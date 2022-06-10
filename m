Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7456AC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Jun 2022 16:57:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DFBA60EEF;
	Fri, 10 Jun 2022 16:57:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oopyjKazDOUy; Fri, 10 Jun 2022 16:57:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64AAC612B6;
	Fri, 10 Jun 2022 16:57:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1A10C1BF358
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 16:57:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 09B018443D
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 16:57:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1l66-7JMyjHQ for <buildroot@lists.busybox.net>;
 Fri, 10 Jun 2022 16:57:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BB77984422
 for <buildroot@busybox.net>; Fri, 10 Jun 2022 16:57:20 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id z9so7387188wmf.3
 for <buildroot@busybox.net>; Fri, 10 Jun 2022 09:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zy3t/JDgPuakAiVjgpOCfBlWo3bFthcaq1WTgPxmlPo=;
 b=lmUSFHnw2nf+wlmtc7V1UUp6PkibKMdjrtiplOPnRXD0f3DOs8of/82vI9Pq2poGgD
 eyipDqDnMxZgIpjaPx4Fj2L2M7TCmvIEu64AbgRY/3xDd1IDT79jUJsbB036CDFfP2EK
 Bg29ZohlSk7JiJQU7gmRpcvMwHj4oHzxMfW1eJfDIh0qxVNIQVX/bjn7YT8gPvHXSsi1
 8rwmdmvNaPVOL0I9mMWUdtPQKLgqkFEgX2wgFYY+PsldJZ0VILFOX/2wKiDyB5ls4/zV
 QO/FJal6NHDxn/Pl9W7uZHrGn/DJA/shrfQ+gKYbjv0PzBYT/35x32LMiqBrJtJvKFyb
 nALQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Zy3t/JDgPuakAiVjgpOCfBlWo3bFthcaq1WTgPxmlPo=;
 b=GWTM00A41/lhVpNfshrOGtbi0P5KvOL3j0sWxJvKvHH/VtxBmQePkFHs4WNLBUlOhv
 T/1UFilx6B8DUhj1V3zWLg4xYF0CMh5nRk1tjMNVwxMPHgGUlmayE9kWyKhe88zrnh07
 N5sMbdD+ZdgoXuVrZ3KkVgy2rvYMlPbp+THAP9Dlkt/ipaujTk7i5GVxGGlFo5nrSsm8
 X8o9a52YSQGTzy0cwnJz7vb1ktLLqGFMXvhxdGFNwBcmDKuFUSKXxA1MDbTOXs+Ohd39
 x0/1gHk9ayEFVIIpZhDuFYSS8A9iDdI1K0GZV/YewvEbUaEmx9PW1+0pqWLMD6XQDEGb
 w3Gw==
X-Gm-Message-State: AOAM531U6LcuGNl3G7b9IubANcO5gb3uX+Wmty5dIcKxYquqyw+8EhxB
 nUrw0vbINnKtesr7LuyXGOLMMRuzQFDhHA==
X-Google-Smtp-Source: ABdhPJzY8jaZQf0bQi3b0MFAUPPjftJXMk9RU11l1GqzlsorSEroPDZeamKrnzEwn7Ra3MTOkJY/Nw==
X-Received: by 2002:a05:600c:1e2a:b0:39c:51f8:80d4 with SMTP id
 ay42-20020a05600c1e2a00b0039c51f880d4mr681996wmb.192.1654880239038; 
 Fri, 10 Jun 2022 09:57:19 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 p190-20020a1c29c7000000b00397402ae674sm3667972wmp.11.2022.06.10.09.57.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:57:18 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 10 Jun 2022 18:57:15 +0200
Message-Id: <20220610165715.2574492-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/lsof: bump to version 4.95.0
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

remove merged patch

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lsof/0001-remove-susvlegacy-funcs.patch | 12 ------------
 package/lsof/lsof.hash                          |  2 +-
 package/lsof/lsof.mk                            |  2 +-
 3 files changed, 2 insertions(+), 14 deletions(-)
 delete mode 100644 package/lsof/0001-remove-susvlegacy-funcs.patch

diff --git a/package/lsof/0001-remove-susvlegacy-funcs.patch b/package/lsof/0001-remove-susvlegacy-funcs.patch
deleted file mode 100644
index fca66aee5..000000000
--- a/package/lsof/0001-remove-susvlegacy-funcs.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-diff -rdup lsof_4.81.orig/lsof_4.81_src/dialects/linux/machine.h lsof_4.81/lsof_4.81_src/dialects/linux/machine.h
---- a/dialects/linux/machine.h	2007-04-24 18:20:58.000000000 +0200
-+++ b/dialects/linux/machine.h	2007-05-15 12:17:03.000000000 +0200
-@@ -616,6 +616,6 @@
-  * zeromem is a macro that uses bzero or memset.
-  */
- 
--#define	zeromem(a, l)	bzero(a, l)
-+#define	zeromem(a, l)	memset(a, 0, l)
- 
- #endif	/* !defined(LSOF_MACHINE_H) */
-
diff --git a/package/lsof/lsof.hash b/package/lsof/lsof.hash
index 9e72023d3..7318c608c 100644
--- a/package/lsof/lsof.hash
+++ b/package/lsof/lsof.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  c41709c2543ecf9de1e950795790a9786a2f225e51c3cc53d6a9a256f872472b  lsof_4.94.0.linux.tar.bz2
+sha256  e9faa0fbcc48638c1d1f143e93573ac43b65e76646150f83e24bd8c18786303c  lsof_4.95.0.linux.tar.bz2
 sha256  32a728188b19bf86917659d904ab29d0a294b4506e1c98b8b7f1c70ab4975fe1  dialects/linux/dproto.h
diff --git a/package/lsof/lsof.mk b/package/lsof/lsof.mk
index feb6a744e..21a327b99 100644
--- a/package/lsof/lsof.mk
+++ b/package/lsof/lsof.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LSOF_VERSION = 4.94.0
+LSOF_VERSION = 4.95.0
 LSOF_SOURCE = lsof_$(LSOF_VERSION).linux.tar.bz2
 LSOF_SITE = https://github.com/lsof-org/lsof/releases/download/$(LSOF_VERSION)
 LSOF_LICENSE = lsof license
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
