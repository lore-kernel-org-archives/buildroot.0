Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC44C433F5
	for <buildroot@archiver.kernel.org>; Tue, 30 Nov 2021 16:14:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C38E661BB4;
	Tue, 30 Nov 2021 16:14:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xHI2QCQGjra3; Tue, 30 Nov 2021 16:14:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 32E3261BB0;
	Tue, 30 Nov 2021 16:14:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 80B521BF2F0
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 16:11:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6E3A261BAE
 for <buildroot@lists.busybox.net>; Tue, 30 Nov 2021 16:11:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tIJjQT-Eyx0w for <buildroot@lists.busybox.net>;
 Tue, 30 Nov 2021 16:11:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 698FE61BC0
 for <buildroot@buildroot.org>; Tue, 30 Nov 2021 16:11:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 0CD70920D8; Tue, 30 Nov 2021 16:07:03 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 30 Nov 2021 17:10:45 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 35d6cf54274dd0e7095b919629bb6da10f660d88
X-Git-Newrev: c9c7e5e3698ca7d25353ecfa8a443e1a91d3ad48
X-Patchwork-Hint: ignore
Message-Id: <20211130160703.0CD70920D8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/coremark-pro: drop spurious space
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

commit: https://git.buildroot.net/buildroot/commit/?id=c9c7e5e3698ca7d25353ecfa8a443e1a91d3ad48
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop spurious space added by commit
b9a2e4e8612b96483a20e75f2077f024b3594f45

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/coremark-pro/coremark-pro.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/coremark-pro/coremark-pro.mk b/package/coremark-pro/coremark-pro.mk
index e797f66840..6a85088560 100644
--- a/package/coremark-pro/coremark-pro.mk
+++ b/package/coremark-pro/coremark-pro.mk
@@ -48,7 +48,7 @@ COREMARK_PRO_MARKS = cjpeg-rose7-preset core linear_alg-mid-100x100-sp loops-all
 COREMARK_PRO_SCRIPTS = results_parser.pl cert_median.pl cert_mark.pl headings.txt
 
 define COREMARK_PRO_INSTALL_TARGET_CMDS
-	mkdir -p  $(TARGET_DIR)/usr/share/coremark-pro/logs
+	mkdir -p $(TARGET_DIR)/usr/share/coremark-pro/logs
 	$(foreach m,$(COREMARK_PRO_MARKS),\
 		$(INSTALL) -D $(@D)/builds/linux$(if $(BR2_ARCH_IS_64),64)/gcc$(if $(BR2_ARCH_IS_64),64)/bin/$(m) $(TARGET_DIR)/usr/bin/$(m)$(sep) \
 		size $(TARGET_DIR)/usr/bin/$(m) > $(TARGET_DIR)/usr/share/coremark-pro/logs/$(m).size.log$(sep))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
