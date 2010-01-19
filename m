From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 19 Jan 2010 17:11:39 +0100
Subject: [Buildroot] (no subject)
In-Reply-To: <BLU148-W233C2B35C60390FF7C87E0EB7A0@phx.gbl> (Terry Forrest's
	message of "Tue, 29 Dec 2009 14:37:19 -0500")
References: <BLU148-W233C2B35C60390FF7C87E0EB7A0@phx.gbl>
Message-ID: <87my0am5vo.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Terry" == Terry Forrest <zippybot7@hotmail.com> writes:

 Terry> Hi All - new to buildroot and am impressed!  Nice design
 Terry> and implementation.

Thanks.

 Terry> We would like to use BR to build for two architectures from
 Terry> the same tree.  We can use a local x86 for a "simulation" mode,
 Terry> and the target is arm.  I see that this is cleanly supported in the
 Terry> 2009.11 release.

 Terry> My question is on a "best practice" for this.  I've set up
 Terry> a top-level Makefile that goes something like this:

 Terry> TOPDIR    = path_to_my_top
 Terry> BUILD   = ${TOPDIR}/build
 Terry> BUILDROOT = buildroot-2009.11
 Terry> BROOT    = ${BUILD}/${BUILDROOT}

 Terry> setup-x86:
 Terry>     cp configs/buildroot-config-x86 ${BROOT}/.config
 Terry>     ${MAKE} -C ${BROOT} oldconfig

We already have a *_defconfig make target doing this, so if you rename
the file to buildroot-86_defconfig, then you can simply do:

make buildroot-x86_defconfig

 Terry> setup-arm:
 Terry>     cp configs/buildroot-config-arm ${BROOT}/.config
 Terry>     ${MAKE} -C ${BROOT} oldconfig

 Terry> build-x86: setup-x86
 Terry>     make -C ${BROOT} O=${BUILD}/output_x86

 Terry> build-arm: setup-arm
 Terry>     make -C ${BROOT} O=${BUILD}/output_arm

 Terry> This seems to work okay - any comments or warnings?
 Terry> Again, I'm new to BR and want to make sure I'm not
 Terry> gonna step in anything.

No, that's fine - I regulary use

make <something>_defconfig; make O=<somewhere>

-- 
Bye, Peter Korsgaard
