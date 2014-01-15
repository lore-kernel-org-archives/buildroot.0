From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 15 Jan 2014 21:14:49 +0100
Subject: [Buildroot] [PATCH 1/1] gst-ffmpeg: Use internal libav instead
	of external ffmpeg
In-Reply-To: <52D6EACE.8020403@zacarias.com.ar> (Gustavo Zacarias's message of
 "Wed, 15 Jan 2014 17:08:46 -0300")
References: <BLU0-SMTP442A9DE801569E9B4917C36D9BE0@phx.gbl>
 <87lhyht3mx.fsf@dell.be.48ers.dk> <52D6EACE.8020403@zacarias.com.ar>
Message-ID: <87ha95t32e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > On 01/15/2014 05:02 PM, Peter Korsgaard wrote:
 >> But what about all the CPU optimization flags we have in ffmpeg? Don't
 >> we need to reproduce those as well here?

 > I'm a bit wary about using the builtin ffmpeg support at all, all of the
 > security fixes from newer versions of the unbundled library will be gone.
 > And i also think the bump was fine, it was time to move along (and mpd's
 > support for ffmpeg needed it for example, it won't work with oldish
 > ffmpeg versions).
 > Maybe it's a bit harsh but we should consider deprecating gst-ffmpeg?

s/gst-ffmpeg/gstreamer 0.10/, but yeah. Upstream officially announced
that almost a year ago:

http://lists.freedesktop.org/archives/gstreamer-announce/2013-March/000273.html

I do think moving to the internal libav copy for gst-ffmpeg until we can
completely remove it is OK though. If people really need it, then the
(outdated) bundled library is still better than no gst-ffmpeg.

-- 
Bye, Peter Korsgaard
