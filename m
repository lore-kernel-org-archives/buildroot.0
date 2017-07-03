From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 3 Jul 2017 16:41:28 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/vlc: security
	bump version to 2.2.6
Message-ID: <20170703144016.4AC20820F1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=911ed451f3aa4da4cb9b1fc66ee60815edd21c8b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

Fixes CVE-2017-8312: Heap out-of-bound read in ParseJSS in VideoLAN VLC due
to missing check of string length allows attackers to read heap
uninitialized data via a crafted subtitles file.

[Peter: add CVE info]
Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit b2f2f92887df5333772a9d0b75b5c4cb5675dd88)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/vlc/vlc.hash | 8 ++------
 package/vlc/vlc.mk   | 2 +-
 2 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
index 0f1b6dc..628dad7 100644
--- a/package/vlc/vlc.hash
+++ b/package/vlc/vlc.hash
@@ -1,6 +1,2 @@
-# From http://get.videolan.org/vlc/2.2.5.1/vlc-2.2.5.1.tar.xz.md5
-md5 7ab63964ffec4c92a54deb018f23318b vlc-2.2.5.1.tar.xz
-# From http://get.videolan.org/vlc/2.2.5.1/vlc-2.2.5.1.tar.xz.sha1
-sha1 042962dba68e1414aa563883b0172ee121cf9555 vlc-2.2.5.1.tar.xz
-# From http://get.videolan.org/vlc/2.2.5.1/vlc-2.2.5.1.tar.xz.sha256
-sha256 b28b8a28f578c0c6cb1ebed293aca2a3cd368906cf777d1ab599e2784ddda1cc vlc-2.2.5.1.tar.xz
+# From http://download.videolan.org/pub/videolan/vlc/2.2.6/vlc-2.2.6.tar.xz.sha256
+sha256 c403d3accd9a400eb2181c958f3e7bc5524fe5738425f4253d42883b425a42a8  vlc-2.2.6.tar.xz
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 7f0c4f5..47fb3e8 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 2.2.5.1
+VLC_VERSION = 2.2.6
 VLC_SITE = http://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPLv2+, LGPLv2.1+
