From: Vadim Kochan <vadim4j@gmail.com>
Date: Mon, 15 Apr 2019 00:26:54 +0300
Subject: [Buildroot] [RFC 1/1] toolchain-external/Config.in: Allow to select
 custom external-toolchain package
Message-ID: <20190414212654.14910-1-vadim4j@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add dummy 'Other' external toolchain option which allows to select
custom external-toolchain project, e.g. from external project tree.

Signed-off-by: Vadim Kochan <vadim4j@gmail.com>
---
 toolchain/toolchain-external/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 1f14f0350a..fd61c70766 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -47,6 +47,12 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Confi
 # architecture.
 source "toolchain/toolchain-external/toolchain-external-custom/Config.in"
 
+config BR2_TOOLCHAIN_EXTERNAL_OTHER
+	bool "Other"
+	help
+	  Use this option to use a external toolchain from custom package
+	  (e.g. in external project).
+
 endchoice
 
 choice
-- 
2.14.1
