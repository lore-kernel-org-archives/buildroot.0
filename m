Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 143EEC00140
	for <buildroot@archiver.kernel.org>; Fri,  5 Aug 2022 07:23:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D13481430;
	Fri,  5 Aug 2022 07:23:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8D13481430
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MmY3n6Ihv83y; Fri,  5 Aug 2022 07:23:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D351813E3;
	Fri,  5 Aug 2022 07:23:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9D351813E3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F41601BF869
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 07:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DC4A241085
 for <buildroot@lists.busybox.net>; Fri,  5 Aug 2022 07:23:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DC4A241085
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id a-TLgb3OJeNZ for <buildroot@lists.busybox.net>;
 Fri,  5 Aug 2022 07:23:42 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FF5840CC5
Received: from relais-inet.orange.com (relais-inet.orange.com [80.12.66.39])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FF5840CC5
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 07:23:42 +0000 (UTC)
Received: from opfedar06.francetelecom.fr (unknown [xx.xx.xx.8])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by opfedar23.francetelecom.fr (ESMTP service) with ESMTPS id 4LzcXD3Cw4zBs1d
 for <buildroot@buildroot.org>; Fri,  5 Aug 2022 09:23:40 +0200 (CEST)
Received: by tl-lnx-nyma7486 (sSMTP sendmail emulation);
 Fri, 05 Aug 2022 09:23:38 +0200
From: <yann.morin@orange.com>
To: <buildroot@buildroot.org>
Date: Fri, 5 Aug 2022 09:23:36 +0200
Message-ID: <31813_1659684220_62ECC57C_31813_212_5_89e764dbf0f4937be712b62946582072287cd163.1659683862.git.yann.morin@orange.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.115.26.50]
X-ClientProxiedBy: OPE16NORMBX406.corporate.adroot.infra.ftgroup
 (10.115.27.15) To OPE16NORMBX305.corporate.adroot.infra.ftgroup
 (10.115.27.10)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=orange.com; s=ORANGE001; t=1659684220;
 bh=Ig97jBptqART6BQgpuTcX31pm/4DytFRhCeeoVTa5Sg=;
 h=From:To:Subject:Date:Message-ID:MIME-Version:
 Content-Transfer-Encoding:Content-Type;
 b=qcMRH6NcP3lx3bUh8ZgjYch6947vVteQR02Dx1B/Hqvdiubozby6+i9H6AOpKKbQk
 9vDFREFKL7a8eu+b9N64MXRuymu20n+C7adNIxq2E99lgC38vqgnHa1RO4RWPRsRBT
 IeROhphv/Oc0glqxL0azafoSSuwC6+akXiVnNw5WxTPlI0Ja6HShyA8GrzZcs4S4+S
 hSGTcezF81VX2YOqvYNsrtnUDy1Mfi5bYd4rVnxwMXLiO/9eHgroPtR0f8bTmyomek
 kILU917ito6mMpShsiNZjHsYAsatnWUl5R+py4r2fin8GSFoxj1LsuLgH4o5xkJVoj
 JHJqmEjhBBPAg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=orange.com header.i=@orange.com
 header.a=rsa-sha256 header.s=ORANGE001 header.b=qcMRH6Nc
Subject: [Buildroot] [PATCH 1/3] package/lshw: allso uses hwdata' PNP IDs
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
Cc: "Yann E. MORIN" <yann.morin@orange.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin@orange.com>

Commit 29bccabdebff (lshw: use data files provided by hwdata) removed
the hardware info DBs installed by lshw, in favour of those provided by
hwdata, as the former are way out-dated while the latter are more
up-to-date.

However, it forgot to also select the PNP ID database, to replace the
one lshw would install.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
---
 package/lshw/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/lshw/Config.in b/package/lshw/Config.in
index 5e0e47b6e2..fb557aacff 100644
--- a/package/lshw/Config.in
+++ b/package/lshw/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_LSHW
 	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_HWDATA # runtime
 	select BR2_PACKAGE_HWDATA_PCI_IDS
+	select BR2_PACKAGE_HWDATA_PNP_IDS
 	select BR2_PACKAGE_HWDATA_USB_IDS
 	help
 	  lshw (Hardware Lister) is a small tool to provide
-- 
2.25.1


_________________________________________________________________________________________________________________________

Ce message et ses pieces jointes peuvent contenir des informations confidentielles ou privilegiees et ne doivent donc
pas etre diffuses, exploites ou copies sans autorisation. Si vous avez recu ce message par erreur, veuillez le signaler
a l'expediteur et le detruire ainsi que les pieces jointes. Les messages electroniques etant susceptibles d'alteration,
Orange decline toute responsabilite si ce message a ete altere, deforme ou falsifie. Merci.

This message and its attachments may contain confidential or privileged information that may be protected by law;
they should not be distributed, used or copied without authorisation.
If you have received this email in error, please notify the sender and delete this message and its attachments.
As emails may be altered, Orange is not liable for messages that have been modified, changed or falsified.
Thank you.

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
