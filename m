Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05756606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=YpU0/SxW
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D80AC812B4;
	Fri, 23 Oct 2026 12:24:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zu6jUXjz1YR3; Fri, 23 Oct 2026 12:24:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org E79E9813B7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758268;
	b=hKX+iCb6a4G1dpnytvtZiD9cBLANRdy4ljdpREIPOU7/wGT+sNgBPm/4kyb78p3ZrZJU
	 1GllHuDgKeHMRmkym9dzSpUOJetzGKelRVkbeC9Qu5ez9H77zgJBb8b0wVCKjEI5gcu3r
	 0ktC8L93bpIPl2o9Om7ab2qXwR27ZUKIbqrg38/1W97zxc4DtvVqZwvMk8+c26ph0Gt//
	 +McFzz+lzBPOGJM2YCx2DwEWUTAohmO1F8TD9TiyHvijg2ZtNHcIG1mhI8csqoQZ2xcAZ
	 BUDJSH0hFLcFb4nrusm5mpoxoYkYR18TKZSAlYW5IjHIVlKIbfUn4OXN2rOyfa6otRQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758268;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=tNx/vKoVVScFLrgZXjCq77rUHJRcv34hLgclX31y62o=;
	b=gK/iyn3SB4L8EtXfSxUAoPnSPpfRzbqffhKR1pYPuKQueJMCiMG6wn1vSy4EwoVdlttL
	 U5y0qYS84nWyd4NZFQLy6foLAQDJcgT1XLAQqTv6ICysYB1nZLv0qyG4J5SrYGrMDvofC
	 5TYNYGJNSEK3pJ3wyaCPpFqoeikMREG8fvrWf0WYsAHgz1t14XnS3e31bEGi82muh5bVq
	 ejdnURMSx2Ew2HTxsC5BhY9oVJmWQWf2ZdOTrfruWn2w2rZS1VYfXyK84K/uHnLTlD4W7
	 wEuvjmCHVVRO6gZBnNFjxYBTQPeMz52cyX4s9KG49xOT9xquun0ffnAjRd5zdYq7mIQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758268;
	bh=tNx/vKoVVScFLrgZXjCq77rUHJRcv34hLgclX31y62o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YpU0/SxWHoOCxQjKcQZhpJKis1Pex0l9YPAIelsCMNIrxCre1YPKEp8uhApxeJhDy
	 Zo9w0xxXGkBMSkuX+xMjgeMW4iDxb14HBN2bA+BHO0Ifu7ldQbdcGl2WFD4+Z1Aikl
	 MCFl5oW9O4jS5rUU8kw5b8vtoeMhVhfpHLbUBAkTjN9+8Ql+Lg3gnrwFAi6YFm4CMK
	 iKG5QXYoh+0ApbYZFcNJzyb5eZkMrTsqe/ZTNTnTgQFkvCcwEE8wmcQ02QxjOf/ivW
	 +SIx+ALAB8c1qylikxXFn3vwHQfJkB88kPczccmdRapiqPDsbzpotdR6KOuAstq6ZS
	 KLFoqHyBvHvbA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E79E9813B7;
	Fri, 23 Oct 2026 12:24:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F11D012C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 24A816063E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ARIMjrVQRfv0 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:24:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 1987F60618
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758259;
 b=gi0BevGSMgRIWqJxuHV2CHik4n3l4EypKqBWYofl40/POxW1WT+IDVqSYZ0USBEZFefb
 4WTjTspFP65fl1MAzL2/i9dTzr+C6ncPj+fdswm3YQenSF4hk2LJIny8DB5vjAvkaJbhD
 9al6DNTEzedublflaTYFpKLtE3oTCYUyrdt1OegjK09FE1KfMklJXBBJqxfw3HvTPvRz2
 +lBjCrTl6f39u3nxeHTK8p81oPTNj8MxRtx6SfPapYaWrX2lGvO4vDzYlAkNUdqZRtNR7
 okNzsBexWY0ctIj45R1pr5IaIAvuVA2W7KkRSiuLwpJbCKHKuoVR6R/zuFXvl9iCNMA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758259;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=J/Xm8AgK3+s1cXCt/eP5NW0+Erle/aWlHj1PlQeKwuk=;
 b=OfYZhlY6UKkUTPsIFLw7Z2v9pGYLyYB4qFTxlypktgPENxWA0q4ZW6gmFv5prdV4AAn3
 4UY7+GEJvBUoWG4z9Ak3/zGbu5INWK2OU5eHzgxla47tw8nXUF33hsznVFe5eX5bWhcAt
 1z888kLJCPN/uxLKw07oURoijmXrtKXjW8uGlv+/rTZkhRbbJBFjOwhAg5Jkb+dbpB3M1
 XShUoaf4lqoCrixr6zOVjdcT6TMdyjz/APwmS6UWvuw6hSG54olAHCePTZ5vDFoC/6v0I
 JZ8dEQDsXwBuzeSio6zg/NbYdQqXAU2PEWT4L8wZ7HCbVdvJoKajsqMdBRYIIgVBYkQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1987F60618
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8C4F69C66A; Fri, 23 Oct 2026 12:22:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:49:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4f924fd52841608d68ac3dcb83fccee8b8c90316
X-Git-Newrev: 5aed48c019945adb895116c155aa9f7d01f9b5c0
X-Patchwork-Hint: ignore
Message-Id: <20261023122254.8C4F69C66A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/iwd: do not
 enable CONFIG_CRYPTO_MD4 for kernel
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7185677504400840150=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7185677504400840150==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5aed48c019945adb895116c155aa9f7d01f9b5c0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This was added in 8c12a6bf51bc4b166948b4392e96344259a64778
"package/iwd: enable required kernel dependencies". The iwd code
referenced there did not check for MD4 then (iwd version 1.20), nor
does it now (3.12), so remove the Kconfig fixup. It did and does check
for MD5, which remains enabled.

Fixes: 8c12a6bf51bc4b166948b4392e96344259a64778

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9fde910991a14e492f391faf02c61f7f88d4f265)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/iwd/iwd.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
index 3a178795da..cdd02a7876 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -64,7 +64,6 @@ define IWD_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_DES)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_ECB)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_HMAC)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MD4)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MD5)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA1)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA256)

--===============7185677504400840150==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7185677504400840150==--
