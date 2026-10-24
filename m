Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAE7606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 19:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=bRkM2Unt;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NALqWiS9
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D958406CF;
	Sat, 24 Oct 2026 19:54:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ygqJ0aL1Z2JK; Sat, 24 Oct 2026 19:54:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 41BAA406D9
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792871657;
	b=g3PNFOf3H95ylIYItpi7UWSbjNwCxyPtf37HphU4kpU/j6svOz/DAEAEl5e9lrR3vVLv
	 pTLm0ggZTeC060R3IaczURS3k96vTLWWRAor9ioXyvqe1Rh2rZoJli7SS6S92P+eAddue
	 RoL+rMsDNml3NZoNq241ifNYrHP0n1bUdOowC1pCHHVqlC9SJL4hTkoj6tyyrDkjCs89z
	 iS6pQhOrHm4q16X9BPzZdmymCLnUkjBQ3x8Ep/f6+4bmE5syemltIO9sKQuk3Uf9gH5Uk
	 7QAWlAO4hS1LRJT26BVxSMgkk9IREuG1IFZZEY/pYStyRC1pwvFGCkFufRH+0MWnbvg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792871657;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=MEvVRRt/eevr1C1FU/0LZqb6TxlxuyEkbKJIOMj0ZFU=;
	b=fgJMTYqp+jRau4o7JWXJTwk4CR2YuxvkvuUmXZGM/c2SDx7kj5S1LNjWVni9CQwgTDbN
	 5RaU3qFTNYcw+1lVq7IBe9dVIJX9ZPIZ7DB5ZlnXrmJ28jzMX/Xu0NSQqNuVZh0v0vblf
	 6TTYMHKTIQBHskbQs5I6H+8g6/5+vnYibhNIEDao4RVkavZ7ArW1wJBoNdCbAifyQ+54e
	 ofRMZmHfA6FTfb+SacCoxH5DgoZPRbndo7x8kyl+9EFDsWyWftGDN89DLmuPpon6Ojr3h
	 uGGFmqy0PY12q1EsmunGqNk67+B8O84L0xlyWxinrfIY9FPOS+ggHQwiA9ye2icvzBA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792871657;
	bh=MEvVRRt/eevr1C1FU/0LZqb6TxlxuyEkbKJIOMj0ZFU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bRkM2UntVSsMLfXVOqc/El5KkewpaIAE09UhIl8lj01AvTvk8pG/qbiaiDFttvP4X
	 ut2jFz8Pj1Zb3ZrXnC5NP0M314QDEfWbsbZROoWdKxUiIihhejXXjZkpA6dwCNxqXs
	 lpXdS9BntW0cna4a4FOcmCxgE+U5xHjWzlKvhsfQucekBL7C7y5mPxhQsokCryuGp4
	 oM2jv6q8fyR3U5dR/mNVkmUi3Hgr6yzCuMZU6O21zDuDuyKVhuVDgYDd8Nkv1wxAwA
	 9hS3U+OhqCKY2RCsfBZ25ppb70dsDTZrntLgS4LrG7tbW+6tqY5FHuyyfNcr/VH0Qe
	 /J09DXYxuncTw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 41BAA406D9;
	Sat, 24 Oct 2026 19:54:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C552356
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3244460611
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:54:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ytBVwLF-3idP for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 19:54:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5704E6060C
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::332"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792871653;
 b=tMd9v7XxzhOBaHfMxoQDy1fTpbK5SDV9K6xFjA0mi3spIwF6oqrxO1Atf4Mo5h5SM0xE
 PuNiK02lhdzxKcHXfX0AJoMnDfa4aeAgmPRsJT/T572SnQJhx+d/tMxLmPOdIISFzhhur
 ktlIkNJcP4Gx9SaQD9veVd7tOw+whjc85BFIHX8u5ewXAf2z8uyjQC+c5BrDQj9R0i5Kn
 n8NDGpUFoG9UjzHfs/5evme4s771Ic7XxB6rca+DzjMntwxAyFMiPMBJ0evsx/n6QEkxk
 uLdHxGgM7gxoYuWJYWix/iA99N9apbbc7ywg2qlEHXhtpDcxB8UeOeV+pxydvh7x/WQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792871653;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=EI72tmCDCP1raj7QEAyVK0WtepMZagqVVOISE++BpHA=;
 b=Ken+BXKJfooYyQVT0lljnRJSRppM+1d+aykLmlzJqHp1Tm3u6N1p8lBOVVGYWK3W9PUO
 NUPbbaeMTlYUzZjCARBbzRFFLOX0BxEp83R5DECEeVw1iwVmlw1xWiqBXuO+6Sr83zwHZ
 MK2tVtkcVwnUHB+HBs29bRXIZocXQ/hQAVquItR6cCPIGrtObbnSdmAiSiWHyjRgC+34e
 nhLHM+yyb4Br5y9Vvw4QKZkyxEd9/P8dZ0g/nvCkYmWKAXu39CDQWk0JShpy86DgS6pI3
 ytNeWSMqTLoeyLE8cb+5KZRUQfA2ASDle4o0dUm66YJvPqYmjccKf12De8laHX0AEyQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=NALqWiS9; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::332"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::332; helo=mail-ot1-x332.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=NALqWiS9
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5704E6060C
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 19:54:12 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 46e09a7af769-84a248254f4so1254331a34.0
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 12:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792871652; x=1793476452; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=EI72tmCDCP1raj7QEAyVK0WtepMZagqVVOISE++BpHA=;
 b=NALqWiS9Arfk3b2PeJ17APiDbjBaPKrVzIXeUHUUmHiJWt42cY1PwdJsbgPKMFMTHn
 TPt1yIeZSc7c37NsAynwld0BZTq2By9vknxBDlXSolW4tTOyyDcz/9J+3xik6+vyKFc/
 xCdJoIoM78YusFjo0L+3Q0peXcrr8VWj7He3z0CjkjJfi3zyhqQFmx2gxWn4XVxK8DTG
 LPKTSLvhD1HD250Yt10TICYKYfkNzuPc4dJaD2L4vVWjSL2BiQzqEFa0wHoCjN4ORhPb
 d8fi7AuZ5I0lAydRjDv/oaiBEF1aSSJxsTY70ma8I/USCCxgOWXubSfTGpDtOVc3Ta+W
 Mxww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792871652; x=1793476452;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=EI72tmCDCP1raj7QEAyVK0WtepMZagqVVOISE++BpHA=;
 b=umlCJsCe1RZTj7BB6siGvjcId2s/5uSPfFgA3/0ji02VZByXimYjJy4Ql0DGKZpi/a
 UuCYn5AeUk5lSlnb3NaQWRxt6iogyzBsG3EJZVuZkZwaYXAG7EfdjnNOii2Z0OFVT6Yp
 ZGIj2QcDu4pz3Aikr5RflzTa88aU14yYPLBwFTUt/8FBMmGW1FbOjCnl5465Loo6QrHH
 r+4qoA0ppocY81CWQLg2iUYDawbaxni1N3NJ8hvmPijudyH97kcY7AMcBhI3RpG3KbBI
 eh7Jh8tJpK78iiYR3/LJWeNE1Gl+gZ7N/o+Rl6HYb0XJLgHHStHVLXXkBs7GU7R5Zg26
 z8aA==
X-Gm-Message-State: AFq9FYKWlItM1+b0sNeyz6vXqKUOEI+HThclIdXpcsdi9ByRzff4zGtg
 tZpsm5uWkeLUN2OFgUGEciFBGZCT1TwuuFNaRJmkAmwqhbMzElzugTb77lotDbRJ
X-Gm-Gg: AYBFou3ebl8moykX1cnVvule7yNGew0VGvGyIlrqVAph1Q36uJA5At+qTA+/7IO4A+5
 yxv0C+tQu4IMDCdxBtW3I6JuNz4lzfK7WdTyZVQjagAO0GKZUfqDX/L/sw9AaxgMPXmpp+rUZ3z
 Vkhvj4xWX2UfG4MYvNqMd87Ziht0sFRaHkuPtWgB2wISu8iEdImWh99zgxKoUbeH/s195rZiRxG
 AVyzkqZGyJDda5v6IX+LsXOIAhMg1y9UEYWLBgJzr5HRIfI1UJaZu8epg3EtjayzrksGW0SIGFw
 5YaypPZj6P1AwTpZrtedWax8sUZk7mN0vguHtdgSTD42cB9BaMVTgrpbmlF9AAJt/9bt30YXVER
 mwPRfp8VhNBlk1tajG4tRRPIRDhEWxFUqDKr5AXoUEKkoTPe9MSCB30bkV7ljjZVgMOeKm14FGC
 H2F2GDzTioSreNGrPYUngoiScqPPaX8UzTxv9Q9qfp3ipoWKdvi54TtINkVzX3XWSs2YCdpqGKd
 OiQ5aqkt7EVXf2OTL9kuJmLhDTokpDoqNGchG6GVoAteGIfX2eDNf8PiFs2kahK30YuNTZyeDuv
 fPMO5wjYiGCrDvWHqGq3o2JkqtMCLDT1vanhAoPrj9aU5IQKAqA9W8D+/i0LY6miwwvJjdX1x6Z
 vsbbxLDauasw3Zkrlqh4jQ1LirX3JozRsvJav2ZNqL55Z/FDU0x9vcCdmAPSgYYg5QFvhjxUhtL
 tL5Tn5NWQWVnrHdlssyK95ZKc=
X-Received: by 2002:a05:6830:441e:b0:81f:827a:b1cf with SMTP id
 46e09a7af769-850ff0a53d1mr2513366a34.22.1792871652091; 
 Sat, 24 Oct 2026 12:54:12 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-850fa99bd40sm2983600a34.4.2026.10.24.12.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 12:54:11 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 13:54:06 -0600
Message-ID: <20261024195406.2164767-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261024195406.2164767-1-james.hilliard1@gmail.com>
References: <20261024195406.2164767-1-james.hilliard1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-bidict: use uv setup type
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-bidict/python-bidict.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-bidict/python-bidict.mk b/package/python-bidict/python-bidict.mk
index aa5441564a..0c333904f9 100644
--- a/package/python-bidict/python-bidict.mk
+++ b/package/python-bidict/python-bidict.mk
@@ -7,10 +7,9 @@
 PYTHON_BIDICT_VERSION = 0.24.1
 PYTHON_BIDICT_SOURCE = bidict-$(PYTHON_BIDICT_VERSION).tar.gz
 PYTHON_BIDICT_SITE = https://files.pythonhosted.org/packages/a8/f2/8d2dd8276ca05e1f5157b6a0d34efb2f585f47a0fbed61e8aad04b221f0b
-PYTHON_BIDICT_SETUP_TYPE = pep517
+PYTHON_BIDICT_SETUP_TYPE = uv
 PYTHON_BIDICT_LICENSE = MPL-2.0
 PYTHON_BIDICT_LICENSE_FILES = LICENSE
-PYTHON_BIDICT_DEPENDENCIES = host-python-uv-build
 PYTHON_BIDICT_BUILD_OPTS = --skip-dependency-check
 
 $(eval $(python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
