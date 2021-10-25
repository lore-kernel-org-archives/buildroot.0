Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B163C433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:56:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F297E60FDC
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 18:56:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F297E60FDC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C715280F02;
	Mon, 25 Oct 2021 18:56:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PZrkumzTo4T5; Mon, 25 Oct 2021 18:56:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1837880F24;
	Mon, 25 Oct 2021 18:56:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BA1B11BF3F7
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:56:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B686B80EFE
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 18:56:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YLv0ernnjUhb for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 18:56:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BD7F80F25
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 18:56:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 80E0F887AA; Mon, 25 Oct 2021 18:53:05 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 25 Oct 2021 20:53:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 50da37281fa02d64bb1e35da1186770756960a1d
X-Git-Newrev: 0692fb12f8c0bcfa16b0b71cb3d7827d05f48ba4
X-Patchwork-Hint: ignore
Message-Id: <20211025185305.80E0F887AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-urwid: fix typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=0692fb12f8c0bcfa16b0b71cb3d7827d05f48ba4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since commit
1c10095945b2b9a0168e2a8f98a5c6a396b2c0cd:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_URWID
  Depends on [n]: (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACAKGE_PYTHON3
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_CONFIGSHELL_FB [=y] && (BR2_PACKAGE_PYTHON [=n] || BR2_PACKAGE_PYTHON3 [=y]) && BR2_PACKAGE_PYTHON3 [=y]

Fixes:
 - No autobuilder failures

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python-urwid/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-urwid/Config.in b/package/python-urwid/Config.in
index 8fd2cac694..c141e8c0bd 100644
--- a/package/python-urwid/Config.in
+++ b/package/python-urwid/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_PYTHON_URWID
 	bool "python-urwid"
-	depends on BR2_PACAKGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Urwid is a console user interface library for Python
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
