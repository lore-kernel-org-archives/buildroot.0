From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri,  6 Jan 2017 13:52:40 +0100
Subject: [Buildroot] [PATCH] libvncserver: security bump to version 0.9.11
Message-ID: <20170106125240.5764-1-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Security related fixes:
- Heap-based buffer overflow in rfbproto.c in LibVNCClient in LibVNCServer
  before 0.9.11 (CVE-2016-9941)

- Heap-based buffer overflow in ultra.c in LibVNCClient in LibVNCServer
  before 0.9.11 (CVE-2016-9942)

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libvncserver/libvncserver.hash | 2 +-
 package/libvncserver/libvncserver.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libvncserver/libvncserver.hash b/package/libvncserver/libvncserver.hash
index 23d5fb080..8d994e4b6 100644
--- a/package/libvncserver/libvncserver.hash
+++ b/package/libvncserver/libvncserver.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  ed10819a5bfbf269969f97f075939cc38273cc1b6d28bccfb0999fba489411f7  LibVNCServer-0.9.10.tar.gz
+sha256  193d630372722a532136fd25c5326b2ca1a636cbb8bf9bb115ef869c804d2894  LibVNCServer-0.9.11.tar.gz
diff --git a/package/libvncserver/libvncserver.mk b/package/libvncserver/libvncserver.mk
index 92cb1e1aa..d3f0657a5 100644
--- a/package/libvncserver/libvncserver.mk
+++ b/package/libvncserver/libvncserver.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBVNCSERVER_VERSION = 0.9.10
+LIBVNCSERVER_VERSION = 0.9.11
 LIBVNCSERVER_SOURCE = LibVNCServer-$(LIBVNCSERVER_VERSION).tar.gz
 LIBVNCSERVER_SITE = https://github.com/LibVNC/libvncserver/archive
 LIBVNCSERVER_LICENSE = GPLv2+
-- 
2.11.0
