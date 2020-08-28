From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 28 Aug 2020 10:22:24 +0200
Subject: [Buildroot] [git commit] package/pkg-utils.mk: report the list of
 ignored CVEs in show-info
Message-ID: <20200902161637.1AF6985EB9@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b9c9f23f9a063c3a19ae52677242845bf8799da9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add the list of the CVEs to ignore for each package because they
already have a fix for it.

This information will be useful for a cve-checker.

Signed-off-by: Gregory CLEMENT <gregory.clement@bootlin.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-utils.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index d88a14ab0f..4fcb076e21 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -119,6 +119,11 @@ define _json-info-pkg
 	"reverse_dependencies": [
 		$(call make-comma-list,$(sort $($(1)_RDEPENDENCIES)))
 	]
+	$(if $($(1)_IGNORE_CVES),
+		$(comma) "ignore_cves": [
+			$(call make-comma-list,$(sort $($(1)_IGNORE_CVES)))
+		]
+	)
 endef
 
 define _json-info-pkg-details
