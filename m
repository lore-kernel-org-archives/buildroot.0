Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A33DD3B7E5
	for <buildroot@archiver.kernel.org>; Mon, 29 Dec 2025 11:25:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2F028174F;
	Mon, 29 Dec 2025 11:25:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pqMeYNLcDR6B; Mon, 29 Dec 2025 11:25:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D363981756
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767007537;
	bh=nHMlpYxIsx4Mav33siASb+B7i/HSDsAenGNfqlJ+3GM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EacUdlZ5NjQcR25FbIQtlD8BtABrjnlOCyLz41hp2IbqjLGlVhmBkp6xmFJAtI0Fg
	 sFebSBL/9z4yd9E8HjuX5TmAHDpRj+Md+/j3TOn2Brt5uX1VOBwOLChHrs6a17ZZWN
	 KNOTmk8Fq83tXePUI9BcCFRq5K2O0isXGSRn+PrG6+RGSDs3PV35x3MXwi7kKl62kj
	 tHyBG/pE5TxHfaa+RD7Zjp3RPpopdLGuno3x/NhggvJkCFEybyEUqdmA+keqDS+TQu
	 wWMPwEjpGDk9O1acii8R5vF84lUvQGpG/yT6yv/4y2Iym+Jq+bo+k4J9MJlPpF6fqI
	 xZKpxTu92DB/Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D363981756;
	Mon, 29 Dec 2025 11:25:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D0B83D8
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 11:25:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE38660802
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 11:25:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wjWx89lY3ZaS for <buildroot@buildroot.org>;
 Mon, 29 Dec 2025 11:25:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B1F56074A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B1F56074A
 for <buildroot@buildroot.org>; Mon, 29 Dec 2025 11:25:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0638F87A6D; Mon, 29 Dec 2025 11:25:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Dec 2025 11:56:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd295e5ba3fd68373da4e83837cd65266c978928
X-Git-Newrev: 2e1d51533cc0c28d5fd86edd90adce250ade5b18
X-Patchwork-Hint: ignore
Message-Id: <20251229112536.0638F87A6D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/aichat: new package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2e1d51533cc0c28d5fd86edd90adce250ade5b18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

AIChat helps seamlessly integrate different LLM models, providing access
via the CLI and network. It can serve as a gateway to heterogeneous and
distributed LLMs.

Handy features like roles, macros, and sessions help simplify repetitive
tasks and reuse of existing solutions. Features like playgrounds and
arenas help to explore and compare models.

https://github.com/sigoden/AIChat

Signed-off-by: Alexander Shirokov <shirokovalexs@gmail.com>
[Julien:
 - select BR2_PACKAGE_HOST_RUSTC instead of "depends on"
 - add Apache-2.0 license (package is dual licensed)
 - add LICENSE-APACHE license hash
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                 |  3 +++
 package/Config.in          |  1 +
 package/aichat/Config.in   | 15 +++++++++++++++
 package/aichat/aichat.hash |  4 ++++
 package/aichat/aichat.mk   | 12 ++++++++++++
 5 files changed, 35 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index b4c9b6e618..ffc14ced6f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -129,6 +129,9 @@ F:	package/openpgm/
 N:	Aleksandr Makarov <aleksandr.o.makarov@gmail.com>
 F:	package/libest/
 
+N:	Alexander Shirokov <shirokovalexs@gmail.com>
+F:	package/aichat/
+
 N:	Alexander Sverdlin <alexander.sverdlin@gmail.com>
 F:	package/mini-snmpd/
 
diff --git a/package/Config.in b/package/Config.in
index cd8765bbcf..b2e8229d5d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -164,6 +164,7 @@ menu "Debugging, profiling and benchmark"
 endmenu
 
 menu "Development tools"
+	source "package/aichat/Config.in"
 	source "package/avocado/Config.in"
 	source "package/bats-core/Config.in"
 	source "package/binutils/Config.in"
diff --git a/package/aichat/Config.in b/package/aichat/Config.in
new file mode 100644
index 0000000000..e1bd177076
--- /dev/null
+++ b/package/aichat/Config.in
@@ -0,0 +1,15 @@
+config BR2_PACKAGE_AICHAT
+	bool "aichat"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	select BR2_PACKAGE_HOST_RUSTC
+	help
+	  AIChat helps seamlessly integrate different LLM models,
+	  providing access via the CLI and network. It can serve
+	  as a gateway to heterogeneous and distributed LLMs.
+
+	  Handy features like roles, macros, and sessions help
+	  simplify repetitive tasks and reuse of existing solutions.
+	  Features like playgrounds and arenas help to explore and
+	  compare models.
+
+	  https://github.com/sigoden/aichat
diff --git a/package/aichat/aichat.hash b/package/aichat/aichat.hash
new file mode 100644
index 0000000000..43e96381ed
--- /dev/null
+++ b/package/aichat/aichat.hash
@@ -0,0 +1,4 @@
+# Locally generated
+sha256  214af28357dd2b7543120fd23b81614c986ea62d69fade6d80259cb7a42eafdd  aichat-0.30.0-cargo4.tar.gz
+sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE-APACHE
+sha256  5af431a6a9869052e2be4e71ccd731c7efe45dca47eaca84d4d1fb38f134cb79  LICENSE-MIT
diff --git a/package/aichat/aichat.mk b/package/aichat/aichat.mk
new file mode 100644
index 0000000000..a1d1514d57
--- /dev/null
+++ b/package/aichat/aichat.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# aichat
+#
+################################################################################
+
+AICHAT_VERSION = 0.30.0
+AICHAT_SITE = $(call github,sigoden,aichat,v$(AICHAT_VERSION))
+AICHAT_LICENSE = Apache-2.0 or MIT
+AICHAT_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
+
+$(eval $(cargo-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
