From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 21 Aug 2014 22:25:47 +0200
Subject: [Buildroot] [PATCH v2 5/6] gendoc infra: Remove the manual* target
	from .PHONY
In-Reply-To: <1408652748-14708-1-git-send-email-s.martin49@gmail.com>
References: <1408652748-14708-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1408652748-14708-6-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is not needed because none of these targets are also the name of a
generated file.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- no change
---
 docs/manual/manual.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 016246c..437eccf 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -143,7 +143,6 @@ $(call GENDOC_INNER,$(pkgname),epub,epub,epub,ePUB)
 clean: $(pkgname)-clean
 $(pkgname)-clean:
 	$$(Q)$$(RM) -rf $$(BUILD_DIR)/$(pkgname)
-.PHONY: $(pkgname) $(pkgname)-clean manual-update-lists
 endef
 
 MANUAL_SOURCES = $(sort $(wildcard docs/manual/*.txt) $(wildcard docs/images/*))
-- 
2.1.0
