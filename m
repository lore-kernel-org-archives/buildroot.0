From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 28 Nov 2012 22:40:31 +0100
Subject: [Buildroot] [PATCH 5/6] Makefile: add to the release target a
	warning about the manual updates.
In-Reply-To: <1354138832-18149-1-git-send-email-s.martin49@gmail.com>
References: <1354138832-18149-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1354138832-18149-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The manual-update-lists target is not added to the dependencies of the
release target to allow editing the generated files.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 Makefile | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 21aa054..3cca919 100644
--- a/Makefile
+++ b/Makefile
@@ -749,6 +749,8 @@ release: OUT=buildroot-$(BR2_VERSION)
 # Create release tarballs. We need to fiddle a bit to add the generated
 # documentation to the git output
 release:
+	$(warning Make sure the manual is up-to-date. To update the manual, run:)
+	$(warning $$ make manual-update-lists)
 	git archive --format=tar --prefix=$(OUT)/ master > $(OUT).tar
 	$(MAKE) O=$(OUT) manual-html manual-txt manual-pdf
 	tar rf $(OUT).tar $(OUT)
@@ -762,4 +764,3 @@ print-version:
 include docs/manual/manual.mk
 
 .PHONY: $(noconfig_targets)
-
-- 
1.8.0.1
