From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 19 Mar 2016 21:25:35 +0100
Subject: [Buildroot] [PATCH 2/3] Config.in: add symbols for
	BR2_HOST_GCC_AT_LEAST_4_6
In-Reply-To: <1458419136-9094-1-git-send-email-bernd.kuhls@t-online.de>
References: <1458419136-9094-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1458419136-9094-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This option is needed to fix the Kodi build with older host gcc
versions.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Config.in b/Config.in
index dfb5721..b5cc892 100644
--- a/Config.in
+++ b/Config.in
@@ -23,9 +23,14 @@ config BR2_HOST_GCC_VERSION
 	string
 	option env="HOST_GCC_VERSION"
 
+config BR2_HOST_GCC_AT_LEAST_4_6
+	bool
+	default y if BR2_HOST_GCC_VERSION = "4 6"
+
 config BR2_HOST_GCC_AT_LEAST_4_7
 	bool
 	default y if BR2_HOST_GCC_VERSION = "4 7"
+	select BR2_HOST_GCC_AT_LEAST_4_6
 
 config BR2_HOST_GCC_AT_LEAST_4_8
 	bool
-- 
2.7.0
