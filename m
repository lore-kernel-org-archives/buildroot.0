From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 13 Feb 2013 23:59:04 +0100
Subject: [Buildroot] [PATCH 3/9] manual: sprinkle with some calls to MESSAGE
In-Reply-To: <cover.1360795941.git.s.martin49@gmail.com>
References: <cover.1360795941.git.s.martin49@gmail.com>
Message-ID: <6aee23c2362a6fe3b8428805af5330f388e2b3aa.1360795941.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/manual.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
1.8.1.3
