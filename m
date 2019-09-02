From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 14:32:52 +0200
Subject: [Buildroot] [git commit branch/2019.02.x] package/libdnet: fix
 dnet-config
Message-ID: <20190902122859.8477A89079@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97d7e73bdb4c26b477e504032d197c2169affe36
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Add dnet-config to LIBDNET_CONFIG_SCRIPTS so this script can be used by
applications such as tcpreplay

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3a4b68278ab20aee6de80bc9001788c4558282d2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libdnet/libdnet.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libdnet/libdnet.mk b/package/libdnet/libdnet.mk
index 00d9c4fd40..d1cc0bf150 100644
--- a/package/libdnet/libdnet.mk
+++ b/package/libdnet/libdnet.mk
@@ -13,6 +13,7 @@ LIBDNET_AUTORECONF = YES
 LIBDNET_CONF_OPTS = \
 	--with-gnu-ld \
 	--with-check=no
+LIBDNET_CONFIG_SCRIPTS = dnet-config
 
 ifneq ($(BR2_PACKAGE_LIBDNET_PYTHON),)
 LIBDNET_DEPENDENCIES = python
