Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B39B5C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Feb 2022 20:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 48DB360BEA;
	Wed, 16 Feb 2022 20:46:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jmt480cNIwsf; Wed, 16 Feb 2022 20:46:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7E0DE60B6A;
	Wed, 16 Feb 2022 20:46:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1901D1BF425
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 065DC41775
 for <buildroot@lists.busybox.net>; Wed, 16 Feb 2022 20:46:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fLdq28o9vJ6c for <buildroot@lists.busybox.net>;
 Wed, 16 Feb 2022 20:46:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1470341715
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 20:46:27 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 j9-20020a05600c190900b0037bff8a24ebso4600454wmq.4
 for <buildroot@buildroot.org>; Wed, 16 Feb 2022 12:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=emAIs7AhONyc/0fNSOb+/cuTpMq7FMsIPdQbQUce8Zg=;
 b=LR6NtOopRIECz3df/MpHXPSgHFBYxJJ7psUEKWGbyopHFWJBoFoLUbEHk2XlLdaqpF
 1oFzSDPlHer0ZiTm5xlXcIzspAuDZe+V2Tcs0jTABMhwgHJSMBWKiCTKpzRLtcthsvEl
 VJ3rlztKT7O7QfGRDLbVdJC/aLQxAuzTpS80SA2XfQxrYcj2TvWHldFDLBsifS6nhFxg
 dPEdTfBxBb27GZ2q5Z1zwC8hRCITIm/PWcw1VFOt2lJeMS6tRFruFkjBSxnCCXwDZSpj
 w3nMx3oEe9Qo5SjRpaNG7j8tIkezGWVJyXgCZ0R5vqIlFonFPq9vBN0Itd9LJi5luGBg
 GIhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=emAIs7AhONyc/0fNSOb+/cuTpMq7FMsIPdQbQUce8Zg=;
 b=rTnrL2h3tk0NCyrSZF3dQdCFu0qm/SDMh1aF3vtNvocgE8OHB/5KFVSJM3S5Z+klUU
 yd3eWY5bR8sJ+ywOM/VCOlaP3LAVpBvMHt6HkigMWY/ZcXJ0KbX9v3q0s0YsQdCWbK8v
 al30v+rsOFmQU2cjeBwHVyZJ4UJiyga4IeEHx6lS0/1SDG1hDnzIcAWHEaNOBoVq9zRZ
 aIuYoxAsVA8My3phmoBYDGM2DhQt2B4omAWeUqiumYj89iSYLucxMhkjtKNe8rHVeQgs
 UaMmTco53ZmXZxcmKQKSWwwc6BJXx0mqJzSAAL9I33pwe72aaUewfQ3e7CIjd5Yarial
 UksA==
X-Gm-Message-State: AOAM530mA1kUpYFonOYDwvdHlSVBjTsfiw0/9C/3SQZwT3vaU+K/Zews
 OHAZj6AdcTkLbSXaPP7PCuNGUo7tu4c=
X-Google-Smtp-Source: ABdhPJw3CWGv2umJXrcj0mhx4xwRmJWsu/cAcicTuhARNgpUJwG+z/UYBBOBs8j7FfoONETN9TjV+Q==
X-Received: by 2002:a05:600c:14d5:b0:37c:2f5d:a396 with SMTP id
 i21-20020a05600c14d500b0037c2f5da396mr3117178wmh.77.1645044385897; 
 Wed, 16 Feb 2022 12:46:25 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id d12sm28244855wrx.47.2022.02.16.12.46.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 12:46:25 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 16 Feb 2022 21:45:38 +0100
Message-Id: <20220216204538.2450673-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dialog: bump to version 1.3-20220117
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

https://invisible-mirror.net/dialog/CHANGES.html#index-t20220117

Fixes:
 - https://bugs.buildroot.org/show_bug.cgi?id=14596

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dialog/dialog.hash | 2 +-
 package/dialog/dialog.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dialog/dialog.hash b/package/dialog/dialog.hash
index 2286590b66..3136d18b2b 100644
--- a/package/dialog/dialog.hash
+++ b/package/dialog/dialog.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  466163e8b97c2b7709d00389199add3156bd813f60ccb0335d0a30f2d4a17f99  dialog-1.3-20200327.tgz
+sha256  754cb6bf7dc6a9ac5c1f80c13caa4d976e30a5a6e8b46f17b3bb9b080c31041f  dialog-1.3-20220117.tgz
 # Locally computed
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  COPYING
diff --git a/package/dialog/dialog.mk b/package/dialog/dialog.mk
index 1c98d354e3..681f8ec9fe 100644
--- a/package/dialog/dialog.mk
+++ b/package/dialog/dialog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DIALOG_VERSION = 1.3-20200327
+DIALOG_VERSION = 1.3-20220117
 DIALOG_SOURCE = dialog-$(DIALOG_VERSION).tgz
 DIALOG_SITE = https://invisible-mirror.net/archives/dialog
 DIALOG_CONF_OPTS = --with-ncurses --with-curses-dir=$(STAGING_DIR)/usr \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
