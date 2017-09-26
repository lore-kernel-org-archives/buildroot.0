From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 26 Sep 2017 23:50:14 +0200
Subject: [Buildroot] [git commit] package/libshout: enable optional
	dependency for libressl
Message-ID: <20170926215333.D669B7FDC5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46b8fb7500ecca65a79507318fd3052208559c09
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libshout uses pkgconfig currently only to check for openssl paths, to
fix the build error we pass our STAGING_DIR as parameter to
--with-openssl

Fixes
http://autobuild.buildroot.net/results/72a/72aa07d48d6b1d7dea046b88ee4aa943534ffad4/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libshout/libshout.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libshout/libshout.mk b/package/libshout/libshout.mk
index 8fd850f..4f20908 100644
--- a/package/libshout/libshout.mk
+++ b/package/libshout/libshout.mk
@@ -31,6 +31,9 @@ endif
 ifeq ($(BR2_PACKAGE_OPENSSL),y)
 LIBSHOUT_CONF_OPTS += --with-openssl
 LIBSHOUT_DEPENDENCIES += openssl
+else ifeq ($(BR2_PACKAGE_LIBRESSL),y)
+LIBSHOUT_CONF_OPTS += --with-openssl=$(STAGING_DIR)/lib
+LIBSHOUT_DEPENDENCIES += libressl
 else
 LIBSHOUT_CONF_OPTS += --without-openssl
 endif
