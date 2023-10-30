Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0333CC4332F
	for <buildroot@archiver.kernel.org>; Mon, 30 Oct 2023 13:11:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9549A80E35;
	Mon, 30 Oct 2023 13:11:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9549A80E35
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Lh-iKmECdd3k; Mon, 30 Oct 2023 13:11:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1A0F80C3F;
	Mon, 30 Oct 2023 13:11:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D1A0F80C3F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5C50F1BF2A9
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 13:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 431BC80C3E
 for <buildroot@lists.busybox.net>; Mon, 30 Oct 2023 13:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 431BC80C3E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OXdxMyCdECAH for <buildroot@lists.busybox.net>;
 Mon, 30 Oct 2023 13:10:58 +0000 (UTC)
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3FF3880C27
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 13:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3FF3880C27
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-32da9ef390fso2812820f8f.2
 for <buildroot@buildroot.org>; Mon, 30 Oct 2023 06:10:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698671456; x=1699276256;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LU8oLtqZWpvZm9MziszWzO3Qtz/6eldZwf19MAYXTAg=;
 b=UJxv4+LdVDG7x4w3APJrsKiDl7wuXp/HmH2lUCOcPnA3wKjdaOjtahco3QZd0GHUg7
 fBzbz6fDjjqanbcCCpm33LkHpkXMwLuy5xGF2WziIGyjeLT5hK1oFmV+SQxFSxD7d7Vb
 1pt1HenJA6pQ7EpASexScxzVyFKxMwHJC3S7hNx0rjs7jTm/aKRVp1H/eJF2zFr1FisO
 iN3+Kt5/RMIaTtVMv2eUEq/8A+IvS1WJ5E2WY5xOTyr6WrqPOk6Dd66uSEZ4GFI+mW2f
 jynC8AirKbU2uLMHb22wdQFJHQZWJOQTQ7AjK3Ta333JJgkG7tOlldchn4QS+9Cat9PM
 9F7A==
X-Gm-Message-State: AOJu0YyoPX3qBpJd5jDTbH6To3Zh5r80+zVvXBGjHGeg55Q6fqfE2MV+
 d3ORWDeiSMCbyhU773J52Iu+eTtYg0A=
X-Google-Smtp-Source: AGHT+IFaF+bNuSCFX7u2KIsvTKqxnjMvYWKC7RCbU4BeWkWN9hlCeY3Go7+K58JVDgh9chpU4Tsmog==
X-Received: by 2002:a5d:4c45:0:b0:32d:a2d6:4058 with SMTP id
 n5-20020a5d4c45000000b0032da2d64058mr7000360wrt.62.1698671455118; 
 Mon, 30 Oct 2023 06:10:55 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 m3-20020adffe43000000b003196b1bb528sm8201864wrs.64.2023.10.30.06.10.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Oct 2023 06:10:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 30 Oct 2023 14:10:52 +0100
Message-ID: <20231030131052.661107-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698671456; x=1699276256; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LU8oLtqZWpvZm9MziszWzO3Qtz/6eldZwf19MAYXTAg=;
 b=Fdzso/TcNVXOvUtNws+2VpiTFBReE65mhkVm5S5TV1rnPFqL+m2RFn5V2zNy4UZrUq
 8LqhqLLTErjfDLpaBdfKYBFb16gV2jYa8mz6A6jk3gbDKCw42fbfiwml+AlEBtXMAuCb
 oVsfCVYMAP2YXEx4raAmiwwEQR/X91K8fFfx26WOpv5Y2Ov3z6r3VeXWOAdPKa3AtTij
 h1EC77ceMl52J9QUMcHSoeWyZQagW788+YqD3lInqZOgF6jZIal1wIe0aQ4gwTvuWPwz
 K3EwrrFcd77L4Ho9xoktBWVtrPWXGOSTt7Qb8tQjdvSKmPYBTSTu0qLja0/X0QmxyA7G
 Ld4g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Fdzso/Tc
Subject: [Buildroot] [PATCH 1/1] package/flashrom: disable -Werror
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Disable -Werror to avoid the following build failure raised since bump
to version 1.3.0 in commit 073b0fc9c1fe9945eccf4b792b948633aae9a9b8:

chipset_enable.c:27: error: "_LARGEFILE64_SOURCE" redefined [-Werror]
   27 | #define _LARGEFILE64_SOURCE
      |
<command-line>: note: this is the location of the previous definition

Fixes:
 - http://autobuild.buildroot.org/results/b8d8c30d1306c2ba8f59b48f457a7ef930306b8c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/flashrom/flashrom.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/flashrom/flashrom.mk b/package/flashrom/flashrom.mk
index ca55592dba..1ccef572da 100644
--- a/package/flashrom/flashrom.mk
+++ b/package/flashrom/flashrom.mk
@@ -9,6 +9,7 @@ FLASHROM_SOURCE = flashrom-v$(FLASHROM_VERSION).tar.bz2
 FLASHROM_SITE = https://download.flashrom.org/releases
 FLASHROM_LICENSE = GPL-2.0+
 FLASHROM_LICENSE_FILES = COPYING
+FLASHROM_MAKE_OPTS = WARNERROR=no
 
 ifeq ($(BR2_PACKAGE_LIBFTDI),y)
 FLASHROM_DEPENDENCIES += host-pkgconf libftdi
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
