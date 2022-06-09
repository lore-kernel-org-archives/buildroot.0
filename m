Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F61CCA47D
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 08:41:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C8B1D41C4C;
	Thu,  9 Jun 2022 08:41:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KPbPoK7aFAw6; Thu,  9 Jun 2022 08:41:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAC6F41C45;
	Thu,  9 Jun 2022 08:41:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 10A041BF3E8
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 08:41:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2C2841C45
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 08:41:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9xtzL2pXoED9 for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 08:41:23 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A18B041C44
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 08:41:23 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id D69C431E037B; Thu,  9 Jun 2022 10:41:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=openadk.org; s=2022;
 t=1654764080; bh=twJqkTGsRZ4ko9NHN2g9f514NucxWyT7fYfT+KyotLc=;
 h=Date:From:To:Subject:From;
 b=c0itfMAn538nzwFiZQ3CKlEGu6/IrUrh03LLhcEwQvF8LLHcgX2OfzFlT3hUjFaS6
 /T6FKoMndp1y9+dmWjKWfg2vrZkYDiZvRvft2qxfDS3OVxOtLvslmBJBz6YK0KsS+i
 9QoaUnvEA91tjrHr6Gc8hN59E/arSrmV4dx+C9ajM0vAsHbY0rLxRywxRPoZgsIciy
 ibF6HC/EqvhaIq3bjWSmKwGOefv//JoVgp1azuKOA6ldzFVGDPeDy/1So622IMKYc7
 2pAjFpIYWOV4ASzPB6robbvXiQRWWG151I0dP9ZHSPUFDsoSKSRgw+91WQ8BdyZRfM
 EyjzhqvCRsMtA==
Date: Thu, 9 Jun 2022 10:41:19 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <YqGyLxqxwd94KHVS@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-10-amd64 x86_64
Subject: [Buildroot] [PATCH] package/openswan: allow uClibc build
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

uClibc-ng 1.0.41 added ns_t_tkey

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/openswan/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/openswan/Config.in b/package/openswan/Config.in
index c71d064daf..724654e984 100644
--- a/package/openswan/Config.in
+++ b/package/openswan/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_OPENSWAN
 	bool "openswan"
 	depends on BR2_USE_MMU # iproute2
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 # iproute2
-	depends on !BR2_TOOLCHAIN_USES_UCLIBC # ns_t_tkey
 	select BR2_PACKAGE_GMP
 	select BR2_PACKAGE_IPROUTE2
 	help
@@ -10,7 +9,6 @@ config BR2_PACKAGE_OPENSWAN
 
 	  http://www.openswan.org
 
-comment "openswan needs a glibc or musl toolchain w/ headers >= 3.4"
+comment "openswan needs a toolchain w/ headers >= 3.4"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4 || \
-		BR2_TOOLCHAIN_USES_UCLIBC
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
