From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 12 Oct 2014 21:47:42 +0200
Subject: [Buildroot] [git commit] package/upmpdcli: fix missing dependency
	of libcurl
Message-ID: <20141012195151.0E3D0B2B69@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1dbdf1e2a297f269c2820399705ed16b63796a2d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: J??rg Krause <jkrause@posteo.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/upmpdcli/Config.in   |    1 +
 package/upmpdcli/upmpdcli.mk |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/package/upmpdcli/Config.in b/package/upmpdcli/Config.in
index dbbc9b5..f28c775 100644
--- a/package/upmpdcli/Config.in
+++ b/package/upmpdcli/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_UPMPDCLI
 	bool "upmpdcli"
 	select BR2_PACKAGE_EXPAT
+	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBUPNP
 	select BR2_PACKAGE_LIBMPDCLIENT
 	depends on BR2_INSTALL_LIBSTDCPP
diff --git a/package/upmpdcli/upmpdcli.mk b/package/upmpdcli/upmpdcli.mk
index 88a5a16..547752a 100644
--- a/package/upmpdcli/upmpdcli.mk
+++ b/package/upmpdcli/upmpdcli.mk
@@ -8,7 +8,7 @@ UPMPDCLI_VERSION = 0.8.3
 UPMPDCLI_SITE = http://www.lesbonscomptes.com/upmpdcli/downloads
 UPMPDCLI_LICENSE = GPLv2+
 UPMPDCLI_LICENSE_FILES = COPYING
-UPMPDCLI_DEPENDENCIES = expat libupnp libmpdclient
+UPMPDCLI_DEPENDENCIES = expat libcurl libupnp libmpdclient
 
 # Upmpdcli only runs if user upmpdcli exists
 define UPMPDCLI_USERS
