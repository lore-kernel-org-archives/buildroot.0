From: Martin Bark <martin@barkynet.com>
Date: Mon,  6 Jun 2016 11:18:14 +0100
Subject: [Buildroot] [PATCH 1/1] Config.in: add BR2_HOST_GCC_AT_LEAST_6
Message-ID: <20160606101814.5777-1-martin@barkynet.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Martin Bark <martin@barkynet.com>

---
Note: i spotted this when trying to build nodejs on archlinux which
currently uses gcc 6.1.1

Signed-off-by: Martin Bark <martin@barkynet.com>
---
 Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Config.in b/Config.in
index 1dd2bb3..9fa7415 100644
--- a/Config.in
+++ b/Config.in
@@ -47,6 +47,11 @@ config BR2_HOST_GCC_AT_LEAST_5
 	default y if BR2_HOST_GCC_VERSION = "5"
 	select BR2_HOST_GCC_AT_LEAST_4_9
 
+config BR2_HOST_GCC_AT_LEAST_6
+	bool
+	default y if BR2_HOST_GCC_VERSION = "6"
+	select BR2_HOST_GCC_AT_LEAST_5
+
 # Hidden boolean selected by packages in need of Java in order to build
 # (example: xbmc)
 config BR2_NEEDS_HOST_JAVA
-- 
2.8.3
