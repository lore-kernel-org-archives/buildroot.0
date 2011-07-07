From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 7 Jul 2011 10:43:27 +0200
Subject: [Buildroot] [PATCH 6/9] gst-ffmpeg: depend on orc if it is
 enabled
In-Reply-To: <1310024348-3575-7-git-send-email-s.neumann@raumfeld.com>
References: <1310024348-3575-1-git-send-email-s.neumann@raumfeld.com>
 <1310024348-3575-7-git-send-email-s.neumann@raumfeld.com>
Message-ID: <20110707104327.38439e72@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Sven,

Le Thu,  7 Jul 2011 09:39:05 +0200,
Sven Neumann <s.neumann@raumfeld.com> a ?crit :

> -GST_FFMPEG_DEPENDENCIES = gstreamer gst-plugins-base ffmpeg
> -GST_FFMPEG_CONF_OPT = --with-system-ffmpeg

This patch does two things: depend on orc if it is enabled (as stated
by the commit title), but it also switches gst-ffmpeg from the system
ffmpeg to (apparently) an internal ffmpeg. Besides the fact that those
two things should be done in two separate patches, could you elaborate
on the reason why you switch from the system ffmpeg to the internal
ffmpeg ? In general, in most Buildroot packages, we prefer to use
external libraries, and they might also be used by other components in
the system.

Thanks !

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
