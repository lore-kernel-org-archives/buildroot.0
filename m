From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Sep 2016 12:04:03 +0200
Subject: [Buildroot] [PATCH] toolchain-external: fix potential entire
	root filesystem removal
In-Reply-To: <1473929908-25697-1-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Thu, 15 Sep 2016 10:58:28 +0200")
References: <1473929908-25697-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87k2edeay4.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > This reverts commit a0aa7e0e1750f6ace2879ea8adb1425a41431b79 and reworks
 > the code to fix a major and potentially catastrophic bug when the
 > following conditions are met:

 >  - The user has selected a "known toolchain profile", such as a Linaro
 >    toolchain, a Sourcery CodeBench toolchain etc. People using "custom
 >    toolchain profile" are not affected.

 >  - The user has enabled BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y to
 >    indicate that the toolchain is already locally available (as
 >    opposed to having Buildroot download and extract the toolchain)

 >  - The user has left BR2_TOOLCHAIN_EXTERNAL_PATH empty, because his
 >    toolchain is directly available through the PATH environment
 >    variable. When BR2_TOOLCHAIN_EXTERNAL_PATH is non-empty, Buildroot
 >    will do something silly (remove the toolchain contents), but that
 >    are limited to the toolchain itself.

 > When such conditions are met, Buildroot will run "rm -rf /*" due to
 > TOOLCHAIN_EXTERNAL_INSTALL_DIR being empty.

 > This bug does not exist in 2016.05, and appeared in 2016.08 due to
 > commit a0aa7e0e1750f6ace2879ea8adb1425a41431b79.

Gaah - Committed, thanks!

I'll put out a 2016.08.1 release with this Saturday or Sunday. Anything
else that should be included in this bugfix release?

-- 
Bye, Peter Korsgaard
