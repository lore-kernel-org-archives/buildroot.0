From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 17 Feb 2017 06:06:55 +0100
Subject: [Buildroot] [PATCH 1/2] wavpack: needs wchar support
References: <20170216204116.2212-1-joerg.krause@embedded.rocks>
 <20170216221907.57ac4b8d@free-electrons.com>
Message-ID: <f0dindxjng.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Am Thu, 16 Feb 2017 22:19:07 +0100 schrieb Thomas Petazzoni:

> None of the places that select wavpack need to be fixed for the wchar
> dependency?
> 
> package/gstreamer/gst-plugins-good/Config.in:   select BR2_PACKAGE_WAVPACK

"depends on BR2_USE_WCHAR" needs to be backported, same was valid
for BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_FLAC.

> package/gstreamer1/gst1-plugins-good/Config.in: select BR2_PACKAGE_WAVPACK

"depends on BR2_USE_WCHAR" needs to be backported, same was valid
for BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_TAGLIB.

> package/mpd/Config.in:  select BR2_PACKAGE_WAVPACK

mpd itself depends on BR2_USE_WCHAR, no backport needed.

Regards, Bernd
