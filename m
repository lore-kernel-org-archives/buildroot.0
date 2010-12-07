From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Dec 2010 20:53:15 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch
 for-2011.02/fix-ccache-support
In-Reply-To: <AANLkTi=6nM36bHfthxOTgw3noRR+P-pz6k10YcBGOws7@mail.gmail.com>
References: <cover.1291403746.git.thomas.petazzoni@free-electrons.com>
	<874oarx2r5.fsf@macbook.be.48ers.dk>
	<AANLkTimzwXT4JMAv_oZxcCrRSEbGc8reZ+GfYhb8RHUZ@mail.gmail.com>
	<20101206202232.6bdcaddb@surf>
	<AANLkTi=6nM36bHfthxOTgw3noRR+P-pz6k10YcBGOws7@mail.gmail.com>
Message-ID: <20101207205315.5cc88d60@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 7 Dec 2010 01:04:41 +0100
Bj?rn Forsman <bjorn.forsman@gmail.com> wrote:

> Are many packages affected?

I don't remember.

> If many, I'll just take your word for it and leave TARGET_CC and
> xFLAGS variables be, but if there is only a few packages affected,
> maybe we can fix them instead?

The problem was related to libtool. And unfortunately "fix problem" and
"libtool" in the same sentence is fairly hard to have :-)

Honestly, I've spent quite a bit of time at this moment trying to find
the solution for the --sysroot option that would work with most
packages, without requiring to do horrible things. As things are
working today, I'm not really willing to spend more time on this, but
if others want, I of course won't prevent them from doing so. I'll just
ask for some heavy testing to be done before accepting changes on
this :-)

> Yes, I'd like to get this CMake toolchain file feature into Buildroot
> as well. How about appending a toolchain file target to
> $(2)_DEPENDENCIES in Makefile.cmake.in?

Hum, why ? Do you want to use the toolchain file even to build the
CMake-based packages in Buildroot ? Or just provide it for users to
build external softwares outside of Buildroot ?

> And place the toolchain file in output/?

As it should be part of the SDK, it should probably be located in
$(HOST_DIR) somewhere. But I'm not really clear yet on what the
organization of the SDK should be. In the mean time, just assume you
can put it in $(O), moving it to some other place won't be hard.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
