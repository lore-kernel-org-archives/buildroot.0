From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Sat, 19 Jan 2013 05:00:16 +0200
Subject: [Buildroot] Gstreamer 0.10 vs. Gstreamer 1.0,
 gst-ffmpeg vs. gst-libav, ffmpeg vs. libav confusion
Message-ID: <50FA0C40.30907@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi everyone

Im going to start building some multimedia capabilities to my buildroot
system soon and
hit to this confusion about gstreamer 0.10 vs. gstreamer 1.0, gst-ffmeg
vs. gst-libav,
and ffmpeg vs libav.

What I have read from
http://www.linuxfromscratch.org/blfs/view/svn/multimedia/gstreamer.html
and all over the Net I have come to following conclusion:

1 )
gstreamer 0.10 and gstreamer 1.0  (and their plugins) are totally
incompatible versions but if need to be
they can be installed both into same system.

2 )
gstreamer 0,10 has the following plugins:
gst-plugins-bad 0.10.x
gst-plugins-good 0.10.x
gst-plugins-ugly 0.10.x
and
gst-plugins-ffmpeg 0.10.x which uses ffmpeg library

3 )
gstreamer 1,0 has the following plugins:
gst-plugins-bad 1.0.x
gst-plugins-good 1.0.x
gst-plugins-ugly 1.0.x
and
gst-plugins-libav 1.0.x which uses libav library (either external or
internal, tarball provided)

4 ) libav is a fork of ffmpeg

5 ) ffmpeg is not dead but kicking and all well and alive.


In the latest git of buildroot there is gstreamer 0.10.x series and all
it's 0.10.x series plugins which is all good and well
and I think it should be keeped in that way.

But what about 1.0 ?
Maybe gstreamer 1.0.x  package for buildroot should be called
gstreamer-1.0 or something similar
and also in it's Config.in file BR2_PACKAGE_GSTREAMER1.0 ???
And it's own plugins named similary with just -1.0 suffix ?
With the exception of gst-libav, which is renamed gst-ffmpeg for
gstreamer 1.0


And is it worth adding libav as an separate package to buildroot at all
or just use the internal version provided by gst-libav plugin
when compiling ?

Best Regards
Stefan

P.S.
Hate it when people have to make things difficult to end users just
because large egos:
http://blog.pkh.me/p/13-the-ffmpeg-libav-situation.html












-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130119/b8877d57/attachment-0001.html>
