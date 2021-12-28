Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF5B3C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Dec 2021 00:22:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4ACCF813B9;
	Tue, 28 Dec 2021 00:22:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gHg0K126Jj4F; Tue, 28 Dec 2021 00:22:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A48DF813BB;
	Tue, 28 Dec 2021 00:22:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EA4791BF322
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 00:22:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEB5A400CC
 for <buildroot@lists.busybox.net>; Tue, 28 Dec 2021 00:22:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JhPOBVoXOeTx for <buildroot@lists.busybox.net>;
 Tue, 28 Dec 2021 00:22:33 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTP id F06F54019B
 for <buildroot@buildroot.org>; Tue, 28 Dec 2021 00:22:32 +0000 (UTC)
Received: from localhost.localdomain ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id 20G4nYx9AR1a120G4n5yrr; Tue, 28 Dec 2021 01:22:31 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1640650951; bh=OXqgltyjFNJN3uvusUQa8LMnJSmAiZ4FacNkF3rbCIw=;
 h=From:To:Subject:Date:MIME-Version;
 b=cB49P4mHai0pWLJbmUB1RxazTS9QndVqmw7JIdM/Wzey0MrbkOYo0Pb02ao3HOzAc
 NQM28lI5Nwo8/3pkz0nkxbBE+wf2uMssXKDoiiR8NBpOMf8ttTXNaSLk/39sRUOPZO
 /lQdJUCVAd3dmQ9JS1wJShipwkTsMJdZEfVLsLj9xiTidzfKKhDKyleRbPbfOWE66A
 0nmiXP1PFwCneQnU7mWRexd3VMYflTi3G0XmGkvrh0gIY0FcLEt/BpthuWlkV+YFUI
 9D78uJkdOEIZtTv/4mQ+ggpxMH7nb9z/1QKh5i2mhxphKvYk+wLv+MQO418Ar4iOi6
 3KuJpDSBRI+mA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Dec 2021 01:22:27 +0100
Message-Id: <20211228002227.15747-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211227222435.393248e5@windsurf>
References: <20211227222435.393248e5@windsurf>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfIqbs7q1RMahrGgZlDQdWNfzDFXKSvqimE108MbbkDDcD8kBL1DfGhYWn3K/V6GbKnGzl7vt5m3HmF5IxDvhMM2bRJSDskv3UqZUAIoyhbQ1uHmd529O
 5+4304f4uKkQ3eYTgktXVi0avFoomY/GlCn8ZJtiidf/EoX5SRMNUn3xwaMP4SVkDvTtDRohAfY5up+zZmNR2Lg8873fCwgDJlGUZlqSfRg1BjnQBS3cJ8Qa
 ppyIMbQnrnzG4TmL6PTN6z23IyBnfGjnoxYfoy/neb12pAT1KUaYW2lea78ufF7ox1ghTjh+hJ5SIO19x15u8EBI9DbMyq3LcRtaJx1zIwjhapirnH/HpHxk
 hjGeu461Nnxx84LareNH5Zer3dTOQFS0GDKaJn29mj7Dl6GiQQ1wNKvHua/tFjpT7e6PlD06Q6ri4/tB/lDAx9+dzTG8kQ1K3vYFOru7y67Cdvw/BoufyjEr
 W/9OL/B+19rBJIyz30+7Znn75vAlnzf7Sv2y0VH9zpoNdXNmmb9INYLK0BVIga9oj6lONg82vq0B2TFEkC02aC/wQgsLDHpgP+dEkvHKjcIRzDBSRVlVZTNd
 bbWfYmNZw0mYaH0CWfuVsN7SoEydImiT3W7pCrT2sJlI+r4NYoCD55SSUoD9+vH0fH5F731WXOWHd/trcraIbyD/4NWTNaFQINHpd4NttXBsCNMGHWR9yTFk
 7+2l//qi8J6o6yEOxdXgMbFalXDkS4Qh
Subject: [Buildroot] [PATCH v2] package/harfbuzz: fix host build failure due
 to C++11
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Samuel Martin <s.martin49@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Simon Dawson <spdawson@gmail.com>,
 Julien Corjon <corjon.j@ecagroup.com>, James Knight <james.knight@collins.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Romain Naour <romain.naour@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Package harfbuzz fails to build for host with error:
```
../src/hb-map.hh:67:18: error: 'is_trivially_copyable' is not a member of 'std'
   static_assert (std::is_trivially_copyable<K>::value, "");
```

Only starting from gcc version 5.0 we have 'is_trivially_copyable' member
of std. So let's depend on BR2_HOST_GCC_AT_LEAST_5 for harfbuzz itself
and pango package that needs host-harfbuzz, but let's also depend on
BR2_TOOLCHAIN_GCC_AT_LEAST_5 for all the harfbuzz direct and
reverse dependencies since the configure/build statements are the same
for host and target harfbuzz package.

Fixes:
http://autobuild.buildroot.net/results/89e1194c1659d7e1af9db8ffe5feee770c448f76

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* add BR2_TOOLCHAIN_GCC_AT_LEAST_5 to harfbuzz and its dependencies
---
 package/cwiid/Config.in                        |  2 +-
 package/efl/Config.in                          |  1 +
 package/enlightenment/Config.in                |  6 +++---
 package/gstreamer1/gst1-plugins-bad/Config.in  | 17 +++++++++--------
 package/gstreamer1/gst1-plugins-base/Config.in |  6 +++---
 package/gtkmm3/Config.in                       |  2 +-
 package/harfbuzz/Config.in                     |  8 +++++---
 package/kodi/Config.in                         |  2 +-
 package/libass/Config.in                       |  6 +++---
 package/libfm/Config.in                        |  6 +++---
 package/libgtk2/Config.in                      |  6 +++---
 package/libgtk3/Config.in                      |  2 +-
 package/librsvg/Config.in                      |  6 +++---
 package/mupdf/Config.in                        |  6 +++---
 package/openbox/Config.in                      |  6 +++---
 package/pango/Config.in                        |  8 +++++---
 package/pangomm/Config.in                      |  8 ++++----
 package/pcmanfm/Config.in                      |  6 +++---
 package/pinentry/Config.in                     |  6 +++---
 package/python-pymupdf/Config.in               |  6 +++---
 package/qt5/qt5base/Config.in                  |  2 +-
 package/rrdtool/Config.in                      |  6 +++---
 package/supertuxkart/Config.in                 |  6 +++---
 package/xscreensaver/Config.in                 |  6 +++---
 24 files changed, 71 insertions(+), 65 deletions(-)

diff --git a/package/cwiid/Config.in b/package/cwiid/Config.in
index 6ae2ac9405..f4a0a3dd77 100644
--- a/package/cwiid/Config.in
+++ b/package/cwiid/Config.in
@@ -18,7 +18,7 @@ if BR2_PACKAGE_CWIID
 config BR2_PACKAGE_CWIID_WMGUI
 	bool "wmgui"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libgtk2 -> pango -> harfbuzz
 	depends on BR2_PACKAGE_XORG7 # libgtk2
 	depends on BR2_USE_WCHAR # libgtk2 -> libglib2
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libgtk2 -> libglib2
diff --git a/package/efl/Config.in b/package/efl/Config.in
index 05ded72cf7..a37e9f6e97 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -267,6 +267,7 @@ config BR2_PACKAGE_EFL_SVG
 	bool "SVG loader"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # librsvg
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # librsvg -> pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # librsvg -> pango -> harfbuzz
 	select BR2_PACKAGE_LIBRSVG
 	select BR2_PACKAGE_CAIRO
 	help
diff --git a/package/enlightenment/Config.in b/package/enlightenment/Config.in
index cd2b8cfe54..9d2c637902 100644
--- a/package/enlightenment/Config.in
+++ b/package/enlightenment/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_ENLIGHTENMENT
 	depends on BR2_PACKAGE_XORG7
 	# libevas-generic-loaders-svg -> librsvg -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	select BR2_PACKAGE_EFL_X_XLIB
 	select BR2_PACKAGE_EFL_EEZE
 	select BR2_PACKAGE_EFL_JPEG # needed at runtime by enlightenment_start
@@ -29,10 +29,10 @@ config BR2_PACKAGE_ENLIGHTENMENT
 
 	  http://www.enlightenment.org/
 
-comment "enlightenment needs udev /dev management and a toolchain w/ wchar, C++, threads, gcc >= 4.9"
+comment "enlightenment needs udev /dev management and a toolchain w/ wchar, C++, threads, gcc >= 5.0"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_EFL && BR2_PACKAGE_XORG7 && BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_PACKAGE_HAS_UDEV
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/package/gstreamer1/gst1-plugins-bad/Config.in b/package/gstreamer1/gst1-plugins-bad/Config.in
index ad08615256..4eceb673f2 100644
--- a/package/gstreamer1/gst1-plugins-bad/Config.in
+++ b/package/gstreamer1/gst1-plugins-bad/Config.in
@@ -328,13 +328,13 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_ASSRENDER
 	bool "assrender"
 	depends on BR2_INSTALL_LIBSTDCPP # libass -> harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libass -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libass -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libass -> harfbuzz
 	select BR2_PACKAGE_LIBASS
 
-comment "assrender plugin needs a toolchain w/ C++, gcc >= 4.9"
+comment "assrender plugin needs a toolchain w/ C++, gcc >= 5.0"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_BLUEZ
 	bool "bluez"
@@ -481,16 +481,17 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_TTML
 	depends on BR2_TOOLCHAIN_HAS_THREADS # pango -> glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # pango -> harfbuzz
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_PANGO
 	help
 	  Timed Text Markup Language (TTML) subtitle plugin
 
-comment "ttml needs a toolchain w/ wchar, threads, C++"
+comment "ttml needs a toolchain w/ wchar, threads, C++, gcc >= 5.0"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_INSTALL_LIBSTDCPP
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_MPEG2ENC
 	bool "mpeg2enc"
@@ -563,15 +564,15 @@ config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_RSVG
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # librsvg
 	depends on BR2_INSTALL_LIBSTDCPP # librsvg -> pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # librsvg -> pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # librsvg -> pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # librsvg -> pango -> harfbuzz
 	select BR2_PACKAGE_LIBRSVG
 	help
 	  RSVG plugin library
 
-comment "rsvg plugin needs a toolchain w/ C++, gcc >= 4.9"
+comment "rsvg plugin needs a toolchain w/ C++, gcc >= 5.0"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 config BR2_PACKAGE_GST1_PLUGINS_BAD_PLUGIN_SBC
diff --git a/package/gstreamer1/gst1-plugins-base/Config.in b/package/gstreamer1/gst1-plugins-base/Config.in
index 7ca94d7dc4..f343e0322a 100644
--- a/package/gstreamer1/gst1-plugins-base/Config.in
+++ b/package/gstreamer1/gst1-plugins-base/Config.in
@@ -293,14 +293,14 @@ config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_PANGO
 	bool "pango font renderer"
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # pango -> harfbuzz
 	select BR2_PACKAGE_PANGO
 	help
 	  Pango-based text rendering and overlay
 
-comment "pango plugin needs a toolchain w/ C++, gcc >= 4.9"
+comment "pango plugin needs a toolchain w/ C++, gcc >= 5.0"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 config BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_THEORA
diff --git a/package/gtkmm3/Config.in b/package/gtkmm3/Config.in
index 8762c7208d..b21e6eb776 100644
--- a/package/gtkmm3/Config.in
+++ b/package/gtkmm3/Config.in
@@ -14,7 +14,7 @@ config BR2_PACKAGE_GTKMM3
 	depends on !BR2_nios2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pangomm, libgtk3 -> pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm, libpangomm -> glibmm/pango
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++11, libgtk3 -> pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_MMU # *mm/libgtk3 -> libglib2
 	depends on BR2_USE_WCHAR # *mm/libgtk3 -> libglib2
diff --git a/package/harfbuzz/Config.in b/package/harfbuzz/Config.in
index 2e4219ee22..e8691e4513 100644
--- a/package/harfbuzz/Config.in
+++ b/package/harfbuzz/Config.in
@@ -2,7 +2,8 @@ config BR2_PACKAGE_HARFBUZZ
 	bool "harfbuzz"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
+	depends on BR2_HOST_GCC_AT_LEAST_5 # C++11
 	help
 	  HarfBuzz is an OpenType text shaping engine
 
@@ -11,7 +12,8 @@ config BR2_PACKAGE_HARFBUZZ
 	  Harfbuzz can make optional use of cairo, freetype,
 	  glib2 and icu packages if they are selected.
 
-comment "harfbuzz needs a toolchain w/ C++, gcc >= 4.9"
+comment "harfbuzz needs a toolchain w/ C++, gcc >= 5.0 and host gcc >= 5.0"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
+		!BR2_HOST_GCC_AT_LEAST_5
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index f436a444d3..d785ff617f 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -52,7 +52,7 @@ menuconfig BR2_PACKAGE_KODI
 	bool "kodi"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libass -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++14
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # C++14, libass -> harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_USE_WCHAR
diff --git a/package/libass/Config.in b/package/libass/Config.in
index d7725d5e1b..18f910a765 100644
--- a/package/libass/Config.in
+++ b/package/libass/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBASS
 	bool "libass"
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # harfbuzz
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_HARFBUZZ
 	select BR2_PACKAGE_LIBFRIBIDI
@@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBASS
 
 	  https://github.com/libass/libass
 
-comment "libass needs a toolchain w/ C++, gcc >= 4.9"
+comment "libass needs a toolchain w/ C++, gcc >= 5.0"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/libfm/Config.in b/package/libfm/Config.in
index e78bc99b76..fab17d20aa 100644
--- a/package/libfm/Config.in
+++ b/package/libfm/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBFM
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libgtk2 -> pango -> harfbuzz
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBGTK2 if !BR2_PACKAGE_LIBGTK3_X11
@@ -22,9 +22,9 @@ config BR2_PACKAGE_LIBFM
 
 	  http://wiki.lxde.org/en/Libfm
 
-comment "libfm needs X.org and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "libfm needs X.org and a toolchain w/ wchar, threads, C++, gcc >= 5.0"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || !BR2_PACKAGE_XORG7
diff --git a/package/libgtk2/Config.in b/package/libgtk2/Config.in
index c75c37fb63..708fdf7ad7 100644
--- a/package/libgtk2/Config.in
+++ b/package/libgtk2/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBGTK2
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # pango -> harfbuzz
 	select BR2_PACKAGE_ATK
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PS
@@ -34,10 +34,10 @@ config BR2_PACKAGE_LIBGTK2_DEMO
 
 endif
 
-comment "libgtk2 needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "libgtk2 needs a toolchain w/ wchar, threads, C++, gcc >= 5.0"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libgtk3/Config.in b/package/libgtk3/Config.in
index bc8cacd9f5..c8277c5f89 100644
--- a/package/libgtk3/Config.in
+++ b/package/libgtk3/Config.in
@@ -20,7 +20,7 @@ config BR2_PACKAGE_LIBGTK3
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # pango -> harfbuzz
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
 		BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_ATK
diff --git a/package/librsvg/Config.in b/package/librsvg/Config.in
index 270b524b37..b77b02b8ec 100644
--- a/package/librsvg/Config.in
+++ b/package/librsvg/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBRSVG
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # pango
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # pango -> harfbuzz
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PNG
 	select BR2_PACKAGE_CAIRO_SCRIPT
@@ -21,10 +21,10 @@ config BR2_PACKAGE_LIBRSVG
 
 	  https://wiki.gnome.org/Projects/LibRsvg
 
-comment "librsvg needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "librsvg needs a toolchain w/ wchar, threads, C++, gcc >= 5.0"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/mupdf/Config.in b/package/mupdf/Config.in
index cf97711160..e4a6e9ef59 100644
--- a/package/mupdf/Config.in
+++ b/package/mupdf/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_MUPDF
 	bool "mupdf"
 	depends on BR2_INSTALL_LIBSTDCPP # harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # harfbuzz
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_GUMBO_PARSER
@@ -18,7 +18,7 @@ config BR2_PACKAGE_MUPDF
 
 	  https://www.mupdf.com/index.html
 
-comment "mupdf needs a toolchain w/ C++, gcc >= 4.9"
+comment "mupdf needs a toolchain w/ C++, gcc >= 5.0"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/openbox/Config.in b/package/openbox/Config.in
index e042ed2b48..83d955ae41 100644
--- a/package/openbox/Config.in
+++ b/package/openbox/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_OPENBOX
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_USE_WCHAR # glib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # pango -> freetype
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBXML2
@@ -20,10 +20,10 @@ config BR2_PACKAGE_OPENBOX
 
 	  http://openbox.org
 
-comment "openbox needs a toolchain w/ C++, threads, wchar, gcc >= 4.9"
+comment "openbox needs a toolchain w/ C++, threads, wchar, gcc >= 5.0"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_INSTALL_LIBSTDCPP
 	depends on BR2_PACKAGE_XORG7
diff --git a/package/pango/Config.in b/package/pango/Config.in
index e2b2e7fe2b..99f54d00c7 100644
--- a/package/pango/Config.in
+++ b/package/pango/Config.in
@@ -5,7 +5,8 @@ config BR2_PACKAGE_PANGO
 	depends on BR2_USE_MMU # glib2
 	depends on BR2_INSTALL_LIBSTDCPP # freetype support
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # harfbuzz
+	depends on BR2_HOST_GCC_AT_LEAST_5 # host-harfbuzz
 	select BR2_PACKAGE_LIBGLIB2
 	select BR2_PACKAGE_LIBFRIBIDI
 	select BR2_PACKAGE_EXPAT
@@ -24,9 +25,10 @@ config BR2_PACKAGE_PANGO
 
 	  https://pango.gnome.org/
 
-comment "pango needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "pango needs a toolchain w/ wchar, threads, C++, gcc >= 5.0, host gcc >= 5.0"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
+		!BR2_HOST_GCC_AT_LEAST_5 || \
 		!BR2_INSTALL_LIBSTDCPP
diff --git a/package/pangomm/Config.in b/package/pangomm/Config.in
index 0702b8c5bf..411235ecec 100644
--- a/package/pangomm/Config.in
+++ b/package/pangomm/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PANGOMM
 	bool "pangomm"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # glibmm/pango
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # pango -> harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_THREADS # *mm/pango -> libglib2
 	depends on BR2_USE_MMU # *mm/pango -> libglib2
 	depends on BR2_USE_WCHAR # *mm/pango -> libglib2
@@ -15,8 +15,8 @@ config BR2_PACKAGE_PANGOMM
 
 	  http://www.gtkmm.org/
 
-comment "pangomm needs a toolchain w/ C++, wchar, threads, gcc >= 4.9"
+comment "pangomm needs a toolchain w/ C++, wchar, threads, gcc >= 5.0"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || !BR2_USE_WCHAR \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_5 || !BR2_USE_WCHAR || \
+		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pcmanfm/Config.in b/package/pcmanfm/Config.in
index 73b8c7c04c..238587b49e 100644
--- a/package/pcmanfm/Config.in
+++ b/package/pcmanfm/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_PCMANFM
 	depends on BR2_USE_MMU # libglib2
 	depends on BR2_INSTALL_LIBSTDCPP # libgtk2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libgtk2 -> pango -> harfbuzz
 	select BR2_PACKAGE_LIBFM
 	select BR2_PACKAGE_MENU_CACHE
 	select BR2_PACKAGE_LIBGLIB2
@@ -18,10 +18,10 @@ config BR2_PACKAGE_PCMANFM
 
 	  http://wiki.lxde.org/en/PCManFM
 
-comment "pcmanfm needs a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "pcmanfm needs a toolchain w/ wchar, threads, C++, gcc >= 5.0"
 	depends on BR2_USE_MMU
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/pinentry/Config.in b/package/pinentry/Config.in
index 3f005f8c58..dc4b2bcf8d 100644
--- a/package/pinentry/Config.in
+++ b/package/pinentry/Config.in
@@ -54,17 +54,17 @@ config BR2_PACKAGE_PINENTRY_GTK2
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libgtk2 -> pango -> harfbuzz
 	select BR2_PACKAGE_LIBGTK2
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	help
 	  The pinentry-gtk2 tool
 
-comment "pinentry-gtk2 needs X and a toolchain w/ wchar, threads, C++, gcc >= 4.9"
+comment "pinentry-gtk2 needs X and a toolchain w/ wchar, threads, C++, gcc >= 5.0"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_PACKAGE_XORG7 || !BR2_USE_WCHAR || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_PINENTRY_QT5
diff --git a/package/python-pymupdf/Config.in b/package/python-pymupdf/Config.in
index 0ecb288922..463f879d9f 100644
--- a/package/python-pymupdf/Config.in
+++ b/package/python-pymupdf/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PYTHON_PYMUPDF
 	bool "python-pymupdf"
 	depends on BR2_INSTALL_LIBSTDCPP # mupdf -> harfbuzz
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # mupdf -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # mupdf -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # mupdf -> harfbuzz
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_FREETYPE
@@ -18,8 +18,8 @@ comment "python-pymupdf needs Xorg"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_PACKAGE_XORG7
 
-comment "python-pymupdf needs a toolchain w/ C++, gcc >= 4.9"
+comment "python-pymupdf needs a toolchain w/ C++, gcc >= 5"
 	depends on BR2_PACKAGE_PYTHON3
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
diff --git a/package/qt5/qt5base/Config.in b/package/qt5/qt5base/Config.in
index 601438d2fe..e808ccfae9 100644
--- a/package/qt5/qt5base/Config.in
+++ b/package/qt5/qt5base/Config.in
@@ -237,7 +237,7 @@ config BR2_PACKAGE_QT5BASE_HARFBUZZ
 	bool "harfbuzz support"
 	select BR2_PACKAGE_HARFBUZZ if \
 		BR2_TOOLCHAIN_HAS_SYNC_4 && \
-		BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	help
 	  This option enables HarfBuzz support (either system harfbuzz
 	  if the toolchain supports __sync for 4 bytes, or the qt
diff --git a/package/rrdtool/Config.in b/package/rrdtool/Config.in
index 5ffdc92618..d5791428b7 100644
--- a/package/rrdtool/Config.in
+++ b/package/rrdtool/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_RRDTOOL_RRDGRAPH
 	bool "rrd_graph"
 	default y
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # pango -> harfbuzz
 	depends on BR2_INSTALL_LIBSTDCPP # freetype support from pango
 	select BR2_PACKAGE_CAIRO
 	select BR2_PACKAGE_CAIRO_PDF
@@ -28,9 +28,9 @@ config BR2_PACKAGE_RRDTOOL_RRDGRAPH
 	  This enables the graphing capabilities ('rrdgraph').
 	  Without this it will only act as a database backend.
 
-comment "rrd_graph support needs a toolchain w/ C++, gcc >= 4.9"
+comment "rrd_graph support needs a toolchain w/ C++, gcc >= 5.0"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 
 endif
diff --git a/package/supertuxkart/Config.in b/package/supertuxkart/Config.in
index a18b9c1a0a..be4a96f826 100644
--- a/package/supertuxkart/Config.in
+++ b/package/supertuxkart/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_SUPERTUXKART
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_INSTALL_LIBSTDCPP # openal
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # harfbuzz, openal
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # harfbuzz, openal
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # openal
 	depends on BR2_PACKAGE_OPENAL_ARCH_SUPPORTS # openal
 	depends on BR2_PACKAGE_HAS_LIBGL
@@ -34,7 +34,7 @@ config BR2_PACKAGE_SUPERTUXKART
 
 	  http://supertuxkart.sourceforge.net/Main_Page
 
-comment "supertuxkart needs an OpenGL backend, a uClibc or glibc toolchain w/ NPTL, C++, gcc >= 4.9"
+comment "supertuxkart needs an OpenGL backend, a uClibc or glibc toolchain w/ NPTL, C++, gcc >= 5.0"
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on BR2_i386 || BR2_x86_64
 	depends on BR2_USE_MMU
@@ -42,6 +42,6 @@ comment "supertuxkart needs an OpenGL backend, a uClibc or glibc toolchain w/ NP
 	depends on BR2_PACKAGE_XORG7
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL \
 		|| !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 \
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
 		|| !BR2_PACKAGE_HAS_LIBGL \
 		|| BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/xscreensaver/Config.in b/package/xscreensaver/Config.in
index 787c3130ae..4c77f76bc3 100644
--- a/package/xscreensaver/Config.in
+++ b/package/xscreensaver/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_XSCREENSAVER
 	depends on BR2_USE_WCHAR # gdk-pixbuf, libgtk2 -> glib2
 	depends on BR2_USE_MMU # gdk-pixbuf, libgtk2 -> glib2
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libgtk2 -> pango -> harfbuzz
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # libgtk2 -> pango -> harfbuzz
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libgtk2 -> pango -> harfbuzz
 	select BR2_PACKAGE_GDK_PIXBUF
 	select BR2_PACKAGE_LIBGLU if BR2_PACKAGE_HAS_LIBGL
 	select BR2_PACKAGE_LIBGTK2
@@ -25,10 +25,10 @@ config BR2_PACKAGE_XSCREENSAVER
 
 	  http://www.jwz.org/xscreensaver/
 
-comment "xscreensaver needs a toolchain w/ wchar, C++, threads, gcc >= 4.9"
+comment "xscreensaver needs a toolchain w/ wchar, C++, threads, gcc >= 5.0"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
 		!BR2_USE_WCHAR
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
