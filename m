From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 May 2010 00:00:10 +0200
Subject: [Buildroot] [git commit master] Fix autotools configuration cache
	handling
Message-ID: <20100502220952.C8DA28ABA4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=1534274047282767ab7053a2c819d209abc02e20
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It got broken by the introduction of the new autotools infrastructure
based on the generic infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Makefile.autotools.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 67cc88a..318bd71 100644
--- a/package/Makefile.autotools.in
+++ b/package/Makefile.autotools.in
@@ -93,7 +93,7 @@ define $(2)_CONFIGURE_CMDS
 	$$(TARGET_CONFIGURE_ENV) \
 	$$($$(PKG)_CONF_ENV) \
 	./configure \
-		$(if $(filter YES,$$($$(PKG)_USE_CONFIG_CACHE)),--cache-file="$(BUILD_DIR)/tgt-config.cache",) \
+		$$(if $$(filter YES,$$($$(PKG)_USE_CONFIG_CACHE)),--cache-file="$(BUILD_DIR)/tgt-config.cache",) \
 		--target=$$(GNU_TARGET_NAME) \
 		--host=$$(GNU_TARGET_NAME) \
 		--build=$$(GNU_HOST_NAME) \
-- 
1.6.3.3
