From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 02 Nov 2020 22:45:17 +0100
Subject: [Buildroot] [2020.02.x] package/busybox: fix build with glibc
 2.31
In-Reply-To: <CANQCQpYPbsgGhjB2WAnc2BOKThXVG6co8eVEGnQ3fDigLnoehg@mail.gmail.com>
 (Matthew Weber's message of "Mon, 2 Nov 2020 14:41:43 -0600")
References: <CANQCQpZvbwcpdhXsE90HUS10fmZrOtbeGAA82rMUWmUZnd0LGg@mail.gmail.com>
 <874km7bm62.fsf@dell.be.48ers.dk>
 <CANQCQpYPbsgGhjB2WAnc2BOKThXVG6co8eVEGnQ3fDigLnoehg@mail.gmail.com>
Message-ID: <87r1pba0wi.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

Hi,

 >> But that is a general issue with using "too new" external toolchains
 >> with older Buildroot versions. Is there any specific reason for wanting
 >> to use that toolchain and not E.G. something built from 2020.02.x?
 >> 

 > Fair.  Our goal was to have a pre-built toolchain for ppc440 with GCC9
 > (probably the last ppc support), CVE updates

2020.02.x has GCC 9 and (should have) all relevant CVE fixes, so you can
build it yourself.


 > and the latest stable bootlin release is now built with libfortran
 > enabled.  Fixing up LTS, saves us from having to create a toolchain
 > only defconfig tweaked with these changes using LTS and managing that
 > in addition to our regular defconfig.

Correct. I am not quite sure what the logic is behind the version
choices done for the Bootlin toolchains, E.G. the kernel headers and
other components are quite old for the stable version, but glibc is the
same for both stable and bleeding edge.


 > I think we're OK carrying these bumps or specific patches internally
 > but thought I'd see if others had interest.

I agree that it (currently at least) isn't a lot of patches, but it
becomes a bit of a slippery slope, so I would prefer to not add them to
2020.02.x.

What do others think?

-- 
Bye, Peter Korsgaard
