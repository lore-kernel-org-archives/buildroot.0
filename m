Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 304A7C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 13:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96ACC81771;
	Mon, 27 Dec 2021 13:36:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xhS-coeMPoX6; Mon, 27 Dec 2021 13:36:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F14EC8148D;
	Mon, 27 Dec 2021 13:36:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 41E9E1BF48C
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 13:36:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3ED158148D
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 13:36:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 85_YdF67DN7h for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 13:36:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0B679813EE
 for <buildroot@busybox.net>; Mon, 27 Dec 2021 13:36:03 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id b13so61764607edd.8
 for <buildroot@busybox.net>; Mon, 27 Dec 2021 05:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g8y0fLrI7c6THKk1Jp58wyqYjBOCuINiFnTX7TyimWk=;
 b=DVl7WqhJdyIw20UfTmFPmu4A2D7Wv2lmw0TdGFwFRxfTdi22M7NnuQk2+Fqqj3tVFK
 D3cX9Luxs7lGY52f1yMxf8SMp2s3lU1+5njaoCNdRV6naR25+vVbBYnNAu93n0AyQ9QO
 h+C5m5+juUlPATvjdh1a5D8haL8ag6iInwmlLMM6+id4QjDHmIe7KVSCTBRVQiN3GGpu
 zlszH4X8SKwCm/v0p0yg/wvfizAc33K/v0x1EoJoFABkwUETabe/CGcC5GFA2ZBDmY4U
 liLMEBbgB3JiW99awJiPv1cyj2dHTWnC3NTmaWH80u+t3hGwzpXQn/iXpJBW4Jo5ICZc
 81Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g8y0fLrI7c6THKk1Jp58wyqYjBOCuINiFnTX7TyimWk=;
 b=4/dtXcWxZ0dENDYYLEBbadEJZL3IpS/GjrkROBi4ueKj43X4UKCeqJtzlOXlJs2K0p
 4DNDV9AkXHrEq42tVNqzbfEs1fThELS6y9jtFCfIQmsxJz5rcderb7eKYTuEXC3Id7hs
 ittx+1BdNDn/S8QdFMzRcnxA5hg8AZ918C43HskkEDWgyh0nF1UfEZz+80v+kRf0gfbw
 TSnK7cFJ0l/CEn1qoU71rYmdF+otXkOTco5NPFiz4K3yyvxL73CbWKkmkX8JwabMZSBW
 zQpAjGC6X3n5fiD1SrnWM9dtdsx044WpBnhIbY/20aIDZhLp7a1alBZFAPCpDFZvCBSN
 naMA==
X-Gm-Message-State: AOAM531z33gTthtZrW3Pl7nKVJtsXaBxzOuqC2Dh1ZzCb9jonb73R/Ji
 2e46eIMOklMQvxRmbbRC5vol6lbp4IQ=
X-Google-Smtp-Source: ABdhPJzcM5LSjwMeRakz78Q9h6s7kxaT/KNHqOx+tK1ErQ7EAGg6aK/Je+6qpS5Ks229Y4XITfrqng==
X-Received: by 2002:a05:6402:2882:: with SMTP id
 eg2mr16611441edb.406.1640612161867; 
 Mon, 27 Dec 2021 05:36:01 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id j5sm5208461ejo.171.2021.12.27.05.36.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 05:36:01 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 27 Dec 2021 14:35:53 +0100
Message-Id: <20211227133553.2165065-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/enchant: bump to 2.3.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/enchant/enchant.hash | 2 +-
 package/enchant/enchant.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/enchant/enchant.hash b/package/enchant/enchant.hash
index 9cee2d78e..9df5316aa 100644
--- a/package/enchant/enchant.hash
+++ b/package/enchant/enchant.hash
@@ -1,3 +1,3 @@
 # locally computed
-sha256  3b0f2215578115f28e2a6aa549b35128600394304bd79d6f28b0d3b3d6f46c03  enchant-2.2.15.tar.gz
+sha256  ce9ba47fd4d34031bd69445598a698a6611602b2b0e91d705e91a6f5099ead6e  enchant-2.3.2.tar.gz
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LIB
diff --git a/package/enchant/enchant.mk b/package/enchant/enchant.mk
index 3135550f7..e00fcb25e 100644
--- a/package/enchant/enchant.mk
+++ b/package/enchant/enchant.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ENCHANT_VERSION = 2.2.15
+ENCHANT_VERSION = 2.3.2
 ENCHANT_SITE = \
 	https://github.com/AbiWord/enchant/releases/download/v$(ENCHANT_VERSION)
 ENCHANT_INSTALL_STAGING = YES
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
