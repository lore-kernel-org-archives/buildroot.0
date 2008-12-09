From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Tue, 9 Dec 2008 07:02:42 +0100
Subject: [Buildroot] [PATCH 0/7] add Phonon support to qtopia4
In-Reply-To: <200812082300.09891.markus.heidelberg@web.de>
References: <200811190244.44817.markus.heidelberg@web.de>
	<200811250833.46629.markus.heidelberg@web.de>
	<20081208190302.724298c4@hcegtvedt>
	<200812082300.09891.markus.heidelberg@web.de>
Message-ID: <20081209070242.00734379@hcegtvedt>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 8 Dec 2008 23:00:09 +0100
Markus Heidelberg <markus.heidelberg@web.de> wrote:

> Hans-Christian Egtvedt, 08.12.2008:

<snipp>

> > Now only to add gst-ffmpeg as well ;)
> 
> This would probably have been my next step, but I have rejected Phonon
> for now. The video playback was just so slow. It took something about
> 15s to load the Qt example I sent and even longer to get the video
> started. And the playback performance then wasn't better. Did I do
> something wrong? I haven't yet tested it on ATSTK1002 nor 1005 and I'm
> not sure I get round to it before the vacation.
> 

I noticed it took some time getting the demo applications to load the
first time, probably just moving stuff into memory.

It will be pretty mandatory to have 64 MB or even 128 MB of RAM I
think, at least to speed up the process after the first run.

The reason playback is so slow is that you are probably not using the
pixel coprocessor (PICO) to do the work. That was why getting
gst-ffmpeg (libavcodec) with the AVR32 patches to work would be very
nice.

> So currently I'm using mplayer -geometry
> 

And with the AVR32 patch, this is quite optimized and uses the PICO.

-- 
Best regards,
Hans-Christian Egtvedt
