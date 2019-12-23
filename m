From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Dec 2019 09:30:39 +0100
Subject: [Buildroot] [git commit branch/2019.11.x] package/libp11: add
 host-pkgconf dependency for host variant
Message-ID: <20191223082218.8A5838DEFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4e8ce81899530de661edbd85caf2c0c0a701ff01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.11.x

host-pkgconf is needed to find host-openssl

Fixes:
 - http://autobuild.buildroot.org/results/05adf424050cb56f74ae4106b3c9b61f8daff7d2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 471281df124d14bd9b1af98b25bb48361c84be37)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libp11/libp11.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libp11/libp11.mk b/package/libp11/libp11.mk
index cf3e78d2dd..90c582571e 100644
--- a/package/libp11/libp11.mk
+++ b/package/libp11/libp11.mk
@@ -20,7 +20,7 @@ ifeq ($(BR2_PACKAGE_P11_KIT),y)
 LIBP11_CONF_OPTS += --with-pkcs11-module=/usr/lib/p11-kit-proxy.so
 endif
 
-HOST_LIBP11_DEPENDENCIES = host-openssl
+HOST_LIBP11_DEPENDENCIES = host-pkgconf host-openssl
 
 $(eval $(autotools-package))
 $(eval $(host-autotools-package))
