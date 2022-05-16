Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 826ECC433F5
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 13:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C86981431;
	Mon, 16 May 2022 13:16:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AX0eJK8Ov3FH; Mon, 16 May 2022 13:16:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73BC381298;
	Mon, 16 May 2022 13:16:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B0E1F1BF37E
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CED4782C8E
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 13:14:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j5OIeEy2cyzO for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 13:14:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0580A82CB7
 for <buildroot@buildroot.org>; Mon, 16 May 2022 13:14:07 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id u3so20507930wrg.3
 for <buildroot@buildroot.org>; Mon, 16 May 2022 06:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6wB/0v8rU8RjHypnW1qOXl6fZkO1iPfMhwvDHKJOwsQ=;
 b=dqC42LqssIh4cPAsAyO67k4VUw80hZwy5wyto5Vi0QQbGfYjripl5NL0UZVglKdZgy
 bKVMhZZX84fBj/Cky38kKVs8CC3mIgBHVAfpqTpSnDUf/QppFz00feNS2RZv8IhJnDxR
 X0/keWYwboyyGX2XlGe0sszo8fUrfRiOVIP1dyU6ZA0QrVuQuG+mJ0FaXkvqc9zFxjXw
 CtWBj1iXH1mVpY4EHPiMYJO0zCl5gHffL6Nl/xGn5P2uwATLHQ92jx/2vu5CQ4mWVVPu
 tvHtTzhddxOGKqIxAGfa0OqxE/SwcTwBnbYMVVNSgy8ezpvJzO3ez6vCiKHKXojbezhg
 3Qpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6wB/0v8rU8RjHypnW1qOXl6fZkO1iPfMhwvDHKJOwsQ=;
 b=Rc19D2rJMH53AAZ6LjMhN6+bGtvvEd6VjgG/CnP9Xj/IUWIc2owxkloWuni6jwmS2/
 xlJQkTe40bMpDSjOPBg15Mn6tNV34Ubwy52KhF8bE9fymGOHRa/MmzTPwTkr5z8bLS/A
 8zyDeYcabhtFbJ8MWPjJoAmtAI7X+1L1DAmjqtxe5KWH8rKT7FUtg3YCzZMiYupbs0Xw
 T6IbLk+MvNQNFUtGAp30LJBccP93vBWKy/gJ3FAK+NCfALjKq2Pbzktmn4CSr4hUIoY1
 WVxjAYiqY1ndYZAdlcaEMQ5ByVCa4X3YnnuooqTBddAMUYw5E0DXajUQuqwE9QPv8mNr
 hw+w==
X-Gm-Message-State: AOAM531wBKzobPbntEy2g+ptbzKO+lHISk0ZW+dd34RsPadUjlQZZqU7
 1nFzcGCq/4lqKgOxf8RV3V34YWxi5yI=
X-Google-Smtp-Source: ABdhPJyiY1/07MEcuo3uu9iaBlZ5OhiAd0dIPvIMkSfhuIgUIFHPJyWNmkn+lq0EmNWKiij3JABCBQ==
X-Received: by 2002:adf:e195:0:b0:20d:110c:b890 with SMTP id
 az21-20020adfe195000000b0020d110cb890mr1204792wrb.232.1652706846414; 
 Mon, 16 May 2022 06:14:06 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 ay41-20020a05600c1e2900b003942a244f51sm13023789wmb.42.2022.05.16.06.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 May 2022 06:14:06 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 16 May 2022 15:13:27 +0200
Message-Id: <20220516131334.1910858-14-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220516131334.1910858-1-johan.oudinet@gmail.com>
References: <20220516131334.1910858-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 13/20] package/erlang-eimp: bump version to
 1.0.21
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
 package/erlang-eimp/erlang-eimp.hash | 2 +-
 package/erlang-eimp/erlang-eimp.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/erlang-eimp/erlang-eimp.hash b/package/erlang-eimp/erlang-eimp.hash
index 28d22be16d..5845815c60 100644
--- a/package/erlang-eimp/erlang-eimp.hash
+++ b/package/erlang-eimp/erlang-eimp.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1a529fa6e8264d3cad43861db417a1e841b28c0601aa847857fa0d6a81935922  erlang-eimp-1.0.17.tar.gz
+sha256  25e4e1178280d6fb98ee5e582ade393f7c5404c546638bcde86a6ebcb6757d90  erlang-eimp-1.0.21.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-eimp/erlang-eimp.mk b/package/erlang-eimp/erlang-eimp.mk
index d066961cd3..27bb2203c2 100644
--- a/package/erlang-eimp/erlang-eimp.mk
+++ b/package/erlang-eimp/erlang-eimp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ERLANG_EIMP_VERSION = 1.0.17
+ERLANG_EIMP_VERSION = 1.0.21
 ERLANG_EIMP_SITE = $(call github,processone,eimp,$(ERLANG_EIMP_VERSION))
 ERLANG_EIMP_LICENSE = Apache-2.0
 ERLANG_EIMP_LICENSE_FILES = LICENSE.txt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
