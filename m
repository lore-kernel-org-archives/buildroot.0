From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 05 May 2019 23:30:36 +0200
Subject: [Buildroot] [PATCH v5 2/8]
 package/gstreamer1/gst1-plugins-{base, good, bad, ugly}: bump to 1.16.0
In-Reply-To: <20190502151622.80865-2-aduskett@gmail.com> (aduskett@gmail.com's
 message of "Thu, 2 May 2019 11:16:16 -0400")
References: <20190502151622.80865-1-aduskett@gmail.com>
 <20190502151622.80865-2-aduskett@gmail.com>
Message-ID: <87o94ga8sj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "aduskett" == aduskett  <aduskett@gmail.com> writes:

 > From: Adam Duskett <Aduskett@gmail.com>
 > Group these patches because of several changes to the plugin packages.

 > Changes:
 >   - Remove upstreamed patches:
 >       - 0001-fdkaacenc-Remove-MODE_2_1.patch
 >       - 0002-fdkaacdec-Use-WAV-channel-mapping-instead-of-interle.patch

 >   - Add BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR to Config.in.legacy as
 >     this plugin is moved to gst1-plugins-base.

 >   - Add BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IQA to Config.in.legacy as this the
 >     plugin is now removed.

 >   - Add BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV to Config.in.legacy as the
 >     plugin now requires opencv3 with the bgsegm opencv_contrib module, which is
 >     not in Buildroot.

 >   - Add BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_STEREO to Config.in.legacy as this
 >     plugin is merged with the audiofx plugin in gst1-plugins-good.

 >   - Add BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VCD to Config.in.legacy as this
 >     plugin is removed.

 >   - Remove COPYING.LIB from gst-plugins-base mk file and hash file as it no
 >     longer exists.

 >   - Add BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_COMPOSITOR to gst1-plugins-base.mk

 >   - Add BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OVERLAYCOMPOSITION to
 >     gst1-plugins-base.

 >   - Add mjpegtools to the dependencies of
 >     BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEG2ENC

 >   - Remove BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IQA because it now depends on
 >     the package dssim which isn't available in Buildroot.

 >   - Remove upstream patch
 >     0001-gstrtspconnection-Security-loophole-making-heap-over.patch

 > Signed-off-by: Adam Duskett <Aduskett@gmail.com>
 > ---
 > Changes v1 -> v2:
 >   - removed IQA plugin because of the dependency on the package dssim which does
 >     not exist in Buildroot.
 >   - Added mjpegtools to the dependencies of the mpeg2enc plugin.
 >   - Moved BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_COMPOSITOR to the correct location
 >     in Config.in.legacy.
 >   - Added BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_IQA to Config.in.legacy

 > Changes v2 -> v3:
 >   - Clean up commit message.
 >   - Remove BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_STEREO (Peter)
 >   - Remove BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_VCD (Peter)
 >   - Remove BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_OPENCV (Peter)
 >   - Add BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_OVERLAYCOMPOSITION to
 >     gst1-plugins-base. (Peter)

 > Changes v3 -> v4:
 >   - Rebase because of commit 80a5217476c45e765db45acd8782f7f854783f93 (Bernd)
 >   - Remove newly commited patch 0001-gstrtspconnection-Security-loophole-making-heap-over.patch 

 > Changes v4 -> v5:
 >   - Fix changes (Peter)
 >   - Add missing "select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_COMPOSITOR" in
 >     Config.in.legacy (Peter)
 >   - Add missing "select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUDIOFX" in
 >     Config.in.legacy (Peter)
 >   - Add missing unconditional --disable-opencv in gst1-plugins-bad.mk (Peter)

Committed, thanks.

-- 
Bye, Peter Korsgaard
