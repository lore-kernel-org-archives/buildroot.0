From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 17 Aug 2016 00:01:46 +0200
Subject: [Buildroot] [PATCH 2/3] ffmpeg: explicitly disable NEON support
In-Reply-To: <1470864544-31919-2-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Wed, 10 Aug 2016 23:29:03 +0200")
References: <1470864544-31919-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1470864544-31919-2-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <87lgzwtlth.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > When BR2_ARM_CPU_HAS_NEON=y, we pass --enable-neon. However, when
 > BR2_ARM_CPU_HAS_NEON is disabled, we don't pass anything. This generally
 > works fine, but turned out to integrate NEON code in ARMv7-M
 > builds (since it's ARMv7, ffmpeg assumed it should enable NEON code).

 > Even though ffmpeg is now disabled for ARMv7-M, it still makes sense to
 > be explicit, and disable NEON support when the CPU doesn't have it.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
