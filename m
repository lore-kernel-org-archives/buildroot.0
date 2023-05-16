Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C81C77B75
	for <buildroot@archiver.kernel.org>; Tue, 16 May 2023 13:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3A0EC61639;
	Tue, 16 May 2023 13:52:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3A0EC61639
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iv9ZxwejagHQ; Tue, 16 May 2023 13:52:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 652346162D;
	Tue, 16 May 2023 13:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 652346162D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 75EFC1BF255
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 13:51:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54EF241946
 for <buildroot@lists.busybox.net>; Tue, 16 May 2023 13:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54EF241946
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B6vaocjcPkac for <buildroot@lists.busybox.net>;
 Tue, 16 May 2023 13:51:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F54F41A3A
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5F54F41A3A
 for <buildroot@buildroot.org>; Tue, 16 May 2023 13:51:31 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3f42ba32e24so56509025e9.3
 for <buildroot@buildroot.org>; Tue, 16 May 2023 06:51:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684245089; x=1686837089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NDhpKRT4JtMzJKIlXqdR3tQG1Zxj680fZ64GOmnp5zY=;
 b=hmzGaxolL5hwd2U2AYD7eepVKKw23mVqU3DdHrNlfLoY3Wa1oYCGoJGluFrcZwXE6t
 1SVW8z+pYXPqeKnJUFimEBT9FyfEqJGVvdEsjCfQehAIVV+4ztS0D0j5Z/kt4i+mYNkx
 BfuD7zue+YXLrRPlPcJ1opM59D3CqUiNU2eyYdIQymRuIyabS0TVEt98B3aQICUydJ4Q
 G4nKkX+cZ+HWqyLDwE/527jxbeUozV4zbj+wetu+mVV0gdiGI3vbwO0EW2maqS7wAhYd
 H+jeYF6PpxTPlVMRJlyp2OCmWq6VbfHV+5OUwsTUqTzi8u3tTrSW5+Ug1W8zuXBiQq6h
 dHJQ==
X-Gm-Message-State: AC+VfDyNdZebGG+g90vYLKj7XW0vfWFpv0y/ah5U9b+e5KoQ6syBye4P
 o+SpJRHgPSW2G9sYnKqnqq01gxRxLzM=
X-Google-Smtp-Source: ACHHUZ668EMPnMJx0bma+QHNWKuRTEz4LmCgFM20BQ0A7/4fmwGz0JubpK9/FSQRFUqBsQJaLif/Nw==
X-Received: by 2002:a1c:7413:0:b0:3f4:bb58:d174 with SMTP id
 p19-20020a1c7413000000b003f4bb58d174mr15301049wmc.22.1684245089039; 
 Tue, 16 May 2023 06:51:29 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 r14-20020a5d494e000000b003063a92bbf5sm2682437wrs.70.2023.05.16.06.51.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 May 2023 06:51:28 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 May 2023 15:51:06 +0200
Message-Id: <20230516135107.238343-5-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230516135107.238343-1-romain.naour@gmail.com>
References: <20230516135107.238343-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684245089; x=1686837089;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NDhpKRT4JtMzJKIlXqdR3tQG1Zxj680fZ64GOmnp5zY=;
 b=RyxTO0ucaZVqyrk7mbE+R6ib/uxris7g7plCZxfOvUlZvZUxmDl+vnLDlD5+LFOkyj
 weTVaeJo6eNa0qqgQ5qXKr8dSeYcXAcCed3SAxKzjXL/znS/+nQioi1sGC5/prpsCB6A
 E/pwIHUI4xp6KpV0cX9ILzm9LnVHQ4xUPz0v5tF/ur0lVt7zXoyRULno4QK/iVshqbnl
 eAKIEVKdm6zFBtvlUsp9KMCh9ooQcOKByYf9NJ436dchdGIJ56kzSIdn3JB5a/5suYqx
 RuVWtoif+IxiTNHrzyRTUzU7PlzNWvS5O1X4G1qjsVwvQVs75OT3Vsb4i5dJ2c7taAto
 HgeA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=RyxTO0uc
Subject: [Buildroot] [PATCH 5/6] package/gcc: switch to gcc 12.x as the
 default
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Even if gcc 11 is still maintained for some time, switch to gcc 12.x
since it has been released since 2022-05-06 and gcc 13.x is available
since 2023-04-26.

We have been having toolchains in the autobuilders with gcc
12.x for a while, so the vast majority of the problems should have
already been solved.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 package/gcc/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 0cbc9166e0..b5503412aa 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -5,7 +5,7 @@ choice
 	default BR2_GCC_VERSION_ARC if BR2_GCC_VERSION_4_8_ARC # legacy
 	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_POWERPC_SPE if BR2_powerpc_SPE
-	default BR2_GCC_VERSION_11_X
+	default BR2_GCC_VERSION_12_X
 	help
 	  Select the version of gcc you wish to use.
 
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
