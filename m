Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10E7CC433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Dec 2021 22:15:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6D736F968;
	Thu,  9 Dec 2021 22:15:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qfz52zpDYr4g; Thu,  9 Dec 2021 22:15:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05C2E6F966;
	Thu,  9 Dec 2021 22:15:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D8041BF350
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 22:15:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 795A342551
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 22:15:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GSXFEOoYNP4h for <buildroot@lists.busybox.net>;
 Thu,  9 Dec 2021 22:15:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A92B64254B
 for <buildroot@buildroot.org>; Thu,  9 Dec 2021 22:15:34 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id y12so23586320eda.12
 for <buildroot@buildroot.org>; Thu, 09 Dec 2021 14:15:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UP5ySOXHd3MKM9R0uw4z4Vn1ml4kvxKSe7/JVp2QoZM=;
 b=i6frcbDiPFevVTgy/OFEWtIWfbnrgXEAv8MtpiNkSd6zrZrBORI/WiwdHIUaZRbmKI
 pDALHhN7R2uK5V+KOppxXd2anZfQ9Gd9j/3H1DLGt8P0mWuN30Pp/RhjnDal8AeFCFnY
 zUQiNgbWe3CVQnsQMphBNYR/J8vGuhrKqkwVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UP5ySOXHd3MKM9R0uw4z4Vn1ml4kvxKSe7/JVp2QoZM=;
 b=cxv7CxPE8Yp+iFAxq5ZcszQaq8mJuWEwN3ZEUazDJixyyNBvVhklz0IzlmWHNdlpMU
 pfv/14Mqg9jraKGHzYTPx9Ii4tr8aMJ2CtUYfyQrPK6ral0XO+m5NqvMB3kkE0yfVl71
 E7B0ywK63xONyu8Xsx4HGIHNKQFHKh+U7L2UpfaLpk0wp2hj4Gq3qnqNL0VyJzaPt7TL
 cv7Sa/RUVQmd0Fu/hadtoEDBhYN5pgcD8YxNFFHjTIvJK5f2w3Tsb+3T2VmdC4g1Ve7q
 j2Vd7asn8bKEDFunK93HpDi30diTOIteRsVQmNimZAXudnVl47h2lYI9QHyJapR82iN+
 e29g==
X-Gm-Message-State: AOAM531zC2ylRlWIvyLcbFH/WhFIyZWIUPmpZ1b2rVweFxeEb1jjRLFD
 QzCQO2F8d9KBtk2zfSPh8hg1ayyWLhxXmw==
X-Google-Smtp-Source: ABdhPJwm+NRXHlZfoPA9LjWoVOHdSV3jA45G5lEW6m+8J/JwCj+SYh8u2AZj0/HKEV9WstpQMOwsjw==
X-Received: by 2002:a05:6402:34cd:: with SMTP id
 w13mr32613741edc.112.1639088132899; 
 Thu, 09 Dec 2021 14:15:32 -0800 (PST)
Received: from localhost.localdomain (host185036130019.static.fidoka.tech.
 [185.36.130.19])
 by smtp.gmail.com with ESMTPSA id r25sm484801edt.21.2021.12.09.14.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 14:15:32 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  9 Dec 2021 23:15:29 +0100
Message-Id: <20211209221529.498292-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2] package/grep: bump to version 3.7
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
v1->v2: updating the signature url after checking
 package/grep/grep.hash | 4 ++--
 package/grep/grep.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/grep/grep.hash b/package/grep/grep.hash
index 9dfe2f2c23..29d9eb1cd6 100644
--- a/package/grep/grep.hash
+++ b/package/grep/grep.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature
-# http://ftp.gnu.org/gnu/grep/grep-3.6.tar.xz.sig
+# http://ftp.gnu.org/gnu/grep/grep-3.7.tar.xz.sig
 # using key 155D3FC500C834486D1EEA677FD9FCCB000BEEEE
-sha256  667e15e8afe189e93f9f21a7cd3a7b3f776202f417330b248c2ad4f997d9373e  grep-3.6.tar.xz
+sha256  5c10da312460aec721984d5d83246d24520ec438dd48d7ab5a05dbc0d6d6823c  grep-3.7.tar.xz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
diff --git a/package/grep/grep.mk b/package/grep/grep.mk
index 27d204d4ce..233f5fe633 100644
--- a/package/grep/grep.mk
+++ b/package/grep/grep.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GREP_VERSION = 3.6
+GREP_VERSION = 3.7
 GREP_SITE = $(BR2_GNU_MIRROR)/grep
 GREP_SOURCE = grep-$(GREP_VERSION).tar.xz
 GREP_LICENSE = GPL-3.0+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
