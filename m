Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99823F9D0EB
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:48:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51FE183CD1;
	Tue, 14 Apr 2026 17:48:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lm05X0_zaJvr; Tue, 14 Apr 2026 17:48:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 74A8583C91
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776188932;
	bh=VJfnjZnS8LR30WGUDrYwKfcrmew7aHQrr//gV8oB/nY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ApkFT9qN9FuZOQ/R18CWwhJvivGAzuvoXqjB9Ip/48DpAs5Rtzdkt2AkolO4HvmHM
	 gbWynjMqNXpOCatO7iCn9azdusnh3BxiU73KmLd4nz8aI6flAo+7SFRkPlC8xhN1E0
	 8WSKltfA7AF5B9ey9Pjqqz5mj8NGuoZlRBKrXJUiJgMGA/XMkZvwwTAiWCmM6pwjz4
	 EavTByb8jB0QlZZZvB7lnabLSPeRdPR96KJ7iDQpW/UmBSoTK394Sxpq39lUM7eBVk
	 6ko2kWVmO7bD4Z6jzmvlsXIxBlOKsdX/kMCLgEgzAc8HN00r9Qp0pj8Sja6CZLtZnb
	 mVWljaRdjnISQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 74A8583C91;
	Tue, 14 Apr 2026 17:48:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C1110375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B30E242741
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id onLK2tW1se47 for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:48:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DF31C4273A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF31C4273A
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:48:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 727967FB2E; Tue, 14 Apr 2026 17:48:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 19:12:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 97c434f731c765a446d24fc94682dfd1fb2024ca
X-Git-Newrev: 81177e9bd0997e87559d2e241c95a5b294da917d
X-Patchwork-Hint: ignore
Message-Id: <20260414174849.727967FB2E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/c-icap-modules: bump version to
 0.5.7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/81177e9bd0997e87559d2e241c95a5b294da917d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

0.5.7: https://sourceforge.net/p/c-icap/mailman/message/58723534/
"The newer c-icap-0.5.12 or c-icap-0.6.2 c-icap release is also
 required."
0.5.6: https://sourceforge.net/p/c-icap/mailman/message/40461114/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/c-icap-modules/c-icap-modules.hash | 6 +++---
 package/c-icap-modules/c-icap-modules.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/c-icap-modules/c-icap-modules.hash b/package/c-icap-modules/c-icap-modules.hash
index 110ffd4de3..278b3efdbb 100644
--- a/package/c-icap-modules/c-icap-modules.hash
+++ b/package/c-icap-modules/c-icap-modules.hash
@@ -1,7 +1,7 @@
 # From http://sourceforge.net/projects/c-icap/files/c-icap-modules/0.5.x/
-md5  ca6d5d124a4668d63affcaa5ab083e57  c_icap_modules-0.5.5.tar.gz
-sha1  67be484a93fe662a7735ee06e1d34d82b54469a8  c_icap_modules-0.5.5.tar.gz
+md5  08c4721a26840bb0ff95fcaa64b686c3  c_icap_modules-0.5.7.tar.gz
+sha1  839b79bc53e9048680309a7cd31ad3c1e2cf44b5  c_icap_modules-0.5.7.tar.gz
 
 # Locally calculated
-sha256  6a42f1fdd8c35ad38d29f7d3c10f925471977f217086352e146cf95e45f2b5b5  c_icap_modules-0.5.5.tar.gz
+sha256  80bc0af10be171c0c73cd5886533a397c4d55211756fb6279f245ee7e5dd3814  c_icap_modules-0.5.7.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/c-icap-modules/c-icap-modules.mk b/package/c-icap-modules/c-icap-modules.mk
index e9bbbdb284..5ef0fa3256 100644
--- a/package/c-icap-modules/c-icap-modules.mk
+++ b/package/c-icap-modules/c-icap-modules.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ICAP_MODULES_VERSION = 0.5.5
+C_ICAP_MODULES_VERSION = 0.5.7
 C_ICAP_MODULES_SOURCE = c_icap_modules-$(C_ICAP_MODULES_VERSION).tar.gz
 C_ICAP_MODULES_SITE = http://downloads.sourceforge.net/c-icap
 C_ICAP_MODULES_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
