Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B5FC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:59:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2441260F41
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:59:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2441260F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F369241622;
	Tue,  3 Aug 2021 22:59:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AL43I4Gmj2Qo; Tue,  3 Aug 2021 22:59:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CFCC40683;
	Tue,  3 Aug 2021 22:59:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2EFED1BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 33E8B40442
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E0U7F4StVa31 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D727404CC
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7A7CF85F62; Tue,  3 Aug 2021 21:09:49 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 12 Jun 2021 14:12:56 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7075cc34558cf650aea96c4e661e374f366dd3eb
X-Git-Newrev: 89fe69225e0a9e19c16a4f3be7ba0b6f356e27b3
X-Patchwork-Hint: ignore
Message-Id: <20210803210949.7A7CF85F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/netsnmp: requires DES
 support in openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=89fe69225e0a9e19c16a4f3be7ba0b6f356e27b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Enable DES in openssl to fix build failure raised since commit
a83d41867c8d69a77d5cd0a665aa216af5340359

Fixes:
 - http://autobuild.buildroot.org/results/76ddd42cfecc596e431490747e3a32b937f95a17

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/netsnmp/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/netsnmp/Config.in b/package/netsnmp/Config.in
index f22e38b335..dff0f18bee 100644
--- a/package/netsnmp/Config.in
+++ b/package/netsnmp/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NETSNMP
 	bool "netsnmp"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	help
 	  Suite of applications used to implement SNMP v1, SNMP v2c, and
 	  SNMP v3 using both IPv4 and IPv6.
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
