Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7082EC433F5
	for <buildroot@archiver.kernel.org>; Fri,  7 Jan 2022 20:37:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 27A5B60AFE;
	Fri,  7 Jan 2022 20:37:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FAsKviBaxXlt; Fri,  7 Jan 2022 20:36:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72D2460AF6;
	Fri,  7 Jan 2022 20:36:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E8E541BF5DA
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:36:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D77DE80BFD
 for <buildroot@lists.busybox.net>; Fri,  7 Jan 2022 20:36:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Xf-FyQBRjHj for <buildroot@lists.busybox.net>;
 Fri,  7 Jan 2022 20:36:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D83C780BFA
 for <buildroot@buildroot.org>; Fri,  7 Jan 2022 20:36:45 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 f189-20020a1c1fc6000000b00347ac5ccf6cso1504209wmf.3
 for <buildroot@buildroot.org>; Fri, 07 Jan 2022 12:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ROHOYfCrtePut6bruRW+7mT62xMpSVC6iSDpIeooQ2Q=;
 b=bsanDuDcFPXoLzuHW3mm4287HZnZm1ZGGjItinStGqycwOwInPs5DkCCCk06FHoSrU
 6XNeP+AEtwZVD5lTHuG2dzn86T2U8MoPYqRWp3pi73qt08OgsAN7lMngNKH2ppJaovK6
 7rA0z9ktELtk9TWrY6fnXkVkioN3qjqwzM0ruAsJ5YoGOXH5k2QnJqlOTEVJI9kV6xkE
 8W+hTT2tW+7RRy92cCU/hN2ad3tQQw0N6tZHi6RMUM2ndl7XeqDAXjjTk2YJWy+cqJr/
 /3u4R5UXKWhqXE0WgZBp92Mp4gMbit8DqJsBTCl2UDsDrzt/ukRqNoItTnABLxdV3hqN
 7wnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ROHOYfCrtePut6bruRW+7mT62xMpSVC6iSDpIeooQ2Q=;
 b=KCqcpcsUpSh/21XZCcSQOqCpUOP2r6sc9htlYjuQDc2a9RE9cyyqes+ish493+LoAn
 cN1GCk8Vmntn81SE9zWKyeg5IRlEDP2x5A+cFcEsLrDZYNx47HujWMd5OTNF2SzPW/Kc
 cI3tQ95zqCKRwhx3qwXETZmp5heHitQzX4oh0D61xwLaXLO7OA4qLsTs4uLjolLjL9NS
 rsep7vrfxXraRtyIEcX/lW2U6Hem1gDCTkQxn64md79uEt+BKqdm4Aq544240QmChcHl
 PsaVFhZO27sK+cuZY3AQ8X9eQiBfv/YclAxe8sC57KYKWr+vXQb6HEcPCjHyJKp+Zp+H
 JrZA==
X-Gm-Message-State: AOAM532GOG9asnCr1yl05mXd9aULkWh4OfO5aI04DjMREqE+aXnfCpe5
 2rFhEIANsXBPRi/IIlYGaL261vSlf68=
X-Google-Smtp-Source: ABdhPJyaWXGJq06EVnD4IpUSQmBr/BuslCEaB9s0F9ESsOOgmFp9E7NC0W+M9cAzzrDzjyXdqIMiww==
X-Received: by 2002:a7b:c3d3:: with SMTP id t19mr2414750wmj.107.1641587804031; 
 Fri, 07 Jan 2022 12:36:44 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id c16sm3331524wrp.109.2022.01.07.12.36.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jan 2022 12:36:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  7 Jan 2022 21:35:34 +0100
Message-Id: <20220107203534.1461378-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220107203534.1461378-1-fontaine.fabrice@gmail.com>
References: <20220107203534.1461378-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/nftables: bump to version 1.0.1
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

Set --with-cli=readline to avoid a build failure since
https://git.netfilter.org/nftables/commit/?id=b4dded0ca78df2a67245a3db1448a51207577ff1

https://www.netfilter.org/projects/nftables/files/changes-nftables-1.0.1.txt

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/nftables/nftables.hash | 2 +-
 package/nftables/nftables.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/nftables/nftables.hash b/package/nftables/nftables.hash
index bbf7e5a2b1..53878abba9 100644
--- a/package/nftables/nftables.hash
+++ b/package/nftables/nftables.hash
@@ -1,3 +1,3 @@
 # From https://netfilter.org/projects/nftables/downloads.html
-sha256  58bf547daf967a2b88ecb4f425f126006ebde22711db806b25c1d6cf84fe45f4  nftables-1.0.0.tar.bz2
+sha256  3ceeba625818e81a0be293e9dd486c3ef799ebd92165270f1e57e9a201efa423  nftables-1.0.1.tar.bz2
 sha256  c17bc4fa5b2434c6f283ffcb2312e5bf3c7cdf5787b79505f094d8de734ac53e  COPYING
diff --git a/package/nftables/nftables.mk b/package/nftables/nftables.mk
index 2409eb0571..d5c16ac2be 100644
--- a/package/nftables/nftables.mk
+++ b/package/nftables/nftables.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFTABLES_VERSION = 1.0.0
+NFTABLES_VERSION = 1.0.1
 NFTABLES_SOURCE = nftables-$(NFTABLES_VERSION).tar.bz2
 NFTABLES_SITE = https://www.netfilter.org/projects/nftables/files
 NFTABLES_DEPENDENCIES = libmnl libnftnl host-pkgconf $(TARGET_NLS_DEPENDENCIES)
@@ -21,6 +21,7 @@ NFTABLES_CONF_OPTS += --with-mini-gmp
 endif
 
 ifeq ($(BR2_PACKAGE_READLINE),y)
+NFTABLES_CONF_OPTS += --with-cli=readline
 NFTABLES_DEPENDENCIES += readline
 NFTABLES_LIBS += -lncurses
 else
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
