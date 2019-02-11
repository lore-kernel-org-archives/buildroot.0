From: Patrick Doyle <wpdster@gmail.com>
Date: Mon, 11 Feb 2019 11:05:58 -0500
Subject: [Buildroot] make: write error: stdout
Message-ID: <CAF_dkJB9s1Um95exFi70ucmr4t3bmUohhm2dcj5558n7cuEdcg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Has anybody else run into this error?  I just noticed it today (after
upgrading my Ubuntu build host to a 4.15.0.45-generic kernel).  When I
attempt to build, I keep getting errors of the form:

make[4]: write error: stdout
Makefile:215: recipe for target 'resource/subdir_lib' failed
make[3]: *** [resource/subdir_lib] Error 1
Makefile:9: recipe for target 'all' failed
make[2]: *** [all] Error 2
package/pkg-generic.mk:247: recipe for target
'/home/wpd/src/d2logger/buildroot-6.0/buildroot-external-microchip/build/glibc-glibc-2.26-146-gd300041c533a3d837c9f37a099bcc95466860e98/.stamp_built'
failed
make[1]: *** [/home/wpd/src/d2logger/buildroot-6.0/buildroot-external-microchip/build/glibc-glibc-2.26-146-gd300041c533a3d837c9f37a099bcc95466860e98/.stamp_built]
Error 2
Makefile:16: recipe for target '_all' failed
make: *** [_all] Error 2

I found this very odd, so I do what I always do when I find my
computer doing very odd things... I asked the Google.  And it found
this:

https://www.mail-archive.com/kernel-packages at lists.launchpad.net/msg322537.html

Apparently, somebody else has ran into this problem with her/his
buildroot build on Ubuntu on 2/9/19.  So it appears to be a very
recent, very specific issue.

Has anybody else run into it?  Have you managed to address it with
something less drastic than rolling back to an older kernel version?

As an aside, I can issue a second "make" command, and the build
continues... until it fails again.

I suppose I could change BR2_JLEVEL from 0 to 1, and just take the
long compile time hit.

Hmmm... I just noticed that I don't have BR2_CCACHE enabled for this
particular target.  (I wonder why I forgot to do that?)  Anyway, I'll
mention that if it helps anybody else.

Also, I'll mention that I am running:

$ uname -a
Linux wpd-p910 4.15.0-45-generic #48~16.04.1-Ubuntu SMP Tue Jan 29
18:03:48 UTC 2019 x86_64 x86_64 x86_64 GNU/Linux

--wpd
