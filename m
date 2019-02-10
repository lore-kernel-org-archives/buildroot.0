From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 10 Feb 2019 11:27:02 +0100
Subject: [Buildroot] [PATCH v3 3/4] package/ffmpeg: bump to version 4.1
In-Reply-To: <1c95jfxr7e.ln2@ID-313208.user.individual.net>
References: <20190206094727.24dfa441@windsurf>
 <ea-mime-5c5aa9fc-6f58-26e2ec99@www-1.netcourrier.com>
 <20190206104749.1ae23e1b@windsurf>
 <1c95jfxr7e.ln2@ID-313208.user.individual.net>
Message-ID: <20190210112702.5dc174c6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 10 Feb 2019 11:01:05 +0100
Bernd Kuhls <bernd.kuhls@t-online.de> wrote:

> no:
> https://bugzilla.gnome.org/show_bug.cgi?id=792900#c14
> "I wouldn't worry about the backwards compatibility, but we would have to 
> wait until 1.16 in that case. Can't be included in 1.14."
> 
> https://github.com/GStreamer/gst-libav/blob/master/NEWS
> "GStreamer 1.16 has not been released yet. It is scheduled for release in
> January/February 2019."

OK.

> Only unstable 1.15.1 was released yet.
> 
> > If not, then presumably there are upstream GStreamer changes that make
> > it compatible with ffmpeg 4.x, and we would like to see those patches
> > backported rather than using home-grown patches.  
> 
> No, upstream says backporting is not possible:
> https://github.com/GStreamer/gst-libav/commit/
> 8886a016fce625e1c25a4902be4021196a6784a2#diff-
> ff4e2dc4962dc25a1512353299992c8dR1400
> 
> "-   The gst-libav module in 1.14 will only build against older ffmpeg
>     3.x versions and won?t build against the newly-released ffmpeg 4.0
>     (as in RPM Fusion for Fedora 28) due to API changes. Use the
>     internal ffmpeg copy instead if you build using autotools. This is
>     fixed in git master / upcoming 1.16, but won?t be backported to the
>     1.14 branch as it is rather intrusive and difficult to support both
>     old and new APIs at the same time."

Then, what about temporarily using the internal ffmpeg copy in
gst-libav, until a new version of gst-libav gets released ?

But anyway, it's too late to bump ffmpeg to 4.x for 2019.02, so it will
anyway be done for the next release, and by then, the new GStreamer
release should be available.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
