From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Mon,  5 May 2014 15:24:07 +0200
Subject: [Buildroot] [PATCH] libenca: Move build host tool to PRE_BUILD_HOOKS
Message-ID: <1399296247-26320-1-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The make_hash host tool, should be built during a PRE_BUILD_HOOKS and
not a POST_CONFIGURE_HOOKS.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 package/libenca/libenca.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libenca/libenca.mk b/package/libenca/libenca.mk
index d998c66..66fcfaa 100644
--- a/package/libenca/libenca.mk
+++ b/package/libenca/libenca.mk
@@ -21,6 +21,6 @@ define LIBENCA_MAKE_HOST_TOOL
 	$(MAKE) -C $(@D)/tools $(HOST_CONFIGURE_OPTS) make_hash
 endef
 
-LIBENCA_POST_CONFIGURE_HOOKS += LIBENCA_MAKE_HOST_TOOL
+LIBENCA_PRE_BUILD_HOOKS += LIBENCA_MAKE_HOST_TOOL
 
 $(eval $(autotools-package))
-- 
1.9.2
