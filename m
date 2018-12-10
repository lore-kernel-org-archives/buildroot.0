From: Carlos Santos <casantos@datacom.com.br>
Date: Mon, 10 Dec 2018 16:45:59 -0200
Subject: [Buildroot] [PATCH] package/waf: purge trailig '/' from WAF_SITE
Message-ID: <20181210184559.13181-1-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

<PKG>_SITE cannot have a trailing slash.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/waf/waf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index cb738a38fd..97bc2a8963 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -6,7 +6,7 @@
 
 WAF_VERSION = 1.9.5
 WAF_SOURCE = waf-$(WAF_VERSION)
-WAF_SITE = https://waf.io/
+WAF_SITE = https://waf.io
 
 define HOST_WAF_EXTRACT_CMDS
 	$(INSTALL) -D -m 0755 $(HOST_WAF_DL_DIR)/waf-$(WAF_VERSION) $(@D)/waf
-- 
2.14.5
