From: Gregory CLEMENT <gregory.clement@bootlin.com>
Date: Fri, 10 Jul 2020 13:22:29 +0200
Subject: [Buildroot] [PATCH 3/9] package/pkg-utils: show-info: report the
 list of the CVEs ignored
In-Reply-To: <20200710112245.1044073-1-gregory.clement@bootlin.com>
References: <20200710112245.1044073-1-gregory.clement@bootlin.com>
Message-ID: <20200710112245.1044073-4-gregory.clement@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add the list of the CVEs to ignore for each package because they
already have a fix for it.

This information will be useful for a cve-checker.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
---
 package/pkg-utils.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index d88a14ab0f..49ce6dc6f1 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -117,7 +117,10 @@ define _json-info-pkg
 		$(call make-comma-list,$(sort $($(1)_FINAL_ALL_DEPENDENCIES)))
 	],
 	"reverse_dependencies": [
-		$(call make-comma-list,$(sort $($(1)_RDEPENDENCIES)))
+		$(call make-comma-list,$(sort $($(1)_RDEPENDENCIES))),
+	],
+	"ignored_cves": [
+		$(call make-comma-list,$(sort $($(1)_IGNORE_CVES)))
 	]
 endef
 
-- 
2.27.0
