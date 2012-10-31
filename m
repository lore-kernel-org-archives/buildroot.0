From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 31 Oct 2012 23:09:54 +0100
Subject: [Buildroot] cannot compile a program within a uclibc build
	chroot
In-Reply-To: <50913F89.3000802@scalemp.com>
References: <50913F89.3000802@scalemp.com>
Message-ID: <5091A1B2.7060407@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/31/12 16:11, Eial Czerwacki wrote:
> '/usr/lib/gcc/i686-unknown-linux-uclibc/4.6.0/../../../../i686-unknown-linux-uclibc/bin/as':
> execv: No such file or directory

  This is probably because one of the libraries against which as is linked
cannot be found.  It's probably linked with the host libc instead of the
target libc.  You can verify that with 'readelf -d': if you see libc.so.6
in there, it's been linked with the host's glibc.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
