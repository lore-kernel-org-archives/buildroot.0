Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 532BEC433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 13:08:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09994814B4;
	Sun,  9 Jan 2022 13:08:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gMymigOw4xMh; Sun,  9 Jan 2022 13:08:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6448481750;
	Sun,  9 Jan 2022 13:08:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 006611BF4D7
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:08:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E330681750
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:08:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w3b8KKd2Hs3D for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 13:08:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D90A3814B4
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 13:08:45 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id t28so14772854wrb.4
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 05:08:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hbchzFgBnnmzLsnoH899BLW5D5VQBOjwJGStYtenoNE=;
 b=iP4peVY0rVu/sWuPF/Z3qoxRIOLuAqrFXU7942t7lQ7RwtgCbmPXHMKRssAtM92izt
 p3ITQ8tN/Dkgrw+jYDZtpuv8usdYdl0u8aDfgTK75GZ0pUe3iPkLgglsDn0p4Q5q+vGF
 jTq1tbtDxp1WrB5V0zUnwMr/QFnqtjYBOjBfNVG7QODA+tpwjVsuHdLQKZuQ44+KQGwZ
 SZX8T92pwX++WyJt2wJlhv0FFCdziF0HnGbTOTCgzQUjrPlGdiGvQipmlWfkFVq6DWv3
 bjoMyWtXXCKQFoLVEQ+S0a+WN79E15OCnXSD1+eJuoo5/7qCC+jGGKuqmcAjIUm3QudD
 a62A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hbchzFgBnnmzLsnoH899BLW5D5VQBOjwJGStYtenoNE=;
 b=HnmMyXedsN1vZzHs0e3hUg/8ZpaVtONZFu5QN6yMALPcf9TTP7cVG9TdSU/7OAOcdY
 S7z62lgtB6c9IwWXOWadJsZzQLO44Jrq89AfyJwku5DjHlgilnDNC6hciOrhCUMUuEcM
 N+LJZFUcC/CSbvUw6yR9zxPTTk3rnnI9dMVcFvM5PjjDfLB6Qs6MfEta5VK8cDtDra4B
 kReVPcUis5rI84aIOF1/FyHtbRELU6Fvr8tJjmwvYSuRMiw0qGgjMfEdl56OI+CNpjWo
 aybZ8xGNrGnCeSiv/3MnjWgT3PwRr6Xhgbfqk8QRMmpIZfoL5IpEr5/8mhcMH82gCSGM
 GS3g==
X-Gm-Message-State: AOAM530O63eB3RCrtT4kbT8Y8kk4dCcMzE6JSz3IOlJcW8bpRuq2xZA+
 jWNzfy61lxb/Z11kGCTupDp9kkezikY=
X-Google-Smtp-Source: ABdhPJzXElKgLOvjdjWz1aNQUcWukncDMFFh371eJBC2xh3UYOZ+ptDvoLCHfcNwBL3lcPKSCyKV9w==
X-Received: by 2002:a5d:6dc6:: with SMTP id d6mr57708313wrz.458.1641733724087; 
 Sun, 09 Jan 2022 05:08:44 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id b14sm4112555wrg.15.2022.01.09.05.08.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 05:08:43 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 14:07:32 +0100
Message-Id: <20220109130732.430160-2-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220109130732.430160-1-fontaine.fabrice@gmail.com>
References: <20220109130732.430160-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/gupnp-av: bump to version 0.14.0
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Rahul Bedarkar <rahulbedarkar89@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://gitlab.gnome.org/GNOME/gupnp-av/-/blob/gupnp-av-0.14.0/NEWS

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/gupnp-av/gupnp-av.hash | 4 ++--
 package/gupnp-av/gupnp-av.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gupnp-av/gupnp-av.hash b/package/gupnp-av/gupnp-av.hash
index 570f8ab3d0..ceab42ef52 100644
--- a/package/gupnp-av/gupnp-av.hash
+++ b/package/gupnp-av/gupnp-av.hash
@@ -1,5 +1,5 @@
-# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-av/0.13/gupnp-av-0.13.0.sha256sum:
-sha256  578b8f562b0f7e908416a41efbe2b7e6b892cd2ed7eac61ac63c48fdc8d7e6c8  gupnp-av-0.13.0.tar.xz
+# Hash from: http://ftp.gnome.org/pub/gnome/sources/gupnp-av/0.14/gupnp-av-0.14.0.sha256sum:
+sha256  20aed546fc882e78a3f186a0c8bce5c841cc3a44b7ea528298fbdc82596fb156  gupnp-av-0.14.0.tar.xz
 
 # Hash for license file:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/gupnp-av/gupnp-av.mk b/package/gupnp-av/gupnp-av.mk
index c2d3c3ba18..655de87608 100644
--- a/package/gupnp-av/gupnp-av.mk
+++ b/package/gupnp-av/gupnp-av.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GUPNP_AV_VERSION_MAJOR = 0.13
+GUPNP_AV_VERSION_MAJOR = 0.14
 GUPNP_AV_VERSION = $(GUPNP_AV_VERSION_MAJOR).0
 GUPNP_AV_SOURCE = gupnp-av-$(GUPNP_AV_VERSION).tar.xz
 GUPNP_AV_SITE = http://ftp.gnome.org/pub/gnome/sources/gupnp-av/$(GUPNP_AV_VERSION_MAJOR)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
