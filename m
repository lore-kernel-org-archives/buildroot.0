From: Baruch Siach <baruch@tkos.co.il>
Date: Sat, 23 Dec 2017 19:43:02 +0200
Subject: [Buildroot] [PATCH 1/2] json-c: build for host
Message-ID: <874c469c732d0301687987f41dcbd7141f319b58.1514050983.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is needed for the recent cryptsetup version host build.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/json-c/json-c.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 7adbcafa7238..86636d7433eb 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -11,7 +11,9 @@ JSON_C_MAKE = $(MAKE1)
 JSON_C_CONF_OPTS = --disable-oldname-compat
 # AUTORECONF is needed because of Makefile.am.inc patch.
 JSON_C_AUTORECONF = YES
+HOST_JSON_C_AUTORECONF = YES
 JSON_C_LICENSE = MIT
 JSON_C_LICENSE_FILES = COPYING
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.15.1
