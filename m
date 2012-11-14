From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 14 Nov 2012 22:43:45 +0100
Subject: [Buildroot] [git commit] legal-info: quote csv file contents,
	so commas can be used
Message-ID: <20121114214737.DC36B99B26@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=f876cb598b78d31ca480e0f0ad0eb61d4e6c146f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/pkg-utils.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

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
