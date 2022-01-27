Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F1DBC433F5
	for <buildroot@archiver.kernel.org>; Thu, 27 Jan 2022 16:21:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5CE6E41CF2;
	Thu, 27 Jan 2022 16:21:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RjVJzu02UNDf; Thu, 27 Jan 2022 16:21:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6FA241CCC;
	Thu, 27 Jan 2022 16:21:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 072EF1BF84C
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 16:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E38B0401A0
 for <buildroot@lists.busybox.net>; Thu, 27 Jan 2022 16:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BIU9k42_4O3R for <buildroot@lists.busybox.net>;
 Thu, 27 Jan 2022 16:21:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9E3F2400CC
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 16:21:03 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id i1so2923105ils.5
 for <buildroot@buildroot.org>; Thu, 27 Jan 2022 08:21:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WMc+Fk32cxu6IQxV9+eQO58zX9KrXZ73feFYWnAHZqM=;
 b=NwdFnmJWlOKo4NoJt8uP2luk5tnbK/s9x2fjHRdKpNDPbuem7OBlKu/MABespsKyhx
 l98dxCN/MXFbiSt2SBAg7ItMl63VZ4itmoQtU675MzBU1LSZjnlCl9oPTbX24wmQl86z
 8ILVDjq3Ndrt6xo98xUgvco7ucj2farMCElWOGWwn69uQK4VjnUOPvQXCaL8Rl1Qz5La
 2vzrZC3Ca4Z/g6KH2h2rPZfcrNKXgWDCSOxRlj5znD/le8b3xrvNn/o5W0AhL54D2jZT
 nKlh4W3F4xFNoJsy/LYbMPlequ4AEVxNuCcFCsa+SjRWgv4PLC5+WOg0oC5lCuvXD+Xo
 WWnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WMc+Fk32cxu6IQxV9+eQO58zX9KrXZ73feFYWnAHZqM=;
 b=uWp6yeINGyJHOrxsKXkKBLSQrPMNhjF3lDMgflDPnSQuzDuvVrvRONU9fkL5Gak/Qx
 9FoGXbQyzqpx+ZdhHt7byRR0tb/Pp8kpw29Y6d5Ena5oD42oHkEsTo6g1a3R3QiMTh5B
 wEfaJ6jHwGKyh7D+mw7yVbsxrVrCeUyB54VVLAvuB3FzTCBuiT3nMFZIXoEsShnjaShs
 EMVhvq4GkrcunfiZf0iOdbH+sGLhkGoThhVdZFfE8Pdt4dbtDjtglNx3Lgbc+Y/yha9c
 ag3+47KkSPC7pqaUOahR7dFiDarISdaqvM/QRltXtuk9tYuXJFtihmqZf0ABo4Svjkor
 wFFQ==
X-Gm-Message-State: AOAM530vw40TzyMJ838WeBG9qC+FVTmfEDCJFekOHlfZGBPwdgVKjxaf
 0d26XnhOfVH4FncJkavYJeiS3dllHrI=
X-Google-Smtp-Source: ABdhPJzPBlFUpcq7q1qchAaulK2ljbOEDAqq2PHNphyPnCWE73VPSfHmgB1DC82vuVabbbvHaxzCjg==
X-Received: by 2002:a92:c542:: with SMTP id a2mr2944389ilj.259.1643300462487; 
 Thu, 27 Jan 2022 08:21:02 -0800 (PST)
Received: from james-x399.localdomain (71-218-245-50.hlrn.qwest.net.
 [71.218.245.50])
 by smtp.gmail.com with ESMTPSA id ay35sm5933258iob.3.2022.01.27.08.21.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 08:21:02 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 27 Jan 2022 09:21:00 -0700
Message-Id: <20220127162100.2629696-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.61.1
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

Drop patch that is now upstream.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...x-typo-in-vapigen-option-metadatadir.patch | 33 -------------------
 package/meson/meson.hash                      |  4 +--
 package/meson/meson.mk                        |  2 +-
 3 files changed, 3 insertions(+), 36 deletions(-)
 delete mode 100644 package/meson/0003-gnome-fix-typo-in-vapigen-option-metadatadir.patch

diff --git a/package/meson/0003-gnome-fix-typo-in-vapigen-option-metadatadir.patch b/package/meson/0003-gnome-fix-typo-in-vapigen-option-metadatadir.patch
deleted file mode 100644
index 3788ee0f11..0000000000
--- a/package/meson/0003-gnome-fix-typo-in-vapigen-option-metadatadir.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 9952446a2a28ea2b009f4b8b2a14ad50f0878bdd Mon Sep 17 00:00:00 2001
-From: Michal Vasilek <michal.vasilek@nic.cz>
-Date: Mon, 10 Jan 2022 21:27:30 +0100
-Subject: [PATCH] gnome: fix typo in vapigen option metadatadir
-
-This typo was introduced in 9ef36fa80bf4483bcd837ea3985a51ab533c7972 and
-can cause a build failure, because --metadatdir is not a valid vapigen
-option.
-
-[aperez@igalia.com: backport from upstream]
-Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
-[yann.morin.1998@free.fr: make it an actual backport]
-Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
----
- mesonbuild/modules/gnome.py | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/mesonbuild/modules/gnome.py b/mesonbuild/modules/gnome.py
-index 1125e56e7..dfc66c2e3 100644
---- a/mesonbuild/modules/gnome.py
-+++ b/mesonbuild/modules/gnome.py
-@@ -1934,7 +1934,7 @@ class GnomeModule(ExtensionModule):
-         cmd: T.List[T.Union[str, 'ExternalProgram']]
-         cmd = [state.find_program('vapigen'), '--quiet', f'--library={library}', f'--directory={build_dir}']
-         cmd.extend([f'--vapidir={d}' for d in kwargs['vapi_dirs']])
--        cmd.extend([f'--metadatdir={d}' for d in kwargs['metadata_dirs']])
-+        cmd.extend([f'--metadatadir={d}' for d in kwargs['metadata_dirs']])
-         cmd.extend([f'--girdir={d}' for d in kwargs['gir_dirs']])
-         cmd += pkg_cmd
-         cmd += ['--metadatadir=' + source_dir]
--- 
-2.25.1
-
diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index c9be54be05..c2d53519d4 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.61.0/meson-0.61.0.tar.gz.asc
-sha256  ea9f33246b1f23f02e90a50e75e0f41e526f6dabf0c24f3e00e27a3f5abdc35c  meson-0.61.0.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.61.1/meson-0.61.1.tar.gz.asc
+sha256  feb2cefb325b437dbf36146df7c6b87688ddff0b0205caa31dc64055c6da410c  meson-0.61.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index e63dc725bf..c40f9f220c 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.61.0
+MESON_VERSION = 0.61.1
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
