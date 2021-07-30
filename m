Return-Path: <SRS0=sxUg=M3=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEBDEC4338F
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:56:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D36460EFD
	for <buildroot@archiver.kernel.org>; Wed,  4 Aug 2021 00:56:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D36460EFD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58CF442419;
	Wed,  4 Aug 2021 00:56:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q8GPW8nyVXEx; Wed,  4 Aug 2021 00:56:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9FDCE423FB;
	Wed,  4 Aug 2021 00:56:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74C151BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE1CA40FA6
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9UTDOngJWMeM for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D50640503
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 548DE87E2D; Tue,  3 Aug 2021 21:10:23 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 30 Jul 2021 23:35:17 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 88b07f86befd30734b111e00a1160eab3194bfb5
X-Git-Newrev: a19d00e77220429e248855268943cf1c3acf0756
X-Patchwork-Hint: ignore
Message-Id: <20210803211023.548DE87E2D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/xml-security-c:
 requires DES support in openssl
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

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
