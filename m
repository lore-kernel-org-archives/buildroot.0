From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 16:09:20 +0200
Subject: [Buildroot] [git commit] package/luvi: fixup the 'v' prefix in the
 version
Message-ID: <20190915140440.7F6068E40B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a014dc55d311e5aaf87655950f72b384c4be3368
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In order for the luvi version to match what is given by
release-monitoring.org, the 'v' prefix should be encoded in
LUVI_SOURCE and LUVI_SITE and not LUVI_VERSION.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/luvi/luvi.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luvi/luvi.mk b/package/luvi/luvi.mk
index ea296d2d7b..b6454ed32b 100644
--- a/package/luvi/luvi.mk
+++ b/package/luvi/luvi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-LUVI_VERSION = v2.9.3
-LUVI_SOURCE = luvi-src-$(LUVI_VERSION).tar.gz
-LUVI_SITE = https://github.com/luvit/luvi/releases/download/$(LUVI_VERSION)
+LUVI_VERSION = 2.9.3
+LUVI_SOURCE = luvi-src-v$(LUVI_VERSION).tar.gz
+LUVI_SITE = https://github.com/luvit/luvi/releases/download/v$(LUVI_VERSION)
 LUVI_LICENSE = Apache-2.0
 LUVI_LICENSE_FILES = LICENSE.txt
 LUVI_DEPENDENCIES = libuv luajit luv host-luajit
