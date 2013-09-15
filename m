From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 15 Sep 2013 23:05:59 +0200
Subject: [Buildroot] [PATCHv2 03/14] toolchain-internal: skip
	gcc-intermediate when possible
In-Reply-To: <1378138000-12739-4-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Mon, 2 Sep 2013 18:06:29 +0200")
References: <1378138000-12739-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1378138000-12739-4-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87ioy1kd6w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> When NPTL support was introduced, gcc required a three stages build
 Thomas> process. Since gcc 4.7, this is no longer necessary, and it is
 Thomas> possible to get back to a two stages build process. This patch takes
 Thomas> advantage of this, by doing a two stages build process when possible.

 Thomas> We introduce a few hidden kconfig options:

 Thomas>  * BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD, which is set by the gcc
 Thomas>    Config.in logic to indicate that the compiler might need a three
 Thomas>    stages build. Currently, all versions prior to 4.7.x are selecting
 Thomas>    this kconfig option.

 Thomas>  * BR2_TOOLCHAIN_LIBC_NEEDS_THREE_STAGE_BUILD, which indicates whether
 Thomas>    the C library might need a three stages build. This is the case for
 Thomas>    eglibc, and uClibc when NPTL is enabled.

 Thomas>  * BR2_TOOLCHAIN_NEEDS_THREE_STAGE_BUILD finally is enabled when both
 Thomas>    of the previous options are enabled. It indicates that a three
 Thomas>    stages build is actually needed.

 Thomas> In addition to those options, the uClibc/gcc build logic is changed to
 Thomas> take use only a two stages build process when possible.

I removed 'take' here and committed, thanks.

-- 
Bye, Peter Korsgaard
