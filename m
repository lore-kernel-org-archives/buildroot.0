Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88912C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 14:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42C136112F;
	Wed,  5 Jun 2024 14:18:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jfpDVpRk59R5; Wed,  5 Jun 2024 14:18:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 010456139B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 010456139B;
	Wed,  5 Jun 2024 14:18:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C65C21BF23C
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 14:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B15841884
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 14:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y1Dof3s2gU4c for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 14:18:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 66FF34172A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 66FF34172A
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 66FF34172A
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 14:18:22 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-421208c97a2so60363925e9.1
 for <buildroot@buildroot.org>; Wed, 05 Jun 2024 07:18:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717597101; x=1718201901;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=/rcBGkVkCn1qvEBStLGbPnEqGwz9CBTqxCpM5OuU4nk=;
 b=QU5QJjBz+71sWEELHgPXAuwopgEl4mV+OYnwr/57XYvbjUaNgNlt/yyIgRJZBqjPIY
 uwxutS2dI8F3NRkn6A7Gv/LK0kprpQD56G5v+y4DI4LYrE97b/3XWqyCXdlc9ddYOa9q
 vYlc3lpuL45dLeMx6OqSt3hUFSb7gnRjn2zahVHqZ7+hJByRtl2UZRX2LwTYfwmyABQc
 paGjAnMV/9fyzzDIvdJs0NZRXOdRaC+WYW3+t+HKnOHp8mG+anrE8xchUZfwJ3KgJ3Ee
 T6pEJhysDH4DRFzhUJI4BahZaPdIpkN1VdGuD9PJsm5QwQw0tKl3W7AALQL2pLlbcPYY
 cyfg==
X-Gm-Message-State: AOJu0Yyf5LDCxC3cgTD27iYUrh0U6MIE3rj0bU6D/L5w7M4SkuP3La6L
 ZzxmwSLkTzHyAaTKleyAajH37CsYKN+ztb4VKAZnwY8nc2CNScJQtK19VA==
X-Google-Smtp-Source: AGHT+IGrshXvW4ZOAhjGVNAbCl1VZMTLZgllqTERaan12/2Y4x29OBYA6mgWS6DlzniWRAWz3Y0Ljw==
X-Received: by 2002:a05:600c:524d:b0:421:5237:786c with SMTP id
 5b1f17b1804b1-42156259c7emr22115095e9.0.1717597100920; 
 Wed, 05 Jun 2024 07:18:20 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42158149057sm24253925e9.36.2024.06.05.07.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jun 2024 07:18:20 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed,  5 Jun 2024 16:18:16 +0200
Message-ID: <e0b686dc7ac91465e02ba7d6e18635404a93ca24.1717597094.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <cover.1717597094.git.yann.morin.1998@free.fr>
References: <cover.1717597094.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1717597101; x=1718201901; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/rcBGkVkCn1qvEBStLGbPnEqGwz9CBTqxCpM5OuU4nk=;
 b=AT5B1VyiuEKQ6CSjay7/+ojFUzblGuzk8WTN2wHl3IoqV5frYJC1g9CKowB19FP5Qh
 lJvsXaWkC4PZzSC9PmHlb6M/Werl3oBrkaIpMW9Lp8Bs+l6z6gjkX82K0x1fU4sZzZEe
 jPUJWr6iDCUudj8D7K4dEQBkxwdOFW4UnUTHTvepXaQXphvCvY+AwvARr631MMb5yAai
 HVbgf1vn8XwprCACJiD4N4Hi/cTfUDj18dt50uiaX06VIScOtJk2HbbCbZywXiSgFHuQ
 Yidxx00yGSgf45skvGjuTJ+is555pyVQi1YBtiAJJa6ta4ol9+Zqk34rzp8Tl9fy/y+3
 6cBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=AT5B1Vyi
Subject: [Buildroot] [PATCH 8/9] support/scripts/apply-patches: use
 appropriate TAR
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Makefile.in              | 2 +-
 support/scripts/apply-patches.sh | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index f415e55f84..9dc66bc674 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -231,7 +231,7 @@ endif
 INSTALL := $(shell which install || type -p install)
 UNZIP := $(shell which unzip || type -p unzip) -q
 
-APPLY_PATCHES = PATH=$(HOST_DIR)/bin:$$PATH support/scripts/apply-patches.sh $(if $(QUIET),-s)
+APPLY_PATCHES = TAR=$(TAR) PATH=$(HOST_DIR)/bin:$$PATH support/scripts/apply-patches.sh $(if $(QUIET),-s)
 
 HOST_CPPFLAGS  = -I$(HOST_DIR)/include
 HOST_CFLAGS   ?= -O2
diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 6da83f6826..39a0c050d6 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -146,7 +146,7 @@ function scan_patchdir {
                 unpackedarchivedir="$builddir/.patches-$(basename $i)-unpacked"
                 rm -rf "$unpackedarchivedir" 2> /dev/null
                 mkdir "$unpackedarchivedir"
-                tar -C "$unpackedarchivedir" -xaf "${path}/$i"
+                $(TAR) -C "$unpackedarchivedir" -xaf "${path}/$i"
                 scan_patchdir "$unpackedarchivedir"
             else
                 apply_patch "$path" "$i"
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
