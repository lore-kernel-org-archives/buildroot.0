Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD511C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Dec 2021 21:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7550B41D62;
	Tue,  7 Dec 2021 21:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dJ1JIHVsP_bE; Tue,  7 Dec 2021 21:47:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBCE741D5F;
	Tue,  7 Dec 2021 21:47:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02D1F1BF470
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 21:47:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E44CC401B6
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 21:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X2CgsV_Zk9Ca for <buildroot@lists.busybox.net>;
 Tue,  7 Dec 2021 21:46:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9876940186
 for <buildroot@buildroot.org>; Tue,  7 Dec 2021 21:46:59 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 i8-20020a7bc948000000b0030db7b70b6bso2808910wml.1
 for <buildroot@buildroot.org>; Tue, 07 Dec 2021 13:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2CLSPwBUJdtIj4i2qI5sPqzJf32r+RIVdPQKNBYhVf0=;
 b=WnUmx271oJ4BX9aK2+V0tANPVK/dmKbCSsFs4JBM7qQzlnQSM6A4r8iS0+uujvAYWt
 3R2qhMZxpdsp5y5vY8hduhK3FxZVSPPh3zbvz9yOBFTNkYRViLbNy0L+9JZN3d3BfsPH
 jua9SFkLGNKiR2bUFL3Uk7vHB8Oo1Ncf1Q+xjuienlHao4kyD88GwqcJyf39wRVoQFSO
 adrVrvjzryi0P6jLPKLjSsMvANf+pC5y03JXI0P910TMS7NcAlTVSaG8eDu/HaL0GWLp
 UblmTDWMBRHn+9ZpnuAhJ0AG7zOyujhiLULl2qdN8f9GtXoyhovMrCABp91QodbiHckR
 Qi6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2CLSPwBUJdtIj4i2qI5sPqzJf32r+RIVdPQKNBYhVf0=;
 b=gl8USMlFPkdxW4B56imTAq2KBrqRKAUWyME/E7yrgTnFsyZnf8W0w+86YgWk1p8nYv
 qONk30syUGarxLpdzMwNNmixiB6D4N0lRA2Pi/O0yv4YR9ZcTROyWDXgXMtGuDRJAENz
 Y7iAyL62MfrKXqRQiU/YfPfWOUq2q5zHP1HISvqniUwfrYEiaZMGrIFGCDXzzezAcPLp
 KbLnrToe/LpjTgYf0Zhv1DGotwJ6mxx2qIAO+OeZ3JyTbRAMSoBP36IOr5S4md5dvGYd
 +jGyp7F8JBFgDUsmKSJVZyKhOsBzAYhfxAtb8gj+2D6Xljy3lm1YRCGi0D+SnMR1OMOm
 sAlA==
X-Gm-Message-State: AOAM531C9FIFEvfsFzI4MZZTw0ruhD62tm6Md7zNOppA/hu6fLU4oT03
 yhulMSnzPj+nGPaAIHYXq/TxGukGnmsGJg==
X-Google-Smtp-Source: ABdhPJz2NCunu8gs9gVV8ts28Z8hH/fh5GcWf1jyDmuup6vfp845BKcp/26g40IR+2SFZqXVnrErYg==
X-Received: by 2002:a1c:9dc7:: with SMTP id
 g190mr10379246wme.130.1638913617570; 
 Tue, 07 Dec 2021 13:46:57 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id b14sm1162169wrd.24.2021.12.07.13.46.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 13:46:57 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Dec 2021 22:46:58 +0100
Message-Id: <20211207214658.3314109-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lsof: bump to version 4.94.0
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

Update indentation in hash file (two spaces)

https://github.com/lsof-org/lsof/releases/tag/4.94.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lsof/lsof.hash | 4 ++--
 package/lsof/lsof.mk   | 5 +++--
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/lsof/lsof.hash b/package/lsof/lsof.hash
index c7432ffbe8..9e72023d30 100644
--- a/package/lsof/lsof.hash
+++ b/package/lsof/lsof.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256	3df912bd966fc24dc73ddea3e36a61d79270b21b085936a4caabca56e5b486a2	lsof-4.93.2.tar.gz
-sha256	32a728188b19bf86917659d904ab29d0a294b4506e1c98b8b7f1c70ab4975fe1	dialects/linux/dproto.h
+sha256  c41709c2543ecf9de1e950795790a9786a2f225e51c3cc53d6a9a256f872472b  lsof_4.94.0.linux.tar.bz2
+sha256  32a728188b19bf86917659d904ab29d0a294b4506e1c98b8b7f1c70ab4975fe1  dialects/linux/dproto.h
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index 6aa829c2c0..ff09d64345 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -4,8 +4,9 @@
 #
 ################################################################################
 
-LSOF_VERSION = 4.93.2
-LSOF_SITE = $(call github,lsof-org,lsof,$(LSOF_VERSION))
+LSOF_VERSION = 4.94.0
+LSOF_SOURCE = lsof_$(LSOF_VERSION).linux.tar.bz2
+LSOF_SITE = https://github.com/lsof-org/lsof/releases/download/$(LSOF_VERSION)
 LSOF_LICENSE = lsof license
 # License is repeated in each file, this is a relatively small one.
 # It is also defined in 00README, but that contains a lot of other cruft.
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
