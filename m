Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B612EC4453C
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 20:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 68B7D60878;
	Wed, 22 Jul 2026 20:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xmRTFLPaik9x; Wed, 22 Jul 2026 20:24:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A3CF76087E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784751859;
	bh=tQR5FlJFTQ40BWxswOzzhEt4AFBOwnwQMiVISCTiuPQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZPwLgo+GLMmeNtinowF3Xi1hX/bSj7hG4EkJOwNHLXlQsJ3OmU0FxEadciaBFz48y
	 uCGc1jUKyUov0aknjfBpZdVD/+tEWgKVTuYlyEyMhDTU+AWbh9/T9TCtLveyddPhpu
	 fFdzVEvUhhBPPBjQvU7ZURh+euEoq7hRTeuTGc9fVy0sQmCPwDkaQHMEaLn4iLpbAZ
	 CJqEzKFVPyfxoFTIJDfdU2H+vfokbFcbyYlH4TuWE2GUQds7t0txxdw7UlIpsmY0wx
	 SkdRueWjwoMT1fcKd/OKRKpsFzyGEr8Hoq1jLNNxa0M/IzJfybKXMVb74D0HP+v5mE
	 PxRIdJT/0KR3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3CF76087E;
	Wed, 22 Jul 2026 20:24:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 98099224
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E71360890
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id POudCI_Jfy2B for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 20:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A64AC6087E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A64AC6087E
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:24:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D051C8A345; Wed, 22 Jul 2026 20:23:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Jul 2026 22:20:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 927c5759640ef626ab4507f91493a8242653d12b
X-Git-Newrev: 770b684426cc388a13f31f1627dec0037b38b696
X-Patchwork-Hint: ignore
Message-Id: <20260722202336.D051C8A345@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/environment-setup: add license info
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/770b684426cc388a13f31f1627dec0037b38b696
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The package is part of Buildroot and thus under GPL-2.0-or-later
unless stated otherwise, as described in COPYING.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/environment-setup/environment-setup.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
index 069ee25f9f..276d5caca8 100644
--- a/package/environment-setup/environment-setup.mk
+++ b/package/environment-setup/environment-setup.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+ENVIRONMENT_SETUP_LICENSE = GPL-2.0-or-later
+
 ENVIRONMENT_SETUP_FILE = $(HOST_DIR)/environment-setup
 
 define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
