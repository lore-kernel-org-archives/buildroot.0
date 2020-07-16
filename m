From: =?utf-8?B?w4lsb2k=?= Bail <eloi.bail@savoirfairelinux.com>
Date: Thu, 16 Jul 2020 06:19:13 -0400 (EDT)
Subject: [Buildroot] [PATCH 1/1] package/gst1-plugins-bayer2rgb-neon:
 bump to 0.4
In-Reply-To: <20200712232001.609f3b61@windsurf.home>
References: <20200702083619.737-1-eloi.bail@savoirfairelinux.com>
 <20200712232001.609f3b61@windsurf.home>
Message-ID: <1902137226.548403.1594894753946.JavaMail.zimbra@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, 

> > Bump gst1-plugins-bayer2rgb-neon to 0.4.

> > Signed-off-by: Eloi Bail <eloi.bail@savoirfairelinux.com>

> I've applied, but there's something odd that caught my eye. See below.

> > -GST1_PLUGINS_BAYER2RGB_NEON_VERSION = 0.3
>> -GST1_PLUGINS_BAYER2RGB_NEON_SOURCE =
> > gst-bayer2rgb-neon-v$(GST1_PLUGINS_BAYER2RGB_NEON_VERSION).tar.bz2
> > +GST1_PLUGINS_BAYER2RGB_NEON_VERSION = 0.4
>> +GST1_PLUGINS_BAYER2RGB_NEON_SOURCE =
> > gst-bayer2rgb-neon-$(GST1_PLUGINS_BAYER2RGB_NEON_VERSION).tar.bz2

> So your change the SOURCE variable to drop the "v", so I wondered why
> and looked at https://git.phytec.de/gst-bayer2rgb-neon/. The tag was
> v0.3 and the new tag is still v0.4. But the snapshot tarball name
> doesn't have the "v", for both the 0.3 and 0.4 versions. But still the
> v0.3.tar.gz download that we had until now worked fine. This puzzles me
> quite a bit. Especially since the download *without* the v as you're
> doing for 0.4 also works.
Indeed wget [ https://git.phytec.de/gst-bayer2rgb-neon/snapshot/%7Bgst-bayer2rgb-neon-0.4.tar.bz2,gst-bayer2rgb-neon-v0.4.tar.bz2%7D | https://git.phytec.de/gst-bayer2rgb-neon/snapshot/{gst-bayer2rgb-neon-0.4.tar.bz2,gst-bayer2rgb-neon-v0.4.tar.bz2} ] works ! 

> So I've applied your patch but I'm quite puzzled by this difference
> between the tag name and the snapshot tarball name, and how it can work
> with v0.3.
Same feeling :) 

> Thanks!

Thanks for pointing me that. 
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20200716/bda10958/attachment.html>
