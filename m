From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 21 Mar 2013 22:04:37 +0100
Subject: [Buildroot] [PATCH 6/7] Makefile: add to the release target a
	warning about the manual updates.
In-Reply-To: <cover.1363899518.git.s.martin49@gmail.com>
References: <cover.1363899518.git.s.martin49@gmail.com>
Message-ID: <91d8c3e54dbd91424ad55fd0e254da76e8b6ea8f.1363899518.git.s.martin49@gmail.com>
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
index c462bb1..2b25059 100644
--- a/Makefile
+++ b/Makefile
@@ -817,6 +817,8 @@ release: OUT=buildroot-$(BR2_VERSION)
 # Create release tarballs. We need to fiddle a bit to add the generated
 # documentation to the git output
 release:
+	$(warning Make sure the manual is up-to-date. To update the manual, run:)
+	$(warning $$ make manual-update-lists)
 	git archive --format=tar --prefix=$(OUT)/ master > $(OUT).tar
 	$(MAKE) O=$(OUT) manual-html manual-txt manual-pdf
 	tar rf $(OUT).tar $(OUT)
-- 
1.8.2
