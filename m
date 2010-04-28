From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 28 Apr 2010 23:41:00 +0200
Subject: [Buildroot] [PATCH 19/19] Fix autotools configuration cache handling
In-Reply-To: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
References: <cover.1272490771.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87554baef80b6727d4b320ab75ddc14e6d3e75e4.1272490772.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It got broken by the introduction of the new autotools infrastructure
based on the generic infrastructure.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.autotools.in |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/Makefile.autotools.in b/package/Makefile.autotools.in
index 96ff91f..67ca5d0 100644
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
