From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 9 Dec 2008 11:45:01 +0100
Subject: [Buildroot] [PATCH 0/7] add Phonon support to qtopia4
In-Reply-To: <200812091135.00129.markus.heidelberg@web.de>
References: <200811190244.44817.markus.heidelberg@web.de>
	<200812082300.09891.markus.heidelberg@web.de>
	<20081209070242.00734379@hcegtvedt>
	<200812091135.00129.markus.heidelberg@web.de>
Message-ID: <20081209114501.247dc1dc@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 9 Dec 2008 11:34:59 +0100
Markus Heidelberg <markus.heidelberg@web.de> wrote:

> Hans-Christian Egtvedt, 09.12.2008:
> > On Mon, 8 Dec 2008 23:00:09 +0100
> > Markus Heidelberg <markus.heidelberg@web.de> wrote:

<snipp>

> > The reason playback is so slow is that you are probably not using
> > the pixel coprocessor (PICO) to do the work. That was why getting
> > gst-ffmpeg (libavcodec) with the AVR32 patches to work would be very
> > nice.
> 
> This optimization with using the PICO should also be possible for Qt
> output, independent of video playback, shouldn't it?
> 

No, you will have to write optimized assembly to take advantage of the
PICO. Qt does not use the PICO by default, not even DSP or SIMD
instructions.

> > > So currently I'm using mplayer -geometry
> > > 
> > 
> > And with the AVR32 patch, this is quite optimized and uses the PICO.
> 
> Sounds comprehensible, I had not really thought about it.
> Are there plans or have there already been efforts to get the AVR32
> patch into mainline ffmpeg? The mplayer version rc1 in buildroot is
> quite old, OK rc2 is not very new, too. But it seems as if the big
> atmel patch is preventing from updating.
> 

I am looking into porting the PICO stuff for ffmpeg to upstream ffmpeg,
and instead use that for mplayer. Then it should be easy to bump the
version to rc2 as well.

-- 
Best regards,
Hans-Christian Egtvedt
