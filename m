From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 15 Jan 2014 17:08:46 -0300
Subject: [Buildroot] [PATCH 1/1] gst-ffmpeg: Use internal libav instead
 of external ffmpeg
In-Reply-To: <87lhyht3mx.fsf@dell.be.48ers.dk>
References: <BLU0-SMTP442A9DE801569E9B4917C36D9BE0@phx.gbl>
 <87lhyht3mx.fsf@dell.be.48ers.dk>
Message-ID: <52D6EACE.8020403@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/15/2014 05:02 PM, Peter Korsgaard wrote:

> But what about all the CPU optimization flags we have in ffmpeg? Don't
> we need to reproduce those as well here?

I'm a bit wary about using the builtin ffmpeg support at all, all of the
security fixes from newer versions of the unbundled library will be gone.
And i also think the bump was fine, it was time to move along (and mpd's
support for ffmpeg needed it for example, it won't work with oldish
ffmpeg versions).
Maybe it's a bit harsh but we should consider deprecating gst-ffmpeg?
Regards.
