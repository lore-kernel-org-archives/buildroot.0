Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E3FDCD98CE
	for <buildroot@archiver.kernel.org>; Fri, 12 Jun 2026 11:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DC8D56104F;
	Fri, 12 Jun 2026 11:22:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dvp31ZImwjeE; Fri, 12 Jun 2026 11:22:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30B6960F71
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781263379;
	bh=VVnwyyk6tNJ3k2VFRPmXG5y0opUI2h40ktkYTn6FnK4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GxBfnCPV7t+KlK6K+65LSX7O4++BpH1ApeWUELyk1tag+PH5sjx5PAqhMk1PDAG7v
	 hzgF3CV8brAFIwsiZn6yLlsANft/qTNn8+xaoaN7S/lt2lvGnhkHjFyoQwvt8zJetF
	 S6ZeU6/u+HDl5wZbjMAOynq9w7/f2KoN2n5LFzi2fYabW37xrZsTyetL1hl8cfwbn8
	 mxyBV++gio4QnWshgXDwFH11YeSOZEqmtiA+fX2M//I5+5vJuw+MazImROEP3v6dd5
	 2VzVQazQ4dGBHLmLeWKNM9ljN87LufdN+qcenSOHroYeEnxMd3YQWXwmyobXeQQilT
	 earPQdztabUBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30B6960F71;
	Fri, 12 Jun 2026 11:22:59 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2B9E237
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B58818329E
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GOU1OroAa9PC for <buildroot@buildroot.org>;
 Fri, 12 Jun 2026 11:22:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE14682CC7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EE14682CC7
 for <buildroot@buildroot.org>; Fri, 12 Jun 2026 11:22:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA58D880E9; Fri, 12 Jun 2026 11:22:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Jun 2026 11:46:22 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: bdbcabf44ec13b7c0c8e90bbb042f1b7d121c629
X-Git-Newrev: 024b81ced42a095cd460783c4eddded72fe0872f
X-Patchwork-Hint: ignore
Message-Id: <20260612112214.BA58D880E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python3: remove
 stale IGNORE_CVES entry
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/024b81ced42a095cd460783c4eddded72fe0872f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Patch 0013 was removed in Buildroot commit
fdfbad13cad9d7f5640d3bf0aa2abc1c6016fd92 (python3 security bump to v3.12.12),
as it has been integrated in Python3 upstream.

However, said Buildroot commit did not remove the corresponding IGNORE_CVES,
so remove it now.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python3/python3.mk | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 60ab5b0cbc..7336c09ae8 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -13,9 +13,6 @@ PYTHON3_LICENSE_FILES = LICENSE
 PYTHON3_CPE_ID_VENDOR = python
 PYTHON3_CPE_ID_PRODUCT = python
 
-# 0013-tarfile-now-validates-archives-to-ensure-member-offsets-are-non-negative.patch
-PYTHON3_IGNORE_CVES += CVE-2025-8194
-
 # This host Python is installed in $(HOST_DIR), as it is needed when
 # cross-compiling third-party Python modules.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
