Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C02FC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 09:07:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0F4981551;
	Sun, 11 Dec 2022 09:07:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0F4981551
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aVrVrd0jty7G; Sun, 11 Dec 2022 09:07:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFC00814A9;
	Sun, 11 Dec 2022 09:07:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFC00814A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C7C601BF865
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38F7B40984
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 08:55:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38F7B40984
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id c4dEQk-oBRAQ for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 08:55:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3BCE440929
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 08:55:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BCE440929
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3954F85FA6; Sun, 11 Dec 2022 08:55:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 11 Dec 2022 09:29:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bb0fc1d63c96df58782d5473bcca175724924e51
X-Git-Newrev: 4f37cfa7907f8594ce9df3ee7956223b9da26bd0
X-Patchwork-Hint: ignore
Message-Id: <20221211085516.3954F85FA6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-prompt-toolkit: bump to
 version 3.0.36
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

commit: https://git.buildroot.net/buildroot/commit/?id=4f37cfa7907f8594ce9df3ee7956223b9da26bd0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop no longer required six dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-prompt-toolkit/Config.in                  | 1 -
 package/python-prompt-toolkit/python-prompt-toolkit.hash | 4 ++--
 package/python-prompt-toolkit/python-prompt-toolkit.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-prompt-toolkit/Config.in b/package/python-prompt-toolkit/Config.in
index ad4f8162de..81d958884e 100644
--- a/package/python-prompt-toolkit/Config.in
+++ b/package/python-prompt-toolkit/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_PROMPT_TOOLKIT
 	bool "python-prompt-toolkit"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_WCWIDTH # runtime
 	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
 	help
diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.hash b/package/python-prompt-toolkit/python-prompt-toolkit.hash
index 8b91ee767f..62ba0c3cfe 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.hash
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/prompt-toolkit/json
-md5  0cc5e752cb2759e99658e2391644e767  prompt_toolkit-3.0.31.tar.gz
-sha256  9ada952c9d1787f52ff6d5f3484d0b4df8952787c087edf6a1f7c2cb1ea88148  prompt_toolkit-3.0.31.tar.gz
+md5  5a2bb559c0bcbc617f507a320c64ba03  prompt_toolkit-3.0.36.tar.gz
+sha256  3e163f254bef5a03b146397d7c1963bd3e2812f0964bb9a24e6ec761fd28db63  prompt_toolkit-3.0.36.tar.gz
 # Locally computed sha256 checksums
 sha256  303574d9bdd85c757d6025017942bf17baeedf2778f62bd7f425d07d880f4c4a  LICENSE
diff --git a/package/python-prompt-toolkit/python-prompt-toolkit.mk b/package/python-prompt-toolkit/python-prompt-toolkit.mk
index bef761e20f..426fa41e0b 100644
--- a/package/python-prompt-toolkit/python-prompt-toolkit.mk
+++ b/package/python-prompt-toolkit/python-prompt-toolkit.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROMPT_TOOLKIT_VERSION = 3.0.31
+PYTHON_PROMPT_TOOLKIT_VERSION = 3.0.36
 PYTHON_PROMPT_TOOLKIT_SOURCE = prompt_toolkit-$(PYTHON_PROMPT_TOOLKIT_VERSION).tar.gz
-PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/80/76/c94cf323ca362dd7baca8d8ddf3b5fe1576848bc0156522ad581c04f8446
+PYTHON_PROMPT_TOOLKIT_SITE = https://files.pythonhosted.org/packages/fb/93/180be2342f89f16543ec4eb3f25083b5b84eba5378f68efff05409fb39a9
 PYTHON_PROMPT_TOOLKIT_SETUP_TYPE = setuptools
 PYTHON_PROMPT_TOOLKIT_LICENSE = BSD-3-Clause
 PYTHON_PROMPT_TOOLKIT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
