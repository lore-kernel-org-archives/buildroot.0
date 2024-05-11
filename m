Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CAE3C04FFE
	for <buildroot@archiver.kernel.org>; Sat, 11 May 2024 23:56:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA26B83D1D;
	Sat, 11 May 2024 23:56:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EofMfFte_B8P; Sat, 11 May 2024 23:56:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2BDA83D21
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2BDA83D21;
	Sat, 11 May 2024 23:56:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EC13A1BF59D
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 23:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8AA3401D8
 for <buildroot@lists.busybox.net>; Sat, 11 May 2024 23:56:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HfjE9g-JJBZc for <buildroot@lists.busybox.net>;
 Sat, 11 May 2024 23:56:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42c; helo=mail-pf1-x42c.google.com;
 envelope-from=christian@aperture.us; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DB9E140163
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DB9E140163
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DB9E140163
 for <buildroot@buildroot.org>; Sat, 11 May 2024 23:56:13 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-6f45020ac2cso2603133b3a.0
 for <buildroot@buildroot.org>; Sat, 11 May 2024 16:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715471772; x=1716076572;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EOb2lrtT35Fts2rlwEiPM74Cp50vwrzZBehIu9Y/mCQ=;
 b=n1RlE3SfkJMA5lpC77Y98e3Up5pXRW9aYcsAVFgxKjst8qUrc1OyWIspk0cdPHvVss
 Q086/JXzGG8ag1X+lzzg6hAQNFEClYzv9DtJwcIy0H2rsKUb14SG3cAx3h+1UKUMIojK
 W7IDUGeDlZnxnYeoYP7+3ecJbSTLdRpOdV9t02YWWJAyT9QHIzlavlVyJACXMgXLrna7
 2Yk0ac+Tyb+QWkPXprOvsHsz3dPbDNac9ST7e+4owMPDCny/dHezR4u6VTvK7PmSy7KC
 /9RfI46kLpMs3ZmH8lhp+RFQQWgkzUxaJwlEpqLakB4VmE3SIbBDNSYI6dFMWj+mk5yD
 AojA==
X-Gm-Message-State: AOJu0YyjwVoSDCls68q+LfolMZgJQUazREwR3Dv/RTfC56bzpfTV/lg0
 vvgaKDtNvLSLdvax1G9OeVVmQJ9JizFxuOB5AeyPuiVmM0WChpAsQDTBNmwgAMQAqJ3JQj6KOH9
 U/yU=
X-Google-Smtp-Source: AGHT+IHy77P1V3eGsBy2qdmJ4iSZSkaOVl5lEtJ2OhrJ4OxUMM6UGk89qAffZYBiQAk5Ai5tvmdi7A==
X-Received: by 2002:a05:6a20:daaa:b0:1ad:31e2:56c with SMTP id
 adf61e73a8af0-1afde0a9becmr7246745637.8.1715471772197; 
 Sat, 11 May 2024 16:56:12 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-1ef0bf30d1fsm54018245ad.162.2024.05.11.16.56.10
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Sat, 11 May 2024 16:56:11 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 11 May 2024 16:56:09 -0700
Message-ID: <20240511235609.88305-1-christian@aperture.us>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1715471772; x=1716076572; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EOb2lrtT35Fts2rlwEiPM74Cp50vwrzZBehIu9Y/mCQ=;
 b=HTKn1z2UFBM+Ua2fjwV4Pl1zWSoOKJsBmdwrBoJLfpiM9HgrxCRZ0JttsL/vcRM46d
 aDWuoBNaAoKTBOISjbLWP6vApC51cv/2iRYnSIiRYpZut/2eAesrtKMQQOkyb0+GruIO
 BXFKrt6qFIAbfe/1akPJ162KIdLREm8ZuMQp+MBziHsT0HwrWJffkAOSSnyDjxG73eSb
 KUxQfrAwS1M4S6wnmoSV8zdYIxPJX50NI0hdOEUqipp1dFIc/+zcGMYfTAYEYG2afRnN
 CoEW+b6PDNXkazTc33AEewycTsylw2b9g8ucqvFFox/eRPKKkZxNTwW6Z+4in35MU/cy
 c7Cg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=aperture.us
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aperture.us header.i=@aperture.us header.a=rsa-sha256
 header.s=google header.b=HTKn1z2U
Subject: [Buildroot] [PATCH v1 1/1] package/docker-compose: bump version to
 v2.27.0
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
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/docker/compose/releases/tag/v2.27.0

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-compose/docker-compose.hash | 2 +-
 package/docker-compose/docker-compose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index cda4a130d5..1fd454e3fa 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  821aac932d0a3bbe583ea290ae777cec785a77f987c5007a30970fa6568e9322  docker-compose-2.26.1-go2.tar.gz
+sha256  448eaf225c2984a2d78b4faa3fe74a4aa1e2bb791f90ac8d4970d3d046e638df  docker-compose-2.27.0-go2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index 66a88ac7e7..32b2236a91 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 2.26.1
+DOCKER_COMPOSE_VERSION = 2.27.0
 DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
