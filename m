Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E8F606A324
	for <buildroot@archiver.kernel.org>; Wed, 21 Oct 2026 20:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=haDtvJaD
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEBEE81854;
	Wed, 21 Oct 2026 20:04:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OrO9Ii2XED7z; Wed, 21 Oct 2026 20:04:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 097A881C56
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792613084;
	b=N1/r1t0pB5Fdo9yS0vnw1VvrdfAZeJGx3hNzc198rOJHXNGyHKDCwlE1d5DkTQcMdKjm
	 HsZiY1BIteoDqvlzENOU995hIjbVuxhWJq3bm1U8HRleOjZVJjAGNaN8bhWihmATtLG1b
	 yBNSvpJs6X6vD1+sWW/+U8Ao0RACgeiR76xN0/ZQ4RjRROGfbom3BGeKve+lcfOEjdzU/
	 6bjVehZSaZSJu2kJVHVE1D2XAlZsvm3EKJrbtlX/Sren8W9uJIgkQAdatL65MxrH2WNrE
	 16qBjCxO7XKjESqHHz2PDJvj0EzfLSV1LKjxhHoMN0zY/G7WrvuYTmW8vPudjR3X8jw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792613084;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MaV5HOzRA3vqB4a++IpAIgWu3aKvp6HCLyqGqj8g1CQ=;
	b=nqJFSyKSxgFDJLflqf5a/tRRfzIL0XMlijxT7HXMw67CJfExliWmh+NrAAy+4tZos9/I
	 WouBtFVIoZKRArG4Ft+eFqBLRoxId1HiCj8ciGP8AT4ICqgBjXLguYL2j9d7LoaGLhWcv
	 0dcZv7U1jhZBo9ceb6Zq1musIjpIGgYde1C5fycANsd98ewiplj7PmE6s8O8IaOV9ab5N
	 fydgMeuuq8Jm+AXPbJKgecTMtrSua0WmALqLmvhcjpxvcJndoRIrKb45CMLDducnP7h3v
	 6ZJ++54f9XEd/+QZmOwGEfjHdxXvAeFfscNUJSxVZHCYWAlwU3g3H3A7aCe1N1v5bgw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792613084;
	bh=MaV5HOzRA3vqB4a++IpAIgWu3aKvp6HCLyqGqj8g1CQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=haDtvJaDHUdV1xCsnS6HW+I4kQE4nThxZsMOu2Bd90VlhOxL/siB4MbNqRQNG00Bc
	 4lpUiDo+QTxwaTL9bDEEY1G+Y/CAZWYyBN4V+XRm1JO8bWAr/kLLGHOIWEIdUhPaWF
	 VPwQTbwxa4vHQiH80s7yDNBRw0zOgfFxuzLBcbsbIreP/cNcrmt3l/0G0kETrS2WSe
	 1p9jkoiF7wiyv4BX1qkEPWWlNzKGIT3Uhnbn9y9nQaZ11m/TRE9oePylg6JhvoB+e9
	 +y7T2Ymv8JrAcDON96ExKTKDKsF5vaWKnHXNMzkaHYYbuk0dKFsAeG1SoPZRjmAMt7
	 XaSXVKWzm6lGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 097A881C56;
	Wed, 21 Oct 2026 20:04:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 86A9E1460
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:04:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6967B81A3B
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:04:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QmlR0iMjy0r1 for <buildroot@buildroot.org>;
 Wed, 21 Oct 2026 20:04:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A964F80DE4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792613077;
 b=XK+efeNOnzh+JFtSDmANN5SjpSTLfSelM5MXXsDyXkMokBHi+EsBDKTbnl07dY8dcZMF
 vKzBBClbA7YhwB6JEJAGhRWzHXfQBRdh+nqDoVQP8O7zXzEI3CVD7Y3x0uGWzA+OFQov1
 6Yh5/mQ8ps7V/97gEg+Ct287qc/a5tor0myJL8iEwI/KV6GRTLKDKIL3gHgwrMJx/+bQU
 8k1FS4z8k/21+EVq/nshduqZEMJLv69b4T3+72KhqphXQgTELNmNTXR9vSm+FJiMZKN/T
 Rk+nii6JGbMfZDx4E0K87EnMR26DufWmoTXdZUthNsDBbchHIkKviJlG0ZCFPfP+YEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792613077;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=QIHiY4+wXlu7+aEQlqUKIehNgstK3L2UkQ5JzdnzVpM=;
 b=eyphcl9iXyxcrBmb8sfoB2yQFN5VL9PWiGaf7Jke+MFc0GDq40Nfyoc9IFXwrCFuczDt
 vqUZFkfBnn5QhQFtZlg2QNPBDEjbAQapFY/r2WA/rIAux6wzJbwuajhy1j2GPD+O1xX9A
 poxkAxkHlJIirFwJh4GCv8t0hjK2u0uwCfRGCXZsdvEEHhjU4qd/g7AgOQQSJpDfNwDf4
 QjRw943INIWVOINwWZJWxc/UHsDdAcOpjJdUBtb8Vygjy8dPjFGLjrZvBbwzPKkWCfTaD
 BnggyfXG8luD1CltxFPkIhMHDWeS8E9q50xJCZLDHI6cW/8YHMCk+5P7Id/DoALySfA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A964F80DE4
 for <buildroot@buildroot.org>; Wed, 21 Oct 2026 20:04:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0022399B23; Wed, 21 Oct 2026 20:03:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 21 Oct 2026 22:04:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: aa1ed6e7415b48807b4a0df289c230d690bff45e
X-Git-Newrev: 436d7fae9ae3092d89e8a8485cfe1d64a290acf6
X-Patchwork-Hint: ignore
Message-Id: <20261021200314.0022399B23@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/imx93-evk_defconfig: drop explicit
 FIRMWARE_IMX_LPDDR4=y
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/436d7fae9ae3092d89e8a8485cfe1d64a290acf6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

This is the default on i.MX93, so is dropped by 'make savedefconfig'.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/imx93-evk_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/imx93-evk_defconfig b/configs/imx93-evk_defconfig
index f3af2b5183..05ab4ae7af 100644
--- a/configs/imx93-evk_defconfig
+++ b/configs/imx93-evk_defconfig
@@ -22,7 +22,6 @@ BR2_PACKAGE_FREESCALE_IMX=y
 BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX93=y
 BR2_PACKAGE_FIRMWARE_ELE_IMX=y
 BR2_PACKAGE_FIRMWARE_IMX=y
-BR2_PACKAGE_FIRMWARE_IMX_LPDDR4=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="256M"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
