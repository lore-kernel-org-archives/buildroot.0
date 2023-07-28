Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBBA1EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 06:36:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 606A142C63;
	Fri, 28 Jul 2023 06:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 606A142C63
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ncz16Mn_mrIU; Fri, 28 Jul 2023 06:36:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 93B0042C6B;
	Fri, 28 Jul 2023 06:36:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93B0042C6B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E2AB1BF836
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 06:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4619F41E4E
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 06:36:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4619F41E4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B-NxIbEo-tlo for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 06:36:01 +0000 (UTC)
Received: from mail-oo1-xc34.google.com (mail-oo1-xc34.google.com
 [IPv6:2607:f8b0:4864:20::c34])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3A7A741E44
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 06:36:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A7A741E44
Received: by mail-oo1-xc34.google.com with SMTP id
 006d021491bc7-56c74961e0cso7739eaf.3
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 23:36:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690526160; x=1691130960;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PrdlRAhCHtEY4P2ry/ptkfx4gvQ5Gm5LLVtzzSt9wS4=;
 b=g1ACnYUCasliwnHhpe2CoFhlRgiv4nzN7LMjN9Q3v+T8axXgmEDLcdciUVezbn/Yiq
 f3jjFIIXKoYpz3WQ/3+xnVEioII7BuRcYZVaMzMqCUx7XeaaA/G6J83gcUxJ/979McJ/
 VRCQsmFdc2EgIobleVovbHxGSMo05ey76yPt9FNZUcbzxHqEKzWVuDVkk5d2gN9l0JSN
 exXTo/eV/lKvwWxNv5f+h4Fsabhi2p46sjNWBMenOumhh5vnX3c0PnWobrrVKTIq6Jt/
 rVrsIbqmokOgQfiXPZ5cCpBnLH5E+/ypE+3EHPZQzXvwebRPl2nhoBElIS1EWaOLoPkY
 fiHw==
X-Gm-Message-State: ABy/qLZXObGCXNmV+wYgwLBsF7ps6w7TvFI7nFDzS4GZtjhQaT1ozaXR
 lxEExTB40PAujjzAzB8PopbPitx/kqiM+O6NJtXx60pKhpNgjg==
X-Google-Smtp-Source: APBJJlEfQLQpGWBdOUGwt/PiS2pXNPHIK3J8aD0qPOrTcrGC0Obc3nhLfeIwcNToB9JsXUBNrNZ16A==
X-Received: by 2002:a05:6808:23c6:b0:3a3:95f9:c99b with SMTP id
 bq6-20020a05680823c600b003a395f9c99bmr2256075oib.35.1690526159988; 
 Thu, 27 Jul 2023 23:35:59 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 12-20020a17090a198c00b002640b7073cfsm3932025pji.14.2023.07.27.23.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 23:35:59 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 23:35:55 -0700
Message-ID: <20230728063555.1217420-2-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230728063555.1217420-1-christian@aperture.us>
References: <20230728063555.1217420-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690526160; x=1691130960;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PrdlRAhCHtEY4P2ry/ptkfx4gvQ5Gm5LLVtzzSt9wS4=;
 b=1H4EA5wLVrRV+eqhG4UeJS/m4qE1kZIcbsnCrtlc4pDzhfAEvhgSov2fTIxJSTLNlh
 kYhKpqj8z//247DHS3SE0wv+GVjjEl4AL3gB5sEASHmpLZX+3t9b1qusTERf8LrywvFM
 U9hHbvba5QAIWLoWijel5aPFnZxxnCH4tssuXO3IP99dC8piIR7YvXCzcg//lk+F1odF
 veFCiqM8teYJRgAWPfB705V2Ud3QSxSSKNabY1jmzY3LHEgOExJVTbT8IIxQtDWDWetz
 F/KMMFQis+Hf94x/mASrzwMx+ToU+ZY4w0AWb9VjKZSad6CP/k444+JOOokAvp8I6I4B
 B/uQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=1H4EA5wL
Subject: [Buildroot] [PATCH v1 2/2] package/docker-cli: bump version to
 v24.0.5
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Christian Stewart <christian@aperture.us>,
 Joachim Wiberg <troglobit@gmail.com>, Tian Yuanhao <tianyuanhao3@163.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bug fixes & enhancements.

One major bug fix included in this release: The Go client now avoids using UNIX
socket paths in the HTTP Host: header, in order to be compatible with changes
introduced in go1.20.6.

Previously docker commands would fail with "invalid Host header."

https://github.com/moby/moby/releases/tag/v24.0.5

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index 2ccf1d98b9..bb4c662079 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dc1d025fd16b113a1a7e2a5d34c30409613d9c4ec313937f17bf34991caf597f  docker-cli-24.0.4.tar.gz
+sha256  d5558cd419c8d46bdc958064cb97f963d1ea793866414c025906ec15033512ed  docker-cli-0.24.5.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index 9b657093cb..4211fd6152 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 24.0.4
+DOCKER_CLI_VERSION = 0.24.5
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
