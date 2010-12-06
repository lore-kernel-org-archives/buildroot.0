From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Mon, 6 Dec 2010 10:44:40 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch
	for-2011.02/fix-ccache-support
In-Reply-To: <874oarx2r5.fsf@macbook.be.48ers.dk>
References: <cover.1291403746.git.thomas.petazzoni@free-electrons.com>
	<874oarx2r5.fsf@macbook.be.48ers.dk>
Message-ID: <AANLkTimzwXT4JMAv_oZxcCrRSEbGc8reZ+GfYhb8RHUZ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On 5 December 2010 23:40, Peter Korsgaard <jacmet@uclibc.org> wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

[snip]

> ?Thomas> I'm not using the symlink technique that was used in the past, but
> ?Thomas> rather prefixing all invocation to host gcc and target gcc with
> ?Thomas> "$(HOST_DIR)/usr/bin/ccache".
>
> Is that working everywhere? I remember we had some problems back when we
> added --sysroot= to TARGET_CC. The qt package in particular is stripping
> the --sysroot argument because of this.

The cdrkit package also strips off --sysroot because its build system
CMake doesn't like it when --sysroot is part of the compiler path.

Actually, I am currently working on a CMAKETARGETS macro (similar to
AUTOTARGETS) and decided to write a patch that takes --sysroot out of
TARGET_CC and move it to the {C,CXX}FLAGS variables, to make CMake
happy. I've been meaning to post the patch series but I don't feel
it's ready to be merged yet. How do the Buildroot developers feel
about

a) moving --sysroot from TARGET_CC to {C,CXX}FLAGS

b) add CMAKETARGETS infrastructure

If this sounds interesting I can post the patches for review.

Best regards,
Bj?rn Forsman
