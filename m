From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 14 Oct 2012 01:14:22 +0200
Subject: [Buildroot] [PATCH 07/13] uClibc: get default paths from
	BR2_PROJECT_DIR
In-Reply-To: <20121013231344.17317.92930.stgit@localhost>
References: <20121013231344.17317.92930.stgit@localhost>
Message-ID: <20121013231422.17317.83807.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 toolchain/uClibc/Config.in |    1 +
 1 file changed, 1 insertion(+)

diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index f46a415..9db0cfc 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -42,6 +42,7 @@ config BR2_UCLIBC_VERSION_STRING
 
 config BR2_UCLIBC_CONFIG
 	string "uClibc configuration file to use?"
+	default "$(PROJECT_DIR)/uClibc.config" if BR2_PROJECT_DIR != ""
 	default "toolchain/uClibc/uClibc-0.9.31.config" if BR2_UCLIBC_VERSION_0_9_31
 	default "toolchain/uClibc/uClibc-0.9.32.config" if BR2_UCLIBC_VERSION_0_9_32
 	default "toolchain/uClibc/uClibc-0.9.33.config" if BR2_UCLIBC_VERSION_0_9_33
