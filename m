Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D7F606A32A
	for <buildroot@archiver.kernel.org>; Sun,  8 Nov 2026 21:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=Cg0bybty
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E73D605FD;
	Sun,  8 Nov 2026 21:37:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UsgWoc5rqVrQ; Sun,  8 Nov 2026 21:37:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 9572B6061F
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794173821;
	b=tFZpcV+gEybaAGTYxL6velmDGu+Cd8ScCo3fTx5gaTy/E7865UuwvkqCzSc1h0/EOr1m
	 KotoPujnt4egVqPpxKGXBmuFoUdwpg6HzEA1Pg+LlBMppNSGXMHBINEEsGHhlMQ+w1Js5
	 eD6/0cWlG7ZYs4hZZ+mNS4ufv66KIQYEgVAv3sZRCSqV79PAsRDbOnp7+3Dr9LwoMJVwh
	 ItznLrl9r5/4dvzkQxupZ8ALGmXeU52IoL7v96bgQ1fLxHQN7/P3XocYe89OCOoMpFJ/h
	 49aduCxfgipVMm9rLz5Algl3b5zhLYKj4iyPbWBsoRIQSjgwgMiX03ZzLhY0B91EVkQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794173821;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=n5+4WQyzIS5Bsl+a4T1GjosQLjmkbB6QUQpeYTVGGVw=;
	b=IZqCWA2+wyOanP+7rHBsPadg1H8gU4DHMBcA5tsV5sU5CCkMpbaGMMQxaCD2d5/5nm4W
	 1zwq7W52HgsusNJNjZ+1PeIUmOX/S30QPdtOW4IeN4LEDWZHA3gJcR93MhH7LZsbHXRyb
	 o7XPXoyJyMcGvljjpLxtdoAk15GYgucmNGIFLN//g2l2XIMONywsEFCwA2OvS0z0q/aro
	 wzKqJ2zNnmKUcmuSx+e3WMxSFMQvMaJoODUvcxvCQXzYdARVzIuCV3iZB+ZOBT2BQGEPf
	 K4hYcd9XCT0p9vjQMTF2VB/4HOniwMXpaIk9wxMuPlk6VLAtFOUJ2cQ/FAG7WqyIyWQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794173821;
	bh=n5+4WQyzIS5Bsl+a4T1GjosQLjmkbB6QUQpeYTVGGVw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=Cg0bybty367S7QF5ORGI7H0b3AU71PtUAy+GdPO7R++pVaoJA5GMppKOIb10d7EZd
	 klcs8fbc3o6odI0pHd3RldVzfFNawNODIdUZPSDxoQLwOB8SlBfShO27nDtxf8Fvkx
	 X1LvKsLf4N5mSOT0Q/pjnCqOO4mzvTU/N42x3pbEe0CNvTPHVcjAIhpY6QyEnmXJeU
	 N4pqzqDpulZlY+Elzfr2nOcOWcEeFXt2Y1zDlSSqx8w7ocBi0Q0TY44zUJY54MX683
	 dG4fauWJ+7PE2JGc+vUmXYtYNEEYq75HMV9ZOMc1QJ0UjB5nC+GV0/qrqmzq6sDJtC
	 UQ5En0Yisdsqw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9572B6061F;
	Sun,  8 Nov 2026 21:37:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FE19317
 for <buildroot@buildroot.org>; Sun,  8 Nov 2026 21:36:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 81CA4401C8
 for <buildroot@buildroot.org>; Sun,  8 Nov 2026 21:36:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YBPUwoczN4E3 for <buildroot@buildroot.org>;
 Sun,  8 Nov 2026 21:36:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4E7C140111
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62a; helo=mail-ej1-x62a.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4E7C140111
 for <buildroot@buildroot.org>; Sun,  8 Nov 2026 21:36:57 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-c4cdc606b47so42015566b.0
 for <buildroot@buildroot.org>; Sun, 08 Nov 2026 13:36:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794173816; x=1794778616;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=GLeUgArGiVD8lEnl5r4jRUnHBFvs8d4lNOni6lTOFwg=;
 b=gJwlHtzWw4Yb6ofdOMMPVFSgZN5NJIOt1dJpoBPdF5iy2OeO8Ajwxbvm//jo7alPEU
 1QR40E6ZuNvNSQbN5vfv5JYc8qChmEYG1DtccBkzxXRXn24RdPin855BnphEE7MBoMrv
 8o9qf6FnR7ZU5+lNi20Pi7aIa7VwKTzYw49tkDCJ0NTq5th9GfnKjpDuw/g8Ofw9DRnD
 Wx6qLtDNdIRPn4VVf0m26ZgegBQmRNDUYpuu1Fdjrcgpc5qHMS8ma1WWKKAZPk1VpGbT
 hx4H7ddz0h6IWsGAb3U7xqcBoeTFMyUpIkH9s6fbpI+zPUfkrP1AkELG2rLRctKinaTs
 GSwQ==
X-Gm-Message-State: APuU4Z8sh8c/Yx5jaZCfHs5xETdrdtYdXpHaRzv23mqyEHXF9Mo+EQ0A
 XD7s2k6SazG5kfRFpP+QMhf2sEYtIU2WxX+VQoSGTG7kmWp/TwpuTAESeLQCtg==
X-Gm-Gg: AYBFou1Ziqnkz1FdXnE+k/gbHUEcqTB+cAI+p51g/7/lrK9KoF5w/JYyiyEJiSPKfpE
 apS/1pulc1ayZxTnMSFBubcv5jC7IU4kY35b+rLWhAXzDABdhY9EJ0jFgcLc0JyIMqOFmg/T8jR
 OhWB71avlF7L8jrraDaS2eqYbrp9BaTNburTTYpJYjGVCv5ctcf7Eti3C/SXcXG/S3Si/kK0zB7
 4Og+XWqPA++wHHC7r1oeVRZ2C7pPaPvjgLsaO9hs2TlecPb0IC4VIDboJMLBTiEhB842yaaZtMh
 QgU9nSvmRruhfDrovbX+nQNfJUmcBD2bkZqJfmc5VueemEvVGldz2dC138XoukDyUCssN7bDoOZ
 1E71GoMnpOcfMXIuEOeSQW+aPBw/Hgvt46TcmED3d6OKJ6uxXUO1dABAIt/bw85XZifh8zrR/yZ
 vlkeeShaIq7kdHOvPec+HEyHK9LSoQ3RugHtBYf8bcjiYlOlYRJzDpYHAvt64Ll+LMIZZaMCvWE
 Cry39m0x2N6H454EX9sMXSFwCLsDq3JJSbBpXh3bTL0Qa8OmmeFErAezVETszfgJvcjShkhceGe
 RKORLodQXnSulrCx/ng275ENs4gyBBIhHoSBg+mK8ZVv3kmyM4sbih1/d8UET+fx9SJvPCUyVBq
 ERaHoqm9d
X-Received: by 2002:a17:906:c104:b0:c29:f5d8:9c73 with SMTP id
 a640c23a62f3a-c4d6daf7efcmr173114566b.34.1794173815659; 
 Sun, 08 Nov 2026 13:36:55 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c4d6a999ee9sm87188866b.76.2026.11.08.13.36.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Nov 2026 13:36:55 -0800 (PST)
To: buildroot@buildroot.org
Date: Sun,  8 Nov 2026 22:36:54 +0100
Message-Id: <20261108213654.3157113-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/dt-utils: use the official release
 tarball
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Marcin Niestroj <m.niestroj@grinn-global.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

git.pengutronix.de now rejects cgit snapshot downloads made with wget
(it answers curl), so dt-utils can no longer be downloaded:

  --2026-11-07 22:06:09--  https://git.pengutronix.de/cgit/tools/dt-utils/snapshot/dt-utils-2023.11.0.tar.xz
  HTTP request sent, awaiting response... 403 Forbidden
  2026-11-07 22:06:10 ERROR 403: Forbidden.

Pengutronix publishes official release tarballs, along with their
sha256, on public.pengutronix.de, using the same version naming as
the snapshots, so release-monitoring.org still matches. Switch to
them and use the upstream hash. The sources are identical to the
snapshot; the release tarball additionally ships the generated
autotools files.

This issue has been present since commit e33cd57b2515
("package/dt-utils: use snapshot tarball"), which switched to cgit
snapshots, although it only started failing when the server began
rejecting them. It therefore affects 2022.02 and later, including all
maintained branches.

Fixes:
https://autobuild.buildroot.org/results/a80df61bc6da78c0ef368d64da2f9d471118a8af

Fixes: e33cd57b2515675d9aa1a9abdfdf8b21025705ea ("package/dt-utils: use snapshot tarball")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/dt-utils/dt-utils.hash | 5 +++--
 package/dt-utils/dt-utils.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/dt-utils/dt-utils.hash b/package/dt-utils/dt-utils.hash
index af964606fe..b82b60c000 100644
--- a/package/dt-utils/dt-utils.hash
+++ b/package/dt-utils/dt-utils.hash
@@ -1,5 +1,6 @@
-# Locally computed
-sha256  5a1ace759b37c4b5138738ae0fa03574b1f55da01a0faa88aaff0417d275cc0e  dt-utils-2023.11.0.tar.xz
+# From https://public.pengutronix.de/software/dt-utils/dt-utils-2023.11.0.tar.xz.sha256
+sha256  d224d941c076c143f43d59cd7c6e1c522926064a31ac34a67720632ddecb6b53  dt-utils-2023.11.0.tar.xz
+# License files, locally computed
 sha256  a2010f343487d3f7618affe54f789f5487602331c0a8d03f49e9a7c547cf0499  LICENSES/CC0-1.0.txt
 sha256  2c9d733cadb50e33cc83f05f1fe7cc4b6c5ff7260fd9eea1b839151c7fa64742  LICENSES/GPL-2.0-only.txt
 sha256  d6e37cb7eff6ef15ae3c4082cf40eae80a94cd59b636991d1149d4a5c9dc3537  LICENSES/GPL-2.0-or-later.txt
diff --git a/package/dt-utils/dt-utils.mk b/package/dt-utils/dt-utils.mk
index 7b197c585a..50878b79c8 100644
--- a/package/dt-utils/dt-utils.mk
+++ b/package/dt-utils/dt-utils.mk
@@ -6,7 +6,7 @@
 
 DT_UTILS_VERSION = 2023.11.0
 DT_UTILS_SOURCE = dt-utils-$(DT_UTILS_VERSION).tar.xz
-DT_UTILS_SITE = https://git.pengutronix.de/cgit/tools/dt-utils/snapshot
+DT_UTILS_SITE = https://public.pengutronix.de/software/dt-utils
 DT_UTILS_LICENSE = CC0-1.0, GPL-2.0, GPL-2.0+, Zlib
 DT_UTILS_LICENSE_FILES = \
 	LICENSES/CC0-1.0.txt \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
