From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 06 Dec 2010 16:08:17 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch
	for-2011.02/fix-ccache-support
In-Reply-To: <AANLkTimzwXT4JMAv_oZxcCrRSEbGc8reZ+GfYhb8RHUZ@mail.gmail.com>
	(=?utf-8?Q?=22Bj=C3=B8rn?= Forsman"'s message of "Mon,
	6 Dec 2010 10:44:40 +0100")
References: <cover.1291403746.git.thomas.petazzoni@free-electrons.com>
	<874oarx2r5.fsf@macbook.be.48ers.dk>
	<AANLkTimzwXT4JMAv_oZxcCrRSEbGc8reZ+GfYhb8RHUZ@mail.gmail.com>
Message-ID: <87tyiruefy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:

Hi,

 Bj?rn> Actually, I am currently working on a CMAKETARGETS macro (similar to
 Bj?rn> AUTOTARGETS) and decided to write a patch that takes --sysroot out of
 Bj?rn> TARGET_CC and move it to the {C,CXX}FLAGS variables, to make CMake
 Bj?rn> happy. I've been meaning to post the patch series but I don't feel
 Bj?rn> it's ready to be merged yet. How do the Buildroot developers feel
 Bj?rn> about

 Bj?rn> a) moving --sysroot from TARGET_CC to {C,CXX}FLAGS

It afaik got moved in the first place to fix issues with external
toolchains (E.G. where sysroot is important) and various configure
scripts not using CFLAGS, so I don't think this will work.

Perhaps we should simply bite the bullet and add simple shell wrappers
in HOST_DIR / STAGING_DIR for gcc/g++/ld which add --sysroot when we're
using an external toolchain, and then get rid of --sysroot in TARGET_CC.

 Bj?rn> b) add CMAKETARGETS infrastructure

Sounds good!

 Bj?rn> If this sounds interesting I can post the patches for review.

Yes, please.

-- 
Bye, Peter Korsgaard
