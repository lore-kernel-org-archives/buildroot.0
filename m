From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 21 Aug 2014 22:25:48 +0200
Subject: [Buildroot] [PATCH v2 6/6] gendoc infra: Move the manual-clean
	target outside of the infra
In-Reply-To: <1408652748-14708-1-git-send-email-s.martin49@gmail.com>
References: <1408652748-14708-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1408652748-14708-7-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- no change
---
 docs/manual/manual.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 437eccf..74e591f 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -140,10 +140,12 @@ $(call GENDOC_INNER,$(pkgname),pdf,pdf,pdf,PDF,\
 	--dblatex-opts "-P latex.output.revhistory=0 -x '--maxvars 100000'")
 $(call GENDOC_INNER,$(pkgname),text,text,text,text)
 $(call GENDOC_INNER,$(pkgname),epub,epub,epub,ePUB)
+endef
+
 clean: $(pkgname)-clean
+
 $(pkgname)-clean:
-	$$(Q)$$(RM) -rf $$(BUILD_DIR)/$(pkgname)
-endef
+	$(Q)$(RM) -rf $(BUILD_DIR)/$(pkgname)
 
 MANUAL_SOURCES = $(sort $(wildcard docs/manual/*.txt) $(wildcard docs/images/*))
 $(eval $(call GENDOC))
-- 
2.1.0
