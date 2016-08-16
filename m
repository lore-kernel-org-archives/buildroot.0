From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Aug 2016 00:02:05 +0200
Subject: [Buildroot] [PATCH 3/3] ffmpeg: don't pass --enable-mipsfpu on
	non-MIPS platform
In-Reply-To: <1470864544-31919-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 10 Aug 2016 23:29:04 +0200")
References: <1470864544-31919-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1470864544-31919-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87h9aktlsy.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > The current logic to pass the --{enable,disable}-mipsfpu option is:
 > ifeq ($(BR2_MIPS_SOFT_FLOAT),y)
 > FFMPEG_CONF_OPTS += --disable-mipsfpu
 > else
 > FFMPEG_CONF_OPTS += --enable-mipsfpu
 > endif

 > In practice, this means that on MIPS soft-float, --disable-mipsfpu is
 > passed, and that in *all* other cases, --enable-mipsfpu is passed,
 > including if we are *not* targetting the MIPS architecture.

 > Even though this doesn't seem to cause any problem, it is a bit weird to
 > see --enable-mipsfpu when you're building ffmpeg for a non-MIPS
 > architecture, so we better fix this by enclosing the MIPS-related
 > options in a MIPS condition.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
