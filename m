Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51885CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:37:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E4F684135;
	Sun, 22 Sep 2024 10:37:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C0t_QQayRGO3; Sun, 22 Sep 2024 10:37:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD1C88411D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD1C88411D;
	Sun, 22 Sep 2024 10:37:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 56DBD1BF870
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 063CB40631
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jq-hY5yxT-lJ for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD15B40630
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DD15B40630
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D09C281446; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 12:30:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97833e5381321bce457a08867e3d76a791987755
X-Git-Newrev: a9be7c30a9a0f7da47a82ba474924fb21913014a
X-Patchwork-Hint: ignore
Message-Id: <20240922103441.D09C281446@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-typing-inspect: bump to
 version 0.9.0
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a9be7c30a9a0f7da47a82ba474924fb21913014a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-typing-inspect/Config.in                  | 1 +
 package/python-typing-inspect/python-typing-inspect.hash | 4 ++--
 package/python-typing-inspect/python-typing-inspect.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-typing-inspect/Config.in b/package/python-typing-inspect/Config.in
index dda057a19c..b897676996 100644
--- a/package/python-typing-inspect/Config.in
+++ b/package/python-typing-inspect/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_TYPING_INSPECT
 	bool "python-typing-inspect"
 	select BR2_PACKAGE_PYTHON_MYPY_EXTENSIONS # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  Runtime inspection utilities for typing module.
 
diff --git a/package/python-typing-inspect/python-typing-inspect.hash b/package/python-typing-inspect/python-typing-inspect.hash
index 737373d609..55c29bf7ba 100644
--- a/package/python-typing-inspect/python-typing-inspect.hash
+++ b/package/python-typing-inspect/python-typing-inspect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing-inspect/json
-md5  d56c8277a55d0bf061275df1ea3785d5  typing_inspect-0.8.0.tar.gz
-sha256  8b1ff0c400943b6145df8119c41c244ca8207f1f10c9c057aeed1560e4806e3d  typing_inspect-0.8.0.tar.gz
+md5  334f7f909260ceebb05e10ebd7039ff0  typing_inspect-0.9.0.tar.gz
+sha256  b23fc42ff6f6ef6954e4852c1fb512cdd18dbea03134f91f856a95ccc9461f78  typing_inspect-0.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  f9d3567d00ca2337f769fb28c553cc590213ecefed4ed599110c10ded2ea0117  LICENSE
diff --git a/package/python-typing-inspect/python-typing-inspect.mk b/package/python-typing-inspect/python-typing-inspect.mk
index 8573bb1c27..09930058b5 100644
--- a/package/python-typing-inspect/python-typing-inspect.mk
+++ b/package/python-typing-inspect/python-typing-inspect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_INSPECT_VERSION = 0.8.0
+PYTHON_TYPING_INSPECT_VERSION = 0.9.0
 PYTHON_TYPING_INSPECT_SOURCE = typing_inspect-$(PYTHON_TYPING_INSPECT_VERSION).tar.gz
-PYTHON_TYPING_INSPECT_SITE = https://files.pythonhosted.org/packages/72/23/bed3ea644bcd77ffe9a7f591eb058c00739747e33ab94d80cc4319ddee8e
+PYTHON_TYPING_INSPECT_SITE = https://files.pythonhosted.org/packages/dc/74/1789779d91f1961fa9438e9a8710cdae6bd138c80d7303996933d117264a
 PYTHON_TYPING_INSPECT_SETUP_TYPE = setuptools
 PYTHON_TYPING_INSPECT_LICENSE = MIT
 PYTHON_TYPING_INSPECT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
