From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 15:01:54 +0200
Subject: [Buildroot] [git commit] package/sslh: add optional libcap
 dependency
Message-ID: <20190411125747.411DB8E425@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b5e19d07d88ddce930b5ebfc1fb80b1c7878cdfd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libcap dependency has been added in version 1.16 with
https://github.com/yrutschle/sslh/commit/009faa64b75801961f88ec5a7a09fd991168d4e9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/sslh/sslh.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/sslh/sslh.mk b/package/sslh/sslh.mk
index 5c868dfe2f..e8eb5e2b6f 100644
--- a/package/sslh/sslh.mk
+++ b/package/sslh/sslh.mk
@@ -13,6 +13,13 @@ SSLH_DEPENDENCIES = libconfig
 
 SSLH_MAKE_OPTS = $(TARGET_CONFIGURE_OPTS)
 
+ifeq ($(BR2_PACKAGE_LIBCAP),y)
+SSLH_DEPENDENCIES += libcap
+SSLH_MAKE_OPTS += USELIBCAP=1
+else
+SSLH_MAKE_OPTS += USELIBCAP=
+endif
+
 ifeq ($(BR2_PACKAGE_PCRE),y)
 SSLH_DEPENDENCIES += pcre
 SSLH_MAKE_OPTS += USELIBPCRE=1
