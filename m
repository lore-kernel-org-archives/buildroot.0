Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0B41C433FE
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 21:13:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94D3B40946;
	Mon, 10 Jan 2022 21:13:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U210g0AN6REV; Mon, 10 Jan 2022 21:13:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E09974032D;
	Mon, 10 Jan 2022 21:13:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 25CA61BF2B3
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 21:13:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10D104032D
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 21:13:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TLjslIhbrGHB for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 21:13:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 496554031F
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 21:13:26 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id 2so8435924ilj.4
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 13:13:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ydNxBMH+7czzH5cJllg35x0+qJxcStOPaMJm8fDFuR0=;
 b=qRqjI7p0mpXzqzYrdJUMlsd0dJXk6tmecZGS278R9avg18+fzX4AjvYEp9wFh0hFqZ
 pOURU49DPlC06+IvTZ5guo89i99gxI0u0HvpBnrRAyjLJN0Wd2v1SJNykI99NwzqNLlq
 TyN4czqlQIqpGns5X7n9EJrlHH5h/Ic+4GMrggIaXCALUxtkIqNyZjL9mO2xtTeEuM7D
 q+PrQKpsVEeLx3V1GuZdYCAcCnHzM7BUBZqDLGfciz7zxdPlMiBwHB7cQ9VwfRWtwvfy
 UkSYr0cpJj1Q8VcROMVbdIFOPaoJYTGUyhao89Yljix8ccgC4DFnNzJhm5LaMeReZe2j
 guXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ydNxBMH+7czzH5cJllg35x0+qJxcStOPaMJm8fDFuR0=;
 b=SOkTdy+r2sC5BtBIg1bzQTwojbFrHi4/mJM1s98VSLKu9ts1h3roj2qa3TCkppQEZj
 Rac71yg1aEx3p7Uov0jE8FceperNL0mpbjONFZli7PuAihtxhESgrZLkrCNYgcTnKXdd
 jyg8uu3ONJ9tKIsiDKZdxcyaGInZY9sePyMlnUg1Is7C5R6bu2+Pzao5Y1d1kKNTRQdu
 rEehgTYgV+Co6mMZiLs3+wxRI6mv40XTX+PiGHOTTu3rH/MJCTlaljDPJYG0uj+Vu9iw
 Vbqbq1/k1hoGSsHKylimi3Qn1tjLBoUYQFgUjjzliBr3Hf41K+TJIEk/8GOisSj2LPsI
 zUpg==
X-Gm-Message-State: AOAM532YJbFqxfZ3DmBypUSaJZR9D8/AmoUqOFx5CN64LiuMy+w7C4qW
 ot4N9prdj9Mecyl8oxcTK9amOnfEx/8=
X-Google-Smtp-Source: ABdhPJwVrBY2jc7N0bdxYIFbPqJbFIcGZ3GUCnDoLeDtd6EhNp6k3l7Xml4i5y0N7ig5mD4oYUhfiQ==
X-Received: by 2002:a92:db0f:: with SMTP id b15mr887233iln.45.1641849205115;
 Mon, 10 Jan 2022 13:13:25 -0800 (PST)
Received: from james-x399.localdomain (97-118-242-51.hlrn.qwest.net.
 [97.118.242.51])
 by smtp.gmail.com with ESMTPSA id n6sm3845921ili.60.2022.01.10.13.13.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Jan 2022 13:13:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 14:13:23 -0700
Message-Id: <20220110211323.1828141-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.61.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 02d8900003..c9be54be05 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.60.3/meson-0.60.3.tar.gz.asc
-sha256  87ca5fa9358a01864529392bd64e027158eb94afca7c7766b1866ef27eccb98e  meson-0.60.3.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.61.0/meson-0.61.0.tar.gz.asc
+sha256  ea9f33246b1f23f02e90a50e75e0f41e526f6dabf0c24f3e00e27a3f5abdc35c  meson-0.61.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index e8443eacba..e63dc725bf 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.60.3
+MESON_VERSION = 0.61.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
