From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 20 Apr 2020 07:46:09 +0200
Subject: [Buildroot] [git commit] package/libuwsc: lua needs dynamic library
Message-ID: <20200420053724.D7EC28F3B1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d4aa39cb63396332c6d68a59c5da9fe4be9fe5f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

lua is built as a module so it needs dynamic library

Fixes:
 - http://autobuild.buildroot.org/results/fe511be44e8546b58c97dc956c07f5a45e0fc3c9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libuwsc/libuwsc.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libuwsc/libuwsc.mk b/package/libuwsc/libuwsc.mk
index 83d05a96ec..08ea72c1f3 100644
--- a/package/libuwsc/libuwsc.mk
+++ b/package/libuwsc/libuwsc.mk
@@ -36,7 +36,7 @@ else
 LIBUWSC_CONF_OPTS += -DUWSC_SSL_SUPPORT=OFF
 endif
 
-ifeq ($(BR2_PACKAGE_LUA),y)
+ifeq ($(BR2_PACKAGE_LUA):$(BR2_STATIC_LIBS),y:)
 LIBUWSC_DEPENDENCIES += lua
 LIBUWSC_CONF_OPTS += -DUWSC_LUA_SUPPORT=ON
 else
