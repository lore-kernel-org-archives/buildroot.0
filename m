Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706C5C4828D
	for <buildroot@archiver.kernel.org>; Thu,  1 Feb 2024 17:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19E3F42243;
	Thu,  1 Feb 2024 17:46:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19E3F42243
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yIdsxeQs7AKu; Thu,  1 Feb 2024 17:46:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F2F342239;
	Thu,  1 Feb 2024 17:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F2F342239
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D002E1BF3BB
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 17:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A38C2846C8
 for <buildroot@lists.busybox.net>; Thu,  1 Feb 2024 17:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A38C2846C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6V3IXw7rl5TQ for <buildroot@lists.busybox.net>;
 Thu,  1 Feb 2024 17:46:46 +0000 (UTC)
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 960F6846CE
 for <buildroot@buildroot.org>; Thu,  1 Feb 2024 17:46:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 960F6846CE
Received: by mail-ej1-x632.google.com with SMTP id
 a640c23a62f3a-a2f79e79f0cso164821566b.2
 for <buildroot@buildroot.org>; Thu, 01 Feb 2024 09:46:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706809604; x=1707414404;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vNCCMU9U6/Ons3xCuxAzGgCx6VmBwYTEf3f6m7TwaBs=;
 b=nzRYtebPNHiX1oBNv9wGXs3H8nq4QenKirzlyDnSuAdEluMCyBhO6YMxtPqwBzgmKI
 2mgpQN8SjjzN7DXhLdFmxD6xWVbwtGLQAuKUHZbnBoba/1FxvClNpPtRnPTDVDajxGyX
 ICrNgZCrTQlH0s/oro0jpWDFB4mP6b2im2W7jDQYKqUk2PIoHbMiBwvsFbi3CMC0RBOR
 auUmus8vZlpzpuyhpDJSUpOEMFOC/VbYnkLHChel0lzbE0GsTlgd5R0opqaER5Z6HSP4
 Aurvcp5AWngcSbzI3fMTNHA7WJlsXSA4uvP0xDB7Xz4QLTls8S0wh3KlC/DneQTusI6K
 tF2g==
X-Gm-Message-State: AOJu0YxziOVKvsKn+jRntyNuaKaG3DF2DZjrJuQUsyK+vFHlyL58dWHq
 MWmZn25l8SP8VLZsgARkdTxEMDYJ8Xhqk1frJrQLkKp/iQAaNVHKXtCcJbtcLqA=
X-Google-Smtp-Source: AGHT+IE/o4nK4cCwdfZwDt11hRy+ORQom81C5ESg5KQ24qAzmi8puMPclBxrTupc7Dkecye10gvrEw==
X-Received: by 2002:a17:906:138d:b0:a31:63eb:5ede with SMTP id
 f13-20020a170906138d00b00a3163eb5edemr4779790ejc.51.1706809604067; 
 Thu, 01 Feb 2024 09:46:44 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 ll9-20020a170907190900b00a26f1f36708sm14503ejc.78.2024.02.01.09.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Feb 2024 09:46:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  1 Feb 2024 18:46:41 +0100
Message-ID: <20240201174641.183601-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706809604; x=1707414404; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vNCCMU9U6/Ons3xCuxAzGgCx6VmBwYTEf3f6m7TwaBs=;
 b=CouEzqRJknV2DgSHJmpRTdIa3WZ9sBHL1HJDYPXl78HjApOgyWwFtlTf1NbtCTBndO
 MpBsi4L2HDuk5K5qa/9uNMoiU81VMz2ysVE2HcJpqf21akicSmL5+MzoTga+BnFzwGBE
 +cQ//Bv1Z1hq+vtQVVG+P5cR0+vu++181A7zsooxIx2Kdfpav/Zk/BAri/t9KXYYpKxD
 ZGe9q7MUsCH+NgYUOJZSaWgaxGVyvtplvDQZUmSgSkTPUERD2Vjx7ZxJJThHEfPa4gYZ
 0QKU6pVjxSkhaVUUBmsBFb8wSkfQHOmt/H/Y6gRtIPO7jOWJkWzHnotvQMw2Rk+zFLua
 /l/A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CouEzqRJ
Subject: [Buildroot] [PATCH 1/1] package/crda: drop CRDA_CPE_ID_VENDOR
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:kernel:crda added by commit
63332c33aa0771532807fd2684d4eee4eb952435 has never been a valid CPE ID
for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe:2.3:a:kernel:crda

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/crda/crda.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/crda/crda.mk b/package/crda/crda.mk
index a73c9aa26d..8043260cfc 100644
--- a/package/crda/crda.mk
+++ b/package/crda/crda.mk
@@ -9,7 +9,6 @@ CRDA_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/crda.git/snap
 CRDA_DEPENDENCIES = host-pkgconf host-python-pycryptodomex libnl libgcrypt
 CRDA_LICENSE = ISC
 CRDA_LICENSE_FILES = LICENSE
-CRDA_CPE_ID_VENDOR = kernel
 
 define CRDA_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
