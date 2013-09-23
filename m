From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 24 Sep 2013 00:41:13 +0200
Subject: [Buildroot] [PATCH] core: introduce the BR2_EXTERNAL variable
	(additional patch to fix manual build)
In-Reply-To: <OFCF97B6AC.08C8B010-ON86257BEF.007B61FF-86257BEF.007B99C0@rockwellcollins.com>
References: <OFCF97B6AC.08C8B010-ON86257BEF.007B61FF-86257BEF.007B99C0@rockwellcollins.com>
Message-ID: <1379976073-2119-1-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 docs/manual/manual.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/docs/manual/manual.mk b/docs/manual/manual.mk
index 157d13c..8cd732a 100644
--- a/docs/manual/manual.mk
+++ b/docs/manual/manual.mk
@@ -1,6 +1,7 @@
 manual-update-lists: manual-check-dependencies-lists
 	$(Q)$(call MESSAGE,"Updating the manual lists...")
 	$(Q)BR2_DEFCONFIG="" TOPDIR=$(TOPDIR) O=$(O)/docs/manual/.build \
+		BR2_EXTERNAL=$(TOPDIR)/support/dummy-external \
 		$(TOPDIR)/support/scripts/gen-manual-lists.py
 
 manual-check-dependencies:
-- 
1.8.4
