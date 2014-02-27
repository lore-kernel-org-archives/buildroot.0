From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 27 Feb 2014 14:36:41 +0100
Subject: [Buildroot] [PATCH v2 1/2] e2fsprogs: fix missing fallocate64()
	on nios2
In-Reply-To: <1392933578-2256-1-git-send-email-frank@frajasalo.de> (Frank
 Bergmann's message of "Thu, 20 Feb 2014 22:59:37 +0100")
References: <1392933578-2256-1-git-send-email-frank@frajasalo.de>
Message-ID: <87a9dcad92.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Frank" == Frank Bergmann <frank@frajasalo.de> writes:

 > (external) nios2 toolchain is currently missing the fallocate64 system
 > call. Because of compiling the e2fsprogs package with _FILE_OFFSET_BITS=64,
 > _LARGEFILE_SOURCE and _LARGEFILE64_SOURCE the fallocate call is replaced
 > by fallocate64 by the glibc. Therefore fallocate is entirely disabled while
 > configuring the package.

 > Fixes http://autobuild.buildroot.org/results/70a/70a47bd7392560cbc1c64769c8357c0b4c91ca3b/

Ups, this was the one I committed, not v1.

-- 
Bye, Peter Korsgaard
