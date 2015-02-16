From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Mon, 16 Feb 2015 12:00:28 -0500
Subject: [Buildroot] [PATCH 1/3] pkg-rebar: HOST_CC -> HOSTCC
In-Reply-To: <1424106030-16836-1-git-send-email-fhunleth@troodon-software.com>
References: <1424106030-16836-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <1424106030-16836-2-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix HOSTCC typo that would cause host-rebar builds to fail.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
 package/pkg-rebar.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-rebar.mk b/package/pkg-rebar.mk
index 620316d..57fb2f4 100644
--- a/package/pkg-rebar.mk
+++ b/package/pkg-rebar.mk
@@ -209,7 +209,7 @@ $(2)_CONF_ENV += $$(REBAR_HOST_DEPS_ENV)
 ifndef $(2)_BUILD_CMDS
 define $(2)_BUILD_CMDS
 	(cd $$(@D); \
-		CC="$$(HOST_CC)" \
+		CC="$$(HOSTCC)" \
 		CFLAGS="$$(HOST_CFLAGS)" \
 		LDFLAGS="$$(HOST_LDFLAGS)" \
 		$$(REBAR_HOST_DEPS_ENV) \
-- 
1.9.1
