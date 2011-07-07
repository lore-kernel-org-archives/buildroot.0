From: Sven Neumann <s.neumann@raumfeld.com>
Date: Thu, 07 Jul 2011 21:05:35 +0200
Subject: [Buildroot] [PATCH 6/9] gst-ffmpeg: depend on orc if it is
 enabled
In-Reply-To: <20110707154416.36cfdb98@skate>
References: <1310024348-3575-1-git-send-email-s.neumann@raumfeld.com>
 <1310024348-3575-7-git-send-email-s.neumann@raumfeld.com>
 <20110707104327.38439e72@skate> <1310044678.2076.23.camel@sven>
 <20110707154416.36cfdb98@skate>
Message-ID: <1310065535.14037.4.camel@bender>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 2011-07-07 at 15:44 +0200, Thomas Petazzoni wrote:
> Le Thu, 07 Jul 2011 15:17:58 +0200,
> Sven Neumann <s.neumann@raumfeld.com> a ?crit :
> 
> > Oops, I should have indeed split this into two patches. And I would
> > probably only have submitted the orc dependency. The switch to the
> > internal ffmpeg is a good choice for us, but might not be desirable
> > for others.
> 
> Ok, could you resubmit a patch that only adds the orc dependency ?

Sure. Will do so tomorrow.

> > Ideally there would be a br2 configuration option for this.
> 
> Yes, this could be a solution. But is there any special advantage in
> using the internal ffmpeg vs. the system ffmpeg ? Of course, when you
> build things manually, using the internal ffmpeg is nicer, but since
> Buildroot takes care of the dependency, what is the advantage of the
> internal ffmpeg ?

Actually you get a pretty bad warning from gst-ffmpeg if you don't use
the internal version. Using an external version of ffmpeg seems to be
unsupported and considered a bad idea by the gst-ffmpeg developers.
Probably because the ffmpeg API has a history of changing quite
frequently without ever being released. As far as I can tell this has
improved a little lately.

I don't remember the details, but after updating our buildroot, I tried
to build with the external version, but didn't get far. Reverting to the
internal version solved the issues for us.


Sven
