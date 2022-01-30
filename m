Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81FBFC433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 21:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3611060E8A;
	Sun, 30 Jan 2022 21:57:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6UwDDfpC3giQ; Sun, 30 Jan 2022 21:57:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 817C4607B0;
	Sun, 30 Jan 2022 21:57:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B0E6E1BF3E3
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 21:57:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E901409BC
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 21:57:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1PhgoYbwIsS4 for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 21:57:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CE19B40922
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 21:57:32 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id z7so10072562ilb.6
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 13:57:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5kmS6+OT7wc+3qgJNYlQskJ/YbjdKg82cPg8LAWpCnc=;
 b=oPonr75xm7CsfGmAGPs+667hY7fkk02I+QjGW8gDoZs5CYItFJ88xRZ+DKPuGJfgpA
 lnDclr/G9J4NdeocE/cX33oWLmZR0g5COouLvsnzAkbA6CkROasn4nx8Haoo7ha7oMpq
 gmteOGp9SCt3Ypxy/OM/L3dkTnSmr6aQkcrL+Z1vpO+CZr/467IsnuuiPPm4UfQU7o6N
 i2IukHMXSwTRsrYdVd37XvtitHfbGctavZ2g0f8sYzC0C+inohRtBJhaI3Ka91/HxXxK
 +I3oq7fU12Py2V+NfXdDirlaLIyqEZl4Kg1VFubfszQA/9EQ6J6irh5zzWQiK78tpXRQ
 ncXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5kmS6+OT7wc+3qgJNYlQskJ/YbjdKg82cPg8LAWpCnc=;
 b=qqBeDybc61dWzT9kkeP/nMUmhHk5XydAnCxUczP79+mhbnMoCoQWqJvpJR3lG91Zsb
 cQV3bGGuliRkq564l7FzqjkbcaL0j+WA88Sb9MGDhwcOLpFAph1ZbFV3Nw6FaePTvSsQ
 4eRxZndYYfKKHBElURKnWwjfFEIPUATIRd36DFTangJgJfghvCdoQjgZ395U2v0zpFXB
 e0LeA18vbSpWIJY5NvBZYw64f6lgRwfQ2/fixiqa2SyN3biDn+nzlzqVEQZMJmQe8ETQ
 Bbru0yLM+64fOmPefslJGgULOLGOXTYBIoZhM7YjdfCbAqU47M8hB+okPipf/6+Z3d6L
 5Drw==
X-Gm-Message-State: AOAM532C2jSbl8NtoY96a3mqDTBs19JvFL1peU+9ihHs/fyXUTuUBnnV
 0KQVJBA+ji8KsWm4Rfb07mNNd6VxG2g=
X-Google-Smtp-Source: ABdhPJyezv981r5CMXI3D/abrRTG/yDn6D36uqar9rbtpJACs224y4rrcHnE+yESH7c47DaRYUZDJw==
X-Received: by 2002:a05:6e02:1d08:: with SMTP id
 i8mr10773818ila.121.1643579851697; 
 Sun, 30 Jan 2022 13:57:31 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id j2sm615807ilu.82.2022.01.30.13.57.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 13:57:31 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 14:57:29 -0700
Message-Id: <20220130215729.2653219-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/iproute2: bump to version 5.16.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/iproute2/iproute2.hash | 2 +-
 package/iproute2/iproute2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/iproute2/iproute2.hash b/package/iproute2/iproute2.hash
index d8d619cbda..f7e7f682a9 100644
--- a/package/iproute2/iproute2.hash
+++ b/package/iproute2/iproute2.hash
@@ -1,3 +1,3 @@
 # From https://kernel.org/pub/linux/utils/net/iproute2/sha256sums.asc
-sha256  38e3e4a5f9a7f5575c015027a10df097c149111eeb739993128e5b2b35b291ff  iproute2-5.15.0.tar.xz
+sha256  c064b66f6b001c2a35aa5224b5b1ac8aa4bee104d7dce30d6f10a84cb8b01e2f  iproute2-5.16.0.tar.xz
 sha256  e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4  COPYING
diff --git a/package/iproute2/iproute2.mk b/package/iproute2/iproute2.mk
index 4162e38eb7..a51b5b2996 100644
--- a/package/iproute2/iproute2.mk
+++ b/package/iproute2/iproute2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IPROUTE2_VERSION = 5.15.0
+IPROUTE2_VERSION = 5.16.0
 IPROUTE2_SOURCE = iproute2-$(IPROUTE2_VERSION).tar.xz
 IPROUTE2_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/net/iproute2
 IPROUTE2_DEPENDENCIES = host-bison host-flex host-pkgconf \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
