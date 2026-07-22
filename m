Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30164C4453A
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 20:52:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DC2760890;
	Wed, 22 Jul 2026 20:52:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nioGvWd59tfE; Wed, 22 Jul 2026 20:52:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0ED3560843
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784753525;
	bh=62PE+WKYNLgmR4e+L6jpA1+SdKbsmivC1O7VXvrFd5U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=SGgWmi5HJHGEjxW1KlKRkS0kOQYUQZL6gwN8opdGXiyzDbkjNx7m3GuDHdIQUL/1a
	 yOJQxkU6ZJtgl15W4oTkJoa3sJBX7IzIcXWU8LBuahGolhL+RgjWY9HCCLBnKWLNAv
	 Qu8C6F+Z2Ws+WQv2HmcntwEyJxpFKBlxwwOeOepRA+kYrag5xkmv6kJqpR/w7Bw4Bb
	 Vl8i1FkWtP8bLCO//gVPQn0slmjErM00nE7DueO9+lhibYBYcetrThJT6F9VOiLM4r
	 YDQbKTldOVlG+pEpJIDUvtOQ6tq4jLBykzUulN9bXY709yffbPhUyUzhwzUvuPsJel
	 gSmLquWntJngQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0ED3560843;
	Wed, 22 Jul 2026 20:52:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 310F7224
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 167D740289
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:52:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id s9scjkn29cug for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 20:52:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 80964400A6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 80964400A6
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 80964400A6
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:52:01 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4QsO-1wxGJ611ew-00wGnD; Wed, 22
 Jul 2026 22:51:58 +0200
To: buildroot@buildroot.org
Date: Wed, 22 Jul 2026 22:51:41 +0200
Message-ID: <20260722205142.674788-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:5vvQGDJLzQU6MlHUHBg7eT3/jvOOHAHEq9FiIGdcyv6WwG4jets
 kV7fkw0JqCaCpQPYyX3ViBX15bHnXAyb03bWUmGMoxeiM0hnQIHPECyKYWD5Q4tMmccKxDJ
 3heMDyi3ocjGnOITT1BgyCgtI+G9hHOYRdsEdH3aYfvWb9wWFGGZQWueFaFxTyuqqW0v+Ag
 xUmRFeqO8Nq4gDRetrSdQ==
UI-OutboundReport: notjunk:1;M01:P0:9iqgyfb2it0=;80cNAXMytwIHRalqCKpwuR0PEA2
 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
 csoQUHVXJLCuK+Y/WeMs3
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1784753518; x=1785358318; i=fiona.klute@gmx.de;
 bh=09lQbJIcrdQcBouLM4KAe5k9tLa49d8JcFMzChtwkXY=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=NHsCHhmhUY7VzWsheQJsMVWOl0WR0wANeuaVPVxm8XNu60vpAUchPehU4na+DOsO
 Pt55EvVo834zBAqz4qpifm6KJIEyhHvkBEGJVKMg4Yf1SqHx40HH0w0bCr+s/Fdk0
 g6Mtm5UAwpHO0RC5oGR18RXgsVZXwGXlu5mJfhXMc6DIKLlvEMRYl5w9jNiPuD8aj
 199NQZ3Nq7lqdSZn+ncrj7TI8z3KOwlEpTkRO/U6vhxG2Mv3t0cQ1Tk0G/3oRz1sg
 dKZsrPRKypXLoMNdAAQgjXNZT6IyO6pJxa72G/1MIbQeUR76yWTYYtj1nqALZUX2A
 aREw/2bG3qXobqmnbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=NHsCHhmh
Subject: [Buildroot] [PATCH 1/2] package/ugetty: use correct SPDX license
 identifier
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BSD-0-Clause is not a recognized SPDX license identifier. 0BSD is used
in the LICENSE file, and LICENSE.0BSD matches the 0BSD license text
[1].

[1] https://spdx.org/licenses/0BSD.html

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/ugetty/ugetty.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ugetty/ugetty.mk b/package/ugetty/ugetty.mk
index d3424bee42..6214498094 100644
--- a/package/ugetty/ugetty.mk
+++ b/package/ugetty/ugetty.mk
@@ -6,7 +6,7 @@
 
 UGETTY_VERSION = f1b7858778800b7256e9874f266c1d16ced22a6e
 UGETTY_SITE = $(call github,ryancdotorg,ugetty,$(UGETTY_VERSION))
-UGETTY_LICENSE = BSD-0-Clause or MIT or CC0-1.0
+UGETTY_LICENSE = 0BSD or MIT or CC0-1.0
 UGETTY_LICENSE_FILES = LICENSE LICENSE.0BSD LICENSE.CC0 LICENSE.MIT-0
 
 define UGETTY_BUILD_CMDS
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
