Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDDAC433F5
	for <buildroot@archiver.kernel.org>; Thu, 19 May 2022 14:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FC8B81D11;
	Thu, 19 May 2022 14:11:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aMFaSX2y71sq; Thu, 19 May 2022 14:11:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6DD7781A12;
	Thu, 19 May 2022 14:11:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0AC701BF3CE
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EDF868426E
 for <buildroot@lists.busybox.net>; Thu, 19 May 2022 14:08:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3rULIlhrrkwp for <buildroot@lists.busybox.net>;
 Thu, 19 May 2022 14:08:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47AB284338
 for <buildroot@buildroot.org>; Thu, 19 May 2022 14:08:46 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 a14-20020a7bc1ce000000b00393fb52a386so5088038wmj.1
 for <buildroot@buildroot.org>; Thu, 19 May 2022 07:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qVu04SENFdHTKJnSMPQcVrcifAW9CqmNfc0s2u6ub3E=;
 b=H6rGZ4fHMy57USlXP0eRbjvFAze68haE0sBtHqrIo6K4isnTtebjsXk84HnZ+yG8DO
 bySrP80lp/k9raxL4jku7dTBTX1u6T40838pRQRcv4b0KIccEvEUJyJ1qBqy8LkoZz/3
 C5I8WxSvBF00J2CP2PjgZfHNVEh0eO7pYE3+DFZV2AFXl1tIYkaNgdJFzE7f7/4eSzKF
 7M4eZyOfVKF5PXiNZLoFu4acthcJW3qwgCaLvGmBEMtFF7ezrtfxJV5NCPdX4F92rnWo
 2PnanXTwtm3X0y50bho0Da8sCQAYS0bi3CedaMnfJtK9VmAGtpV+XIuIvAY1o5g1LLMu
 mhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qVu04SENFdHTKJnSMPQcVrcifAW9CqmNfc0s2u6ub3E=;
 b=GBm+dq5DBD1YnCSyHyDNrLVL+Z86m4mi3wN7ZlBK82MR4hubf8jUV52tA4Ag0EGYws
 qK5e+2OQbaZVt06QdutrMwtRzq2Uz+k4FZD7hEbklVaE1hZibQOuaIHJ5Ri8BOPXhwYO
 cHkZ0Hc/5fDZgS753m51C2kJdS1W+oa6TPLkXINOc/BxePkJqzCoQZsXvWQc+pu3wnIX
 /iN7voQLEzxKAN3Wl9hOgn704TlOIMD1punYUwcpMnUnb+9XDQi63XH3j5waygRnTOSl
 driSwc0v3XtITxa6xWI3G5dN9v2n1cksi3xfR4txI8PpiaBJoxDztKqHOLrpd9gscIPm
 ca8Q==
X-Gm-Message-State: AOAM532/fw8CAjlGXAkWXXjxvNkp2u8g/Vow/u2FZcUDbmGin0SJ2O6X
 ahFFnR9nMRj5C9QBbjMqR4X56eJAcIc=
X-Google-Smtp-Source: ABdhPJxQxHoqPPVMG27fCNuLEIclXkcHsAjEeS6GTzDivmlr+PJfgSNWG7S7weI1hW/CsreqrpMZuQ==
X-Received: by 2002:a05:600c:5026:b0:394:92b4:7486 with SMTP id
 n38-20020a05600c502600b0039492b47486mr3948538wmr.65.1652969324262; 
 Thu, 19 May 2022 07:08:44 -0700 (PDT)
Received: from shrek2.. (lmontsouris-659-1-42-116.w92-154.abo.wanadoo.fr.
 [92.154.77.116]) by smtp.gmail.com with ESMTPSA id
 f18-20020adfb612000000b0020d00174eabsm4790214wre.94.2022.05.19.07.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 May 2022 07:08:43 -0700 (PDT)
From: Johan Oudinet <johan.oudinet@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 19 May 2022 16:08:04 +0200
Message-Id: <20220519140810.1953601-15-johan.oudinet@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220519140810.1953601-1-johan.oudinet@gmail.com>
References: <20220519140810.1953601-1-johan.oudinet@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 14/20] package/erlang-p1-mqtree: bump version
 to 1.0.14
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
