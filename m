From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 18:17:37 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/vlc: security
 bump version to 3.0.8
Message-ID: <20190902161339.013AC81056@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8e8e0c33a45ab370270b1359dceae994f6f6f2d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

Release notes: https://www.videolan.org/developers/vlc-branch/NEWS

Fixes the following security bugs:
 * Fix a buffer overflow in the MKV demuxer (CVE-2019-14970)
 * Fix a read buffer overflow in the avcodec decoder (CVE-2019-13962)
 * Fix a read buffer overflow in the FAAD decoder
 * Fix a read buffer overflow in the OGG demuxer (CVE-2019-14437, CVE-2019-14438)
 * Fix a read buffer overflow in the ASF demuxer (CVE-2019-14776)
 * Fix a use after free in the MKV demuxer (CVE-2019-14777, CVE-2019-14778)
 * Fix a use after free in the ASF demuxer (CVE-2019-14533)
 * Fix a couple of integer underflows in the MP4 demuxer (CVE-2019-13602)
 * Fix a null dereference in the dvdnav demuxer
 * Fix a null dereference in the ASF demuxer (CVE-2019-14534)
 * Fix a null dereference in the AVI demuxer
 * Fix a division by zero in the CAF demuxer (CVE-2019-14498)
 * Fix a division by zero in the ASF demuxer (CVE-2019-14535)

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit ad9efda5789550711b6da7757478a8efae04cee1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.hash | 12 ++++++------
 package/vlc/vlc.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index ba053ea963..d1d3e45b0c 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,9 +1,9 @@
-# From http://download.videolan.org/pub/videolan/vlc/3.0.7.1/vlc-3.0.7.1.tar.xz.sha256
-sha256 0655804371096772f06104b75c21cde8a76e3b6c8a2fdadc97914f082c6264f5 vlc-3.0.7.1.tar.xz
-# From http://download.videolan.org/pub/videolan/vlc/3.0.7.1/vlc-3.0.7.1.tar.xz.sha1
-sha1 3f6f9e56695eeea662b86602963721f1ac7afd23 vlc-3.0.7.1.tar.xz
-# From http://download.videolan.org/pub/videolan/vlc/3.0.7.1/vlc-3.0.7.1.tar.xz.md5
-md5 1adf2fe21070378b0e45ad163d3b232d vlc-3.0.7.1.tar.xz
+# From http://download.videolan.org/pub/videolan/vlc/3.0.8/vlc-3.0.8.tar.xz.sha256
+sha256 e0149ef4a20a19b9ecd87309c2d27787ee3f47dfd47c6639644bc1f6fd95bdf6 vlc-3.0.8.tar.xz
+# From http://download.videolan.org/pub/videolan/vlc/3.0.8/vlc-3.0.8.tar.xz.sha1
+sha1 424a9795e051c198e7fa28107b15809ee6820d43 vlc-3.0.8.tar.xz
+# From http://download.videolan.org/pub/videolan/vlc/3.0.8/vlc-3.0.8.tar.xz.md5
+md5 744442ec0c145453ea1d257914c8072e vlc-3.0.8.tar.xz
 # Locally computed
 sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
 sha256 dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index a736643159..ae12e89b8a 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 3.0.7.1
+VLC_VERSION = 3.0.8
 VLC_SITE = https://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPL-2.0+, LGPL-2.1+
