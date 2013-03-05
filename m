From: Samuel Martin <s.martin49@gmail.com>
Date: Tue,  5 Mar 2013 22:35:31 +0100
Subject: [Buildroot] [PATCH 5/6] Makefile: add to the release target a
	warning about the manual updates.
In-Reply-To: <cover.1362518799.git.s.martin49@gmail.com>
References: <cover.1362518799.git.s.martin49@gmail.com>
Message-ID: <e7929ec170e7b97af398284a0fe1c95b3de157cc.1362518799.git.s.martin49@gmail.com>
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
index 1300725..bcd896c 100644
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
1.8.1.5
