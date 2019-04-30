From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 30 Apr 2019 10:51:56 +0200
Subject: [Buildroot] [PATCH v3 08/10] package/gstreamer1/gst1-libav:
 bump to version 1.16.0
References: <20190424210333.62571-1-aduskett@gmail.com>
 <20190424210333.62571-8-aduskett@gmail.com>
Message-ID: <cuelpfxhjh.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 24 Apr 2019 17:03:31 -0400 schrieb
aduskett-Re5JQEeQqe8AvxtiuMwx3w:

> -GST1_LIBAV_VERSION = 1.14.4
> +GST1_LIBAV_VERSION = 1.16.0
>  GST1_LIBAV_SOURCE = gst-libav-$(GST1_LIBAV_VERSION).tar.xz
>  GST1_LIBAV_SITE = https://gstreamer.freedesktop.org/src/gst-libav
>  GST1_LIBAV_DEPENDENCIES = \

Hi Adam,

with this version bump you can revert these commits:

https://git.buildroot.net/buildroot/commit/package/gstreamer1/gst1-libav?
id=902d3d27bc729b5466fcb3eb130525f26f6d81b8

https://git.buildroot.net/buildroot/commit/package/gstreamer1/gst1-libav?
id=0c6f83c3eb63940808644281575844573c45477a

https://git.buildroot.net/buildroot/commit/package/gstreamer1/gst1-libav?
id=4b6dcccdb6a53cae04abc280e62945f5fd079129

https://git.buildroot.net/buildroot/commit/package/gstreamer1/gst1-libav?
id=07415ad214373c787962a1479514739045916001

in order to use system ffmpeg and not the bundled version:

configure: Using system-installed libav code
checking whether libav is provided by FFmpeg... yes

Test build was successful with this defconfig

BR2_PACKAGE_GSTREAMER1=y
BR2_PACKAGE_GST1_LIBAV=y

based on support/config-fragments/autobuild/br-x86-64-core2-full.config

Regards, Bernd
