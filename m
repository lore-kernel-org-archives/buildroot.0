From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 23 Sep 2016 15:13:06 +0200
Subject: [Buildroot] [PATCH] gst1-imx: add menuconfig to select each
 plugin individually
In-Reply-To: <20160923125835.mr63ylhk25qb3gt2@t450s.lan>
References: <20160916131038.23240-1-gary.bisson@boundarydevices.com>
 <20160920210425.1ca82f17@free-electrons.com>
 <20160920224355.l76a3kggupuiugok@t450s.lan>
 <1af982ba-faf7-9cd7-73ae-c32e45286f34@mind.be>
 <20160923125835.mr63ylhk25qb3gt2@t450s.lan>
Message-ID: <20160923151306.1fd4e4c7@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 23 Sep 2016 14:58:35 +0200, Gary Bisson wrote:

> What about we stick with the depends for now?

It's fine for me.

> My V2 will take care of the dependencies inside the 'ifeq' statements in
> gst1-imx.mk. BTW, doing it as suggested kind of makes the code redundant
> since several plugins might have the same dependency, like:
> 
> ifeq ($(BR2_PACKAGE_GST1_IMX_MP3ENCODER),y)
> # There's no --enable-mp3encoder option
> GST1_IMX_DEPENDENCIES += imx-codec
> else
> GST1_IMX_CONF_OPTS += --disable-mp3encoder
> endif
> 
> ifeq ($(BR2_PACKAGE_GST1_IMX_UNIAUDIODEC),y)
> # There's no --enable-uniaudiodec option
> GST1_IMX_DEPENDENCIES += imx-codec
> else
> GST1_IMX_CONF_OPTS += --disable-uniaudiodec
> endif
> 
> Is that ok? I know it doesn't bring any issue, just look a little
> redundant.

If only a single dependency is needed for those codecs, is it really
necessary to have different options to enable/disable them? How much
space do they take each?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
