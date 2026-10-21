Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27356606A322
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:04:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bQd3t/GU
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54F9E40EC2;
	Wed, 21 Oct 2026 20:04:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nhfTewN8S4Z4; Wed, 21 Oct 2026 20:04:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6A57540EBC
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792613085;
	b=iS5BGDy6aGrtRwYuiMHa/WDYhVVqclaOBXJuPEvkunkJm583xNlyVGXmZoYnVOsgTnVI
	 RbKgpifV3dfpkUloipnq2m361VOnfWl6KQkfAJ/f+9hGaVMqFI9JONXh/v2fuiodCvMdD
	 Ne4iyj/IAms8qTQTQnsEbxFHkT1mm1rIa1AsrkHbNrlYgiXnpV7GxXqJDedxJYi+FKOwM
	 1itRAu8DIKGF/IyF7E2mNjxMwA7saaYJmGMnkuNZnESbbmhsxvE3qygzhasZEyJ3QEo4F
	 m/qK3gfrg7X7Gp/3uqm4ZTy9y2Ia/dfJNfu9OB7vePAt+ZmA3RW8oYu6TkhMvExCyaQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792613085;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=fOI2m+/FrKfWQrzqm8CWBg8z71ndbo8pGZ+59GbDIxM=;
	b=T6gfQyMXVMDhe4grmOCL7nnSWS9AEDl0deDS5oxvujn555dMN6RrtIwvqkCIB4KoYpRT
	 4BNnNA0iD3/BDu2nTOWmY0NoYEDj37PFADQTQJqW4LpeO3ogJHGLQfcami6cZxwlCVIbR
	 K0bXtHBzP4gbgkS4rSkssWh4zuNdEnv+nc7ehFHRjBycZ+xvHIo4XX6ySg+nHUbO/pXz/
	 WDwv/TGUIcdst1//9LutQPrlnUkBt60CfYUhTEsGTijRN2Vu5Uw3X/L9FYUOa2yTFKk0V
	 CnED2ciXYqUYvNmuChjaUq6/k5boqcpbSA8wBp4xHKEU6FVa7WL6sh9uRGTYTp3MGEg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792613085;
	bh=fOI2m+/FrKfWQrzqm8CWBg8z71ndbo8pGZ+59GbDIxM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bQd3t/GUyM+4QZ0xNGITdqnZS/2RywCgFwQ7Io4EUXzqcMvdQUSPWVbmRQ3Fcp3DG
	 m4MSXw386V77DiHC2/CwnY1mtDg6IT2lfNh5GBp7QO01mcFpqrslZLCfP/vBOH1Tmu
	 sos3wsUopklBzwgdpgBhYW6IyxEcAixcoO39HfolMfF9SJbiIJU5KJGUu/i51JsUJ8
	 ZuxTjvrDbEgpwYeHUgE3esW+7P+rq0CnUI4eepAWv24N0Arh4C6V4t/KWZErLxZ2yD
	 xWi1a9tHGxuxAJ2YrLBxLsJmsepGy/SRBAWDhJ8KhZ66ZjFhrtx4PnK1f+eX40nYhw
	 HJM2sHdB19DPQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A57540EBC;
	Wed, 21 Oct 2026 20:04:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 90456769
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 817A080A83
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vC8lo9qAJ11K for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:04:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CBA838128D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792613077;
 b=JUeCuhFFf/jcoVyV02HkUqlBNOY1pUzsubNJGaWcsVRftdmtkFlvKBm+CxTkySSeMA1R
 LTGOxZlEgV4np0psKDKKGwQ+WVriwdakKvzX9eia2ItOarDVUN3p504omMb8C8IXgDE6j
 HJQqf2es28gTV7vrFT1fSEr8YRclNQKzhkYMco/cylV97Igl03nMtenxlUY6JrAZSI/iz
 esj8IWfeRgHQPmdGs0weLcc08SRpf2eVAncpFOgjM27H7e4B5gXXnr1po3PqP4jxQvJTD
 /io/Q/ENUSANcGsdiGdx7TkjJoncl2/lglGQv/jWmbWUUxzw/xgD9nJIZ6losZXEvEA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792613077;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=upQUB3gL1CRwrG411i64vl9ZWCz5TpLnsLr+hJ3UUJM=;
 b=jeZ0ZfpTQxQXrEk86sMX4KVMrxf7Ouct/BNokMPKM7jlU8JDRJHLwSYm28R7V55gsfSB
 ZC811+iyAe/xvNdRRC2aoU93UsHMsMSUkC/4RRE+JvO4Djm5VLcs90peBlkcJ71RQSGX1
 Yg7rRp/MTfSc7QzRCuSEwQkTyiowJwI2dnP1NdzIU8uSq/owsNqYxwFLk2Fln2KtP/Y/d
 Eu0nI5ise3KKWDjnOI7wbfYQ/g56WyRk7cAW/pcszR3tnuu4m5naAFQeLayCHKWr4D+L+
 G/xCEiSfk9byWTY8RVGDxr1J3iz+hBwxgSC1Vg8oM2rBrqfe4790MOTUwZHrhewYVrg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBA838128D
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:04:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 11C4799A6F; Wed, 21 Oct 2026 20:03:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 22:04:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 93ff6ffeaa8cd470ed677a9235e54a9a4d3bb90b
X-Git-Newrev: 05fcd8321eb78a56d088d9efed0fe857cdf17d7e
X-Patchwork-Hint: ignore
Message-Id: <20261021200314.11C4799A6F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx93-evk_defconfig: include
 EdgeLock firmware in boot image
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/05fcd8321eb78a56d088d9efed0fe857cdf17d7e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The defconfig had the EdgeLock firmware enabled, but it was not passed to
U-boot so not included in the flash.bin boot file.  Fix that.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/imx93-evk_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/imx93-evk_defconfig b/configs/imx93-evk_defconfig
index 8c85c0e7cc..cf03bbe3c7 100644
--- a/configs/imx93-evk_defconfig
+++ b/configs/imx93-evk_defconfig
@@ -43,6 +43,7 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_UTIL_LINUX=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_IMX_FIRMWARE=y
+BR2_TARGET_UBOOT_NEEDS_IMX_ELE_FIRMWARE=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="flash.bin"
 BR2_TARGET_UBOOT_SPL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
