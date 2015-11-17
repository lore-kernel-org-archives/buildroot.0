From: =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>
Date: Tue, 17 Nov 2015 17:16:25 +0100
Subject: [Buildroot] [PATCH] skeleton: remove unused /etc/issue
Message-ID: <1447776985-20087-1-git-send-email-jezz@sysmic.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

/etc/issue is managed with BR2_TARGET_GENERIC_ISSUE. In case
BR2_TARGET_GENERIC_ISSUE is set (which is default), /etc/issue
is overwritten. In case BR2_TARGET_GENERIC_ISSUE is not set,
we don't want /etc/issue exist.

Finaly, remove /etc/issue from skeleton.

Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>
---
 system/skeleton/etc/issue | 3 ---
 1 file changed, 3 deletions(-)
 delete mode 100644 system/skeleton/etc/issue

diff --git a/system/skeleton/etc/issue b/system/skeleton/etc/issue
deleted file mode 100644
index 90f1779..0000000
--- a/system/skeleton/etc/issue
+++ /dev/null
@@ -1,3 +0,0 @@
-
-Welcome to Buildroot
-
-- 
2.1.4
