From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 15 May 2016 10:03:03 +0200
Subject: [Buildroot] QtMultimedia and gstreamer-1.0
In-Reply-To: <5738116B.9050904@gmail.com>
References: <5738116B.9050904@gmail.com>
Message-ID: <20160515100303.003752e2@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Marco,

On Sun, 15 May 2016 08:04:27 +0200, Marco Trapanese <marcotrapanese@gmail.com> wrote:

> Hello,
> I'm trying to use QtMultimedia on my system (2016.05-git-01212-gabfaf47-dirty, attached the .config file).
> The QtMultimedia documentations says:
> 
> The minimum required version of GStreamer is 0.10.24. The 1.x series is also supported.
> 
> To build Qt Multimedia, you need the GStreamer library, base plugins, and development files for your system. To run applications that use Qt Multimedia, you might also need to install the following GStreamer plugins: 'good', 'ugly', 'bad', ffmpeg (0.10), and libav (1.x). These additional plugins contain various codecs for audio and video decoding, as well as the necessary components for using the camera APIs. The package names for GStreamer vary between Linux distributions; try searching for gstreamer or libgstreamer in your distribution's package repository to find suitable packages.
> I selected gstreamer 1.x, gst1-libav, and several plugins from base/good/bad/ugly. But I'm not sure what "development files" exactly means.

This means the header files etc. which are installed into the staging directory (and not into the target directory) which
Qt needs to detect and compile with GStreamer support...

> When I try to create a QtMultimedia class I get the following error:
> 
> defaultServiceProvider::requestService(): no service found for - "org.qt-project.qt.mediaplayer"
> Do you have any experience on this topic?


Should not happen ;-)

Last time I used this combination was with Buildroot 2015.11-rc3 and it worked for me with this (defconfig)
additional package selection:

+BR2_PACKAGE_GSTREAMER1=y
+BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_AUDIOTESTSRC=y
+BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_ALSA=y
+BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OGG=y
+BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VORBIS=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUDIOPARSERS=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_DEBUGUTILS=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ID3DEMUX=y
+BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_FLAC=y
+BR2_PACKAGE_DEJAVU=y
+BR2_PACKAGE_QT5=y
+BR2_PACKAGE_QT5BASE_LICENSE_APPROVED=y
+BR2_PACKAGE_QT5BASE_EXAMPLES=y
+BR2_PACKAGE_QT5BASE_WIDGETS=y
+BR2_PACKAGE_QT5BASE_FONTCONFIG=y
+BR2_PACKAGE_QT5BASE_GIF=y
+BR2_PACKAGE_QT5BASE_JPEG=y
+BR2_PACKAGE_QT5BASE_PNG=y
+BR2_PACKAGE_QT5MULTIMEDIA=y


...seems time to recheck it..., but needs some time...

Regards,
Peter

> Thanks
> Marco
> 
> 
> 
> 
