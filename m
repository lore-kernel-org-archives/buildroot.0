From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 28 Sep 2018 19:35:19 +0200
Subject: [Buildroot] [PATCH 2/2] haproxy: fix linking with lua
In-Reply-To: <20180928173519.9731-1-fontaine.fabrice@gmail.com>
References: <20180928173519.9731-1-fontaine.fabrice@gmail.com>
Message-ID: <20180928173519.9731-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use LUA_LIB_NAME to give lua library name otherwise haproxy can't find
it

Fixes:
 - http://autobuild.buildroot.net/results/28b6672188bb0082ac1467d3b45904880e3634f3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.17.1
