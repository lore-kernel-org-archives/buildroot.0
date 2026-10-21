Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C76CA606A322
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XUroPJYp
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9EC6581A30;
	Wed, 21 Oct 2026 20:04:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kU5H8fzobWE9; Wed, 21 Oct 2026 20:04:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A7A5B80C8E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792613079;
	b=J8udQg3fSp6aP5MnfNDLMIwvw1X4s1YYOuqGo3mDdaaNn2SPQTE9TIehZyQB/Q+Btz0V
	 4d3CeDNMmQxkEsgR2MyqQFTaSEL2KUZMbM9IT/OeknqhZn8DAfgEtXGoyfU9VgCNDqcDf
	 Xr28fR6CGyOfpkIfNC6uQiXBrDleZHqMr06RsVvW8A+Icrr0LFqKRs+bgxwkQH6mYLJ4m
	 og4uEg2Ii2q+qND1CQX6b6rLobUWZ2oxJ644smf7HR2P9DSCgnoQ19Ovvi7MceiTTgtVt
	 ik4Du0FR0hH1GSFHaAGHdX//oH+ADd72ADaFgzqUW2zJANpHAKZX8E0uMELJDkZ7A4Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792613079;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=THfaYyCJcailvyVwPl/1x8ldWOBm/VH0pe4B8lkUHwk=;
	b=F9sIW12smyLz14nWVxIfPmq8jk7O4D+vAoMiz9ed8hp7MybfqAew3EuBMvNPNaem1rxL
	 JnKRPAZgE66t6KfzkIB5yec0P1X4Z+jRqx+K9tco7J06TThkTCVr/GdT8CRbAAvCKJhok
	 kAGYZNjb2+g053KZQzofY29SKLkhZDZIHgZU05LI8CmHEOWmN9bgCYNde5tZnJmI/K5ZZ
	 Auw/P//dnemRC/NPsbd/szznxmp9e4V2ZZCAIWwQDRef57kSQYY4IxdXixbEhifqVLBt8
	 CWrqe2PfxunwmgjONxAb2Q5yTJWzfeY8+vpMCMmGQjpjRm4NDnKe/hGEXpSz6M1UJmg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792613079;
	bh=THfaYyCJcailvyVwPl/1x8ldWOBm/VH0pe4B8lkUHwk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XUroPJYpERgeBTssXzAgQlrCVKmyGMSpN8iV584GhjH4WoprdkHAcifrDPYvqAd87
	 IjC7/OPDrNz5ouN3gshVH/RyXsnHhH7JywfP5rkSXpI2IcIJWhtUiXAnP8DEw+lKko
	 EtIOoDjGafBmAZ3ESPgI2guGuD3w+PzMkp081OjDqJw3k40h1Vb/+5FZw0BXaFZNBR
	 ljzEZl7SGEi3H0B3aDm1cQ75L448zmum9mhmuLEKYgS1/h3OKzU5r4dJv1pUqODjXI
	 hMVkhdYmkzeT6vQmQv8095vci7unCrXDRmPaHpme/GZkxA5CtsapO2mFLRIqdBMexD
	 gq4ytQRtmTMMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A7A5B80C8E;
	Wed, 21 Oct 2026 20:04:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 58601769
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4A0BA40380
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GkteVRPjIvaL for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:04:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8BEB54016D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792613077;
 b=ECq6yedawvIScvAzc8hEcerrDPAInek7ltdDg6uY41awCG4OC34nei6peaZZi956eONv
 4B7ecLXfF0A8MXzek9/Ua4xcBQYVdC8D6rILhmPteRdmjtK9WaKHqHonfedHU9BMJ5yR9
 aYNNjPW0d3CYA+g2weYczkWpdGjb42QTkxPkFGyAwyY7Rc0IURwTya1RxGpXQHir7Rkz4
 Vjyr2W3rKq/8gBndCRvK2Zs5G1C3hWBOl2JilKS7PYTLJ5RbwIezQEFKR0zPb44aR9J7L
 wVIW8kgyhtqLcMKasLqlQqJDSq+afC8cRdZVp/44L0FzD4Xn9go8dzO733rUwVjb7Mw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792613077;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=IT40cP98JU2Bfj7xvWFBAYE5YzRt+I+Yl1RIIVSa2Bw=;
 b=cYqOf9filOHV9XrwE5Tyy853mWjQanfwcOTnVc26W+tQ13gHh4QD2N3jPDSsjwqDUM2n
 vSXiyTr/ImcEZp9ofujzPqX5ABofRIJjonlA9LYWR2gY/hcvPxPUleP9EssOXipLKtgPx
 vDpSqWD947WGWxGZ+K4DO2oqoV+od+rNzuleQuhFE3vR1egLhH9F+GeqQqzdZgxEN3WTH
 Mv1dmxD7xHK5LtW9V4bYnq8biXrl9wCLXWlMjRZDVkLkErjVglwxmY3WzXeulp8yz8Ado
 s7GNb4m0EUd0DWC3akzokbnFuHNxInDnKTF0ICfUHeLGW5a4rk4RpWVIcPJrKkm2pBQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BEB54016D
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:04:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CFB0E99A59; Wed, 21 Oct 2026 20:03:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 21:50:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2260627613cb7b49518f94ea2657c44b0ed535c7
X-Git-Newrev: 8de9e606d7bb3d1fd5facf12aed36cb0b0d92612
X-Patchwork-Hint: ignore
Message-Id: <20261021200313.CFB0E99A59@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freescale-ele-imx: install with
 original filename
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8de9e606d7bb3d1fd5facf12aed36cb0b0d92612
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

U-Boot expects the original filename (E.G. mx93a1-ahab-container.img rather
than ahab-container.img), so install into BINARIES_DIR with the original
filename and add a ahab-container.img symlink similar to how it is done in
firmware-imx.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
index 5756b422ba..d2a96d06b8 100644
--- a/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
+++ b/package/freescale-imx/firmware-ele-imx/firmware-ele-imx.mk
@@ -22,7 +22,8 @@ endef
 FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE = $(call qstrip,$(BR2_PACKAGE_FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE))
 
 define FIRMWARE_ELE_IMX_INSTALL_IMAGES_CMDS
-	cp $(@D)/$(FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE) $(BINARIES_DIR)/ahab-container.img
+	cp $(@D)/$(FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE) $(BINARIES_DIR)/
+	ln -sf $(FIRMWARE_ELE_IMX_AHAB_CONTAINER_IMAGE) $(BINARIES_DIR)/ahab-container.img
 endef
 
 $(eval $(generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
