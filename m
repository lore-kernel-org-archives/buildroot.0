Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CFBC54798
	for <buildroot@archiver.kernel.org>; Fri, 23 Feb 2024 17:28:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35E3560833;
	Fri, 23 Feb 2024 17:28:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cTLrFe_Yf9ny; Fri, 23 Feb 2024 17:28:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4608760838
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4608760838;
	Fri, 23 Feb 2024 17:28:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D58411BF423
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 17:28:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CD70E4082E
 for <buildroot@lists.busybox.net>; Fri, 23 Feb 2024 17:28:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ChaceAjY9t4o for <buildroot@lists.busybox.net>;
 Fri, 23 Feb 2024 17:28:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::433; helo=mail-wr1-x433.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8A3F74080C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A3F74080C
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8A3F74080C
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 17:28:55 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-33d36736d4eso437633f8f.1
 for <buildroot@buildroot.org>; Fri, 23 Feb 2024 09:28:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708709332; x=1709314132;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c3rYnUChLDHtOBO5dkr2jSf1WjaiysRaT5haa6NtwzQ=;
 b=XNVeruQrVW094cHOMXc88egS1xk+9BiHda3C7f3dDoSnX7wPi3TrpzczZSe4lBlmhn
 fRNmFlqB549fEmNgYJWK+RQoX+4bUPh06YGJue+vRdTkid9+Y6dpjdGAnmYqNAkqg1/c
 8vR//y2uzCua4L2K6RS6xXIvX9zQkNbFN16dheDtsWc9oZlS/IafL5xUq5t+PzRc2lKA
 2E8rZn6aqBkBzyCF7B5DPjaagTU0PRdCKlymiytRaZaWNk/gAQ/78YstuGQ4BPAFzyIK
 2UXKqrt4RlMubuJpYuWbCB5muDK9KY8QseORP2n32SMNwvwr/atdtsCfuzzIQeTfUdbo
 RJuA==
X-Gm-Message-State: AOJu0Yy9ykF0D+HOU6p4CqqEKMVNDnwEpNk3ATxM4WVkO4w0DXAXtFac
 Ez9rbBv7a9EDCAUut8EipRvNWYG8ljx07xsM5z455TzJMG6A/FIyoRPAZBFj
X-Google-Smtp-Source: AGHT+IFIspCM2MnEKpnSM3+gHzGE3Edd3xO0Z1RZnLq1xPGa5JndCGnFLkoU6fCTqSk4Lhwl0SdpgQ==
X-Received: by 2002:a5d:5981:0:b0:33d:2437:e739 with SMTP id
 n1-20020a5d5981000000b0033d2437e739mr395297wri.54.1708709332393; 
 Fri, 23 Feb 2024 09:28:52 -0800 (PST)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 bn11-20020a056000060b00b0033d8a17a710sm4039294wrb.88.2024.02.23.09.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Feb 2024 09:28:51 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Feb 2024 18:28:50 +0100
Message-ID: <20240223172850.559363-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1708709332; x=1709314132; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c3rYnUChLDHtOBO5dkr2jSf1WjaiysRaT5haa6NtwzQ=;
 b=U9vXBwi4HVlmnbFi13kgqD367KoghECtBHaBdgFouVQBhPZd/+Ws6g6HUce/vrkxks
 2UeaajgxGk9wYhllcDu3CCCK2FhlPKsAIdpV6qnai7WDIYB0RoCNmZzyitSFzREp8MYW
 I5+QUmRQ1P/RFdYr35AxdOHhiFd3tk3Jz6pi1nGxBeQEwKjcnkNfjI7Cuv83qtTO6Vxm
 x02dY7Ljzq+4LiKBrp5pqAWGCJNZ4afRk3hSMmeECC9YW4rRc86fMZqaxPUb0s95rQ0w
 dNvcvx+bYPVBEJCIYOS+WMC/fk8LARr2TIgTXGynFwRneMGi+CRwKI1csE3sO9F60O6U
 dekg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=U9vXBwi4
Subject: [Buildroot] [PATCH 1/1] package/c-ares: security bump to version
 1.27.0
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

Fix CVE-2024-25629: Reading malformatted /etc/resolv.conf,
/etc/nsswitch.conf or the HOSTALIASES file could result in a crash.

https://github.com/c-ares/c-ares/security/advisories/GHSA-mg26-v6qh-x48q
https://github.com/c-ares/c-ares/releases/tag/cares-1_27_0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/c-ares/c-ares.hash | 2 +-
 package/c-ares/c-ares.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/c-ares/c-ares.hash b/package/c-ares/c-ares.hash
index ee097a53c9..9a2b69c731 100644
--- a/package/c-ares/c-ares.hash
+++ b/package/c-ares/c-ares.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  bed58c4f02b009080ebda6c2467ba469722ac6aebbf4497dc44a83d8c6194e50  c-ares-1.26.0.tar.gz
+sha256  0a72be66959955c43e2af2fbd03418e82a2bd5464604ec9a62147e37aceb420b  c-ares-1.27.0.tar.gz
 
 # Hash for license file
 sha256  80fff25340df53b0cf0c3cddbca9050b559b9cbed2ad71830327cfef54959aef  LICENSE.md
diff --git a/package/c-ares/c-ares.mk b/package/c-ares/c-ares.mk
index 29da6baa4b..c4441255a2 100644
--- a/package/c-ares/c-ares.mk
+++ b/package/c-ares/c-ares.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-C_ARES_VERSION = 1.26.0
+C_ARES_VERSION = 1.27.0
 C_ARES_SITE = http://c-ares.haxx.se/download
 C_ARES_INSTALL_STAGING = YES
 C_ARES_CONF_OPTS = --with-random=/dev/urandom
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
