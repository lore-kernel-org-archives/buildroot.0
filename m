From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Oct 2018 21:58:38 +0200
Subject: [Buildroot] [git commit] spandsp: remove redundant --disable-doc
Message-ID: <20181012195931.720378360B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0d1a6f152f3185e128fd122f05b81f8d0fb9e6fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

We pass --disable-doc by default to all autotools packages.

Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/spandsp/spandsp.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/spandsp/spandsp.mk b/package/spandsp/spandsp.mk
index fc9db34bfc..e02c15a776 100644
--- a/package/spandsp/spandsp.mk
+++ b/package/spandsp/spandsp.mk
@@ -15,7 +15,6 @@ SPANDSP_INSTALL_STAGING = YES
 SPANDSP_CONF_ENV = LIBS="`$(PKG_CONFIG_HOST_BINARY) --libs libtiff-4`"
 
 SPANDSP_CONF_OPTS = \
-	--disable-doc \
 	--disable-builtin-tiff \
 	$(if $(BR2_X86_CPU_HAS_MMX),--enable-mmx,--disable-mmx) \
 	$(if $(BR2_X86_CPU_HAS_SSE),--enable-sse,--disable-sse) \
