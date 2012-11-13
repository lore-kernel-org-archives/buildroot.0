From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 13 Nov 2012 13:00:46 +0100
Subject: [Buildroot] legal-info: quote csv file contents,
	so commas can be used
Message-ID: <1352808046-28127-1-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

---
 package/pkg-utils.mk |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 293bf4f..835c588 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -94,7 +94,7 @@ legal-warning-pkg=echo "WARNING: $(1): $(2)" >>$(LEGAL_WARNINGS)
 define legal-warning-pkg-savednothing # pkg, {local|override}
 	$(call legal-warning-pkg,$(1),sources and license files not saved ($(2) packages not handled))
 endef
-legal-manifest=echo "$(1),$(2),$(3),$(4),$(5)" >>$(LEGAL_MANIFEST_CSV)
+legal-manifest=echo '"$(1)","$(2)","$(3)","$(4)","$(5)"' >>$(LEGAL_MANIFEST_CSV)
 define legal-license-header
 	echo -e "$(LEGAL_INFO_SEPARATOR)\n\t$(1):" \
 		"$(2)\n$(LEGAL_INFO_SEPARATOR)\n\n" >>$(LEGAL_LICENSES_TXT)
-- 
tg: (234fe44..) t/legal-info-commas (depends on: master)
