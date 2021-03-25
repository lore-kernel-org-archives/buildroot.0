From: Stefan Agner <stefan@agner.ch>
Date: Thu, 25 Mar 2021 15:17:28 +0100
Subject: [Buildroot] [PATCH] package/libbytesize: remove pcre2 runtime
 dependency
Message-ID: <226176cabe249af62546689fbb39de8a7010c329.1616681740.git.stefan@agner.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The library is only required at build time, which is handled by the
select in Config.in.

Signed-off-by: Stefan Agner <stefan@agner.ch>
---
 package/libbytesize/libbytesize.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/libbytesize/libbytesize.mk b/package/libbytesize/libbytesize.mk
index 0ba380dc74..df54ae84b7 100644
--- a/package/libbytesize/libbytesize.mk
+++ b/package/libbytesize/libbytesize.mk
@@ -14,8 +14,7 @@ LIBBYTESIZE_DEPENDENCIES = \
 	host-pkgconf \
 	host-gettext \
 	gmp \
-	mpfr \
-	pcre2
+	mpfr
 
 LIBBYTESIZE_CONF_OPTS += \
 	--without-python3 \
-- 
2.30.2
