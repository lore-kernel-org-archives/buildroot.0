From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 4 Jun 2020 23:27:43 +0200
Subject: [Buildroot] [git commit] package/gloox: disable tests and examples
Message-ID: <20200604212709.CA3AA839E5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e16c37ae16ee0cc52c0e26cd889b1400d74cfc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/91385a34c80c5043519e96395e203eef662ac18d/

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
