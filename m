Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF3CAC433F5
	for <buildroot@archiver.kernel.org>; Fri, 25 Mar 2022 21:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 655AA60BAA;
	Fri, 25 Mar 2022 21:18:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JiRzUgpMOppJ; Fri, 25 Mar 2022 21:18:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 800CB607B5;
	Fri, 25 Mar 2022 21:18:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F11991BF380
 for <buildroot@lists.busybox.net>; Fri, 25 Mar 2022 21:18:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E810C80C52
 for <buildroot@lists.busybox.net>; Fri, 25 Mar 2022 21:18:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zdJ0v2olgrql for <buildroot@lists.busybox.net>;
 Fri, 25 Mar 2022 21:18:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A46DF80C30
 for <buildroot@buildroot.org>; Fri, 25 Mar 2022 21:18:47 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 i67-20020a1c3b46000000b0038ce25c870dso1591618wma.1
 for <buildroot@buildroot.org>; Fri, 25 Mar 2022 14:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d6NS8i7rAnd9rJK9U7wr5CEakTIWRBspmvP/caqbaUU=;
 b=dzWGDIVInJdiSklG1Gr/2EQGcbXYOPVbnkwmMsi4fEPJ6hoy7p2exnSJMSNDUwzDOF
 4TJ/vEkWMTsmpHhVj2APHYkpvTR7V/i+6+oOhi9GYu0fDYLhZqOXIt9DVInUPbNZRXhy
 VGSsqRq11ptVuvoPdSQE/kk3g8X6rvIRRPc77wCxaGr/V87SP+gKCB6PvtOqltkRBfrB
 NF982DgFU7DgfEZmGxXHEx/F3b2l9G22BqOfXNX7N3kJCggZy+Qf2oMYuto0Xjd9xxKb
 K0dc7PzytZv4Yc7qsNM/WqKc3TDSnDpUdjs0tDuuycobNOaBHZe3rJcDzqj2KGwfajsf
 DukQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d6NS8i7rAnd9rJK9U7wr5CEakTIWRBspmvP/caqbaUU=;
 b=wutzWlf2PVjg5Ssu6dicpKeYVmOUewXgVMyvLc0PptQCbWtH8MTIqyXIOkgIfn6XyB
 j8n2cDPJIb2Xn4ah2DFsBjk7SvVXQQTpVruoTN9xHkWZ2+uZLqKhUoa2pA9amWW5Ny1u
 3vH2LwBGRUHBq9LOYrtpjjDEMCIdviqWrRzcaDGNTv1AUDsgjRB8xhEtIW2K9l1XIds+
 as6doRz5X/UIV3KQCxrufsKXiH3rxIre4+EOXBXV9KylOHTz1W4+qkcc2s4aspS+0SE+
 ak9JOxBED4jUx+l1cZID5V3CpwgC+yJSd+w1a+HBHeoUJ3etqo1LW0IHs9A9k2jAzPHK
 qMtw==
X-Gm-Message-State: AOAM532oxwEEIM5VtWpgHTvL1skcSZhS+6D2FsRTr+dRa7qDNoCe9nkV
 iShT5OQJJu3uXHVb1YxDQpNVUMhk1uo=
X-Google-Smtp-Source: ABdhPJyGoJDB0ugK5i6RI+GwpuwdbOZqgLbksdhC3n1gJFvsXRkB2QqcXdOhHyqFOsQVgQNMrEtXlw==
X-Received: by 2002:a05:600c:1e0b:b0:38c:9ac5:b486 with SMTP id
 ay11-20020a05600c1e0b00b0038c9ac5b486mr11858503wmb.71.1648243125715; 
 Fri, 25 Mar 2022 14:18:45 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 20-20020a05600c22d400b0038c8dbdc1a3sm5154615wmg.38.2022.03.25.14.18.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Mar 2022 14:18:45 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Mar 2022 22:17:25 +0100
Message-Id: <20220325211725.612796-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/atk: bump to version 2.38.0
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

https://gitlab.gnome.org/GNOME/atk/-/tags/2.38.0

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/atk/atk.hash | 4 ++--
 package/atk/atk.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/atk/atk.hash b/package/atk/atk.hash
index 2e7c3b5fec..d8cd69ff1f 100644
--- a/package/atk/atk.hash
+++ b/package/atk/atk.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/atk/2.36/atk-2.36.0.sha256sum
-sha256  fb76247e369402be23f1f5c65d38a9639c1164d934e40f6a9cf3c9e96b652788  atk-2.36.0.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/atk/2.38/atk-2.38.0.sha256sum
+sha256  ac4de2a4ef4bd5665052952fe169657e65e895c5057dffb3c2a810f6191a0c36  atk-2.38.0.tar.xz
 
 # Hash for license file
 sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/atk/atk.mk b/package/atk/atk.mk
index dfeb4de8b2..2820fb486d 100644
--- a/package/atk/atk.mk
+++ b/package/atk/atk.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ATK_VERSION_MAJOR = 2.36
+ATK_VERSION_MAJOR = 2.38
 ATK_VERSION = $(ATK_VERSION_MAJOR).0
 ATK_SOURCE = atk-$(ATK_VERSION).tar.xz
 ATK_SITE = http://ftp.gnome.org/pub/gnome/sources/atk/$(ATK_VERSION_MAJOR)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
