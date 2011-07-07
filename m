From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 07 Jul 2011 15:17:58 +0200
Subject: [Buildroot] [PATCH 6/9] gst-ffmpeg: depend on orc if it is
 enabled
In-Reply-To: <20110707104327.38439e72@skate>
References: <1310024348-3575-1-git-send-email-s.neumann@raumfeld.com>
 <1310024348-3575-7-git-send-email-s.neumann@raumfeld.com>
 <20110707104327.38439e72@skate>
Message-ID: <1310044678.2076.23.camel@sven>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2011-07-07 at 10:43 +0200, Thomas Petazzoni wrote:
> Hello Sven,
> 
> Le Thu,  7 Jul 2011 09:39:05 +0200,
> Sven Neumann <s.neumann@raumfeld.com> a ?crit :
> 
> > -GST_FFMPEG_DEPENDENCIES = gstreamer gst-plugins-base ffmpeg
> > -GST_FFMPEG_CONF_OPT = --with-system-ffmpeg
> 
> This patch does two things: depend on orc if it is enabled (as stated
> by the commit title), but it also switches gst-ffmpeg from the system
> ffmpeg to (apparently) an internal ffmpeg. Besides the fact that those
> two things should be done in two separate patches, could you elaborate
> on the reason why you switch from the system ffmpeg to the internal
> ffmpeg ? In general, in most Buildroot packages, we prefer to use
> external libraries, and they might also be used by other components in
> the system.

Oops, I should have indeed split this into two patches. And I would
probably only have submitted the orc dependency. The switch to the
internal ffmpeg is a good choice for us, but might not be desirable for
others. Ideally there would be a br2 configuration option for this.


Sven
