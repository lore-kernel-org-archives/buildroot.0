From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  5 Apr 2019 23:16:36 +0200
Subject: [Buildroot] [PATCH 2/2] package/sslh: add optional libcap dependency
In-Reply-To: <20190405211636.17616-1-fontaine.fabrice@gmail.com>
References: <20190405211636.17616-1-fontaine.fabrice@gmail.com>
Message-ID: <20190405211636.17616-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libcap dependency has been added in version 1.16 with
https://github.com/yrutschle/sslh/commit/009faa64b75801961f88ec5a7a09fd991168d4e9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
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
-- 
2.20.1
