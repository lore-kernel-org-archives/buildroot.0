From: Adrian Perez de Castro <aperez@igalia.com>
Date: Wed,  5 Jul 2017 16:06:33 +0300
Subject: [Buildroot] [PATCH 1/1] Config.in: add BR2_HOST_GCC_AT_LEAST_7
In-Reply-To: <20170705130633.12365-1-aperez@igalia.com>
References: <20170705130633.12365-1-aperez@igalia.com>
Message-ID: <20170705130633.12365-2-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Config.in b/Config.in
index 72ceadfde6..e395995ec9 100644
--- a/Config.in
+++ b/Config.in
@@ -57,6 +57,11 @@ config BR2_HOST_GCC_AT_LEAST_6
 	default y if BR2_HOST_GCC_VERSION = "6"
 	select BR2_HOST_GCC_AT_LEAST_5
 
+config BR2_HOST_GCC_AT_LEAST_7
+	bool
+	default y if BR2_HOST_GCC_VERSION = "7"
+	select BR2_HOST_GCC_AT_LEAST_6
+
 # Hidden boolean selected by packages in need of Java in order to build
 # (example: xbmc)
 config BR2_NEEDS_HOST_JAVA
-- 
2.13.2
