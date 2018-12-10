From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Dec 2018 22:01:37 +0100
Subject: [Buildroot] [git commit] package/waf: purge trailing '/' from
 WAF_SITE
Message-ID: <20181210205813.1BECE840EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=10ded59ca54d653c405f715b50b8d200706d7e26
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

<PKG>_SITE cannot have a trailing slash.

This was not detected by the check in generic-package because it is a
host-only package without Config.in symbol.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
