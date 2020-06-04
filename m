From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Thu,  4 Jun 2020 10:26:06 +0200
Subject: [Buildroot] [PATCH v1 1/1] package/gloox: disable tests and examples
Message-ID: <20200604082606.6080-1-heiko.thiery@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/91385a34c80c5043519e96395e203eef662ac18d/

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
The failure occures in building the tests. By disabling this the failure
is gone. Nethertheless it could be checked if there can something
reported upstrem.
---
 package/gloox/gloox.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/gloox/gloox.mk b/package/gloox/gloox.mk
index 46fe4d6a15..f643118198 100644
--- a/package/gloox/gloox.mk
+++ b/package/gloox/gloox.mk
@@ -13,7 +13,9 @@ GLOOX_INSTALL_STAGING = YES
 GLOOX_DEPENDENCIES = mpc
 GLOOX_CONF_OPTS = \
 	--without-libidn \
-	--enable-getaddrinfo
+	--enable-getaddrinfo \
+	--without-examples \
+	--without-tests
 
 GLOOX_CXXFLAGS = $(TARGET_CXXFLAGS)
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_85180),y)
-- 
2.20.1
