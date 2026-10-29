Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67931606A31E
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AaGg/D3J
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3FF4140E12;
	Fri, 30 Oct 2026 14:20:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v5fGRKXEcM6I; Fri, 30 Oct 2026 14:20:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 540F540E24
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793370034;
	b=Fe4oCLmeBZPg2+KKdpLE4WFoAQ0NNWHRsyRdji5Dwqr/5zC3rXSkcDaJp2qXPoSQrdrP
	 bHT/HHCt7wfxO4K4AvRZNgbIXBvNa2+kV4nBtPhy9+wzHTTeFpKbpzl30MLBGOP7WsHhU
	 ytTiWuVTg24KcFXLHQc5jEgMG9X7eOS0kL3PDOjidNsFre904kcGH/lGngKZhEUHYdF2R
	 QyW+6rHnHoYmT15AQEeYoryqVkMVhTc3CVkgrTUFhvBkj2CD157tv5Jp3TmJBaYDj1QsJ
	 CWG+8VC327irUijaAnrYn/Ask2iw6fupdj5O/tLkgF0s3WYrNfLNu1n8NfZtOGn0BZg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793370034;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=1ftFRCYY9mztp8v++oif5Ze0FD1YGO2N9pxsWJwM2Ps=;
	b=sDb+3Xp0O2lS+uShOxaU6HpEQCEHWJCqg92jQAJmVGf/IV8O/YNHOxQktoQw2VJ+bzWd
	 xf/WuxD+0gVQhw0eOJQlhUmI6maE0cIsmaFgRJ8jXtwfQKYDWxy3L+YEV18K2vVxp79Ny
	 MlCOhGSowe6VirYZ5SQOG2PTq3Gx39a3WVD2tu1iV8R8CG2T+TOtNX1FQJxidQArYsJYN
	 OmPeKY7PvZs6R3jyqRGdQJWteJV6bgPLvB0nW911YZ1PNnQYevc5rgt24wykiBEAQMiSf
	 ZYe6rB3xOmLlIaB60vnRpUNdVIsN4/q23TiYjGBUMpuxULw9TiV7LQxu136iXdKpBog==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793370034;
	bh=1ftFRCYY9mztp8v++oif5Ze0FD1YGO2N9pxsWJwM2Ps=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AaGg/D3JNAgzM4LpRytnQH3GKzwfiUcSu36oHJ0CC/ZKjdwOINzO4ntBWIZcFm4QR
	 InJe2Czpl2m5nH4tlIcqjum/3JYiMFXB5edry6zgU0v7w8CtOOHulQTO6IbELac1yp
	 Gn3F/q0UsN9A3YpbFD4isFl6+hyKARvsKaQ/3K4Kr2X3GnYE859h8+dPa2s5CTMAkB
	 fZRMO9WgUf/TKZJi8reMzGjcFQD15meut/NNdUb7j5Pt+SyKhraCGLidS2Nu2s+HVe
	 aJTrdA7Z/ULyLDqbhOaIGmXkg7Ii8hNpKd8mEgId1g23KwYx3ixdeh13X2rvexEHAp
	 fFTgozEIvO4Zw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 540F540E24;
	Fri, 30 Oct 2026 14:20:34 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 52CD7D44
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C1C1812F5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z4RYlE4h6uKa for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6A4BA81300
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369895;
 b=JD5/c0hGYTzcvje7jS77Dr+7qjoV3DqUkFNmpIUZLJPNc8gyhmlOgyqvuK0l9uW/Xvc+
 eUsDvcgSCnUoiIkWHbX/sOwUghfikDpdoYyKHhbwvLcXpyP5vSRX/8Yc8M76/ij7B4tlL
 fQLSUGTbsAL5qiKhZ/gxjUnq/2a6DGnWVsuN1kDzqf6gQeWhylfS/E24GHOnscMqng0Rx
 TD17sO9gkbAyfHpbWOc2qoScOGM8lXz4cGNT6/L4MkwXG5ucrGf0zd2fwrJgPRRaUeAi8
 6Nmv/zyDs+dMMoR8WyZ0kPzA7X/+7UTeA/N8334es0rGCoE+ZtgYBqb6sS1bIeOLLEw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369895;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Kcbtt8lzSwdhzFJr/uT7w07IkdwnKkpt16yMkLDrkJQ=;
 b=QZ3+YrlrNiJsSb4E0WTCiZChAuxBSEDQOIfGdriJmYXFRkENJPsyYhuC3etUA8AcNUw9
 f9HmCRnxHw4D/xbbmFRamaf5cLIv3HPKiq2QWMjea4G11ePdRn235xFtZuUCpqbAwPzxD
 5Dv27GZJUtJ/bz/a8oBO7Qq276R9MxE7+Y72wRbvsw9IE/mrs8wweEgqpOzmz8GNDDpXG
 LzJC/+dL9p92Pu+RxydglJqCC7vKoagvdXOl5Ul4kY2Vv5CNDamtykUKWMOWJavM+L9nU
 InwtEXhsU5iQAKuLXMU+DamRMJsklQZEW5CA6XS24Of9TjX8tHuUySQVrKB32YEV8xw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6A4BA81300
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 888539D388; Fri, 30 Oct 2026 14:16:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:11 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: b2a3433e1c2caf9d03b114d5e79381cd933a1ff6
X-Git-Newrev: cdd9a34415c1138cbf548a3ed7969c39f9209af7
X-Patchwork-Hint: ignore
Message-Id: <20261030141647.888539D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/rtai: fix
 download URL
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
Content-Type: multipart/mixed; boundary="===============4620717145617665779=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4620717145617665779==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cdd9a34415c1138cbf548a3ed7969c39f9209af7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

The RTAI download area has been removed from www.rtai.org, so the
download fails with:

  ERROR 404: Not Found.

The website now points to a GitHub repository holding the former
rtai.org files, including the latest release rtai-5.3.tar.bz2 [1].
Download it from there, pinned to the commit that added it, so that
the URL doesn't depend on the repository branch. The tarball is
identical, so the hash is unchanged.

This is not caused by a Buildroot change: the download URL has been
the same for years, and upstream removed the files. All maintained
branches use the same URL and are therefore affected as well.

Fixes:
https://autobuild.buildroot.org/results/24364819229d65dda43a4294f26a31667e7bd77b

[1] https://github.com/mmorandi/RTAI/tree/main/userfiles/downloads/RTAI

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e9d5ba526565f9011beccf37209ae0287a0835fc)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/rtai/rtai.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/rtai/rtai.mk b/package/rtai/rtai.mk
index 6b309ebf85..6e189bf27b 100644
--- a/package/rtai/rtai.mk
+++ b/package/rtai/rtai.mk
@@ -6,7 +6,7 @@
 
 RTAI_VERSION = 5.3
 RTAI_SOURCE = rtai-$(RTAI_VERSION).tar.bz2
-RTAI_SITE = https://www.rtai.org/userfiles/downloads/RTAI
+RTAI_SITE = https://raw.githubusercontent.com/mmorandi/RTAI/cb3c52f056559c9aaa54d0e1c8c0b47467ae5f3e/userfiles/downloads/RTAI
 RTAI_INSTALL_STAGING = YES
 
 # The <pkg>_CONFIG_SCRIPTS cannot apply here to the specificities of rtai-config

--===============4620717145617665779==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4620717145617665779==--
