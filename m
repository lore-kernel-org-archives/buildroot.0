From: Stefan Becker <chemobejk@gmail.com>
Date: Wed,  2 May 2018 13:09:04 +0300
Subject: [Buildroot] [PATCH] Config.in: add BR2_HOST_GCC_AT_LEAST_8
Message-ID: <20180502100904.29985-1-chemobejk@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fedora 28 switched to GCC 8.x.

Signed-off-by: Stefan Becker <chemobejk@gmail.com>
---
 Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Config.in b/Config.in
index 62d2dc3473..0d24ba6ebc 100644
--- a/Config.in
+++ b/Config.in
@@ -62,6 +62,12 @@ config BR2_HOST_GCC_AT_LEAST_7
 	default y if BR2_HOST_GCC_VERSION = "7"
 	select BR2_HOST_GCC_AT_LEAST_6
 
+config BR2_HOST_GCC_AT_LEAST_8
+	bool
+	default y if BR2_HOST_GCC_VERSION = "8"
+	select BR2_HOST_GCC_AT_LEAST_7
+
+
 # Hidden boolean selected by packages in need of Java in order to build
 # (example: kodi)
 config BR2_NEEDS_HOST_JAVA
-- 
2.17.0
