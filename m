From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 05 Dec 2010 23:40:14 +0100
Subject: [Buildroot] [pull request v2] Pull request for branch
	for-2011.02/fix-ccache-support
In-Reply-To: <cover.1291403746.git.thomas.petazzoni@free-electrons.com>
	(Thomas Petazzoni's message of "Fri, 3 Dec 2010 20:16:22 +0100")
References: <cover.1291403746.git.thomas.petazzoni@free-electrons.com>
Message-ID: <874oarx2r5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> [ Sorry, previous pull request had some mistakes. ]

 Thomas> Here is a patch that reworks the ccache support to make it work and
 Thomas> make it useful. It is now a "Build options" rather than a "Toolchain
 Thomas> option". I have tested it with both internal toolchain and external
 Thomas> toolchain. The principle is simply to build ccache as early as
 Thomas> possible in the build process, and then use it to cache host and
 Thomas> target compiled files.

Thanks, looks interesting.

 Thomas> The ccache cache is kept in ~/.buildroot-ccache/, so that it can be
 Thomas> shared between different builds.

Why here and not in the default ~/.ccache? Is the ~/.ccache directory
content ccache-version dependent?

 Thomas> I'm not using the symlink technique that was used in the past, but
 Thomas> rather prefixing all invocation to host gcc and target gcc with
 Thomas> "$(HOST_DIR)/usr/bin/ccache".

Is that working everywhere? I remember we had some problems back when we
added --sysroot= to TARGET_CC. The qt package in particular is stripping
the --sysroot argument because of this.

-- 
Bye, Peter Korsgaard
