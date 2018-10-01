From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Oct 2018 15:16:50 +0200
Subject: [Buildroot] [git commit] haproxy: fix linking with lua
Message-ID: <20181001131659.9786C8A5DC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b02427f19d2c31298f57086ad546b10f6e5361b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use LUA_LIB_NAME to give lua library name otherwise haproxy can't find
it

Fixes:
 - http://autobuild.buildroot.net/results/28b6672188bb0082ac1467d3b45904880e3634f3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/haproxy/haproxy.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index a799e69651..363fc4447f 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -25,7 +25,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LUA_5_3),y)
 HAPROXY_DEPENDENCIES += lua
-HAPROXY_MAKE_OPTS += USE_LUA=1
+HAPROXY_MAKE_OPTS += \
+	LUA_LIB_NAME=lua \
+	USE_LUA=1
 endif
 
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
