From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 27 Apr 2012 16:31:44 +0200
Subject: [Buildroot] [PATCH] uboot-tools: bump to version 2012.04
In-Reply-To: <20120427150128.77d4636b@eb-e6520> ("Eric =?utf-8?Q?B=C3=A9na?=
 =?utf-8?Q?rd=22's?= message of "Fri, 27 Apr 2012 15:01:28 +0200")
References: <1335436472-2085-1-git-send-email-gustavo@zacarias.com.ar>
 <20120427150128.77d4636b@eb-e6520>
Message-ID: <87ty058cvj.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Eric" == Eric B?nard <eric@eukrea.com> writes:

Hi,

 >> -UBOOT_TOOLS_VERSION = 2011.03
 >> +UBOOT_TOOLS_VERSION = 2012.04
 >> UBOOT_TOOLS_SOURCE  = u-boot-$(UBOOT_TOOLS_VERSION).tar.bz2
 >> UBOOT_TOOLS_SITE    = ftp://ftp.denx.de/pub/u-boot
 >> 
 Eric> here is a message from Wolfgang Denk on oe-core's mailing list :
 Eric> "Please update and use v2012.04.01 instead.  This is a bug fix release
 Eric> which fixes a nasty bug in the command line processing, which can
 Eric> cause incorrect execution of commands and scripts."

Yes, but that doesn't affect the tools:

git diff --stat v2012.04..v2012.04.01
 Makefile                 |    2 +-
 arch/arm/lib/bootm.c     |   12 +++++++++++-
 arch/sandbox/cpu/start.c |    6 ------
 common/main.c            |    3 ++-
 4 files changed, 14 insertions(+), 9 deletions(-)

But we better update the u-boot package.

-- 
Bye, Peter Korsgaard
