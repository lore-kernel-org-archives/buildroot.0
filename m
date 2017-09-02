From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 2 Sep 2017 22:02:34 +0200
Subject: [Buildroot] [git commit] xavante: bump to version 2.4.0
Message-ID: <20170902195515.3CED98041D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=dd99477836e39faf26f225ba1cc06df79532a8b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/xavante/Config.in    | 8 ++++----
 package/xavante/xavante.hash | 2 +-
 package/xavante/xavante.mk   | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/xavante/Config.in b/package/xavante/Config.in
index be8e6d9..d66ca1f 100644
--- a/package/xavante/Config.in
+++ b/package/xavante/Config.in
@@ -1,14 +1,14 @@
 config BR2_PACKAGE_XAVANTE
 	bool "xavante"
 	# Runtime dependency only
-	select BR2_PACKAGE_CGILUA
 	select BR2_PACKAGE_COPAS
-	select BR2_PACKAGE_COXPCALL
 	select BR2_PACKAGE_LUAFILESYSTEM
 	select BR2_PACKAGE_LUASOCKET
-	select BR2_PACKAGE_WSAPI
 	help
 	  Xavante is a Lua HTTP 1.1 Web server that uses a modular
-	  architecture based on URI mapped handlers.
+	  architecture based on URI mapped handlers. Xavante currently
+	  offers a file handler, a redirect handler and a WSAPI handler.
+	  Those are used for general files, URI remapping and WSAPI
+	  applications respectively.
 
 	  http://keplerproject.github.com/xavante/
diff --git a/package/xavante/xavante.hash b/package/xavante/xavante.hash
index d960c2d..09b2a22 100644
--- a/package/xavante/xavante.hash
+++ b/package/xavante/xavante.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	d683bebdb3e1b497dc04ceb3fb8f1c8c67a6486ab0c6da0c23f281cc07a63657  xavante-2.3.0-1.src.rock
+sha256 67c738f981e7d65d18c717f3acac59a37f95d5139c00fb0de5d3167262025273  xavante-2.4.0-1.src.rock
diff --git a/package/xavante/xavante.mk b/package/xavante/xavante.mk
index 07f9ee6..20e4aab 100644
--- a/package/xavante/xavante.mk
+++ b/package/xavante/xavante.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XAVANTE_VERSION = 2.3.0-1
+XAVANTE_VERSION = 2.4.0-1
 XAVANTE_LICENSE = MIT
 
 $(eval $(luarocks-package))
