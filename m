From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 08 Apr 2018 17:10:16 +0200
Subject: [Buildroot] [PATCH 1/1] qt5webkit: fix build issue with 32-bits
 armv8-a
In-Reply-To: <20180302105833.6828-1-gael.portay@savoirfairelinux.com>
 (=?utf-8?Q?=22Ga=C3=ABl?=
 PORTAY"'s message of "Fri, 2 Mar 2018 05:58:33 -0500")
References: <20180302105833.6828-1-gael.portay@savoirfairelinux.com>
Message-ID: <87vad1bup3.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ga?l" == Ga?l PORTAY <gael.portay@savoirfairelinux.com> writes:

 > Adds WTF platform support for the 32-bits armv8-a architectures.
 > Fixes:

 > 	In file included from ./config.h:30:0,
 > 	                 from ...
 > 	./wtf/Platform.h:323:6: error: #error "Not supported ARM
 > architecture"
 > 	 #    error "Not supported ARM architecture"
 > 	      ^~~~~

 > The patch is an adaptation of an upstream fix in version 5.212 of
 > qtwebkit[1].

 > Unfortunately, the commit cannot be backported and has to be fixed since
 > the toolchain does not define __ARM_ARCH_8__ but __ARM_ARCH_8A__.

 > 	$ host/bin/arm-buildroot-linux-gnueabihf-g++ -dM -E - < /dev/null | grep -i ARM
 > 	#define __ARM_SIZEOF_WCHAR_T 4
 > 	#define __ARM_FEATURE_SAT 1
 > 	#define __ARM_ARCH_ISA_ARM 1
 > 	#define __ARMEL__ 1
 > 	#define __ARM_FEATURE_UNALIGNED 1
 > 	#define __ARM_FEATURE_IDIV 1
 > 	#define __ARM_FP 14
 > 	#define __ARM_ARCH_8A__ 1
 > 	#define __ARM_NEON_FP 6
 > 	#define __ARM_SIZEOF_MINIMAL_ENUM 4
 > 	#define __ARM_PCS_VFP 1
 > 	#define __ARM_FEATURE_LDREX 15
 > 	#define __ARM_FEATURE_QBIT 1
 > 	#define __ARM_FEATURE_FMA 1
 > 	#define __ARM_NEON__ 1
 > 	#define __ARM_ARCH_PROFILE 65
 > 	#define __ARM_32BIT_STATE 1
 > 	#define __ARM_FEATURE_CLZ 1
 > 	#define __ARM_ARCH_ISA_THUMB 2
 > 	#define __ARM_ARCH 8
 > 	#define __arm__ 1
 > 	#define __ARM_FEATURE_SIMD32 1
 > 	#define __ARM_FEATURE_CRC32 1
 > 	#define __ARM_NEON 1
 > 	#define __ARM_ARCH_EXT_IDIV__ 1
 > 	#define __ARM_EABI__ 1
 > 	#define __ARM_FEATURE_DSP 1

 > [1]: https://github.com/qt/qtwebkit/blob/35655d5f4bad248ead1700b59c381cc568b4e98b/Source/WTF/wtf/Platform.h#L241-L242

 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > Reported-by: Brock Williams <brock@cottonwoodcomputer.com>
 > Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
