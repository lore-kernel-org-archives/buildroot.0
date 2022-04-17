Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD30BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Apr 2022 08:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4BB23611F1;
	Sun, 17 Apr 2022 08:28:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4FaUqKyTuna1; Sun, 17 Apr 2022 08:28:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60FA4611EE;
	Sun, 17 Apr 2022 08:28:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5943A1BF286
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 08:28:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 477068426E
 for <buildroot@lists.busybox.net>; Sun, 17 Apr 2022 08:28:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JJBbVcSix3d3 for <buildroot@lists.busybox.net>;
 Sun, 17 Apr 2022 08:28:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4648C8426D
 for <buildroot@busybox.net>; Sun, 17 Apr 2022 08:28:19 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id b19so15364799wrh.11
 for <buildroot@busybox.net>; Sun, 17 Apr 2022 01:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C98HnnYY7kYQkxyX8+xEMB6IJVmaH2XUT7hlSwrg6Aw=;
 b=D/yLj2N81np5D+jHS3XkbB+Msek61HT8kaE5LD2OU+5e9KjCZed0JXhRZrBg8fm2Ko
 6zokpm0APpND73qJ5veVafHMV4m93/vNcLoFHLdYTwYCy+ydh/SU9UJwvCGbM2VW1KDP
 76BpP4ViC6u7ZcQ3MDX5j44KmTzdKLU5gKyYtB9WwoonudR+vGxDtD2BzL1IfVgHDxhm
 SNI/xTTtBYMasp8/WWUA9XXHNRhtdQ6qaXQZdVl8Ip14Ul6rNhFg0iCzJAp8viKt8Nzc
 4cjsMKCQI/QQ6jUq4FVKcPUNMTrexNNgLeCZt5R1ulHRiniWOXO04VASEFzPqpVUf/e0
 dxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C98HnnYY7kYQkxyX8+xEMB6IJVmaH2XUT7hlSwrg6Aw=;
 b=ATyNu5C87kpYsk/paPW8wyJRELhQdqi660G5SveeyPayZ2sjJb/6aqwMEpGUtmeCsK
 QVg4IpvK9Ctod7aqnxIf/MNsEtIzo8gMD+YiNrZkoRQfonG49DBsBSWp+C8TFMqSI4Ph
 AFW2bh/PdqNNR1gbaLF0n8iqoPsu45dGYrOKPM/iNHwSXZBAMrUsIdP2MI0iMoJFlUf2
 k5s305Wa4Z0JZGZMEsLnQDpWCym3A6P/Y8Eu93YGtDADWSdXaFfx1uI5x/Q7xzYD7jPE
 63yfOYi9ZHPMyj/LeimEnrWaHPn5augRGi+suLuhdFBmjJD3AVtXvMoIELNAQcmA3BKI
 UlXg==
X-Gm-Message-State: AOAM530/HbLdsp6WVqBsACXmO/+aO66g5NG8YNWeQ7CjOTNgoUgufby7
 tWAikY0JPqh62AbZs8+u9s1xLrtaCqI=
X-Google-Smtp-Source: ABdhPJysod4O0HvmwrOqsEvyNc4smHIshFh3V01CAOW1Qz2zBvp9Ho+y7t98gWbWlHTh6xyeb5605A==
X-Received: by 2002:a05:6000:1ace:b0:203:d465:1a83 with SMTP id
 i14-20020a0560001ace00b00203d4651a83mr4724111wry.26.1650184097805; 
 Sun, 17 Apr 2022 01:28:17 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056000184800b0020a8c9b56d7sm2206056wri.113.2022.04.17.01.28.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Apr 2022 01:28:17 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun, 17 Apr 2022 10:28:00 +0200
Message-Id: <20220417082800.2742525-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/luarocks: bump to version 3.9.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/luarocks/luarocks.hash | 2 +-
 package/luarocks/luarocks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/luarocks/luarocks.hash b/package/luarocks/luarocks.hash
index d80e08a20..14809402d 100644
--- a/package/luarocks/luarocks.hash
+++ b/package/luarocks/luarocks.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  56ab9b90f5acbc42eb7a94cf482e6c058a63e8a1effdf572b8b2a6323a06d923  luarocks-3.8.0.tar.gz
+sha256  5e840f0224891de96be4139e9475d3b1de7af3a32b95c1bdf05394563c60175f  luarocks-3.9.0.tar.gz
 sha256  542ad0ee9b8ba582437ca7b4d0959c9b9432f25d2067f144d017188a7a84dd2f  COPYING
diff --git a/package/luarocks/luarocks.mk b/package/luarocks/luarocks.mk
index 028e144e2..b28a1bd57 100644
--- a/package/luarocks/luarocks.mk
+++ b/package/luarocks/luarocks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUAROCKS_VERSION = 3.8.0
+LUAROCKS_VERSION = 3.9.0
 LUAROCKS_SITE = https://luarocks.org/releases
 LUAROCKS_LICENSE = MIT
 LUAROCKS_LICENSE_FILES = COPYING
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
