From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 2 Apr 2018 19:57:02 +0200
Subject: [Buildroot] [git commit] waf: use HOST_WAF_DL_DIR instead of
 WAF_DL_DIR
Message-ID: <20180402175820.D66928155A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=149246d0cadbf516e6320cc1994557ef33848317
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The infrastructure only provides HOST_WAF_DL_DIR, because this package
is host only. Ideally the infra should provide WAF_DL_DIR, but it
doesn't currently, and that requires more significant changes.

Fixes:

  http://autobuild.buildroot.org/results/01d8c21df4baa9ecc6a0e45744fe6a4d086a0652/

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/waf/waf.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index 639c26a3b0..cb738a38fd 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -9,7 +9,7 @@ WAF_SOURCE = waf-$(WAF_VERSION)
 WAF_SITE = https://waf.io/
 
 define HOST_WAF_EXTRACT_CMDS
-	$(INSTALL) -D -m 0755 $(WAF_DL_DIR)/waf-$(WAF_VERSION) $(@D)/waf
+	$(INSTALL) -D -m 0755 $(HOST_WAF_DL_DIR)/waf-$(WAF_VERSION) $(@D)/waf
 endef
 
 define HOST_WAF_INSTALL_CMDS
