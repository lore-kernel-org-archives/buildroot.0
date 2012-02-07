From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 7 Feb 2012 10:52:35 +0100
Subject: [Buildroot] [git commit] Makefile: GENDOC_INNER: don't create
	subdirs for generated manuals
Message-ID: <20120207104119.DE48A909FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3ec57751fa54a1c8ad7d974a7e5a036af68d935c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The output files are generated directly in $(O)/docs/manual.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 912012f..7aeee96 100644
--- a/Makefile
+++ b/Makefile
@@ -719,7 +719,7 @@ $(1)-$(3): $$(O)/docs/$(1)/$(1).$(4)
 
 $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt $$($(call UPPERCASE,$(1))_SOURCES)
 	@echo "Generating $(5) $(1)..."
-	$(Q)mkdir -p $$(O)/docs/$(1)/$(2)
+	$(Q)mkdir -p $$(@D)
 	$(Q)a2x $(6) -f $(2) -d book -L -r $(TOPDIR)/docs/images \
 	  -D $$(@D) $$<
 endef
