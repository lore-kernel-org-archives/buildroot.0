From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 21:59:11 +0200
Subject: [Buildroot] [git commit] copas: bump to version 2.0.2
Message-ID: <20170902195204.09C938172F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e33c21778a1fd9a693a50ffff6159b297ce96fef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/copas/Config.in  | 8 +++++---
 package/copas/copas.hash | 2 +-
 package/copas/copas.mk   | 4 ++--
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/package/copas/Config.in b/package/copas/Config.in
index 21dd0eb..d7800b6 100644
--- a/package/copas/Config.in
+++ b/package/copas/Config.in
@@ -1,10 +1,12 @@
 config BR2_PACKAGE_COPAS
 	bool "copas"
 	# Runtime dependency only
-	select BR2_PACKAGE_COXPCALL
+	select BR2_PACKAGE_COXPCALL if BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
 	select BR2_PACKAGE_LUASOCKET
 	help
-	  Copas is a dispatcher based on coroutines that
-	  can be used by TCP/IP servers.
+	  Copas is a dispatcher based on coroutines that can be used
+	  for asynchronous networking. For example TCP or UDP based
+	  servers. But it also features timers and client support for
+	  http(s), ftp and smtp requests.
 
 	  http://keplerproject.github.com/copas/
diff --git a/package/copas/copas.hash b/package/copas/copas.hash
index 27e3316..d894b86 100644
--- a/package/copas/copas.hash
+++ b/package/copas/copas.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c94890bdc8899d05163ca963dadf4b74b2ad7a5795ea3923a792b6e928ec142a  copas-2.0.1-1.src.rock
+sha256 efeded4f4633bc71551175b239199304640ef918ae8ea9dc9c5047359ae07107  copas-2.0.2-1.src.rock
diff --git a/package/copas/copas.mk b/package/copas/copas.mk
index 132b5d9..5ab5473 100644
--- a/package/copas/copas.mk
+++ b/package/copas/copas.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-COPAS_VERSION = 2.0.1-1
-COPAS_SUBDIR = copas-2_0_1
+COPAS_VERSION = 2.0.2-1
+COPAS_SUBDIR = copas-2_0_2
 COPAS_LICENSE = MIT
 
 $(eval $(luarocks-package))
