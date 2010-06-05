From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sat, 5 Jun 2010 22:16:11 +0200
Subject: [Buildroot] [git commit master] New lua modules: wrap them up in a
	submenu
Message-ID: <20100605201726.C6D699BFB0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=accf2eb2576c3e122ca2b2095f1dd775cc15f4db
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Closes #1885

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES           |    1 +
 package/Config.in |    2 ++
 2 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/CHANGES b/CHANGES
index 98a9e12..b653124 100644
--- a/CHANGES
+++ b/CHANGES
@@ -13,6 +13,7 @@
 
 	#1771: Fakeroot and the target/generic/device_table.txt create bad...
 	#1879: Bump iptables to 1.4.8
+	#1885: Add a bunch of lua modules
 	#1909: netperf-2.4.5 fails to build because of undeclared SOCK_DCCP
 
 2010.05, Released May 30th, 2010:
diff --git a/package/Config.in b/package/Config.in
index 8b837fd..8d6c270 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -208,6 +208,7 @@ source "package/haserl/Config.in"
 source "package/java/jamvm/Config.in"
 source "package/lua/Config.in"
 if BR2_PACKAGE_LUA
+menu "LUA libraries/modules"
 source "package/cgilua/Config.in"
 source "package/copas/Config.in"
 source "package/coxpcall/Config.in"
@@ -216,6 +217,7 @@ source "package/luasocket/Config.in"
 source "package/rings/Config.in"
 source "package/wsapi/Config.in"
 source "package/xavante/Config.in"
+endmenu
 endif
 source "package/microperl/Config.in"
 source "package/php/Config.in"
-- 
1.6.3.3
