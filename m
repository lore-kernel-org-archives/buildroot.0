From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 21 Mar 2021 19:55:22 +0100
Subject: [Buildroot] [git commit branch/2020.11.x] package/sconeserver: pcre
 is optional, not mandatory
Message-ID: <20210321183131.39E91814F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c773117318785ecf366b73253a1bf9c201b970c3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.11.x

pcre is optional not mandatory since
https://github.com/sconemad/sconeserver/commit/98ec61436c9ea68ffe2d70a818c1175dcafa2a79

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 754633fe8c306190c00087662df42f5b740c8754)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sconeserver/Config.in      | 1 -
 package/sconeserver/sconeserver.mk | 5 ++++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index 09cf5d459c..429ac81fe1 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -3,7 +3,6 @@ menuconfig BR2_PACKAGE_SCONESERVER
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
-	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_ZLIB
 	help
 	  Sconeserver is a modular, object-orientated and extremely
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index b81134002e..62cc128d77 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -10,7 +10,10 @@ SCONESERVER_LICENSE = GPL-2.0+
 SCONESERVER_LICENSE_FILES = COPYING
 # fetching from Git, we need to generate the configure script
 SCONESERVER_AUTORECONF = YES
-SCONESERVER_DEPENDENCIES = host-pkgconf pcre zlib
+SCONESERVER_DEPENDENCIES = \
+	host-pkgconf \
+	$(if $(BR2_PACKAGE_PCRE),pcre) \
+	zlib
 # disable markdown module because its git submodule cmark
 # https://github.com/sconemad/sconeserver/tree/master/markdown
 # has no cross-compile support provided by the sconeserver build system
