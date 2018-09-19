From: Mark Fine <mark.fine@gmail.com>
Date: Wed, 19 Sep 2018 14:07:43 -0700
Subject: [Buildroot] [PATCH 1/2] c-ares: enable the host variant
Message-ID: <20180919210744.66688-1-mark.fine@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gRPC needs a c-ares library for the plugins to compile against.
Allow c-ares to be compiled as a host tool.

Signed-off-by: Mark Fine <mark.fine@gmail.com>
---
 package/c-ares/c-ares.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 67254244a1..76e9687b37 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -15,3 +15,4 @@ C_ARES_LICENSE = MIT
 C_ARES_LICENSE_FILES = ares_mkquery.c
 
 $(eval $(autotools-package))
+$(eval $(host-autotools-package))
-- 
2.14.3 (Apple Git-98)
