Return-Path: <SRS0=lKTV=PD=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C42AC433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 21:50:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A44EB61184
	for <buildroot@archiver.kernel.org>; Fri, 15 Oct 2021 21:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A44EB61184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=crapouillou.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A3554046F;
	Fri, 15 Oct 2021 21:50:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4pVAUd2yCcC8; Fri, 15 Oct 2021 21:50:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id AECC5403F6;
	Fri, 15 Oct 2021 21:50:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 87EAD1BF417
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 21:50:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77B0C60EF1
 for <buildroot@lists.busybox.net>; Fri, 15 Oct 2021 21:50:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id n1LK1HYjQLxV for <buildroot@lists.busybox.net>;
 Fri, 15 Oct 2021 21:50:13 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from aposti.net (aposti.net [89.234.176.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7BAC360876
 for <buildroot@buildroot.org>; Fri, 15 Oct 2021 21:50:13 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: buildroot@buildroot.org
Date: Fri, 15 Oct 2021 22:50:03 +0100
Message-Id: <20211015215003.181073-1-paul@crapouillou.net>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/lightning: stop spam!
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
Cc: Paul Cercueil <paul@crapouillou.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Every week I receive an automated email that tells me about the
CVE-2020-7747 vulnerability in Lightning. This vulnerability however
applies to the Javascript lightning-server project, and not to the
GNU Lightning project.

Ignore this CVE in the Lightning package to reduce my stress levels.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 package/lightning/lightning.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
index 3bd17bef56..38b132e082 100644
--- a/package/lightning/lightning.mk
+++ b/package/lightning/lightning.mk
@@ -12,6 +12,10 @@ LIGHTNING_INSTALL_STAGING = YES
 # We're patching include/Makefile.am
 LIGHTNING_AUTORECONF = YES
 
+# CVE-2020-7747 is for the Javascript lightning-server project, and not for
+# GNU Lightning.
+LIGHTNING_IGNORE_CVES = CVE-2020-7747
+
 ifeq ($(BR2_PACKAGE_LIGHTNING_DISASSEMBLER),y)
 LIGHTNING_DEPENDENCIES += binutils zlib
 LIGHTNING_CONF_OPTS += --enable-disassembler
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
