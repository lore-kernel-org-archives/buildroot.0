From: Romain Naour <romain.naour@gmail.com>
Date: Wed, 31 May 2017 21:12:49 +0200
Subject: [Buildroot] [PATCH] package/hans: fix build failures with high
	'make -j' values
Message-ID: <20170531191249.18287-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The top-level doesn't handle correctly the build dependencies
between .o files.

Since hans doesn't take too many time to build, just use MAKE1.

Fixes:
http://autobuild.buildroot.net/results/d14/d142f4a439d4d5fcc89865abde3e593c45ad5d96
http://autobuild.buildroot.net/results/28e/28ed230e40cc154db9274f9765085cd7f0eee85a
http://autobuild.buildroot.net/results/900/9008c3be3bcf46f0fc21a34f48e3cf9da1397d9a

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/hans/hans.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hans/hans.mk b/package/hans/hans.mk
index 2e1e002..5058581 100644
--- a/package/hans/hans.mk
+++ b/package/hans/hans.mk
@@ -10,7 +10,7 @@ HANS_LICENSE = GPL-3.0+
 HANS_LICENSE_FILES = LICENSE
 
 define HANS_BUILD_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) GCC="$(TARGET_CC)" GPP="$(TARGET_CXX)" -C $(@D)
+	$(TARGET_MAKE_ENV) $(MAKE1) GCC="$(TARGET_CC)" GPP="$(TARGET_CXX)" -C $(@D)
 endef
 
 define HANS_INSTALL_TARGET_CMDS
-- 
2.9.4
