From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sun, 29 Jan 2012 16:11:37 +0100
Subject: [Buildroot] [RFC 04/15] legal-info: do not copy sources for
	proprietary packages
In-Reply-To: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
References: <1327849908-15588-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1327849908-15588-5-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/Makefile.package.in |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/Makefile.package.in b/package/Makefile.package.in
index 0d7e081..745cb26 100644
--- a/package/Makefile.package.in
+++ b/package/Makefile.package.in
@@ -657,7 +657,9 @@ $(1)-legal-info:	$(1)-source $(LEGAL_INFO_DIR) $(REDIST_SOURCES_DIR)
 			@echo -e "$(1)\t$$($(3)_VERSION)\t$$($(3)_LICENSE)"
 			@echo "$(1),$$($(3)_VERSION),$$($(3)_LICENSE)" \
 				>>$(LEGAL_MANIFEST_CSV)
+ifneq ($$($(3)_LICENSE),PROPRIETARY)
 			@cp $(DL_DIR)/$$($(3)_SOURCE) $(REDIST_SOURCES_DIR)
+endif
 
 $(1)-show-depends:
 			@echo $$($(2)_DEPENDENCIES)
-- 
1.7.5.4
