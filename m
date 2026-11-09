Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89ED606A322
	for <buildroot@archiver.kernel.org>; Mon,  9 Nov 2026 12:33:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=VVf44NRE
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 82C2A80D13;
	Mon,  9 Nov 2026 12:33:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hkNmbQXSbwAW; Mon,  9 Nov 2026 12:33:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9612580D16
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794227607;
	b=QBZjhqveeX3/2gf34Il++wRhPdA+TIjdxSJVaWCEUCO3PLeNCUS01r+11asqq6MjWeC+
	 20jGZYjJhpLQJOi0cN1T0hpRxAw53XiA5AB4G8pWFVBMd+OLQHxxXEg2VDoPI/1y5EqH/
	 A1ykY8Xdi5VdGNRVXNX5TjY4nEYfCUfqYRXzAXZydHnFdKOfUFaKq3rKI58GuEmCCKpF9
	 HSw4bGw8ADudA0Jm1/p/kCEqe/1HePHUUgauxUVe5/FrTbIPRJPxyaEgqt+0BdC//78fT
	 xQX1/ZeAZyxyjpegg5g//XMpUKCE4fcacmwWCH2piB7fc2DXBiNl2NOD8DStPOoNEtg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794227607;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:To:
	 Date:Message-ID:X-Mailer:MIME-Version:X-Last-TLS-Session-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:From:
	 Reply-To:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=O3yqiDbwZYOKNCsrC850VhH0G3MpW/qiQTsbEYz+d20=;
	b=fxm14/aJR1WPkFduJWcI0vDbFd+PKRbxVMXJ8B2EdJmF9S7YCfebHwDtx7ZkfPSw5vZT
	 lyMB5loJkfnU8Q9WBWSkTM+i9f+J8Nq2Dl43/SdtUaCpvLpDcoO7rUNvqZpOMYQ7Kc8UD
	 Y8yq00aFaonuhxFnaSwXtavPn0aEWTQJHWqRTWNE3LkJsTgFiXvI0e6T8JQk7pGEmirms
	 uSH1IO8lMWzlSwsVLPsa35SfehEZ3rCyQOCkz3d8jWLSfgs5vMsxmNfJMeNKkXHgcrQ16
	 CNZ7OmUYC96/wIlyxRssNVDzp1YGHaWfT/C7swenenxLTiXwk7GjhcGB248C+pOyUBA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794227607;
	bh=O3yqiDbwZYOKNCsrC850VhH0G3MpW/qiQTsbEYz+d20=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=VVf44NREdCGLYCRQPcY3Nm03iR2LyFKBr6oE0db/LuSlKWmXPoVMdRDpdBEuszLHa
	 X1eZaUncUosdv7p3r7kHT+3bcMfqoDQIGp+h8J2kb+P5f+rpWeJbE+8Ghplr78ypWg
	 IhH/hRFhGcTyU8hDDp5/As9vbpy3bNigS1oItjf467flH6YjdLdwN3OiINNMDKqe6l
	 /Iifvb/FWMVgnyRAzu+TOxz+7kNW/1mqr/XrvQnwubSdPiHQZ6VLf7lsErxw/hA0u0
	 cm7B8RXZncZ+KtLtgO8FtXdUhLGquPe2jtBjUJFg68fuTA6V4hf1txPNaZQaKEeuJq
	 M3InG6ZkVyw6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9612580D16;
	Mon,  9 Nov 2026 12:33:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 79BB92AC
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 12:33:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6A8D1406B0
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 12:33:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDs0N_F7_Tl7 for <buildroot@buildroot.org>;
 Mon,  9 Nov 2026 12:33:25 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A19144064C
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=195.201.24.99;
 helo=mail.heine.tech; envelope-from=buildroot@heine.tech; receiver=<UNKNOWN> 
Received: from mail.heine.tech (mail.heine.tech [195.201.24.99])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A19144064C
 for <buildroot@buildroot.org>; Mon,  9 Nov 2026 12:33:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 6E5CF1814BE; Mon, 09 Nov 2026 13:33:19 +0100 (CET)
To: buildroot@buildroot.org
Date: Mon,  9 Nov 2026 13:32:28 +0100
Message-ID: <20261109123245.2226001-2-buildroot@heine.tech>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH] package/fmt: bump to version 12.2.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Michael Nosthoff via buildroot <buildroot@buildroot.org>
Reply-To: Michael Nosthoff <buildroot@heine.tech>
Cc: Semyon Kolganov <semenak94@mail.ru>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

minor bugfix release.

changelog:
https://github.com/fmtlib/fmt/releases/tag/12.2.1

Signed-off-by: Michael Nosthoff <buildroot@heine.tech>
---
 package/fmt/fmt.hash | 2 +-
 package/fmt/fmt.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fmt/fmt.hash b/package/fmt/fmt.hash
index 094a755aac..755ee63679 100644
--- a/package/fmt/fmt.hash
+++ b/package/fmt/fmt.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  a2f4a8d51178f954e4c339007f77edd76ba0cb2e36f87a48e5a5403d9be5878f  fmt-12.2.0.zip
+sha256  870a49acec5bcdab236aeea834ebd7f0b8548a7d8cea33c996b6873a37f2d50c  fmt-12.2.1.zip
 sha256  a65fcc5a1095fc33cc37e4fff69366e49d7e92f613558a2b95ed1b70e33758b4  LICENSE
diff --git a/package/fmt/fmt.mk b/package/fmt/fmt.mk
index b1d25e077b..4b1a73ba5e 100644
--- a/package/fmt/fmt.mk
+++ b/package/fmt/fmt.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FMT_VERSION = 12.2.0
+FMT_VERSION = 12.2.1
 FMT_SITE = https://github.com/fmtlib/fmt/releases/download/$(FMT_VERSION)
 FMT_SOURCE = fmt-$(FMT_VERSION).zip
 FMT_LICENSE = MIT with exception
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
