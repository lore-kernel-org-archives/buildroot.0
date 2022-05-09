Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926A4C4332F
	for <buildroot@archiver.kernel.org>; Mon,  9 May 2022 16:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E10F60E09;
	Mon,  9 May 2022 16:12:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Jh4NbnFqjAVm; Mon,  9 May 2022 16:12:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 39F6160B20;
	Mon,  9 May 2022 16:12:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C8F501BF281
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 16:12:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4BDB813EA
 for <buildroot@lists.busybox.net>; Mon,  9 May 2022 16:12:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8XIO49reDL27 for <buildroot@lists.busybox.net>;
 Mon,  9 May 2022 16:12:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DCCAD813BE
 for <buildroot@busybox.net>; Mon,  9 May 2022 16:12:39 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id e24so20172896wrc.9
 for <buildroot@busybox.net>; Mon, 09 May 2022 09:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xfdZe2WJoBnNrAhkCwPZ3FKoiUYptBwbw/XaWn41oZg=;
 b=HH95tr/eB/tXowj1jlqUacN2Xm45erq4k4iddpxlYAQvZVzHjK/xd3VImel1JO121g
 JzX/TcQBXa2To/3CxSgetszHZUhcEpbjYEpRZGV9Jp8mz6uXaEou6cfJlIraPtbGsT2v
 IzTV5yvS144I02MMHUVvTXoQSg4rwrKTMMOki/WT45iP5HXw7g+B2GEMNX1NTck+qdjS
 /alwm3ExrAMbEXnbmpcarIaWl0t5A4LhK/s/QIJyoXzcAIdbz9MXNK0vi1ifR9xosBD3
 UaR2fnvZGymq3SsZcHs0Hf4ZEHmaNS+9XDYbhd+32xZ3DSN4q21rIHuy1mz8ymfWK7sR
 UYbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xfdZe2WJoBnNrAhkCwPZ3FKoiUYptBwbw/XaWn41oZg=;
 b=NHrtnXBVijPPvWxVTCUc3PsLAlJi1bJjMAJDuyL46Du7xv+onCO3bowPFTJz987c6F
 EdVwdx8jYiE0U6HQC9TulrF4un2BeQW/taGmi9HFfq7x5YyQuyUi223m/uleO0UnU49e
 HlywFNmF0BL8nHh4SS5khewSVbsh/HWmlooRLLmWBEm8jAagysuiAJGN/vC8JNhJNWf/
 F3qa1tC+1LlYLdH4lEgWAHbtTKrG3JUez3CHvHWERkvRCTWdHrpEEV6hNIuV2f7WTd9a
 jsaATucoHoyyPI8VXxzwMJ1+5tZKuzKtEVvVY50h9DWLS2e/woLd9hos3s2kbRVWlsBS
 wDwg==
X-Gm-Message-State: AOAM531iAvaMRygWnuyO0uOHSexIoxFPED3knjBSuHwd6fs3vQPbFmZ/
 PgbwyDKjwU0blwuy4nZc0Ymh2zoydzY=
X-Google-Smtp-Source: ABdhPJyIDyesu79PMQb4ZGwo2KDAValumjQTBpIqGINXxFng6qV3e4yDGL2wblyypT/pRbNmd/TZFA==
X-Received: by 2002:adf:e10e:0:b0:206:2d7:b4de with SMTP id
 t14-20020adfe10e000000b0020602d7b4demr14192172wrz.497.1652112757857; 
 Mon, 09 May 2022 09:12:37 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 g3-20020a056000118300b0020c5253d8bcsm11760477wrx.8.2022.05.09.09.12.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 09:12:37 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  9 May 2022 18:12:24 +0200
Message-Id: <20220509161224.188751-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/gdbm: bump to version 1.23
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
 package/gdbm/gdbm.hash | 6 +++---
 package/gdbm/gdbm.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/gdbm/gdbm.hash b/package/gdbm/gdbm.hash
index 59f9ea62d..7449d5dc9 100644
--- a/package/gdbm/gdbm.hash
+++ b/package/gdbm/gdbm.hash
@@ -1,6 +1,6 @@
 # From https://www.gnu.org.ua/software/gdbm/download.html
-md5  0bbd38f12656e4728e2f7c4708aec014  gdbm-1.22.tar.gz
-sha1  c45cc0178cbf41828369b07749d41778741703bd  gdbm-1.22.tar.gz
+md5  8551961e36bf8c70b7500d255d3658ec  gdbm-1.23.tar.gz
+sha1  50ba1b1d45ce33fd44e4fdaaf3b55a9d8f3dc418  gdbm-1.23.tar.gz
 # Locally computed
-sha256  f366c823a6724af313b6bbe975b2809f9a157e5f6a43612a72949138d161d762  gdbm-1.22.tar.gz
+sha256  74b1081d21fff13ae4bd7c16e5d6e504a4c26f7cde1dca0d963a484174bbcacd  gdbm-1.23.tar.gz
 sha256  690d762f2e8e149ab1e2d6a409a3853b6151a2533b2382fae549a176d6bedecf  COPYING
diff --git a/package/gdbm/gdbm.mk b/package/gdbm/gdbm.mk
index 52624f580..e807a8e1e 100644
--- a/package/gdbm/gdbm.mk
+++ b/package/gdbm/gdbm.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GDBM_VERSION = 1.22
+GDBM_VERSION = 1.23
 GDBM_SITE = $(BR2_GNU_MIRROR)/gdbm
 GDBM_LICENSE = GPL-3.0+
 GDBM_LICENSE_FILES = COPYING
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
