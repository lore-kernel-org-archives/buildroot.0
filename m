From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  2 Sep 2017 18:56:32 +0200
Subject: [Buildroot] [PATCH 02/12] copas: bump to version 2.0.2
In-Reply-To: <20170902165642.22943-1-francois.perrad@gadz.org>
References: <20170902165642.22943-1-francois.perrad@gadz.org>
Message-ID: <20170902165642.22943-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/copas/Config.in  | 7 +++++--
 package/copas/copas.hash | 2 +-
 package/copas/copas.mk   | 4 ++--
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/package/copas/Config.in b/package/copas/Config.in
index 21dd0eb88..bc53c1d2b 100644
--- a/package/copas/Config.in
+++ b/package/copas/Config.in
@@ -1,10 +1,13 @@
 config BR2_PACKAGE_COPAS
 	bool "copas"
 	# Runtime dependency only
-	select BR2_PACKAGE_COXPCALL
+	select BR2_PACKAGE_COXPCALL if BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
 	select BR2_PACKAGE_LUASOCKET
 	help
 	  Copas is a dispatcher based on coroutines that
-	  can be used by TCP/IP servers.
+	  can be used for asynchroneous networking. For
+	  example TCP or UDP based servers. But it also
+	  features timers and client support for http(s),
+	  ftp and smtp requests.
 
 	  http://keplerproject.github.com/copas/
diff --git a/package/copas/copas.hash b/package/copas/copas.hash
index 27e33166c..d894b8657 100644
--- a/package/copas/copas.hash
+++ b/package/copas/copas.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  c94890bdc8899d05163ca963dadf4b74b2ad7a5795ea3923a792b6e928ec142a  copas-2.0.1-1.src.rock
+sha256 efeded4f4633bc71551175b239199304640ef918ae8ea9dc9c5047359ae07107  copas-2.0.2-1.src.rock
diff --git a/package/copas/copas.mk b/package/copas/copas.mk
index 132b5d967..5ab547378 100644
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
-- 
2.11.0
