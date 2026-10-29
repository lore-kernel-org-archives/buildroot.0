Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8B95606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qTJO6bpb
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C9A1E8153C;
	Fri, 30 Oct 2026 14:18:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qHvPKGmYbQkN; Fri, 30 Oct 2026 14:18:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 15DCB81546
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369911;
	b=oCsnx0L9z6Q9SviMv6K9bv9ePz/YhrD5KwHYLwpD2egyourww175vWBsa9nmhEkLH0LW
	 3HDtaFxEaQitcrfqlZB+T2pzF5tbPxa5JCi6esAPGkdLlLDse+h1Greq3n1QHNgMBRy4e
	 y5bJSJxZewC+6x/Z8V9wAr9T7LHNnu3wWTjm31Od3lQScP5iao9PUwd6CWgGuiWNkfyoX
	 HaranH6Ipvw50Y/HyCRarriw+d0a+1OsderJLFGcLz0GEwnSgqQURPlFquPb5fqoZtTMS
	 m6daUXhb28rze3ArzEgvl2+GSQGbkx7k+CR6zOvsci73T4vR3zav2KLV5/WOpdDYngg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369911;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=kV/U7c5xZYUpvoWEOaEgCMhOAmT7pXUHuQdDDtHroQU=;
	b=kN3HhRBviTkx9Ft9vxI/gsF2wWrJSdpE7h/SAXEzzWWvEHR3NaToW6GXLsOxQibluQKC
	 pgzzkDHy8zQTLY7q0GGG4cv77lP3/12WAKgSV6gMVXYhh/El6Y15Zxoowt+bO+fq6xf+p
	 5kHX+FbAIPeZ9gLa3LIIgvzoK6tHGwlw8wqp7CrfkcdfRupoTKh6jh2soYWanie0ISFHV
	 +s0CLuYpudPdIwrExCKUuwf9w0FjfvJtXTYvca+KrenogSjzIgutUgfbsRckafegkoaoa
	 5KnPb5MB6bNENE5O5pR/a5m42NyjKcbs758KXkK7jikSEyjTi4839WjjApJpXp2q+zg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369911;
	bh=kV/U7c5xZYUpvoWEOaEgCMhOAmT7pXUHuQdDDtHroQU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qTJO6bpbHPMGJ4p+FHNWYGvJiSYF9LiJBtr3QeD9xBS2QfxVeHRoL2ALgT9W2Ly0V
	 zgk3WEWaIQD5xiQqpO2x78+NNxTVImmzd5W6JEmjW5Bfrt+FvnCTFq93+1DP/GUfq3
	 AH2Q1OXMavm/fmgUh6HD4cPrK6wMPmA2nQlhQMtF2faK/8CPzHyrlI3M0WQ3O6urO9
	 LAFpYYidyq/z8Svpd6SIXdTWXOgH3E4d0k4j6M7LPRZQyu28KAOfkc0XggkHdw2OA0
	 wizWX3wQV/ZSbY5SVMf34py4buefgRl6jze2e4hRykkqJwA5OdgtHdI5o2NCuE2kai
	 D+bPeUQs2q8sw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 15DCB81546;
	Fri, 30 Oct 2026 14:18:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 49B1ED44
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DF75812B9
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eIME0loN0T0I for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5F30081283
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369884;
 b=fZszHpdRru0Axpe7r4yeqT9uEAKoMIxtn5qCAklil3Xy+75TVjxvw+dR0h0VZXejVXcU
 aAvYWWr6GMrwFMwUsHGVBwE/EjwTSf26cXFt/FiQxKtBR0pw4Vgv0ABYLs5nGfPZCLfO5
 /NUMt44lh+RCyPaLLDjycWkbo8R1PRB2YF97pCYXSekgh8edHqeOATTuJlMbEFoA1btLw
 E2FTyR8c3VOxdefavKW8x+11+G8CntrePXayMvHqVf9w9RFNaO+iOs1j+R5X/GG8PWg7l
 Ya+/FMh4DsUXFUX0rp/x9UQHJeYB2ZPXBJu/qW2FE4FBVN+fr+WEo8yfnKD5+CoInVg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369884;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2pSj1Ntel5WmGYM49n5YtFmo6reCkC9GVhnOIU8emqU=;
 b=cBDY/1R//jonr+9DPkw/jrjGEYeS0dd8rOGAt5VNre+Hn7c//6ak/mHm1drVtA1tJPI7
 6CR2AYzrtGl4K37zZhJpNSsr7Ad24vFbINIoILUxNgHN8LyCwo3/aHAThxL1kbuM7UZ8e
 I3WxdzoBPfZd4jdDbvrxXA1IrIbmgrVPA4Yct9d25gLbYnmtbAjHUFR0y2mhfVLwdu6bb
 fXcsUeEABu0KQGXmnHcF2aU9tFoG+dOJrw1qH7BedUxN2uAPlVoa01kHq7GuidP30Og66
 gGl09cejzKBeUWaI6I4JCNDO+fev0SvwKNDdR5iB7bcOW7QaJV+LRgUlhNSfcBL7n1w==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F30081283
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C88D9D388; Fri, 30 Oct 2026 14:16:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:04 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 48327395a78bc9da561a32d1ee1f97b418ee872f
X-Git-Newrev: f7d1d109602528bc61b9d2e0336df0ae8b67ad9d
X-Patchwork-Hint: ignore
Message-Id: <20261030141636.7C88D9D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/sdl3_ttf: be
 strict about dependencies
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
Content-Type: multipart/mixed; boundary="===============7398951421772605985=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7398951421772605985==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f7d1d109602528bc61b9d2e0336df0ae8b67ad9d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Instead of silently ignoring missing dependencies, bail out with an
error.

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
[Thomas: extracted from https://patchwork.buildroot.org/project/buildroot/patch/20260816191830.533747-6-alseycmiller@gmail.com/]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 6588d61513f8eccf8c9a1eae6185a286d47ece42)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/sdl3_ttf/sdl3_ttf.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/sdl3_ttf/sdl3_ttf.mk b/package/sdl3_ttf/sdl3_ttf.mk
index 6bcaccfaa1..a4ab8f3e90 100644
--- a/package/sdl3_ttf/sdl3_ttf.mk
+++ b/package/sdl3_ttf/sdl3_ttf.mk
@@ -17,7 +17,8 @@ SDL3_TTF_CONF_OPTS = \
 	-DSDLTTF_VENDORED=OFF \
 	-DSDLTTF_SAMPLES=OFF \
 	-DSDLTTF_INSTALL_MAN=OFF \
-	-DSDLTTF_PLUTOSVG=OFF
+	-DSDLTTF_PLUTOSVG=OFF \
+	-DSDLTTF_STRICT=ON
 
 ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
 SDL3_TTF_DEPENDENCIES += harfbuzz

--===============7398951421772605985==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7398951421772605985==--
