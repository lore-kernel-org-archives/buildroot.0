From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 18 Nov 2018 18:54:54 +0100
Subject: [Buildroot] [git commit] sconeserver: needs zlib
Message-ID: <20181118175952.D4F68838C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a18eb7f785e0a92ac6245591d3dd738571533d26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since bump to 6b932d7d8dbb700b830205e7111e469cefff490c and
https://github.com/sconemad/sconeserver/commit/34b01e9d332f912da82ab1c09529a33969ff6ebb,
sconeserver needs zlib so select it

Fixes:
 - http://autobuild.buildroot.org/results/b5e2b8635b37e6f2803a6031b154cf67685a4221

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/sconeserver/Config.in      | 1 +
 package/sconeserver/sconeserver.mk | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sconeserver/Config.in b/package/sconeserver/Config.in
index 7027bd9a15..e984801de5 100644
--- a/package/sconeserver/Config.in
+++ b/package/sconeserver/Config.in
@@ -4,6 +4,7 @@ menuconfig BR2_PACKAGE_SCONESERVER
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on !BR2_STATIC_LIBS # dlopen()
 	select BR2_PACKAGE_PCRE
+	select BR2_PACKAGE_ZLIB
 	help
 	  Sconeserver is a modular, object-orientated and extremely
 	  versatile network server framework for GNU/Linux and
diff --git a/package/sconeserver/sconeserver.mk b/package/sconeserver/sconeserver.mk
index 12cadbfd20..c160c8bf7c 100644
--- a/package/sconeserver/sconeserver.mk
+++ b/package/sconeserver/sconeserver.mk
@@ -10,7 +10,7 @@ SCONESERVER_LICENSE = GPL-2.0+
 SCONESERVER_LICENSE_FILES = COPYING
 # fetching from Git, we need to generate the configure script
 SCONESERVER_AUTORECONF = YES
-SCONESERVER_DEPENDENCIES = host-pkgconf pcre
+SCONESERVER_DEPENDENCIES = host-pkgconf pcre zlib
 # disable markdown module because its git submodule cmark
 # https://github.com/sconemad/sconeserver/tree/master/markdown
 # has no cross-compile support provided by the sconeserver build system
