From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 9 Jun 2021 22:52:39 +0200
Subject: [Buildroot] [git commit branch/2021.02.x] package/webkitgtk: select
 missing multimedia deps
Message-ID: <20210609202608.9FBF881970@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=071df79e1da57eb1a7870638562613d5b4cdb60c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Select a few missing multimedia related dependencies:

- BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT is needed for
  "autoaudiosink"; not having this element can cause a crash as
  it is used unconditionally.
- BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA and
  BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX are needed for
  WebM video playback.

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 6823e59111aeb4481367b8a98a47f3903f5225d8)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/webkitgtk/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/webkitgtk/Config.in b/package/webkitgtk/Config.in
index 4ea931fde1..2ba8d47660 100644
--- a/package/webkitgtk/Config.in
+++ b/package/webkitgtk/Config.in
@@ -98,8 +98,11 @@ config BR2_PACKAGE_WEBKITGTK_MULTIMEDIA
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VIDEOSCALE
 	select BR2_PACKAGE_GST1_PLUGINS_BASE_PLUGIN_VOLUME
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_AUTODETECT
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_ISOMP4
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_MATROSKA
 	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_RTSP
+	select BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_VPX
 	select BR2_PACKAGE_GST1_LIBAV
 	help
 	  This option pulls in all of the required dependencies
