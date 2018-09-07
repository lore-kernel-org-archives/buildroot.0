From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:29 -0000
Subject: [Buildroot] [git commit] package/botan: add optional dependency to
 xz
Message-ID: <20180907111537.05D46811CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=2fc8abde2b9bb46d44ee80c2bde4d0012672ef10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/botan/botan.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index 984ecdc039..eb817f62d9 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -60,6 +60,11 @@ BOTAN_DEPENDENCIES += sqlite
 BOTAN_CONF_OPTS += --with-sqlite
 endif
 
+ifeq ($(BR2_PACKAGE_XZ),y)
+BOTAN_DEPENDENCIES += xz
+BOTAN_CONF_OPTS += --with-lzma
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 BOTAN_DEPENDENCIES += zlib
 BOTAN_CONF_OPTS += --with-zlib
