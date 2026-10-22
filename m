Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6C5606A31D
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 15:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=iUeVjYUJ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C3BE8606E9;
	Thu, 22 Oct 2026 15:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wUUYLRuUqgSM; Thu, 22 Oct 2026 15:40:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org D8E4360677
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792683655;
	b=FSAmO15vWUQy6x+g1iX3pZkeHJrkc5GU88692AkyCH0Z5o7I71B5J21TRO9tcY44cBFv
	 vhuLc+XPwwUgWn+ttcNrMG4adB9vyzpgfHW2gGWz4BLFxM2u8HDFqLZCIX68/jcMp87Uz
	 PVkFm7cHqwYp5sSfyFqX8JdOUGkqMsFR7GQGEUizaxZ7Fmt76d26iUbYKbEi+qebI4jFr
	 V4zdVwJtcS+ecLUxapAz20mY7FTZe9SNEunBHzgiGzrg43dcQWzsseq/Je3O1n38RVVnc
	 oClYOXRlSJQejy8jA4lKjwWmegSnnLKbu+jmSLDiCss7OgE5PytZbOSkTK5v/X0giIQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792683655;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Z8GIlRDBA+4xO+/pEVy3EcUmiklOvo01poN+ZleLaTs=;
	b=JBRgid1F7Sw7vFgRgaaMvU7qZ6i/mQTL7G8zjRkzx6D16bPxKTJv612EJaHDWp40Fr0B
	 CsUUvey2oSy8ZbH7A3siYIVcfQg92bBBu5Bu39L+EDW6u3J9DlHm9MT91/2c+T4LVkE9p
	 vgVdTQVrWrlaLEC3FC1kYiJXWfmlGJDBDmgQvm1JgH1VRIKGn/+9qwljfjOlEZDLzfubT
	 T28XR9e5a/DuU1z3I4g6xoRD0DmswCO0CdErgKFAEYbE5RbR3JJDj6Zs9yH62XxYlAAKh
	 rz8bpndsnfF/WXp6emibj1OqYHBAEVXNoITqcAFD0WB+H+H5GEjFsvopVNPWm8Ti1KQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792683654;
	bh=Z8GIlRDBA+4xO+/pEVy3EcUmiklOvo01poN+ZleLaTs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iUeVjYUJHK8TG8zMsfrMvTQekskCTqZPDpl6P3nDYey5y9eIvhY/ThT8FxAdQDLYC
	 /Yo40Xzaoci31ovT8ptxeGBioByI+ijZacwDWVYL97jXMMzyTCVSuVpumGxMika8y3
	 uYKQ9ai3jg9Zn1Mxkh3Le9AQSi+KjmprMi29ADZeB9mJ195sBvIRwU9OgMiO0eYogp
	 SXKyHx3HTCTfxrV70u76tedR1bLWLjC9QTF7obInZ3un03hAohiUHPgA4/cuS8662M
	 DWp49JTk2PD7laNA0Y9wz9kqBY/IqGAJiEzMHvty1wqSoMfuJ9/oRWdCRQP2S5x2jy
	 ca4O0lxa/YOOQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8E4360677;
	Thu, 22 Oct 2026 15:40:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id E46DD1AB
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:40:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D67E1811F8
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:40:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id snvxEZwwD5FP for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 15:40:53 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 34E1A811F5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792683653;
 b=n39YX7HTJU3JEJOVRITs1nxed9Hjd8VbAvCC+FPJDLKAn61z7sKDSC+R3CJbkL0xfmje
 D3iiJfCSBWsF8ud5QZLi8bMnRnJEDVuEKHngNuSysVK7QkbusbafcyisTWcv1uDyoqp8n
 B34tk2+bNgkxzBeMTqa41ZVQMT4Tk4yfBSVcXiMz3TLvm6be0Ew/nIvHx38bohhr0IYKv
 nrj3gUfWpoQz7lB6l8+Fj/8qAtHLHVnvLZ0Rnw0CEtfyK7CiYCchwAmdu97VhCSgrSXla
 u7ffKlg8fAiWaTncrCD1iGR5IqEWdgkQIm7mzrixkXWkMPcq1Ys3IbZn0Ml+Bqx2r9A==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792683653;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=0RLyjHtoW3Onl0JoSvFywxuOsg/MBizYpBgC1q3mbPY=;
 b=BXrLpLiCM4Lb9KDFyd3BKoT1/vX8fO3Uur54pUPf2FB6mBQEp22+N579vEkA/hS3oUZq
 IQLbP0UQz5RY4LMzWRQQ/fDJRwOZq354Vj/5ZZMzdXfXra+9aISlFyfSJyUPwRAndONlF
 MrxiTjF4TtJpsfqazeSm2x1HcmoVj/luvLGSjs2RImMWJSiqXmHnJqmZBQ2DTwjbs1QHp
 Vmj/Ox9SYiKKUDGzOLqTqy0G4MgxL5yJY+qFACPFfI66RpQz2vWK7wbz8516ly1ikZKRl
 Vufr7Lfx/j48i8oKH3RCMfW3HZ5B1m0BQgnc+NXMBt6bcFuz/FF+opVnGm9TqapFYLg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34E1A811F5
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 15:40:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1E3409B9FF; Thu, 22 Oct 2026 15:39:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 17:39:00 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0e800f37f3767be20fc2f33ccad3016ae9b8e87d
X-Git-Newrev: 4f924fd52841608d68ac3dcb83fccee8b8c90316
X-Patchwork-Hint: ignore
Message-Id: <20261022153929.1E3409B9FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] Makefile: Update for
 2025.02.19
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4f924fd52841608d68ac3dcb83fccee8b8c90316
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index 2a87b632da..5b838ddf2b 100644
--- a/Makefile
+++ b/Makefile
@@ -92,9 +92,9 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.02.18
+export BR2_VERSION := 2025.02.19
 # Actual time the release is cut (for reproducible builds)
-BR2_VERSION_EPOCH = 1789067700
+BR2_VERSION_EPOCH = 1792683600
 
 # Save running make version since it's clobbered by the make package
 RUNNING_MAKE_VERSION := $(MAKE_VERSION)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
