From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 06 Feb 2013 23:13:23 +0100
Subject: [Buildroot] [PATCH 1/5] ffmpeg: define license
In-Reply-To: <5112B74A.2030903@mind.be> (Arnout Vandecappelle's message of
 "Wed, 06 Feb 2013 21:04:26 +0100")
References: <1360167853-7177-1-git-send-email-luca@lucaceresoli.net>
 <5112B74A.2030903@mind.be>
Message-ID: <87k3qlm6po.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 Arnout> On 06/02/13 17:24, Luca Ceresoli wrote:
 >> How about making it more "automagic", such as:
 >> 
 >> ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
 >> FFMPEG_LICENSE = LGPLv2.1+, GPLv2+, libjpeg license
 >> FFMPEG_LICENSE_FILES = LICENSE COPYING.LGPLv2.1 COPYING.GPLv2
 >> else
 >> FFMPEG_LICENSE = LGPLv2.1+, libjpeg license
 >> FFMPEG_LICENSE_FILES = LICENSE COPYING.LGPLv2.1
 >> endif

 Arnout>  Sounds good to me!

Or even better:

FFMPEG_LICENSE = LGPLv2.1+, libjpeg license
FFMPEG_LICENSE_FILES = LICENSE COPYING.LGPLv2.1

ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
FFMPEG_LICENSE += GPLv2+
FFMPEG_LICENSE += COPYING.GPLv2
endif

-- 
Bye, Peter Korsgaard
