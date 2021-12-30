Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28527C4332F
	for <buildroot@archiver.kernel.org>; Thu, 30 Dec 2021 22:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD0E460C0F;
	Thu, 30 Dec 2021 22:20:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6f87WJAMhwHr; Thu, 30 Dec 2021 22:20:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB3DD60AC5;
	Thu, 30 Dec 2021 22:20:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 302651BF3C2
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1EE17827C5
 for <buildroot@lists.busybox.net>; Thu, 30 Dec 2021 22:20:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ELvQUswGADUJ for <buildroot@lists.busybox.net>;
 Thu, 30 Dec 2021 22:20:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C732D827AA
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 22:20:04 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id d9so52974296wrb.0
 for <buildroot@buildroot.org>; Thu, 30 Dec 2021 14:20:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sf9XIiMZmcOgM+eSn6+uPcPbUnfqiln4O/SSv3QW1KQ=;
 b=TOotYekUVcoEWj6gQm1j080rDlkU1eubWuOB3q7SsTCmSlekZ2XDOelT4CQeMrQWnL
 2r9vGjK/rfHhP8Df6qAuX+UdRz+D02EmqMH7mp3Zk9hTrfbAeA84QyQfUfq7Ps1XErxl
 jUt178XFzW3JXxndVgZSbxG+szZcLPrUCZ/9lM8t1+0uB/eYhZxBks4fmaNeFHS2h7xj
 D18niR3YbdtHeWxPnYBCfasXzxSHw98a32FvKUecwtDLMvfYMTOZMYhJ2hPVE8YAMqi8
 unQ5BvBjAJ58a8Gt51HfKAXuRRxk1D6apZX0BY8ttHENsyJZH98svXJYb/Ch5zOunofQ
 cZ2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sf9XIiMZmcOgM+eSn6+uPcPbUnfqiln4O/SSv3QW1KQ=;
 b=z3C7beLBtNInU+V1mnlHvRLN+LAgzTEazvJJnDRzUzemlBn7N+VzAapVqlA02ocy1o
 hS6mZW57x2K5nDH/dnkNMhfKaLkKSUwVf+OeyH1EVQ9Wof2NhHxeutMppk7QghOZlOGr
 BHVgoScQkY0ds1u3mxKp6iM7IyfX2ntAvYKrWDCH8dvUsZCHKS+/KlIzkgOlvGQQzFYq
 q03tCqIc37+BODpRlDdVmUwM6QHZGInXCT0z9OHGv6ORLNvG3xNduh8MxknUYLS6Vbcw
 02JKeTis1H2FVcW0uauPsb4R5XjeBkdGTbk42Hv/0ikz+G+X10HT2RS0HIryyD5qronT
 U6mQ==
X-Gm-Message-State: AOAM533ZaXJY6ziyXURjqjtMj2GkxZoNCys62NCR7dvGszbHRPwcKu11
 ZNx7dUFlRDbHQbeVZkfGQE9kWQ2ULVI=
X-Google-Smtp-Source: ABdhPJzj5KvzJWkwHJpGdhtuygM8GUgLa4UXlouEwcQorNLFTVho9DJ/kQJP21SE4lIKOjrRG8Ku9Q==
X-Received: by 2002:a5d:47aa:: with SMTP id 10mr23812867wrb.640.1640902802932; 
 Thu, 30 Dec 2021 14:20:02 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id i8sm31270497wry.108.2021.12.30.14.20.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Dec 2021 14:20:02 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Dec 2021 23:19:04 +0100
Message-Id: <20211230221904.3064022-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/efl: handle input option
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 2d7a3e48c574c05346b66f79cdb75ecdfa7f074e forgot to manage input
option on target which was added (and enabled by default) by
https://git.enlightenment.org/core/efl.git/commit/?id=0c2cf7e1bf7ca547655d25aaea30d081101b42be
resulting in the following build failure when eeze is disabled:

../output-1/build/efl-1.26.0/src/lib/elput/meson.build:1:0: ERROR: Unknown variable "eeze".

Fixes:
 - http://autobuild.buildroot.org/results/4a840c54bad9748b5748738378a0352d02de1f7e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/efl/Config.in | 13 +++++++++++++
 package/efl/efl.mk    |  7 +++++++
 2 files changed, 20 insertions(+)

diff --git a/package/efl/Config.in b/package/efl/Config.in
index 05ded72cf7..d873c77ac6 100644
--- a/package/efl/Config.in
+++ b/package/efl/Config.in
@@ -85,6 +85,19 @@ config BR2_PACKAGE_EFL_LIBFRIBIDI
 	  so you may also trigger code paths with bugs that are never
 	  normally used.
 
+config BR2_PACKAGE_EFL_LIBINPUT
+	bool "Enable libinput support (recommended)"
+	default y
+	depends on BR2_PACKAGE_HAS_UDEV # libinput
+	select BR2_PACKAGE_EFL_EEZE
+	select BR2_PACKAGE_LIBINPUT
+	select BR2_PACKAGE_LIBXKBCOMMON
+	help
+	  Libinput is used to support gesture recognition.
+
+comment "libinput needs udev /dev management"
+	depends on !BR2_PACKAGE_HAS_UDEV
+
 config BR2_PACKAGE_EFL_LIBSNDFILE
 	bool "Enable libsndfile support (recommended)"
 	default y
diff --git a/package/efl/efl.mk b/package/efl/efl.mk
index 46bce29305..642b37a434 100644
--- a/package/efl/efl.mk
+++ b/package/efl/efl.mk
@@ -67,6 +67,13 @@ else
 EFL_CONF_OPTS += -Deeze=false
 endif
 
+ifeq ($(BR2_PACKAGE_EFL_LIBINPUT),y)
+EFL_DEPENDENCIES += libinput libxkbcommon
+EFL_CONF_OPTS += -Dinput=true
+else
+EFL_CONF_OPTS += -Dinput=false
+endif
+
 ifeq ($(BR2_PACKAGE_EFL_UTIL_LINUX_LIBMOUNT),y)
 EFL_DEPENDENCIES += util-linux
 EFL_CONF_OPTS += -Dlibmount=true
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
