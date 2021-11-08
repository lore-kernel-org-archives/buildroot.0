Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6823C433EF
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:08:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A491161075
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 16:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A491161075
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72271402D9;
	Mon,  8 Nov 2021 16:08:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h3Dg3Aj6RLyG; Mon,  8 Nov 2021 16:08:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A415402CC;
	Mon,  8 Nov 2021 16:08:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 149EB1BF868
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E90AD80EA1
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 16:07:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KiCcDQvTkYLN for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 16:07:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id AEEAA80E9A
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 16:07:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id F34028B6BA; Mon,  8 Nov 2021 16:03:17 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Nov 2021 16:05:27 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: dc71e6f6426e5ad444e4b380fbfd513fb112ca11
X-Git-Newrev: c6a0652f0a1327516db55f520535bc0db266bdbb
X-Patchwork-Hint: ignore
Message-Id: <20211108160317.F34028B6BA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/dahdi-linux: fix
 typo in Config.in
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

commit: https://git.buildroot.net/buildroot/commit/?id=c6a0652f0a1327516db55f520535bc0db266bdbb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Fix typo added with commit d959966b41bd88a36664c733a8a8d2b6809e4fc2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 6ae74b57aeb1134c1c0c1d00a162460ccfce7569)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/dahdi-linux/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dahdi-linux/Config.in b/package/dahdi-linux/Config.in
index f2a370917c..ea9fc00db2 100644
--- a/package/dahdi-linux/Config.in
+++ b/package/dahdi-linux/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_DAHDI_LINUX
-	bool "dhadi-linux"
+	bool "dahdi-linux"
 	depends on BR2_LINUX_KERNEL
 	help
 	  DAHDI (Digium/Asterisk Hardware Device Interface) is the open
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
