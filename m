From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 23 Nov 2014 21:39:11 +0100
Subject: [Buildroot] [PATCH 39/51] coreutils: add error handling to for loop
In-Reply-To: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1416775163-20215-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1416775163-20215-40-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/coreutils/coreutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index db0d8a9..8901d23 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -102,7 +102,7 @@ endif
 define COREUTILS_POST_INSTALL
 	# some things go in root rather than usr
 	for f in $(COREUTILS_BIN_PROGS); do \
-		mv -f $(TARGET_DIR)/usr/bin/$$f $(TARGET_DIR)/bin/$$f; \
+		mv -f $(TARGET_DIR)/usr/bin/$$f $(TARGET_DIR)/bin/$$f || exit 1; \
 	done
 	# link for archaic shells
 	ln -fs test $(TARGET_DIR)/usr/bin/[
-- 
2.1.0
