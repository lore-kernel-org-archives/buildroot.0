Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBA50606A31E
	for <buildroot@archiver.kernel.org>; Tue, 24 Nov 2026 08:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=ngsOyLmt;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gCy5da+r
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C39A406D4;
	Tue, 24 Nov 2026 08:59:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XOgVAyNIhZ_A; Tue, 24 Nov 2026 08:59:34 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 54C42403FC
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795510774;
	b=BsM0xdOOUMm85HZ3eNLx6/2OqIhtbO3jn65oh1X7rv1PuK7aPRGZyyy9gi2fymaSJoZa
	 Kh9LdFEikUsLdH5zXvvgfeyD9YBt5Uxs0ujPCd5sJbjxiT+5ZKtYMxkTahE1heUG/QjSp
	 Z99Z25wkHZadG+CnTjhfqQLPDW+D19eZsg4uXra4pnADNBJ5HiLQFr+Rg4Ttpto0F8xYC
	 XMt0x4dDEIuW6KToY6JmqKfLVOjmxKj3KhLufm3xrs9x+7db0x2PpbL8qMQOwTnSyo9AT
	 ICTbrZcv7STT2navutXJClawHMJlPnD1VWr0F9yhzLWYcL50vmYsuxlOcj8WnARGeeA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795510774;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=p5OzwgZ5DKjNN4O4iAhu+KIv4XijQPUSfuNqA2wrJIw=;
	b=riP7w8o+C2wAa7va9VqnFf97K7YQ/Dhly8lStlfBpx6x3Gi6Q4B21vB2VB8Hxk8ZdSJ9
	 DLYi2zcSY4GUI0S6oM5uzZ9rNPMlx3/Kni0SAWOo1rX4bgeAVgGvnWsM/eaWYeqYVBVKK
	 2HN3m//PENJ6x+TzbWZHvBHJyBVK0JaxyMsHaO/DGL2AiRgx8zaZrkjfH1N+pKTpZfAFa
	 Wv2nPXfC2/Zb8KwsRbZIwGmT+gBP9u2Bem2D+6W+a6Vj1olSQObfB1WvWbuQqMGEN/9qg
	 IAM7zvYeanBw73JtAs7jdeAPArdtBu7eyllStqA4rKzxRHTpmbZP51ubxkMrvLUJ9uw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795510774;
	bh=p5OzwgZ5DKjNN4O4iAhu+KIv4XijQPUSfuNqA2wrJIw=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=ngsOyLmtRja7RFYAsAIozBWInPRisyuxfl4hMAE+YdIin2dU+pFBwOTZ/wOsJjLUL
	 eF/zKsloCKtv46kOSsxO7qNP6OsFZEk26Hhte8GIUbPwBK3PpAPiIyOFiPFTZ7lxAz
	 QidQUpykJEMjJxsecFBKBRNpIXLtq6CxuC5H9dDNFz3gN96iAXlQExcGSgJAv/KznP
	 /pGq86rkrJ3gKQYuLVf4+NTE+0u4dKwFrA6tJRZ4cf0CAA88vwpGAzBuPtDgzVMD1h
	 yzM7V0Ww3JzMpfOSrF5kSiLlfv4p53Z4AuyGEJbWZsXGuDV/Mxpkl3XSmvTiqz3gly
	 vY+1CcHV307bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54C42403FC;
	Tue, 24 Nov 2026 08:59:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4360E3C4
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 08:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 29283605F7
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 08:59:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 102mL9BgaAVe for <buildroot@buildroot.org>;
 Tue, 24 Nov 2026 08:59:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2F512605C9
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::433"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=angelo.compagnucci@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20260707 header.b=gCy5da+r
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F512605C9
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 08:59:29 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-4a2f4ca0dcfso2423080f8f.1
 for <buildroot@buildroot.org>; Tue, 24 Nov 2026 00:59:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795510768; x=1796115568; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=rsgnLL+2+q7Vi6tOR8vj29sL2tIKCDTXu+pbw/JDO3k=;
 b=gCy5da+rNOKwVqayxR1UzRr4qF8FGhg2LjXcwztwWOQVlJYaaZ7ZNpHbAPrjD+rmoU
 ttfljV/K9+BWTB7Qeia/3UUkjYgTSEhYF3B22U8iVbbofjWNKPLtLBeczHx3+/inRSPz
 mOGfxJXaQbTu4YH77WNom8RUR5Ql9SKb71FMCxvnlv/kh97XqiXKrkYPschrqzBU3BFV
 5u+3Mxh2BcCEjJAwcPfNn1vlOuJt1jMh+so8pjypwujp0bGLJmdlNbADp3783xAVWzD/
 B/JS6Jwl8YijZwx4Pmqdf6cI2UobhLnbq7vS1rctwQl+CSqCxDyV4g/yqLG5PmoJefEG
 z3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795510768; x=1796115568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=rsgnLL+2+q7Vi6tOR8vj29sL2tIKCDTXu+pbw/JDO3k=;
 b=m0zZeAk0lPvVDcB8Rr+OTIPo57wcqJhUKXCdKWUqxERVfiTavp0OlogpRe3SwJrGsH
 HM0j3rB/YOYRgXavyGkwLo8EmTuZlrLJILrsECCO15QogiAhM+sb36dyJaTqLHc3NTw9
 HU3zVNcHMe+Y9ZDL9oogwDdmZnq8ctu5J7QuLwE+0RO3iGbu30b/yvZXBKOd3xHOIpns
 C2FKy0MHCqzBrvxGMp38EibOhOs7rmWcjC5gOD2E1CYrz57QFUqR9OJP5v/GjGx1bQYo
 0HB03xZV+X0r4MFs6PJzWSNOahJiAlWHw8hVkzBjOu9A/tlhi80nUexDF2ABg4Vteru4
 feMg==
X-Gm-Message-State: APuU4Z+0mCNJIxr72A9HmdUbs2+obRGHHBdrdKHQY7CZxws0/mx66K/p
 pqI9rNjq/PNiy1tWMJAy1DEbpSIzSia3wmdAjnncG7hykjYCodTBJLIurCppIyKg
X-Gm-Gg: AZFdTZdIF2mpHF8qh/nl1gcM6Z6Cuh63wwjt9vZ11bBqfA6WoOfwqdZxfIfyH0hzW2I
 JjwzxJayyEredbjiBju0XyFB/9p/CNcskdthn0/XIfY1G9b6HvMyhbrPAmW8E26Wa9yGQYcGv+4
 9mvtGrGJBTNqETBtIUe2Nlp8OUkrk/04RxSasq8YTd8wdwhuFRSWTjjuKA6+f8vDQECXV8GUtMq
 l7wdBWA+fO0/gbx7iM+3TZciUmmVnY/TVDQsXg8XRk2aw+eJ4l6krmU6VvEBgyfqLG2TD65yWlM
 vgTTx/VI5fQ+lKdIk8aitOejw+8uuAERKujssWCAjc7NzPaqN+HtnrbXD5AMmstW5q73t3HD1d6
 9gJhi66+eEFhgG+gL6QJ4kuPde9ZlA3YfyNHO6TGsZTtWB4s4XbhmjRgDC8f1YNucGh4dRpftvT
 vrh7Jt40qNIBA1Y19dJH8BaFJCz3BBHA6uDyxB3sH8iseYqdqE5nZmBrMSbmzjJ871pVZBH0Sa6
 PPOHf88bQhGWEi9C/pTj+cueuPrebBC3GyHheTkEC4Udkm5TmDjnWeud9nMC4k7dyeBdCZnu1cW
 xi5fF8sQKEFKGbdslndyTWLoT/t3Q6j/UY7Bc0r+ArJTQELlf+g=
X-Received: by 2002:a05:600d:600b:b0:4a2:cbe:bec2 with SMTP id
 5b1f17b1804b1-4bb8882375cmr290081475e9.32.1795510767686; 
 Tue, 24 Nov 2026 00:59:27 -0800 (PST)
Received: from angelo-Precision-7550 ([2.58.136.216])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4bb884865b1sm413668555e9.5.2026.11.24.00.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Nov 2026 00:59:27 -0800 (PST)
From: Angelo Compagnucci <angelo.compagnucci@gmail.com>
To: buildroot@buildroot.org
Cc: Vincent Fazio <vfazio@gmail.com>, Vincent Fazio <vfazio@xes-inc.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Neal Frager <neal.frager@amd.com>,
 Ibai Erkiaga <ibai.erkiaga-elorza@amd.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>
Date: Tue, 24 Nov 2026 09:59:24 +0100
Message-ID: <20261124085924.2250690-2-angelo.compagnucci@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261124085924.2250690-1-angelo.compagnucci@gmail.com>
References: <CAOrEah6tmVYxKe4C0N0GV2YvaOt22uPaRCFB1scc01ezwtBetw@mail.gmail.com>
 <20261124085924.2250690-1-angelo.compagnucci@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 2/2] package/elfutils: drop the microblaze
 workaround
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
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

8ef2bb4437 ("package/elfutils: fix build on microblaze") disabled
symbol versioning on MicroBlaze, because GCC didn't support the symver
attribute there:

  dwelf_elf_begin.c:62:1: error: symver is only supported on ELF platforms

Commit "package/gcc: add symver attribute support to MicroBlaze" adds
symver support to the MicroBlaze GCC. Drop the workaround. The Bootlin
toolchains get the fix when they are rebuilt with it.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
---
Changes v1 -> v2:
  - new patch: drop the workaround the GCC fix makes useless

 package/elfutils/elfutils.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/elfutils/elfutils.mk b/package/elfutils/elfutils.mk
index 65ac15e64a..0c038a7f2f 100644
--- a/package/elfutils/elfutils.mk
+++ b/package/elfutils/elfutils.mk
@@ -45,10 +45,6 @@ ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
 ELFUTILS_CONF_OPTS += --disable-symbol-versioning
 endif
 
-ifeq ($(BR2_microblaze),y)
-ELFUTILS_CONF_OPTS += --disable-symbol-versioning
-endif
-
 ifeq ($(BR2_PACKAGE_ELFUTILS_LIBDEBUGINFOD),y)
 ELFUTILS_CONF_OPTS += --enable-libdebuginfod
 ELFUTILS_DEPENDENCIES += json-c libcurl
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
