From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 20 Aug 2014 12:03:24 +0200
Subject: [Buildroot] [PATCH 6/6] gendoc infra: Move the manual-clean target
	outside of the infra
In-Reply-To: <1408529004-18632-1-git-send-email-s.martin49@gmail.com>
References: <1408529004-18632-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1408529004-18632-7-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 docs/manual/manual.mk | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 3651b32..3c8d36a 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -159,10 +159,12 @@ $(call GENDOC_INNER,$(pkgname),pdf,pdf,pdf,PDF,\
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
2.0.4
