Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A045C433EF
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 10:31:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 300D6829FD;
	Mon,  6 Jun 2022 10:31:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D6DfMzl3GUbb; Mon,  6 Jun 2022 10:31:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2BB40831F2;
	Mon,  6 Jun 2022 10:31:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EFE131BF39A
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:31:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ED2EC831F2
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 10:31:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 71Lkvuu15kgQ for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 10:31:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 357C082FCE
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 10:31:02 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id k16so19254627wrg.7
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 03:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+rGYN0Bmt1d9Cg2o0MdGr7+IIVrucfkNs87btqT6dgw=;
 b=NeRxZ4C6UQhXMf7M+2WMv9VcPKLeb5qs3RTko/NO9teOWCYrBYSYbpHcddT2hBjBPs
 bQEKewVTrL7YwTj+bw5J8WbF6So4QawIjnCJRfsWrMD7nWC5O/n+hI0fSTwjTHdxqTPy
 /Mbnbu3SSnDheMV+1X3o1thiweMaUuVioYVZvI2ZHV/FmAosNkMDTxLUCDkjw3YpOOTD
 7VD5ydlewDfpnO3WTT+KfEAFCdQsNMR185jT5Av5qqyoW7ObzPZWUW/pe8gPFuXhEDbv
 3Wm9UdfsYBHQ/v2ddGPnfPo+VQZPEZd9ja5/tgeLyJ5z3Fnc5ZUkMlFc86m9yoMcJuqu
 XpkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=+rGYN0Bmt1d9Cg2o0MdGr7+IIVrucfkNs87btqT6dgw=;
 b=XD8eMcfuiY+JoeKCjT58Qt25uIIMEWsN6VZDjyuen30IYyZx2unpYFpZct5CsVWmlm
 +HOMytsvtozdaaW+r8TOo0Nic2wIhQ0EaGOrlEjgc+exxipidV+Lg46rnYvlWyekvD1H
 B2XIh8kIlsviMhzb40WsmVa2mZ/uNzl7t5xGRaiIY4R+F6uwbAoGljbuep05NeltxgTD
 Ol/ERs2GScRP0O/UjCu8cOisRgoPUAgj0FKonsrOOWVOAPWv+9lrkexKzsMVqrm+WPws
 RdbRSgmRHdGq+gHfKAwUtkVNQC/EduCZV36RL/aKDX0GgbP7dP9f2/iTGxGBcNF5lbM3
 OAJA==
X-Gm-Message-State: AOAM531f09ZL68XGldo6Tera68fKtqSkac2mgK19jocEYTf62elBeICv
 dPAtux1fdxL6UDSJW77umh1EfuwO5zg=
X-Google-Smtp-Source: ABdhPJx8/OMUEGl882PnJEovCZhDsT6yxgrltmSyKbH8oLSy8AmNuNCb1fgPipfo40P1dn90Xzt0yw==
X-Received: by 2002:a5d:5885:0:b0:218:3d12:e0eb with SMTP id
 n5-20020a5d5885000000b002183d12e0ebmr4694982wrf.510.1654511460256; 
 Mon, 06 Jun 2022 03:31:00 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r9-20020adfe689000000b0020c5253d8d0sm14729598wrm.28.2022.06.06.03.30.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 03:30:59 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Jun 2022 12:28:22 +0200
Message-Id: <20220606102822.398093-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/vim: security bump to version
 8.2.5062
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

Fix CVE-2022-1851: Out-of-bounds Read in GitHub repository vim/vim prior
to 8.2.

Fix CVE-2022-1886: Heap-based Buffer Overflow in GitHub repository
vim/vim prior to 8.2.

Fix CVE-2022-1898: Use After Free in GitHub repository vim/vim prior to
8.2.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vim/vim.hash | 2 +-
 package/vim/vim.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vim/vim.hash b/package/vim/vim.hash
index 9d61d6fc87..55e5643b90 100644
--- a/package/vim/vim.hash
+++ b/package/vim/vim.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  5606a3c62dba038f4c4f2eddb305ffccbae58a7bfd569bdb8100f524564c8a32  vim-8.2.4980.tar.gz
+sha256  3052bc702cfb49571dbcf9824827ae6032c37c7bf1a2aa0d3f7cc18c8f085dfb  vim-8.2.5062.tar.gz
 sha256  0bcab3b635dd39208c42b496568d1e8171dad247cf3da5bab3d750c9d5883499  LICENSE
 sha256  96970b67f9cb38b0e759946cff22562a3c4b11ce78f62f2117d5e7ecded9ab4d  README.txt
diff --git a/package/vim/vim.mk b/package/vim/vim.mk
index 9e70360b90..6dbb32d27b 100644
--- a/package/vim/vim.mk
+++ b/package/vim/vim.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VIM_VERSION = 8.2.4980
+VIM_VERSION = 8.2.5062
 VIM_SITE = $(call github,vim,vim,v$(VIM_VERSION))
 VIM_DEPENDENCIES = ncurses $(TARGET_NLS_DEPENDENCIES)
 VIM_SUBDIR = src
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
