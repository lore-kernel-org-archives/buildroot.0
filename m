From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu,  5 Jan 2017 22:16:38 +0100
Subject: [Buildroot] [PATCH 2/2] package/libpjsip: drop path to staging to
	find libsrtp
In-Reply-To: <cover.1483650983.git.yann.morin.1998@free.fr>
References: <cover.1483650983.git.yann.morin.1998@free.fr>
Message-ID: <c1748115da6b3cd0269388e78450d97df370d387.1483650983.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As it happens, specifying the path where to look for libsrtp is not
needed: pjsip does not use the argument to --with-external-srtp as a
search path at all; it only checks whether it is 'no' or something
else.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: Luca Ceresoli <luca@lucaceresoli.net>
Acked-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/libpjsip/libpjsip.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libpjsip/libpjsip.mk b/package/libpjsip/libpjsip.mk
index 70dd4aa..eb50f00 100644
--- a/package/libpjsip/libpjsip.mk
+++ b/package/libpjsip/libpjsip.mk
@@ -52,7 +52,7 @@ LIBPJSIP_CONF_OPTS = \
 	--disable-ipp \
 	--disable-ssl \
 	--disable-silk \
-	--with-external-srtp=$(STAGING_DIR)/usr
+	--with-external-srtp
 
 # Note: aconfigure.ac is broken: --enable-epoll or --disable-epoll will
 # both enable it. But that's OK, epoll is better than the alternative,
-- 
2.7.4
