From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 19 Jan 2013 20:24:31 +0100
Subject: [Buildroot] Gstreamer 0.10 vs. Gstreamer 1.0,
 gst-ffmpeg vs. gst-libav, ffmpeg vs. libav confusion
In-Reply-To: <50FA0C40.30907@petroprogram.com>
References: <50FA0C40.30907@petroprogram.com>
Message-ID: <50FAF2EF.2050707@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 19/01/13 04:00, Stefan Fr?berg wrote:
> Hi everyone
>
> Im going to start building some multimedia capabilities to my buildroot
> system soon and
> hit to this confusion about gstreamer 0.10 vs. gstreamer 1.0, gst-ffmeg
> vs. gst-libav,
> and ffmpeg vs libav.
>
> What I have read from
> http://www.linuxfromscratch.org/blfs/view/svn/multimedia/gstreamer.html
> and all over the Net I have come to following conclusion:
>
> 1 )
> gstreamer 0.10 and gstreamer 1.0  (and their plugins) are totally
> incompatible versions but if need to be
> they can be installed both into same system.

  Totally incompatible is an exaggeration. It's more like python2 vs. 
python3: sufficiently incompatible to warrant separate packaging.

>
> 2 )
> gstreamer 0,10 has the following plugins:
> gst-plugins-bad 0.10.x
> gst-plugins-good 0.10.x
> gst-plugins-ugly 0.10.x
> and
> gst-plugins-ffmpeg 0.10.x which uses ffmpeg library
>
> 3 )
> gstreamer 1,0 has the following plugins:
> gst-plugins-bad 1.0.x
> gst-plugins-good 1.0.x
> gst-plugins-ugly 1.0.x
> and
> gst-plugins-libav 1.0.x which uses libav library (either external or
> internal, tarball provided)
>
> 4 ) libav is a fork of ffmpeg
>
> 5 ) ffmpeg is not dead but kicking and all well and alive.
>
>
> In the latest git of buildroot there is gstreamer 0.10.x series and all
> it's 0.10.x series plugins which is all good and well
> and I think it should be keeped in that way.
>
> But what about 1.0 ?
> Maybe gstreamer 1.0.x  package for buildroot should be called
> gstreamer-1.0 or something similar
> and also in it's Config.in file BR2_PACKAGE_GSTREAMER1.0 ???
> And it's own plugins named similary with just -1.0 suffix ?
> With the exception of gst-libav, which is renamed gst-ffmpeg for
> gstreamer 1.0

  Yes, for GStreamer 1.0 there should be separate packages. For one 
thing, the new plugin libraries don't have the same set of plugins.

  They should be called something like BR2_PACKAGE_GSTREAMER_10 (no dots 
allowed in config symbols). Which is of course mightily confusing, since 
the old thing is called gstreamer-0.10...

  Note that Bogdan Radulescu posted a patch series to bump the GStreamer 
packages to 1.0. I thought he was going to resubmit with new packages 
instead of bumps, but that hasn't appeared on the list yet.

>
>
> And is it worth adding libav as an separate package to buildroot at all
> or just use the internal version provided by gst-libav plugin
> when compiling ?

If it's just gst-libav, I don't think it's worth introducing libav as a 
package. But if some other package starts to use libav instead of ffmpeg, 
it will be necessary.


  Regards,
  Arnout

>
> Best Regards
> Stefan
>
> P.S.
> Hate it when people have to make things difficult to end users just
> because large egos:
> http://blog.pkh.me/p/13-the-ffmpeg-libav-situation.html
>
>
>
>
>
>
>
>
>
>
>
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
