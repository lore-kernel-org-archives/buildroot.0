From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 01 May 2012 10:28:46 +0200
Subject: [Buildroot] enabling libc.a generation
In-Reply-To: <4F9F819C.80509@scalemp.com>
References: <4F9F819C.80509@scalemp.com>
Message-ID: <4F9F9EBE.2070303@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/01/12 08:24, Eial Czerwacki wrote:
> I have a little issue, while trying to compile a small file within a
> buildroot generated env, I get this:
> /usr/lib/gcc/i686-unknown-linux-uclibc/4.2.4/../../../../i686-unknown-linux-uclibc/bin/ld:
> cannot find -lc
> collect2: ld returned 1 exit status

  It would help if you at least specified the command you used to start 
the link.  You can also add the -v option to gcc to see the exact 
parameters of the call to ld, including the search path.

  libc.a and libc.so should be present in output/staging/usr/lib.  But I 
see you're calling a gcc in /usr...  Is this a compiler running on the 
target?  In that case, you should have libc.so and libc.a in /usr/lib.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
