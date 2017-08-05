From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  5 Aug 2017 11:29:18 +0200
Subject: [Buildroot] [PATCH/next 2/2] package/luvi: bump version to 2.7.6
In-Reply-To: <20170805092918.11608-1-bernd.kuhls@t-online.de>
References: <20170805092918.11608-1-bernd.kuhls@t-online.de>
Message-ID: <20170805092918.11608-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switched to github helper because upstream does not provide the tarball
anymore.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/luvi/luvi.hash | 2 +-
 package/luvi/luvi.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/luvi/luvi.hash b/package/luvi/luvi.hash
index 99fd69e79..7f7abdbf4 100644
--- a/package/luvi/luvi.hash
+++ b/package/luvi/luvi.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b36a3b96ec5852398338bc38567c5bb589783487c65130e1d702ff98fac3a6b7  luvi-src-v2.7.5.tar.gz
+sha256 65d3ded5007d5bb58fc3b76013913596fd42ed7326310d67c668ddf9a017a179  luvi-v2.7.6.tar.gz
diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index 956c37ffa..7dd5e5a32 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-LUVI_VERSION = v2.7.5
-LUVI_SOURCE = luvi-src-$(LUVI_VERSION).tar.gz
-LUVI_SITE = https://github.com/luvit/luvi/releases/download/$(LUVI_VERSION)
+LUVI_VERSION = v2.7.6
+LUVI_SITE = $(call github,luvit,luvi,$(LUVI_VERSION))
 LUVI_LICENSE = Apache-2.0
 LUVI_LICENSE_FILES = LICENSE.txt
 LUVI_DEPENDENCIES = libuv luajit luv host-luajit
-- 
2.11.0
