From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 14 Oct 2012 01:14:17 +0200
Subject: [Buildroot] [PATCH 06/13] toolchain-crosstool-ng: get default paths
 from BR2_PROJECT_DIR
In-Reply-To: <20121013231344.17317.92930.stgit@localhost>
References: <20121013231344.17317.92930.stgit@localhost>
Message-ID: <20121013231417.17317.68954.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/toolchain-crosstool-ng/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index 35ea2b1..9a08768 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -36,6 +36,7 @@ config BR2_TOOLCHAIN_CTNG_LIBC
 
 config BR2_TOOLCHAIN_CTNG_CONFIG
 	string "crosstool-NG configuration file to use"
+	default "$(PROJECT_DIR)/crosstool-ng.config" if BR2_PROJECT_DIR != ""
 	default "toolchain/toolchain-crosstool-ng/crosstool-ng.config-uClibc" if BR2_TOOLCHAIN_CTNG_uClibc
 	default "toolchain/toolchain-crosstool-ng/crosstool-ng.config-eglibc" if BR2_TOOLCHAIN_CTNG_eglibc
 	default "toolchain/toolchain-crosstool-ng/crosstool-ng.config-glibc"  if BR2_TOOLCHAIN_CTNG_glibc
