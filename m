Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4093FC3DA61
	for <buildroot@archiver.kernel.org>; Sun, 21 Jul 2024 16:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA60F607D0;
	Sun, 21 Jul 2024 16:42:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8vRigWK59xjx; Sun, 21 Jul 2024 16:42:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7307B6068A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7307B6068A;
	Sun, 21 Jul 2024 16:42:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 391581BF321
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26D6740120
 for <buildroot@lists.busybox.net>; Sun, 21 Jul 2024 16:42:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LRVzp_Ou18cA for <buildroot@lists.busybox.net>;
 Sun, 21 Jul 2024 16:42:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 176FA400F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 176FA400F3
 for <buildroot@buildroot.org>; Sun, 21 Jul 2024 16:42:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 023DA86F76; Sun, 21 Jul 2024 16:42:44 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Jul 2024 18:39:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ce07b7b29d08e09f52ca81c9d25728726c87d57
X-Git-Newrev: 6282b4eceb1821bc281a0710f93b52140fd9d36b
X-Patchwork-Hint: ignore
Message-Id: <20240721164245.023DA86F76@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/parsec-tool: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6282b4eceb1821bc281a0710f93b52140fd9d36b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Parsec Command Line Interface
This tool can be used to communicate with the PARSEC service.

https://github.com/parallaxsecond/parsec-tool.git

Signed-off-by: Saeed Kazemi <kazemi.ms@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                           |  1 +
 package/Config.in                    |  1 +
 package/parsec-tool/Config.in        |  9 +++++++++
 package/parsec-tool/parsec-tool.hash |  3 +++
 package/parsec-tool/parsec-tool.mk   | 12 ++++++++++++
 5 files changed, 26 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e5fe7b25a5..333e26d74e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2862,6 +2862,7 @@ F:	package/biosdevname/
 
 N:	Saeed Kazemi <kazemi.ms@gmail.com>
 F:	package/eza/
+F:	package/parsec-tool/
 F:	package/procs/
 F:	package/mxt-app/
 F:	package/zoxide/
diff --git a/package/Config.in b/package/Config.in
index f2e10b2b5e..a0d78518b6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1589,6 +1589,7 @@ menu "Crypto"
 	source "package/mbedtls/Config.in"
 	source "package/nettle/Config.in"
 	source "package/openssl/Config.in"
+	source "package/parsec-tool/Config.in"
 	source "package/pkcs11-helper/Config.in"
 	source "package/rhash/Config.in"
 	source "package/tinydtls/Config.in"
diff --git a/package/parsec-tool/Config.in b/package/parsec-tool/Config.in
new file mode 100644
index 0000000000..7607017bb1
--- /dev/null
+++ b/package/parsec-tool/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_PARSEC_TOOL
+	bool "parsec-tool"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  The Parsec Command Line Interface
+	  This tool can be used to communicate with the PARSEC service.
+
+	  https://github.com/parallaxsecond/parsec-tool.git
diff --git a/package/parsec-tool/parsec-tool.hash b/package/parsec-tool/parsec-tool.hash
new file mode 100644
index 0000000000..bd01bc4980
--- /dev/null
+++ b/package/parsec-tool/parsec-tool.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  5b994e10305a682c22fb6f566b57874a22ed8b9120d9fd253f5fa17c40ff759a  parsec-tool-0.7.0-cargo2.tar.gz
+sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/parsec-tool/parsec-tool.mk b/package/parsec-tool/parsec-tool.mk
new file mode 100644
index 0000000000..6fe2a8f320
--- /dev/null
+++ b/package/parsec-tool/parsec-tool.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# parsec-tool
+#
+################################################################################
+
+PARSEC_TOOL_VERSION = 0.7.0
+PARSEC_TOOL_SITE = $(call github,parallaxsecond,parsec-tool,$(PARSEC_TOOL_VERSION))
+PARSEC_TOOL_LICENSE = Apache-2.0
+PARSEC_TOOL_LICENSE_FILES = LICENSE
+
+$(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
