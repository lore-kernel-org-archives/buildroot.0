From: David GOUARIN <dgouarin@gmail.com>
Date: Tue, 13 Oct 2020 21:49:45 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/pkg-waf: allow for override of
 PKG_WAF directive
Message-ID: <20201013194945.6287-1-dgouarin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As suggested by Thomas for the libtalloc patch : http://patchwork.ozlabs.org/project/buildroot/patch/20200327150225.15277-1-jared.bents at rockwellcollins.com/

Signed-off-by: David GOUARIN <dgouarin@gmail.com>
---
 package/pkg-waf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-waf.mk b/package/pkg-waf.mk
index 35e56d3c13..038d89454e 100644
--- a/package/pkg-waf.mk
+++ b/package/pkg-waf.mk
@@ -46,7 +46,7 @@ ifeq ($$($(2)_NEEDS_EXTERNAL_WAF),YES)
 $(2)_DEPENDENCIES += host-waf
 $(2)_WAF = $$(HOST_DIR)/bin/waf
 else
-$(2)_WAF = ./waf
+$(2)_WAF ?= ./waf
 endif
 
 $(2)_BUILD_OPTS				?=
-- 
2.17.1
