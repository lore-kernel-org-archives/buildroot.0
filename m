From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 01 Feb 2012 23:04:01 +0100
Subject: [Buildroot] [PATCH 2/4] Convert busybox to the device
	declaration method
In-Reply-To: <201201210030.35889.arnout@mind.be> (Arnout Vandecappelle's
 message of "Sat, 21 Jan 2012 00:30:35 +0100")
References: <cover.1326304128.git.maxime.ripard@free-electrons.com>
 <1098caad9414fca0d7395e8c65b7034c780f4ed3.1326304128.git.maxime.ripard@free-electrons.com>
 <201201210030.35889.arnout@mind.be>
Message-ID: <87zkd2cisu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> +++ b/package/busybox/busybox.mk
 >> @@ -28,6 +28,11 @@ ifndef BUSYBOX_CONFIG_FILE
 >> BUSYBOX_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_BUSYBOX_CONFIG))
 >> endif
 >> 
 >> +define BUSYBOX_PERMISSIONS
 >> +/bin/busybox			 f 4755	0 0 - - - - -
 >> +/usr/share/udhcpc/default.script f 755  0 0 - - - - -

 Arnout>  Actually, the default.script doesn't need to be touched.
 Arnout> busybox.mk will install it with install -m 0755 so the line
 Arnout> above doesn't change it.  (Note: I verified that.)

But it only does so if it isn't present in the target skeleton. You
could argue that people should just mark it executable there though.

-- 
Bye, Peter Korsgaard
