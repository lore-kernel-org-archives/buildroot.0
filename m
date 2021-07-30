Return-Path: <SRS0=Uqjv=MW=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F375C4338F
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 21:35:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBFCD60F9B
	for <buildroot@archiver.kernel.org>; Fri, 30 Jul 2021 21:35:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CBFCD60F9B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FE9740577;
	Fri, 30 Jul 2021 21:35:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id igh2hSYs-2XB; Fri, 30 Jul 2021 21:35:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E83EF4053E;
	Fri, 30 Jul 2021 21:35:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D08461BF488
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 21:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D367C826D5
 for <buildroot@lists.busybox.net>; Fri, 30 Jul 2021 21:35:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YY3ltZDoSvfz for <buildroot@lists.busybox.net>;
 Fri, 30 Jul 2021 21:35:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DE17B8250B
 for <buildroot@buildroot.org>; Fri, 30 Jul 2021 21:35:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 80E7D8A33B; Fri, 30 Jul 2021 21:35:35 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 30 Jul 2021 23:35:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 88b07f86befd30734b111e00a1160eab3194bfb5
X-Git-Newrev: a19d00e77220429e248855268943cf1c3acf0756
X-Patchwork-Hint: ignore
Message-Id: <20210730213535.80E7D8A33B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/xml-security-c: requires DES
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

commit: https://git.buildroot.net/buildroot/commit/?id=a19d00e77220429e248855268943cf1c3acf0756
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable DES in openssl to fix build failure raised since the addition of
the package in bbda38afbbfa79ff436e1a187bb267b8d9558036

Fixes:
 - http://autobuild.buildroot.org/results/fb9252de77e020182fea7e9011a3e402c49d926b

Tested-by: Matthew Weber <matthew.weber@collins.com>
Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xml-security-c/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/xml-security-c/Config.in b/package/xml-security-c/Config.in
index 81d945f23d..17d0ca3aad 100644
--- a/package/xml-security-c/Config.in
+++ b/package/xml-security-c/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_XML_SECURITY_C
 	depends on BR2_INSTALL_LIBSTDCPP # xerces
 	depends on BR2_USE_WCHAR # xerces
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_7 # C++11
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_XERCES
 	help
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
