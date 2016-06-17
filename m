From: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
Date: Fri, 17 Jun 2016 10:36:00 +0200
Subject: [Buildroot] [PATCH] mpdstate: add package
In-Reply-To: <20160612215336.06191b9e@free-electrons.com>
References: <20160530063656.GC31737@airbook.vandijck-laurijssen.be>
 <20160612215336.06191b9e@free-electrons.com>
Message-ID: <20160617083600.GA6429@airbook.newtec.eu>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> Hello,
> 
> On Mon, 30 May 2016 08:36:56 +0200, Kurt Van Dijck wrote:
> > Mpdstate listens for MPD state changes and outputs them
> > on stdout. It is easy to write a script that receives mpdstate's output
> > on stdin an act upon some of the events.
> > 
> > Signed-off-by: Kurt Van Dijck <dev.kurt@vandijck-laurijssen.be>
> 
> Isn't the same thing achievable with the "mpc idle" feature, which
> allows you to listen for events from mpd ?

'mpc idleloop' prints the category of events, certainly not the real
changes. 

> 
> Like your other package, I'd prefer to have some evidence of even some
> limited adoption/usage of a software package before adding it to
> Buildroot.

Like my other package, mpc is ideal for interactive use, but not for
small automation stuff.
I created a raspberry pi box that engages the audio amplifier whenever
mpd plays, and standby when mpd pauses/stops.

It's hard to build stable scripts around 'mpc' for that regards,
as you need several calls, and the state may change in between.

mpdstate fixes that flow.

Like my other package, I may need to add that kind of comments, I
learned that, and you're right in pointing me to that.

I'm yet puzzled by the version info that I take from the git repository,
that does not work in buildroot since it's buildroot's git repo there.
I haven't found a solution yet, and that's keeping me from updating my
patches :-)

Thanks for the review, I'll take that into account.

Kurt
