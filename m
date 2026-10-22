Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B46D606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Du9COrGn
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7BBDD813B7;
	Fri, 23 Oct 2026 12:32:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wYD-skcvfA7f; Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4C8F281469
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758727;
	b=YZaHtsb1Y47VJwquO2q8L7inBO4rq48sIEQzIzZcFebXppnUIUwGHI4HjS7prtt64BWG
	 24kKUvuRJxsIwQvYc6OzyMQtC+nsmKAM8SjdJlJl61or6FPuv/hpjlI8lfccavPb/VEon
	 liMqMrLw27zuM1FVi/JNzdhBkGKaJVo9Ge+y+lQE5g5bxgxlHFRuNDNc9jA0afmcK+1T7
	 jcK8WwA4+VYPNWW0tuOoHgWB5VYmouu5Xmek3a3jQbnLYz+BVzu3pv8DiWVCQMWl47A5V
	 LY2KyoVfLg8rKWZdSA2k1DNrgfS2l0PypOoX5oZAjfOt03NWTJvTw3cojX0i3qdKkBg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758727;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=UMhNe6nNSgjYmIyxI5n9wKX7mFnMtLTVlLG3lwx0k88=;
	b=optCIGhrMYm8ETyh/8+oEnnCLTRenFgvpJ4UwAdmeiFlXkuBt7OMOuKT2T0Mwd0z0lHm
	 +/Tibnmjn0Y45L6ECXZJm4jBOWYqakdwANYtTUeFFOEczpoAyFIi7HsP5AKVWtaxC8JRe
	 ql8/mcmK6yZaOkkpHNa74cHAj61eshyRFShVyisYf6//+fwtvlCQMlvstIjHI24CmnX+n
	 gvJk0D2cIJzEDdY1GdVDV6kQJAkOJxKF77Dht8jQTzIviM2i0ewJp8xUkyN1FUPzqspzD
	 VNfHgRB0DCAdEl/4wJ0Z0MH4YHHOi+m8Uml6DIkY3eWwg9MaT8q/eHEOaMCQBqx+8/w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758727;
	bh=UMhNe6nNSgjYmIyxI5n9wKX7mFnMtLTVlLG3lwx0k88=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Du9COrGnYdi2X/YW8ZjowU9ApiFF6ndq+U8gT0HSJnbLOhDKO36AGdjlgl12GJ6o4
	 KripL6NmPYD8RdmuCbfEJXpEHup6gnoMF7lClapfrYnrQEnap+zhrJ7XkAnXUtSib9
	 hdmZqy/rNVtIDnghl+RljFUiC5uL9z++blY8Yw3ZLYWJmnsks0dU3c5yTqCec7lMhJ
	 mh+deE0jZ2a2ubJBRac4uvYap0yhTXJTckp+YEjntrG0Thzm6cwmY9n+b00k+s7leZ
	 85nsdIhEBN8fW5MD+fIGKlql9bpcdYH8c9Ae/OlYw8T70f0INSL9F6CcCACjYpvvpa
	 ucSeO74VlpNjg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C8F281469;
	Fri, 23 Oct 2026 12:32:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08D3C12C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE92E40933
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mfem9ts15ohT for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5714340934
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758724;
 b=F2KY0HPHVrmpo4z5QLQuPqq2LGfpNNgmM1eXqBZOSrsmz7hb+0czqKI0S22t1d0FkrjH
 H0UKe5BpR23KaGV2We2mJNjxBs9MnCAuSdkS6vwINmECIvoUbhmfC9E/Uj8hsXAG1p28O
 hlH2k5pMNXrDfzsjb923ZR1B6Hpjdl69RbZ4IDasQcgaYZRYz1AqD9l0Y2EP6pvYpl7Il
 A3bYTWUUJgxeBZ5AsIiVhTxgiug+jnaoXvzs8iEApOLPMkMtkNUsHhkW17yZJ2iJd6hzA
 L8WLAc8B7HwOaF5Vh4/l4VquB1FurDj+/+PRAARF8hCsTvL2ZRJWTVCJgTm23R/kivw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758724;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=K+h3HrRaRz2dorUmV0myBGAys5rc4h7UonOfDLTZ0gw=;
 b=GCqSmE06Llo3qTC+1G5brOXkMnkASDODtqHiAl+885XIazJK5Prz/A0iMABQP821Pr9U
 395sRxmpHdBsBeOpBgPLR6UXvtBhukhTGlyIh68ary3GSfKZc2VH+yUzb+K8cASG/hmny
 WwNyf9z4t4MLyN6OBdiiHmsVFQD5rtP+AeV1mRZiDetTzSYZnwWF2QZRR3caLa+/gxBVi
 bVxL+atQAc26SgUOwge8/S5s+helgVylQJGTHBLj3HV1CTevXjKBa68db0YV5pWYQFXba
 3KQqs++JAGFm5zpYIJm4FgpYbLlByrpi09tlrJW8xAsGuZ8sCObPXuzN0hTRsNas+jA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5714340934
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2AF49C669; Fri, 23 Oct 2026 12:30:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:50:23 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 054a087d8a77fa1677d4b95811a8f1d44d834f4a
X-Git-Newrev: 7e1b227cb6f82a216d6e05f2944c6c6b7d1d062b
X-Patchwork-Hint: ignore
Message-Id: <20261023123039.D2AF49C669@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/iwd: do not
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
Content-Type: multipart/mixed; boundary="===============0639308186847989999=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============0639308186847989999==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7e1b227cb6f82a216d6e05f2944c6c6b7d1d062b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
index 8f662ce5e5..bb6bbcd868 100644
--- a/package/iwd/iwd.mk
+++ b/package/iwd/iwd.mk
@@ -77,7 +77,6 @@ define IWD_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_DES)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_ECB)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_HMAC)
-	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MD4)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_MD5)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA1)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_CRYPTO_SHA256)

--===============0639308186847989999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0639308186847989999==--
