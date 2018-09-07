From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 07 Sep 2018 11:16:36 -0000
Subject: [Buildroot] [git commit] package/botan: add optional dependency to
 sqlite
Message-ID: <20180907111536.D700F80F5F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9e62635c2e6f5dbcf346b9b44968a45115748d69
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/botan/botan.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/botan/botan.mk b/package/botan/botan.mk
index e25bf5b52f..984ecdc039 100644
--- a/package/botan/botan.mk
+++ b/package/botan/botan.mk
@@ -55,6 +55,11 @@ BOTAN_DEPENDENCIES += openssl
 BOTAN_CONF_OPTS += --with-openssl
 endif
 
+ifeq ($(BR2_PACKAGE_SQLITE),y)
+BOTAN_DEPENDENCIES += sqlite
+BOTAN_CONF_OPTS += --with-sqlite
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 BOTAN_DEPENDENCIES += zlib
 BOTAN_CONF_OPTS += --with-zlib
