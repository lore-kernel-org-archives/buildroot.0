From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 17 Feb 2013 22:51:03 +0100
Subject: [Buildroot] [git commit] manual: sprinkle with some calls to MESSAGE
Message-ID: <20130217221225.B36009A7C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=4b95b369b1422b205ffde220d9cb20cc18f6b2dd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 docs/manual/manual.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index d664603..aa20534 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -18,7 +18,7 @@ $(1): $(1)-$(3)
 $(1)-$(3): $$(O)/docs/$(1)/$(1).$(4)
 
 $$(O)/docs/$(1)/$(1).$(4): docs/$(1)/$(1).txt $$($(call UPPERCASE,$(1))_SOURCES)
-	@echo "Generating $(5) $(1)..."
+	@$(call MESSAGE,"Generating $(5) $(1)...")
 	$(Q)mkdir -p $$(@D)
 	$(Q)a2x $(6) -f $(2) -d book -L -r $(TOPDIR)/docs/images \
 	  -D $$(@D) $$<
