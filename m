From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 23 Feb 2010 21:07:04 +0100
Subject: [Buildroot] [PATCH 40/40] e2fsprogs: fix lsattr chattr and e2label
	e2undo mixup
In-Reply-To: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
References: <cover.1266955555.git.thomas.petazzoni@free-electrons.com>
Message-ID: <f08e9eea1b70f057cc0a3efa18b2acb4faea4abe.1266955555.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Richard van Paasen <rvpaasen@t3i.nl>

In Config.in lsattr/chattr and e2label/e2undo are mixed up.
---
 package/e2fsprogs/Config.in |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/e2fsprogs/Config.in b/package/e2fsprogs/Config.in
index e83ad4f..2bb92d9 100644
--- a/package/e2fsprogs/Config.in
+++ b/package/e2fsprogs/Config.in
@@ -54,7 +54,7 @@ config BR2_PACKAGE_E2FSPROGS_E2LABEL
 	select BR2_PACKAGE_E2FSPROGS_LIBBLKID
 
 config BR2_PACKAGE_E2FSPROGS_E2UNDO
-	bool "e2label"
+	bool "e2undo"
 	default y
 	depends on BR2_PACKAGE_E2FSPROGS
 
@@ -81,7 +81,7 @@ config BR2_PACKAGE_E2FSPROGS_LOGSAVE
 	depends on BR2_PACKAGE_E2FSPROGS
 
 config BR2_PACKAGE_E2FSPROGS_LSATTR
-	bool "chattr"
+	bool "lsattr"
 	default y
 	depends on BR2_PACKAGE_E2FSPROGS
 
-- 
1.6.3.3
