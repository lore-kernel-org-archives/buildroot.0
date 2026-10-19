Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5854606A320
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 17:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=CoSuq8/0
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 920AA606F4;
	Mon, 19 Oct 2026 17:19:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xx1CNmlBhzAS; Mon, 19 Oct 2026 17:19:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A7E6F60719
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792430382;
	b=D/sHKPWEag1Oiw74pvaBaT9n5fXyAJdcldbVXBHKFpeRecc+ylGxAkg5xCN3vtzLDEBw
	 eRNY9cJLRMc2CqYuNTkK9PIj3xVuGUcMEopCeO239ma7UM2gdZTlP8N0d9UXUFFcXOStJ
	 c+IbcOHMuBkDnu5KWVGb3u4LeM50LNIgfg61wY5Mip21U+s5GJcvpIXjumCKGg+yptE3e
	 kziAHt6tBOroFLsa68jfyCssdODM3sL+TVtEPWtXdWK1o9K7NMoBXXfa4PdO+PSGqKfiy
	 jQVlv6TMFoUMAyOpEFUomHL5cpQdeUVEdsX7w3gFzgzT1hBHnnG7WdVZ82mm94eKHRw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792430382;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=aGakLKokHsVwzpvT7n0nf1m+5DRE+x/Hp70BucIJEH8=;
	b=ikF4QfzrV+yjDr03exdWPrInY4udeduNPjIExhqQgLzBFCYf344jBp5G/J+3uQNP7Wts
	 LrZk2Sk/UkcpfyiuMxfJJgQmrumzTvtndT9DYXiUF4gVvyaQcPJjwddpKpQAxxYgwWeCP
	 7/UIeJUUGTjvPdvSvdIrMIjFV/qeSz2IIu25eLsrEvVHpw+KTCTRJKSOQ5D/NOCjOMiBV
	 2s8SMammlMTbu/YHCr4wrFGq80WoPj72y/4uPj0OIZu3CNsmkRxewFdTJf2xNloCqUrPK
	 mlxiIPf9PNa422nuMOiJCdvfG8jqPHAB7qE+G+LxjQ1z97IqLZkfBYUEtGAMT1iO4JQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792430382;
	bh=aGakLKokHsVwzpvT7n0nf1m+5DRE+x/Hp70BucIJEH8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=CoSuq8/0Be/zR9n/WIMgxLJDggWkHFlc0c9S7t5YLUPSPEP+vzUCI7e9OSwsbMnFn
	 teYQzabF75tRToTPh7VyDkRwtqSPvnS0CySWpFXvsrlORgfyE+958/DBmkhRhZDBZc
	 9ILIPCbs4nQ4Fx8JvSvqyGZpZJlC5fDwM+QOUyi7JYzfNCUOd5Mg60igr1IP8Fq3yN
	 s5HkhaH06inoehg1a2/LBtmj39AwLIYDNdaHtyRtm6SbePKre275aSHnj7PNcRp85t
	 c0fv76jvSIAGZZbbg1NKiOD4cZBadyQHmHbzewo68x/oDAtf3I7Tpekox61/Sl2Rl2
	 hGJTetJFoMe3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7E6F60719;
	Mon, 19 Oct 2026 17:19:42 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FFD71E9
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:19:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4236C80E12
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 22NmCe8UCD5H for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 17:19:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5B1E280D89
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792430380;
 b=j/iKgE0GeZwQW+KBQmShnhkbBd3TRgE/4KlNOQZK2q91tcI42yfwVdEijef2OymiIvnz
 d71fJ3lSSX/4buzFsbf529LshMIbpITfR9SdpTPGQkF2aPFfv2VUzl41xCYjGCTemGODt
 i3wDIsg9OfF6V83VhMb0lpNEszpulVEw9IBx1xc84R1FskzEsrBQpOKL4q31wO7mhOIQf
 Unb1PPvYR4Qze4V9sSzJL1pLd9rBQaUgOmYCHyJhyhzjZYlYX7EcETU5I1XFuL4O7fYAb
 ri1ZOcmtGwxDeqozcoQkApwZ+OyG5BlcP1zppgqxQt/UBiVLaCDCsZrJZdLMgkVC1HQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792430380;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2Eljw6hfu2vkIL1Ye3FAm4u1yLaA4bqECwkUxoWU/pk=;
 b=ljpFTklb8L9MXCj0SnK5JxeM44jX730vhDKPidKug4iimN9ga82aaIWxvqI0oO0tiNGe
 TxsGMbPKe/+NfjVbMWp8NDeA1lCVaJq7DETKZjePJWLLksChNmhSEf1YX9n2V9c8PoqZF
 m4rNjLO2mvLYjd3A+GFqCQQnEM2VWC63Mr7dKZ4/4FScu5TNfzLOFM5dxHSA/wapxL1yV
 r0VN8/BykeHVyRZzcJallcv+/LZS4HD4BAsbx/iTsRgJQUKzE1LY4I6xgn2EudoLdgZgZ
 E8bdYqOos6g+XRtuAOVzLtZFfOtQQWIarijwKUVG80weLRnRdAUcxMHgUBXOzh5gcyw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5B1E280D89
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 17:19:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AAD01984B2; Mon, 19 Oct 2026 17:18:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Oct 2026 19:19:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02201ecb444cacf2c76b7e452792bb8bb3674064
X-Git-Newrev: 2d3102a8b313302d7a451ddde4a35dc914e1397b
X-Patchwork-Hint: ignore
Message-Id: <20261019171817.AAD01984B2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uboot-tools: fix build without FIT
 support
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2d3102a8b313302d7a451ddde4a35dc914e1397b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Commit d7ccf54d7f8cfcb1ab40b227c080aee36f5a6aa1 ("package/uboot-tools:
fix target FIT signature support") changed how options for FIT support
are written to include/generated/autoconf.h, removing the
unconditional "echo" call (possibly with empty arguments) that existed
before. Because of this, include/generated/autoconf.h was not created
when U-Boot was built without FIT support, making the build fail
because of the missing header. Add a "touch" to ensure the file is
always created.

Fixes: d7ccf54d7f8cfcb1ab40b227c080aee36f5a6aa1 ("package/uboot-tools: fix target FIT signature support")

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/uboot-tools/uboot-tools.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/uboot-tools/uboot-tools.mk b/package/uboot-tools/uboot-tools.mk
index 32fe9f1d7b..87b708ac5c 100644
--- a/package/uboot-tools/uboot-tools.mk
+++ b/package/uboot-tools/uboot-tools.mk
@@ -31,6 +31,7 @@ define UBOOT_TOOLS_CONFIGURE_CMDS
 	echo "#include <linux/kconfig.h>" > $(@D)/include/config.h
 	touch $(@D)/include/config/auto.conf
 	mkdir -p $(@D)/include/generated
+	touch $(@D)/include/generated/autoconf.h
 	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),$(UBOOT_TOOLS_ENABLE_HASH_ALGOS))
 	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SUPPORT),echo '#define CONFIG_TOOLS_FIT_PRINT 1' >> $(@D)/include/generated/autoconf.h)
 	$(if $(BR2_PACKAGE_UBOOT_TOOLS_FIT_SIGNATURE_SUPPORT),echo '#define CONFIG_TOOLS_IMAGE_PRE_LOAD 1' >> $(@D)/include/generated/autoconf.h)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
