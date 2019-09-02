From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 2 Sep 2019 14:33:15 +0200
Subject: [Buildroot] [git commit branch/2019.05.x] package/libdnet: fix
 dnet-config
Message-ID: <20190902122907.3C94F8907E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=178b93cbb9b9971ff6310a7041803d08711601b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.05.x

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
