From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 12 Oct 2018 07:39:51 +0300
Subject: [Buildroot] [PATCH 2/2] spandsp: remove redundant --disable-doc
In-Reply-To: <461481fbc34bd2142d4b7e7265f953c2fbf84056.1539319191.git.baruch@tkos.co.il>
References: <461481fbc34bd2142d4b7e7265f953c2fbf84056.1539319191.git.baruch@tkos.co.il>
Message-ID: <c7da382b5516402633f053139d12ecdc6156d9f1.1539319191.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We pass --disable-doc by default to all autotools packages.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/spandsp/spandsp.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/spandsp/spandsp.mk b/package/spandsp/spandsp.mk
index fc9db34bfcae..e02c15a77677 100644
--- a/package/spandsp/spandsp.mk
+++ b/package/spandsp/spandsp.mk
@@ -15,7 +15,6 @@ SPANDSP_INSTALL_STAGING = YES
 SPANDSP_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libtiff-4`"
 
 SPANDSP_CONF_OPTS = \
-	--disable-doc \
 	--disable-builtin-tiff \
 	$(if $(BR2_X86_CPU_HAS_MMX),--enable-mmx,--disable-mmx) \
 	$(if $(BR2_X86_CPU_HAS_SSE),--enable-sse,--disable-sse) \
-- 
2.19.1
