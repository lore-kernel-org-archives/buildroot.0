Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B01DC43334
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 18:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AE10840A68;
	Wed,  1 Jun 2022 18:10:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pzmeD4D3C8Ue; Wed,  1 Jun 2022 18:10:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CBCAF405A0;
	Wed,  1 Jun 2022 18:10:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 375291BF379
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 18:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2606041860
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 18:10:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J5utTYlmhpZ9 for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 18:10:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EAB3641856
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 18:10:51 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id
 n13-20020a17090a394d00b001e30a60f82dso7027310pjf.5
 for <buildroot@buildroot.org>; Wed, 01 Jun 2022 11:10:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0JWG5D6E9//CMRmjGjp2fkjoTYiM+SWZUh9bk74IA+Y=;
 b=yq3NJt4szj2iLpdZbZOF6CNDnUDGw8Zbuxr0uyP1ry1fsgUkN/12BNn17V3aT425/H
 xfJ4AN4W3xImjKa3yyaThSGlbob8C6d25Ew7InAS0b+ftdEINmmSHDbD2DSqDBgLcbeN
 y+NbMwvh3p+MlvEX11KltZIQm0z576BOKIwNsEPIW9jHI14pjShgYN3Euzm5U0aAEEb3
 1VishiN1May2LL5Fu7BD5W3qrenAK09MTyEtGSyn9q+1/0CjPjCSn5sAk5h38fCkmCRK
 P3Z180KexTmDvKM5/qOcn24jg9UsPAQglKZU23l1Z5BaE9SnxcDi0Yb5Cr5A4Kau4AFL
 h7GQ==
X-Gm-Message-State: AOAM533Mi4UkRCQP75GiZCaEIuzk74AND+eZpGzW4iDr33v4vziWKNtm
 wGDs89uYkPrq4GA8/MOTQwCU6UqOqQS1zQ==
X-Google-Smtp-Source: ABdhPJw6+yY7d1dxsnl+8GcV4TJt1qFgZ/YMy86NHdFWSf5iyv752oRRlRqhyWBkSgVikGh94SEyig==
X-Received: by 2002:a17:90b:a85:b0:1e2:e062:95ba with SMTP id
 bn5-20020a17090b0a8500b001e2e06295bamr20562796pjb.211.1654107050904; 
 Wed, 01 Jun 2022 11:10:50 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 b9-20020a1709027e0900b00161d8153d56sm1816067plm.148.2022.06.01.11.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 11:10:50 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  1 Jun 2022 11:10:47 -0700
Message-Id: <20220601181047.89675-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/runc: security bump to v1.1.2
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
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2022-29162

Minor security issue (which appears to not be exploitable) related to process
capabilities.

A bug was found in runc where runc exec --cap executed processes with ble Linux
process capabilities, creating an atypical Linux environment. For more
information, see GHSA-f3fp-gc8g-vw66 and CVE-2022-29162.

runc spec no longer sets any inheritable capabilities in the created example OCI
spec (config.json) file.

https://github.com/opencontainers/runc/releases/tag/v1.1.2

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/runc/runc.hash | 2 +-
 package/runc/runc.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/runc/runc.hash b/package/runc/runc.hash
index fe3c4cc488..f8133d13c1 100644
--- a/package/runc/runc.hash
+++ b/package/runc/runc.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  11a34535c108b36fd59de58e7bef3a130444c9ea41e4b8bb8f8d4654c8ad654c  runc-1.1.1.tar.gz
+sha256  0ccce82b1d9c058d8fd7443d261c96fd7a803f2775bcb1fec2bdb725bc7640f6  runc-1.1.2.tar.gz
 sha256  552a739c3b25792263f731542238b92f6f8d07e9a488eae27e6c4690038a8243  LICENSE
diff --git a/package/runc/runc.mk b/package/runc/runc.mk
index 2618b71f63..5faa8b683d 100644
--- a/package/runc/runc.mk
+++ b/package/runc/runc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUNC_VERSION = 1.1.1
+RUNC_VERSION = 1.1.2
 RUNC_SITE = $(call github,opencontainers,runc,v$(RUNC_VERSION))
 RUNC_LICENSE = Apache-2.0, LGPL-2.1 (libseccomp)
 RUNC_LICENSE_FILES = LICENSE
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
