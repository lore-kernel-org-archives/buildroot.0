From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Sun, 20 Jan 2013 14:14:00 +0200
Subject: [Buildroot] Gstreamer 0.10 vs. Gstreamer 1.0,
 gst-ffmpeg vs. gst-libav, ffmpeg vs. libav confusion
In-Reply-To: <50FAF2EF.2050707@mind.be>
References: <50FA0C40.30907@petroprogram.com> <50FAF2EF.2050707@mind.be>
Message-ID: <50FBDF88.9010004@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

19.1.2013 21:24, Arnout Vandecappelle kirjoitti:
> On 19/01/13 04:00, Stefan Fr?berg wrote:
[snip]
>> But what about 1.0 ?
>> Maybe gstreamer 1.0.x  package for buildroot should be called
>> gstreamer-1.0 or something similar
>> and also in it's Config.in file BR2_PACKAGE_GSTREAMER1.0 ???
>> And it's own plugins named similary with just -1.0 suffix ?
>> With the exception of gst-libav, which is renamed gst-ffmpeg for
>> gstreamer 1.0
>
>  Yes, for GStreamer 1.0 there should be separate packages. For one
> thing, the new plugin libraries don't have the same set of plugins.
>
>  They should be called something like BR2_PACKAGE_GSTREAMER_10 (no
> dots allowed in config symbols). Which is of course mightily
> confusing, since the old thing is called gstreamer-0.10...
>
>  Note that Bogdan Radulescu posted a patch series to bump the
> GStreamer packages to 1.0. I thought he was going to resubmit with new
> packages instead of bumps, but that hasn't appeared on the list yet.
>

Oh. That's good.


>>
>>
>> And is it worth adding libav as an separate package to buildroot at all
>> or just use the internal version provided by gst-libav plugin
>> when compiling ?
>
> If it's just gst-libav, I don't think it's worth introducing libav as
> a package. But if some other package starts to use libav instead of
> ffmpeg, it will be necessary.
>
>

Yes. AFAIK, for now, it's just this gst-libav that needs it.
I did a quick compile test of that gst-libav, using internal libav, and
it compiled nicely.

And what I have read more and more about those differences of ffmpeg vs.
libav, it now seems that
current, newest version of ffmpeg is now much more secure and feature
rich than it was at the time of fork.

They just kicked out new major release, ffmpeg 1.1.


Stefan
