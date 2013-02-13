From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 13 Feb 2013 23:59:10 +0100
Subject: [Buildroot] [PATCH 9/9] Makefile: add to the release target a
	warning about the manual updates.
In-Reply-To: <cover.1360795941.git.s.martin49@gmail.com>
References: <cover.1360795941.git.s.martin49@gmail.com>
Message-ID: <73205fcda9f19a8e4717799831d0eb41a376da27.1360795941.git.s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The manual-update-lists target is not added to the dependencies of the
release target to allow editing the generated files.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index 3f967b2..e406de0 100644
--- a/Makefile
+++ b/Makefile
@@ -815,6 +815,8 @@ release: OUT=buildroot-$(BR2_VERSION)
 # Create release tarballs. We need to fiddle a bit to add the generated
 # documentation to the git output
 release:
+	$(warning Make sure the manual is up-to-date. To update the manual, run:)
+	$(warning $$ make manual-update-lists)
 	git archive --format=tar --prefix=$(OUT)/ master > $(OUT).tar
 	$(MAKE) O=$(OUT) manual-html manual-txt manual-pdf
 	tar rf $(OUT).tar $(OUT)
-- 
1.8.1.3
