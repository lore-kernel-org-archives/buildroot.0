From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 27 Feb 2015 12:51:58 -0300
Subject: [Buildroot] [PATCH] vlc: security bump to version 2.1.6
Message-ID: <1425052318-21287-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

* Fix heap overflow in decomp stream filter
* Fix buffer overflow in updater
* Fix potential buffer overflow in schroedinger encoder
* Fix null-pointer dereference in DMO decoder
* Fix buffer overflow in parsing of string boxes in mp4 demuxer
* Fix SRTP integer overflow
* Fix potential crash in zip access
* Fix read overflow in Ogg demuxer

And also add hash file.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/vlc/vlc.hash | 2 ++
 package/vlc/vlc.mk   | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)
 create mode 100644 package/vlc/vlc.hash

diff --git a/package/vlc/vlc.hash b/package/vlc/vlc.hash
new file mode 100644
index 0000000..718a0e6
--- /dev/null
+++ b/package/vlc/vlc.hash
@@ -0,0 +1,2 @@
+# From http://get.videolan.org/vlc/2.1.6/vlc-2.1.6.tar.xz.sha256
+sha256	1b76cf4b96e18cf224d21b91343f7e579790c5d3e499c8a230f53da695687c04	vlc-2.1.6.tar.xz
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 9d99de6..56006b5 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VLC_VERSION = 2.1.5
+VLC_VERSION = 2.1.6
 VLC_SITE = http://get.videolan.org/vlc/$(VLC_VERSION)
 VLC_SOURCE = vlc-$(VLC_VERSION).tar.xz
 VLC_LICENSE = GPLv2+ LGPLv2.1+
-- 
2.0.5
