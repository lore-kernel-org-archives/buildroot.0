Return-Path: <SRS0=DPgg=NG=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533E6C4338F
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 14:53:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0CBE961154
	for <buildroot@archiver.kernel.org>; Sun, 15 Aug 2021 14:53:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0CBE961154
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCF03401BA;
	Sun, 15 Aug 2021 14:53:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mlm3CiYdqfJH; Sun, 15 Aug 2021 14:53:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3E778401B4;
	Sun, 15 Aug 2021 14:53:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2890A1BF376
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 14:52:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2307180BA5
 for <buildroot@lists.busybox.net>; Sun, 15 Aug 2021 14:52:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ilHTokCW3qPX for <buildroot@lists.busybox.net>;
 Sun, 15 Aug 2021 14:52:48 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9DB5C80BBA
 for <buildroot@buildroot.org>; Sun, 15 Aug 2021 14:52:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4F8BD84262; Sun, 15 Aug 2021 14:52:13 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 15 Aug 2021 16:52:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d55535622ffd5b138782ad90e785252c6b5b4a1b
X-Git-Newrev: d77aba25a55560d4c15bf319d6dc24619232a8ee
X-Patchwork-Hint: ignore
Message-Id: <20210815145213.4F8BD84262@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-matplotlib: merge
 dependency comments
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=d77aba25a55560d4c15bf319d6dc24619232a8ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-matplotlib/Config.in | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/python-matplotlib/Config.in b/package/python-matplotlib/Config.in
index e7e2804b4f..afc090856f 100644
--- a/package/python-matplotlib/Config.in
+++ b/package/python-matplotlib/Config.in
@@ -34,8 +34,6 @@ config BR2_PACKAGE_PYTHON_MATPLOTLIB_QT
 
 endif
 
-comment "python-matplotlib needs a toolchain w/ C++"
-	depends on !BR2_INSTALL_LIBSTDCPP
-
-comment "python-matplotlib needs glibc or musl"
-	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
+comment "python-matplotlib needs a glibc or musl toolchain w/ C++"
+	depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL) || \
+		!BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
