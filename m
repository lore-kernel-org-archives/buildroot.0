Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D05FC54EE9
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 11:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1ED041C06;
	Fri, 16 Sep 2022 11:52:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1ED041C06
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id khc8uAxbga2X; Fri, 16 Sep 2022 11:52:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A917F419CA;
	Fri, 16 Sep 2022 11:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A917F419CA
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 614DF1BF2B9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:47:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 432CA41964
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 11:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 432CA41964
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qFIEa_UZPDqD for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 11:46:46 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id B4F9341C5F
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4F9341C5F
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id ADC6383CC2; Fri, 16 Sep 2022 11:46:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 12:26:22 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 1b80413afde1fe45249ca419f655d375fa4eb793
X-Git-Newrev: 3cbac6d4c2c7a5d46d65e1520513bbcda55202b0
X-Patchwork-Hint: ignore
Message-Id: <20220916114645.ADC6383CC2@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/busybox: fix typo
 on BR2_PACKAGE_NETCAT_OPENBSD
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

commit: https://git.buildroot.net/buildroot/commit/?id=3cbac6d4c2c7a5d46d65e1520513bbcda55202b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

The typo was added in 2018 by commit
'f3da9ffff0 package/busybox: invert dependency with netcat-openbsd'

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2e83ab59920537d8ed2dfdb60fbbe9d062be3661)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/busybox/busybox.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
index 3e49de0a84..920f55c7fc 100644
--- a/package/busybox/busybox.mk
+++ b/package/busybox/busybox.mk
@@ -48,7 +48,7 @@ BUSYBOX_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_MTD),mtd) \
 	$(if $(BR2_PACKAGE_NET_TOOLS),net-tools) \
 	$(if $(BR2_PACKAGE_NETCAT),netcat) \
-	$(if $(BR2_PACKAGE_NETCAT_OPENSBSD),netcat-openbsd) \
+	$(if $(BR2_PACKAGE_NETCAT_OPENBSD),netcat-openbsd) \
 	$(if $(BR2_PACKAGE_NMAP),nmap) \
 	$(if $(BR2_PACKAGE_NTP),ntp) \
 	$(if $(BR2_PACKAGE_PCIUTILS),pciutils) \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
