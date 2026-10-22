Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A90D606A31F
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 08:39:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=j6Pre9Fe
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D80C480BBD;
	Thu, 22 Oct 2026 08:39:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8wz4eHVFWw1p; Thu, 22 Oct 2026 08:39:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 0121F80BE2
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792658348;
	b=cf+O2gqN7p5/3RI+3PPxk4b7l4LJUXHZt4cJkZSCRc5dUCcXNZI2JEbxExQWveaXhaIv
	 cH5RsF4xHHQY2+T1Ktk9l/51I4WvBGVTf+HmvTAVjawDT6ZGeLkAcCi+gDX2OIIaoEgKj
	 JUoae7ppIGIg6GF4T6aRP4tOCXYNZluCRK9i+/fuWgU4KnYajK5Qk687ZFBOLvqdN6DSc
	 XD4aT8QHHH5lydtHb8XdEJzUUKiKGsqwHJEmGRRm5i64JsT39e/TakCfC1axEWryMhQ1P
	 qIf8B0xYCh5k2QAgD0+s3o7johB1dcNwpw318E7o/YeA9U76o6lM9iKoKCuDV/ntJiQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792658348;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Jqv4zGTXVkVnFY5TDOfDVGFLI/iiW6n0l2Iqe/XMGfo=;
	b=XSpHqQGk3qy1Sg42/xlbeu3AhYy5oaFOwKt0DaHY3L0d1aZEUVyppQjbCk+YA6NgtVeD
	 1DBkCorQCef8flLAXIWIu188AboKQhMaSx9qL/80K1xNz3I6D8Pxop6mIok7lQGD9SofL
	 7ppSzjbNcz7ppvhV87H1bEDpwK3nj8Kv33bEzlSYIcz+9EDvbj2pEay2ypzjDmMHOSkUK
	 LfoWS3v77Mbl/DrvjghxRnlySsJiDcONYy+qSor1SR3d/FvI5rRmgKZRUvlXO36Szmy4k
	 Sw5MzRmgBMcpMPQZAxUALMxlmo6LY6OsdeYa4JddfQF2m7YlL9JIOasHaghEiin/uPA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792658348;
	bh=Jqv4zGTXVkVnFY5TDOfDVGFLI/iiW6n0l2Iqe/XMGfo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=j6Pre9FeLqiCYIRdU4L/Ong5Ymnnrk5xPPOI8NzCT5j7MgrouJcpkgZevwHR09I4D
	 jCguANb+wsZ266l2qH5sCs8uKBTRtVAcZHDHUwbQxUCN8IRnc837YsDjx4suZ7rEIS
	 ZeRHJqgYEvLcRG97YLfwkKH7MgD+hMtw+n8A+UP1owNR9GqLcG4TXzwvBIUXpXGetU
	 kjopSsCAUSi4Kmv/ZPn5MMMMIFe56JuYHwqL3XN1sEPVx92aZ9tYMvs0zDSU8FHvc+
	 jWxIvw6t6dYDlM6I/HS8ujmxyEo+sZOBQ9FcXH1GsGzvyWYgbD/7uZRZWuqmk1qyfi
	 +kUOx/tPe+06A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0121F80BE2;
	Thu, 22 Oct 2026 08:39:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id A5DED371
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:39:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B75480BE2
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:39:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 30Rpd3blqBV6 for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 08:39:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A7F5C80BBD
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792658345;
 b=GKSgBTnkNBCtn/0UvjdKH43sR7uNg64fOnFA4wY/L4DmuHYKZteTVvDzEU7mwVUTON+C
 DHNKR+/sSkPv0U/INsNM7NoJMBBGdSSvGaX/n7T6ZGFQAEGCpfPaBik+LMllf7Y4i4jL8
 L44iPqs/3/hte8wJMN+GH52XQ5PYROl0ZmPTgzqx/2h62sjzU0GCfC7if/FuFmfFXg+ar
 7j2HCMPMB2JrEK99+YU5CWQ1MIfSSPOxix2bGKaMj5YoSyhqGsnCLu9zztqnz+KxNitsw
 mMl/zUkW4LvJDxp1J5tdfvcdtmN1F35CDFERk9L3/lsajNMynGnbsfJUoNOYZ8g6m8g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792658345;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9iEUEax00BFx7mWCDKKVzCbj1xtFI+8Mu8l16/z9v24=;
 b=ehK3D3XsMueUeKWhx2HW49xJNsSEfuaAOowWdmgxmNZLuGB+yUBedj/VNRG77ZFaHnR8
 pRAlvKth+wCTKgnhMYPI3gKcAQxWfd8+Dfn65/hHBv28L4MbPj5j5Wk243pt3eNaDwwSD
 Kk46srn3X64LUtw+/bXWp6V8CYZpd8NTE+4psUjlgxG7AzaDWNj0LpCJO5an33AXJCyK/
 WWO1PMyN17UH//zFLwyFlzPkXqX5L6xpuYf11g/z/hY/ZzJaydhbzU0kZOE1Yc6j4JM8v
 zxg4/HC36qw2ELzr8zPN1QD1oESQvwJwxAk0cJsfMdGjZBApG1YAT4ZY9KPPwe4Jsjw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A7F5C80BBD
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 08:39:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B20739B497; Thu, 22 Oct 2026 08:37:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 10:12:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37aa996967499efc62948b93811b279abe981c1f
X-Git-Newrev: ef4e20cc948cd20cb161da4a559cdddaea48551f
X-Patchwork-Hint: ignore
Message-Id: <20261022083741.B20739B497@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stellarium: bump version to 26.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ef4e20cc948cd20cb161da4a559cdddaea48551f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://stellarium.org/release/2026/09/28/stellarium-26.3.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/stellarium/stellarium.hash | 4 ++--
 package/stellarium/stellarium.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/stellarium/stellarium.hash b/package/stellarium/stellarium.hash
index d0dd53f900..1e0e0fa9c9 100644
--- a/package/stellarium/stellarium.hash
+++ b/package/stellarium/stellarium.hash
@@ -1,5 +1,5 @@
-# From https://github.com/Stellarium/stellarium/releases
-sha256  9a068d00aac82151f2b24c7f278847a2f9416f31f17c0326fc56ee4cc4cb1aed  stellarium-26.2.tar.xz
+# From https://github.com/Stellarium/stellarium/releases/tag/v26.3
+sha256  01cc5fce373c3fd2262ac0457f0b52be72adbfa30f8a959274be221b436b7ace  stellarium-26.3.tar.xz
 # From https://github.com/Stellarium/stellarium/blob/v26.2/CMakeLists.txt#L857
 sha256  55d0111d48fb11883aaee91465e642b8b640775a4d6993c2d0e7a8092758ef21  release-0.5.2.tar.gz
 # From https://github.com/Stellarium/stellarium/blob/v26.2/plugins/LensDistortionEstimator/src/CMakeLists.txt#L6
diff --git a/package/stellarium/stellarium.mk b/package/stellarium/stellarium.mk
index a3ab725017..df59305650 100644
--- a/package/stellarium/stellarium.mk
+++ b/package/stellarium/stellarium.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STELLARIUM_VERSION = 26.2
+STELLARIUM_VERSION = 26.3
 STELLARIUM_SOURCE = stellarium-$(STELLARIUM_VERSION).tar.xz
 STELLARIUM_SITE = https://github.com/Stellarium/stellarium/releases/download/v$(STELLARIUM_VERSION)
 STELLARIUM_LICENSE = GPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
