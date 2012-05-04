From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 04 May 2012 21:55:42 +0200
Subject: [Buildroot] enabling libc.a generation
In-Reply-To: <4F9FA29F.90309@scalemp.com>
References: <4F9F819C.80509@scalemp.com> <4F9F9EBE.2070303@mind.be>
 <4F9FA29F.90309@scalemp.com>
Message-ID: <4FA4343E.1090003@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/01/12 10:45, Eial Czerwacki wrote:
> as for libc.so, here is the relevant output:
> sh-4.1# find . -name "libc*"
> ./lib/libcrypt.so.0
> ./lib/libc.so.0
> ./lib/libcrypt-0.9.32.so
> ./usr/include/bits/libc-lock.h
> ./usr/lib/libcurses.a

  Right, so no libc.so or libc.a...

  These files are copied into or removed from the target fs depending on 
the status of the BR2_HAVE_DEVFILES option.  This option must be 
enabled, otherwise it is impossible to select the BR2_PACKAGE_GCC_TARGET 
option.

  However, the copying of libc.so and libc.a happens at the time the 
cross-toolchain is built.  If you enable BR2_HAVE_DEVFILES afterwards, 
it will have no effect.  Perhaps you didn't do a clean build after 
reconfiguring buildroot?

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
