Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 591F5C433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 18:21:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1C1B40986;
	Tue,  4 Jan 2022 18:21:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fB1BKUQCYEdd; Tue,  4 Jan 2022 18:21:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FB4A4098F;
	Tue,  4 Jan 2022 18:21:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 02F2D1BF5DB
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E426E40547
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 18:21:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bn8GKnBA_ahw for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 18:21:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7094440236
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 18:21:33 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id e5so77876231wrc.5
 for <buildroot@buildroot.org>; Tue, 04 Jan 2022 10:21:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a0IN/QxrHhFOzI7N+MtdgF6a5eCWOO6MMScUsnSm4pM=;
 b=pj3ybcel021tuyC5Yf+mfsAIS/OKLUFvL5Fh5fN+uUVcDLsoMfho2qGElupsbM6QOP
 ouufWUfnLdzK+w5H6mMRK2O/Gi9Fdb5iEUFcLM+dzVsTR5YS4Ts5jNqHveZbowRaSZGU
 yALK1+bHGmBrulk4OuoXd++TSMLYu0ql9pIe36te1v4zbuCZBkYbPx3WZ+6mIGdFOqgI
 as2fDpkt3MBDWWiTEy11KvAFL9Vj1avYfLEtFRGwOpBE0d+h+Q6Max4qryLV2M8ymc3T
 kWIkYBjDBS7K3DpBH95gKmUwRO7x97NliSU9rG3K+6MeLNpHhkxrnT1qtYSxucSi/fcr
 5bhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=a0IN/QxrHhFOzI7N+MtdgF6a5eCWOO6MMScUsnSm4pM=;
 b=DARitDEUI7xH9ikWVe6Icl9+sg4ghNJe7/YKvcF/Mt5HjK1Vl8gNroULLMToaLGeHQ
 B7+vJMs/gJHab/MJiDiw3Vj1eUgnYA0UxqEJTwUlj1OxcP1lJTT829YlmGIatKNIKXKc
 J41spP21dDj6h1U/9wYDWlm3zFfy8CtTFsFPBCNke3U29vowUGdFzvntPBwEKXws6naM
 QTdyGQvcVEkHkCNx2glwSQAqAsmV/Jc6V0dpeAcTYVpLHaX67f7loSI7IhVMYfMq9tHh
 LmS20mbPK1hVmVrhVF3GGahKTqiwyB4Ouv2Ye4SizuDX1aUhTr95nHEOzGXyzO4mBxuV
 j6Xg==
X-Gm-Message-State: AOAM532Kr1H+4OoAiGggKQ7G3+0wlLZbUcRWEJs/ZAednQ025Lqnkp85
 iRKySSdcrf0nb7m6MT+6BUe4jwdO6AU=
X-Google-Smtp-Source: ABdhPJzwXnAazfiqidYey8ulf3fLLoK78ecLvywabRubTjWdQfdWC1bbU0Uj/yBZ+elbhc6jZSzh4g==
X-Received: by 2002:adf:dcc9:: with SMTP id x9mr42729848wrm.122.1641320492085; 
 Tue, 04 Jan 2022 10:21:32 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id a3sm3295329wri.89.2022.01.04.10.21.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 10:21:31 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  4 Jan 2022 19:20:37 +0100
Message-Id: <20220104182037.3292464-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/openipmi: bump to version 2.0.32
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

- Refresh patch and send it upstream
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...01-Avoid-searching-host-library-path.patch | 27 ++++++++++---------
 package/openipmi/openipmi.hash                | 12 ++++-----
 package/openipmi/openipmi.mk                  |  2 +-
 3 files changed, 21 insertions(+), 20 deletions(-)

diff --git a/package/openipmi/0001-Avoid-searching-host-library-path.patch b/package/openipmi/0001-Avoid-searching-host-library-path.patch
index 44a57dcfb4..15b4510f67 100644
--- a/package/openipmi/0001-Avoid-searching-host-library-path.patch
+++ b/package/openipmi/0001-Avoid-searching-host-library-path.patch
@@ -10,6 +10,9 @@ $(libdir) in the library search path.
 
 Signed-off-by: Baruch Siach <baruch@tkos.co.il>
 Signed-off-by: Joel Stanley <joel@jms.id.au>
+[Fabrice: refresh patch for 2.0.32]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://sourceforge.net/p/openipmi/patches/35]
 ---
  cmdlang/Makefile.am | 3 +--
  unix/Makefile.am    | 6 ++----
@@ -19,13 +22,12 @@ diff --git a/cmdlang/Makefile.am b/cmdlang/Makefile.am
 index 264ee12be79f..0b3843784656 100644
 --- a/cmdlang/Makefile.am
 +++ b/cmdlang/Makefile.am
-@@ -15,8 +15,7 @@ libOpenIPMIcmdlang_la_SOURCES = cmdlang.c cmd_domain.c cmd_entity.c cmd_mc.c \
- libOpenIPMIcmdlang_la_LIBADD = -lm \
+@@ -15,7 +15,7 @@ libOpenIPMIcmdlang_la_SOURCES = cmdlang.c cmd_domain.c cmd_entity.c cmd_mc.c \
  	$(top_builddir)/utils/libOpenIPMIutils.la \
  	$(top_builddir)/lib/libOpenIPMI.la
--libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-L$(libdir)
-+libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION)
+ libOpenIPMIcmdlang_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-L$(libdir) -no-undefined
++	-no-undefined
  
  bin_PROGRAMS = openipmish
  
@@ -33,20 +35,19 @@ diff --git a/unix/Makefile.am b/unix/Makefile.am
 index 5128839dad13..bd0f897ba8d6 100644
 --- a/unix/Makefile.am
 +++ b/unix/Makefile.am
-@@ -10,14 +10,12 @@ lib_LTLIBRARIES = libOpenIPMIposix.la libOpenIPMIpthread.la
- libOpenIPMIpthread_la_SOURCES = posix_thread_os_hnd.c selector.c
+@@ -10,12 +10,12 @@ lib_LTLIBRARIES = libOpenIPMIposix.la libOpenIPMIpthread.la
  libOpenIPMIpthread_la_LIBADD = -lpthread $(GDBM_LIB) \
  	$(top_builddir)/utils/libOpenIPMIutils.la $(RT_LIB)
--libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-L$(libdir)
-+libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION)
+ libOpenIPMIpthread_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-L$(libdir) -no-undefined
++	-no-undefined
  
  libOpenIPMIposix_la_SOURCES = posix_os_hnd.c selector.c
  libOpenIPMIposix_la_LIBADD = $(top_builddir)/utils/libOpenIPMIutils.la \
  	$(GDBM_LIB) $(RT_LIB)
--libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
--	-L$(libdir)
-+libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION)
+ libOpenIPMIposix_la_LDFLAGS = -rdynamic -version-info $(LD_VERSION) \
+-	-L$(libdir) -no-undefined
++	-no-undefined
  
  noinst_HEADERS = heap.h
  
diff --git a/package/openipmi/openipmi.hash b/package/openipmi/openipmi.hash
index 2ec9dd31af..eded076ade 100644
--- a/package/openipmi/openipmi.hash
+++ b/package/openipmi/openipmi.hash
@@ -1,8 +1,8 @@
 # From http://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library/
-sha1 be0c87743a38e2fa00586df931f021c0b480385b OpenIPMI-2.0.28.tar.gz
-md5 ba37f08e306062ec73c7ed2a2bd4d5f4 OpenIPMI-2.0.28.tar.gz
+sha1  73d7dce4312b006983b11367e4a43d4ec52cf888  OpenIPMI-2.0.32.tar.gz
+md5  532404c9df7d0e8bde975b95b9e6775b  OpenIPMI-2.0.32.tar.gz
 # Locally computed
-sha256	8e8b1de2a9a041b419133ecb21f956e999841cf2e759e973eeba9a36f8b40996	OpenIPMI-2.0.28.tar.gz
-sha256	32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670	COPYING
-sha256	185323a62589e7ee80f86bf2ea29caad9a09fdda0ea3f1c00db8b778c7edf60e	COPYING.BSD
-sha256	5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509	COPYING.LIB
+sha256  f6d0fd4c0a74b05f80907229d0b270f54ca23294bcc11979f8b8d12766786945  OpenIPMI-2.0.32.tar.gz
+sha256  32b1062f7da84967e7019d01ab805935caa7ab7321a7ced0e30ebe75e5df1670  COPYING
+sha256  185323a62589e7ee80f86bf2ea29caad9a09fdda0ea3f1c00db8b778c7edf60e  COPYING.BSD
+sha256  5bbcbb737e60fe9deba08ecbd00920cfcc3403ba2e534c64fdeea49d6bb87509  COPYING.LIB
diff --git a/package/openipmi/openipmi.mk b/package/openipmi/openipmi.mk
index 3240b89894..ad2f2d2f4f 100644
--- a/package/openipmi/openipmi.mk
+++ b/package/openipmi/openipmi.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENIPMI_VERSION = 2.0.28
+OPENIPMI_VERSION = 2.0.32
 OPENIPMI_SITE = https://sourceforge.net/projects/openipmi/files/OpenIPMI%202.0%20Library
 OPENIPMI_SOURCE = OpenIPMI-$(OPENIPMI_VERSION).tar.gz
 OPENIPMI_LICENSE = LGPL-2.0+, GPL-2.0+, BSD-3-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
