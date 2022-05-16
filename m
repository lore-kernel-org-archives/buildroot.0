Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE8EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 13:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 272D961072;
	Mon, 16 May 2022 13:14:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sxpVREYTAKxo; Mon, 16 May 2022 13:14:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 364C361078;
	Mon, 16 May 2022 13:14:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8B5951BF37E
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A02E6106B
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:13:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eFocHT7UJbUl for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 13:13:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4C32861065
 for <buildroot@buildroot.org>; Mon, 16 May 2022 13:13:53 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t6so20490314wra.4
 for <buildroot@buildroot.org>; Mon, 16 May 2022 06:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9V/0gtswYckWqA85KnnovJxN47E2AA4O8ddVZ8Pk28g=;
 b=hwYcbB2w5uYvknmzKBkfK8mXysAPBy90zlCMwVWwcirI8/j19wG0kvylEdX30E/prz
 hBquZAj1msWCB92ta9OHzxmruYoicx6uCeBS5gSwHsIq3fyOBB4ZzCXSHbVPOHCbqq33
 RE9ORIVr9SYGEKvuAV5KzC6HC4GfLf5WVcnkJETvmxabJw0QTSTxJ4vkw1JrtOPbq3Rj
 sIYlfuHsJkvq/ZtScAFBym7EajTxJlVuxuJXmywF038AsqM/tJI91BJufGaT+2QIH15M
 cXueBwbBR5g0oXJYxZh+Vy7pQm8bNmYe0GJBTM4bOcqIqhuUI/2T4ervLVammEjl0kSA
 zElw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9V/0gtswYckWqA85KnnovJxN47E2AA4O8ddVZ8Pk28g=;
 b=vzhTA5wXUrb4/tJQN4XJ0d7qOVipeV27/mirP4U3C1cuTO65AF9tqH6bmoZRBKypKU
 b8BjwvH0TuOaLqKCzBV+A+tbHotcuWdfA0p5v9kcL0NJf1VRWL8P0a8MCnBvQ5U0oEmb
 ajjaZ8amIIXMqgM8bnfZkX1LfxZkORRHtrOZdi5HK9woBT4GswZ6ElRw/rD+FdWlHJDt
 QRn47zsE39RjnMi7M4GEKJ/TGIT75S43N2eGycX0F+OfBPkBYvHp88omYkxtMFBTYpjG
 kRmMy3oAEiH8QZrUOVvK9Z1Z6SJV/nuWj7f95Rgn+/mLyl39fzYklso4R7YSiU228Po/
 /MNg==
X-Gm-Message-State: AOAM531ZASSDlOQBMAB6F1Lulg0zVb48t0hJxDbV2gZZYOMgWWQPZLz5
 hu777Ask5CzycNOVN7qhYiNAbQYY2H4=
X-Google-Smtp-Source: ABdhPJwzt69ZTcJyX1lr6HDGIhNojbX2lvL1d7lzKlibSG0t0uhhX5fExUDesdm054OErtJdSkn0Jg==
X-Received: by 2002:a05:6000:2cd:b0:20c:5ff6:1816 with SMTP id
 o13-20020a05600002cd00b0020c5ff61816mr13860882wry.336.1652706831073; 
 Mon, 16 May 2022 06:13:51 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm13023789wmb.42.2022.05.16.06.13.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:13:50 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 15:13:16 +0200
Message-Id: <20220516131334.1910858-3-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220516131334.1910858-1-johan.oudinet@gmail.com>
References: <20220516131334.1910858-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 02/20] package/erlang-lager: bump version to
 3.9.1
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
 package/erlang-lager/erlang-lager.hash | 4 ++--
 package/erlang-lager/erlang-lager.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/erlang-lager/erlang-lager.hash b/package/erlang-lager/erlang-lager.hash
index 40291af392..282d112d3b 100644
--- a/package/erlang-lager/erlang-lager.hash
+++ b/package/erlang-lager/erlang-lager.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 c5bb4ba6f918e90d2e6671c3996d72c61f2a589b65c151b3df8011d046362981 erlang-lager-3.6.10.tar.gz
-sha256 809fa1ed21450f59827d1e9aec720bbc4b687434fa22283c6cb5dd82a47ab9c0 LICENSE
+sha256  13316ba3006b174cf6b085ad13ed19ec0f618f10b83fc3530a072cdf4b50668b  erlang-lager-3.9.1.tar.gz
+sha256  809fa1ed21450f59827d1e9aec720bbc4b687434fa22283c6cb5dd82a47ab9c0  LICENSE
diff --git a/package/erlang-lager/erlang-lager.mk b/package/erlang-lager/erlang-lager.mk
index a698bce8d5..7ff27ec0f2 100644
--- a/package/erlang-lager/erlang-lager.mk
+++ b/package/erlang-lager/erlang-lager.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_LAGER_VERSION = 3.6.10
+ERLANG_LAGER_VERSION = 3.9.1
 ERLANG_LAGER_SITE = $(call github,erlang-lager,lager,$(ERLANG_LAGER_VERSION))
 ERLANG_LAGER_LICENSE = Apache-2.0
 ERLANG_LAGER_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
