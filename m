From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 14 Jan 2010 10:18:44 +0100
Subject: [Buildroot] [PATCH 1/1] Add uClibc 0.9.30.2
In-Reply-To: <cover.1263460719.git.thomas.petazzoni@free-electrons.com>
References: <cover.1263460719.git.thomas.petazzoni@free-electrons.com>
Message-ID: <da230e87fe682fc49cb1787b636f98c40d6f1ae8.1263460719.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 toolchain/uClibc/Config.in |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index 16708a6..b17c60f 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -5,7 +5,7 @@ comment "uClibc Options"
 
 choice
 	prompt "uClibc C library Version"
-	default BR2_UCLIBC_VERSION_0_9_30_1
+	default BR2_UCLIBC_VERSION_0_9_30_2
 	help
 	  Select the version of uClibc you wish to use.
 
@@ -26,6 +26,9 @@ choice
 	config BR2_UCLIBC_VERSION_0_9_30_1
 		bool "uClibc 0.9.30.1"
 
+	config BR2_UCLIBC_VERSION_0_9_30_2
+		bool "uClibc 0.9.30.2"
+
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		bool "daily snapshot"
 
@@ -44,6 +47,7 @@ config BR2_UCLIBC_VERSION_STRING
 	default 0.9.29		if BR2_UCLIBC_VERSION_0_9_29
 	default 0.9.30		if BR2_UCLIBC_VERSION_0_9_30
 	default 0.9.30.1	if BR2_UCLIBC_VERSION_0_9_30_1
+	default 0.9.30.2	if BR2_UCLIBC_VERSION_0_9_30_2
 	default $BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
@@ -52,6 +56,7 @@ config BR2_UCLIBC_CONFIG
 	default "toolchain/uClibc/uClibc-0.9.29.config" if BR2_UCLIBC_VERSION_0_9_29
 	default "toolchain/uClibc/uClibc-0.9.30.config" if BR2_UCLIBC_VERSION_0_9_30
 	default "toolchain/uClibc/uClibc-0.9.30.config" if BR2_UCLIBC_VERSION_0_9_30_1
+	default "toolchain/uClibc/uClibc-0.9.30.config" if BR2_UCLIBC_VERSION_0_9_30_2
 	default "toolchain/uClibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_SNAPSHOT
 	help
 	  Some people may wish to use their own modified uClibc configuration
-- 
1.6.3.3
