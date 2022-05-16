Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A713C433F5
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 13:16:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48D4560672;
	Mon, 16 May 2022 13:16:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gIJd5Osj4Fgt; Mon, 16 May 2022 13:16:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08596607A3;
	Mon, 16 May 2022 13:16:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D74451BF37E
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C56DB40B44
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZaWJHjnojPcW for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 13:14:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8ABA840396
 for <buildroot@buildroot.org>; Mon, 16 May 2022 13:14:09 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 o12-20020a1c4d0c000000b00393fbe2973dso10889131wmh.2
 for <buildroot@buildroot.org>; Mon, 16 May 2022 06:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qVu04SENFdHTKJnSMPQcVrcifAW9CqmNfc0s2u6ub3E=;
 b=dA05ZXh7U8Wk2CCQ5TtHUawzoac+MkOV137ss6QuI2lL0xAuRoNLol5W5BNDofW4UV
 5tQvDVNWw0EL+Qiq7K2B10GacNCMaOYqRmXFIn5TcposmyXUatRBZbMoD8bYP3kAHaWE
 Mefz5oxd10xhGl2s9Z2mDhbmBH9Dmtxg81NviBhrAymj1TN1Mq8kbt8DMxPVKMLy7PNI
 KlDIEGfd8pHQQzx2ncH8//ott3m5H2S3zhr8/qQWrsFcSge9KfQnV9LGE4qvrtbXNtlt
 yxLF0kkojbTXzKaD85yQGM8kpAKBVWxcBn+H6/78tZPjieYwyQzpqYGoOEbfUUSxiSEz
 6J+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qVu04SENFdHTKJnSMPQcVrcifAW9CqmNfc0s2u6ub3E=;
 b=4lLyG8CS3ni3h5sGM+nt3vlYr4eoAP5XvvGIA+Ob2mmVrZkvdXel5BHDDLpX+Ml67w
 +mqd3ackPrC4RC3ILZOV6jfEIcRmhLvuatlyCGlLP04uculNN+k1RzLqshPJmTPwXknX
 0wBzaJIm/dmDs+4L/Yy/8JHqGgGZ7CRie2FvNa9IDVTXWEMEZaUCEGltTdy3GgjQBzHA
 4JFF3/07Nu/IEo+fUbVTQJ35A4I8UsLXVnEkhsigZk2EOK84KGPW/A7zjkQ2A9vFa0wh
 A9KMAR9CqXw3eOiQw4jdeYxpMY97jYjJ3T5VwUMfGsyk8taPI8D2zGvkFeSFgHIwz1Uv
 f4Bg==
X-Gm-Message-State: AOAM531gqIBPIa1EosrZwQeQWWxK1l/Lh7/9jOw1VUtPXEmJDVpku4fe
 axxarj95Pqc2KNie+aDiOlHpyRbgRPg=
X-Google-Smtp-Source: ABdhPJzI/DBImC9nBYpK33PZAXAK4wzkaS90ltuK/6XaG6f5mgE39Jj2gCqMJa5elIBd7PiT3WXngg==
X-Received: by 2002:a05:600c:3482:b0:397:165:3ac3 with SMTP id
 a2-20020a05600c348200b0039701653ac3mr6245504wmq.149.1652706847611; 
 Mon, 16 May 2022 06:14:07 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm13023789wmb.42.2022.05.16.06.14.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:14:07 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 15:13:28 +0200
Message-Id: <20220516131334.1910858-15-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220516131334.1910858-1-johan.oudinet@gmail.com>
References: <20220516131334.1910858-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 14/20] package/erlang-p1-mqtree: bump version to
 1.0.14
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
Cc: Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Johan Oudinet <johan.oudinet@gmail.com>
---
 package/erlang-p1-mqtree/erlang-p1-mqtree.hash | 2 +-
 package/erlang-p1-mqtree/erlang-p1-mqtree.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-mqtree/erlang-p1-mqtree.hash b/package/erlang-p1-mqtree/erlang-p1-mqtree.hash
index cf1a880cb8..b91a0cdaa0 100644
--- a/package/erlang-p1-mqtree/erlang-p1-mqtree.hash
+++ b/package/erlang-p1-mqtree/erlang-p1-mqtree.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4f86e272a97152d3f5166dad583dc1b5bda9582f6777f6294fb8328def8b2189  erlang-p1-mqtree-1.0.10.tar.gz
+sha256  b0b5506f43fd2ef8f72b3d5f42ece4dd22d872f9be2a9120affb7c6ae047597f  erlang-p1-mqtree-1.0.14.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/erlang-p1-mqtree/erlang-p1-mqtree.mk b/package/erlang-p1-mqtree/erlang-p1-mqtree.mk
index 19e31ef1b2..9e66bebbaa 100644
--- a/package/erlang-p1-mqtree/erlang-p1-mqtree.mk
+++ b/package/erlang-p1-mqtree/erlang-p1-mqtree.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_MQTREE_VERSION = 1.0.10
+ERLANG_P1_MQTREE_VERSION = 1.0.14
 ERLANG_P1_MQTREE_SITE = $(call github,processone,mqtree,$(ERLANG_P1_MQTREE_VERSION))
 ERLANG_P1_MQTREE_LICENSE = Apache-2.0
 ERLANG_P1_MQTREE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
