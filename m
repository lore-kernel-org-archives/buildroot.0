From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Nov 2020 16:36:35 +0100
Subject: [Buildroot] [git commit branch/next] package/pkg-utils.mk: expose
 CPE ID in show-info when available
Message-ID: <20201126152148.325C68741A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c02d4652747aa3d86197ac6879b94955c95a5286
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This commit exposes a new per-package property in the "make show-info"
JSON output: "cpe-id", which exists when a valid CPE ID is available
for the package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pkg-utils.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 4fcb076e21..a2cc160d0b 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -119,6 +119,9 @@ define _json-info-pkg
 	"reverse_dependencies": [
 		$(call make-comma-list,$(sort $($(1)_RDEPENDENCIES)))
 	]
+	$(if $($(1)_CPE_ID_VALID), \
+		$(comma) "cpe-id": "$($(1)_CPE_ID)" \
+	)
 	$(if $($(1)_IGNORE_CVES),
 		$(comma) "ignore_cves": [
 			$(call make-comma-list,$(sort $($(1)_IGNORE_CVES)))
