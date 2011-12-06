From: Will Wagner <will_wagner@carallon.com>
Date: Tue,  6 Dec 2011 12:17:19 +0000
Subject: [Buildroot] [PATCH v2 3/4] Allow user to specify a custom uClibc
	config file when using ct-ng
In-Reply-To: <1323173840-8837-1-git-send-email-will_wagner@carallon.com>
References: <1323173840-8837-1-git-send-email-will_wagner@carallon.com>
Message-ID: <1323173840-8837-4-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Will Wagner <will_wagner@carallon.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
---
 toolchain/toolchain-crosstool-ng/Config.in |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index 4dd8a87..35db4de 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -66,8 +66,13 @@ choice
 endchoice
 
 config BR2_TOOLCHAIN_CTNG_uClibc_CONFIG
+	string "uClibc configuration file to use?"
 	default "toolchain/uClibc/uClibc-0.9.30.config" if BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_30
 	default "toolchain/uClibc/uClibc-0.9.32.config" if BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_32
+	help
+	  Some people may wish to use their own modified uClibc configuration
+	  file and will specify their config file location with this option.
+	  If unsure, use the default.
 
 config BR2_TOOLCHAIN_CTNG_uClibc_LARGEFILE
 	bool "Enable large file (files > 2 GB) support"
-- 
1.7.2.5
