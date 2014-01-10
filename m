From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 10 Jan 2014 22:59:43 +0100
Subject: [Buildroot] [PATCH] dtc: broken for static builds
In-Reply-To: <52D008E2.6000600@imgtec.com> (Vicente Olivert Riera's message of
 "Fri, 10 Jan 2014 14:51:14 +0000")
References: <1389087873-40458-1-git-send-email-Vincent.Riera@imgtec.com>
 <87fvowc3pp.fsf@dell.be.48ers.dk> <52D008E2.6000600@imgtec.com>
Message-ID: <87r48f7b1r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > On 01/09/2014 08:14 PM, Peter Korsgaard wrote:
 >>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
 >> 
 >> > dtc package has hardcoded shared lib link options in the Makefile, so it
 >> > will fail if you try to build it on a static lib environment.
 >> 
 >> Really? I just did a quick test build and it seems to work here:
 >> 
 >> file output/target/usr/bin/dtc
 >> output/target/usr/bin/dtc: ELF 32-bit LSB executable, ARM, version 1
 >> (SYSV), statically linked, stripped

 > I have tried right now with a simple buildroot configuration for
 > x86_64 and it fails. Please, try to reproduce it following these
 > steps:

 > -make clean
 > -make distclean
 > -make menuconfig
 > (choose x86_64 target)
 > (choose prefer static libs)
 > (choose dtc package)
 > -save changes
 > -make

Ahh yes, I do see it on x86-64. Thanks.

-- 
Bye, Peter Korsgaard
