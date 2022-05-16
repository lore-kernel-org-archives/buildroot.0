Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11775C433FE
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 13:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C45F241843;
	Mon, 16 May 2022 13:14:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v1qCGoO04-JX; Mon, 16 May 2022 13:14:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A8B104183E;
	Mon, 16 May 2022 13:14:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C03DF1BF37E
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BD6A66106B
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:13:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id utKmgoPK3yMi for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 13:13:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 13EC061065
 for <buildroot@buildroot.org>; Mon, 16 May 2022 13:13:55 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id w4so20436017wrg.12
 for <buildroot@buildroot.org>; Mon, 16 May 2022 06:13:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WZaH2E9Nca2CNwqixOH5cHpOxAJS48vCjaS7Tyn1l2c=;
 b=kj8mbH3i+p52zvYRSI87VIPxDImUUR+5i3KSCraUeMqq0y+7ntdSs9sAv5QY8I7NUi
 k3r//OK1xYth5n54cuj6n4mJJTUf+XVebllzIS0TpM4I61+bK3yFIlhXi1w6NBtlWWSd
 P+DC4tjSMg1xZIduieIcZ5izIrZrPq44+3rms+hbR5LPTuoxF8DiQk8312JchMTyxwfJ
 Rd2IUCPibvL6SbJp/jBfsnN3WWsgJLEQhitsyK0XNdWAoAkXCdS1ScHg9KJq35AkUIZ6
 R3776xUiZg24yqSfOZYPHZlV3kGHymdxqcsgpMVKinvS5NK/lPVThxPukeYLopA70GD9
 s12Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WZaH2E9Nca2CNwqixOH5cHpOxAJS48vCjaS7Tyn1l2c=;
 b=s9pr1jrSxSxcGQF2KS85dTPn/bW8Yd94CsroJIprxOVSevxCskkCN66KpcEqySC46Z
 rLi9YnFe+uz/vI+3ka5ARLJpSY3zRUKgLYku/zBLuPe7YQ601b32MLTHnLSvk/zmse4h
 27ZcBw4BxF4nXdJ9SSBL8WqlTJdW0/j8YOw9t9weHD7D96N8qJjuRjLotWZOHSA9E0nk
 AXdp0tqdkh136shNwKkGElZgXgWtx6WmjDg8G8bjJbXSgyGUil155f/tuH1awdjDGnKm
 s8R8/XME5+XdJ0gtTnifr54Sc4/v2pGlyQhvxk7G/vJtoenDglmOt2HmCVIp+GH8pkd8
 yFAg==
X-Gm-Message-State: AOAM5334dgEUkcP7KOZVni/U/f8fM45iwLM8qpN3ljIiU0xcHt74W5UD
 zt5BjyM3uSpQsUFjxMpFoN55PhZ3q7I=
X-Google-Smtp-Source: ABdhPJyDEK3SK3wx9NFbwhmGefZ5Frv4HxtMknp+0X9dd/OYFGS+MGoqYm9ftffKLR0I7uUPURaj4Q==
X-Received: by 2002:a5d:6c68:0:b0:20c:7246:a86 with SMTP id
 r8-20020a5d6c68000000b0020c72460a86mr13957961wrz.283.1652706834057; 
 Mon, 16 May 2022 06:13:54 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm13023789wmb.42.2022.05.16.06.13.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:13:53 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 15:13:18 +0200
Message-Id: <20220516131334.1910858-5-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220516131334.1910858-1-johan.oudinet@gmail.com>
References: <20220516131334.1910858-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 04/20] package/erlang-p1-cache-tab: bump version
 to 1.0.29
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
 package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash | 2 +-
 package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash
index 85a92cf0b2..9f03bdbfae 100644
--- a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash
+++ b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  32cb3a3017f53e66bd1c2b75f60a2c4a14f00f375582a3c511ea39266b2385b9  erlang-p1-cache-tab-1.0.25.tar.gz
+sha256  b11299eebafab6f1f5670650c48b10d9fa607ab092b4be8a976982e3f2b37526  erlang-p1-cache-tab-1.0.29.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
index f3253d1cd7..046235f24c 100644
--- a/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
+++ b/package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_P1_CACHE_TAB_VERSION = 1.0.25
+ERLANG_P1_CACHE_TAB_VERSION = 1.0.29
 ERLANG_P1_CACHE_TAB_SITE = $(call github,processone,cache_tab,$(ERLANG_P1_CACHE_TAB_VERSION))
 ERLANG_P1_CACHE_TAB_LICENSE = Apache-2.0
 ERLANG_P1_CACHE_TAB_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
