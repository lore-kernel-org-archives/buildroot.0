Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F37BC43334
	for <buildroot@archiver.kernel.org>; Mon,  6 Jun 2022 21:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 299A5409D5;
	Mon,  6 Jun 2022 21:39:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tHiajScmfSkG; Mon,  6 Jun 2022 21:39:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A0E54014C;
	Mon,  6 Jun 2022 21:39:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2331B1BF279
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 21:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1FF5C61055
 for <buildroot@lists.busybox.net>; Mon,  6 Jun 2022 21:39:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VTb6qyj38XS0 for <buildroot@lists.busybox.net>;
 Mon,  6 Jun 2022 21:39:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22BDB60EC7
 for <buildroot@buildroot.org>; Mon,  6 Jun 2022 21:39:21 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id u3so21538885wrg.3
 for <buildroot@buildroot.org>; Mon, 06 Jun 2022 14:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0xiazr3/H1cEC0bkIGDFcykzXoyrenwQQTCxrUZI9RM=;
 b=HC+uX1n24McJzrGDMGgQPAaeycuR/deQTbHIqwSKacV+tIzePkIbWecZdHS+2uKwu/
 0jokcm/0eFTxh5Iqheo7tWwpHF/QSrctkkNVaxy6gTUiXT71Aj63I3ZBAk/5PljQEhmv
 /lQFqy2VlT70oTmFh2KkbqTFpXc3Jm74H5AUWxylo82JF5IQNVCyE43jrLgJoFh5CGZD
 k9dCfjj7pdUg0W4YYdYW6PLdocWJMd/CAdTAop+oLZSUHhNg757lBtjxm643u31EYZHr
 OE5QZ+Y0bKz3d5qsK2WfJBYemJQFKcW8tDqTpfPs5QTkmPyoCU8ufg5im46kECqIhznX
 fyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0xiazr3/H1cEC0bkIGDFcykzXoyrenwQQTCxrUZI9RM=;
 b=AWFwVYB3ckDY/crt4CwRvxYM3xYow1abDz1lwcreZzU0WdXp+1yiFmRnobfKv7IBtZ
 EHv+UoGqGr6SkBcGxBkdiKYqz2amwL/gh0L1trKjkZXlkvxvMrtwQmGN3zGhf8NVibpp
 IYaFNXOXb01SemQ/LVq6/Dfvj7PRmHyv8+bx6oOKXgTF3l2YAsAoHyUUdyatwFjjS/Hu
 Iax+A9stRrNxh4/7ip9msYNPDwgqGLflPcWKEV1QF945iLnPPJysene/3FFaj39ZKQ3U
 VF/SoHi7qC6fDEHm7QcRaMREess3X5H0vB3/AoaKVLY8vOY9+yPzBzuAOhhXEh6SVwzl
 Ptiw==
X-Gm-Message-State: AOAM530BmT59Mb+Y+cRVIINYs15i0uxDrcGscPJcc2RIsK49qRsb9lhn
 LVQeJTO3qqVfENWlQPL8G/JS7ekiOWI=
X-Google-Smtp-Source: ABdhPJz0Z7r/fFNLP1lc145VnFLjnyv8sLb3trg3zIkdwznsjAMfiv9B/XX0t0DuWMChBBFoS3pnzw==
X-Received: by 2002:a5d:588d:0:b0:218:4d47:bb66 with SMTP id
 n13-20020a5d588d000000b002184d47bb66mr1248332wrf.157.1654551559142; 
 Mon, 06 Jun 2022 14:39:19 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 m4-20020a1c2604000000b0039c506de087sm3726053wmm.6.2022.06.06.14.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 14:39:18 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  6 Jun 2022 23:36:48 +0200
Message-Id: <20220606213648.20480-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/expat: bump to version 2.4.8
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

https://github.com/libexpat/libexpat/blob/R_2_4_8/expat/Changes

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/expat/expat.hash | 8 ++++----
 package/expat/expat.mk   | 2 +-
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/expat/expat.hash b/package/expat/expat.hash
index 26f1098b7a..91d7a79d28 100644
--- a/package/expat/expat.hash
+++ b/package/expat/expat.hash
@@ -1,7 +1,7 @@
-# From https://sourceforge.net/projects/expat/files/expat/2.4.7/
-md5  75a1f475e30281a00cb6f083ea481159  expat-2.4.7.tar.xz
-sha1  032ceaa11cd791d4bc622bbf0d835b8766207796  expat-2.4.7.tar.xz
+# From https://sourceforge.net/projects/expat/files/expat/2.4.8/
+md5  0584a7318a4c007f7ec94778799d72fe  expat-2.4.8.tar.xz
+sha1  e30345a20d0cc29a0c307eb3703e7a9bb62afa90  expat-2.4.8.tar.xz
 
 # Locally calculated
-sha256  9875621085300591f1e64c18fd3da3a0eeca4a74f884b9abac2758ad1bd07a7d  expat-2.4.7.tar.xz
+sha256  9875621085300591f1e64c18fd3da3a0eeca4a74f884b9abac2758ad1bd07a7d  expat-2.4.8.tar.xz
 sha256  8c6b5b6de8fae20b317f4992729abc0e520bfba4c7606cd1e9eeb87418eebdec  COPYING
diff --git a/package/expat/expat.mk b/package/expat/expat.mk
index a42c77e0fb..e89de81da7 100644
--- a/package/expat/expat.mk
+++ b/package/expat/expat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-EXPAT_VERSION = 2.4.7
+EXPAT_VERSION = 2.4.8
 EXPAT_SITE = http://downloads.sourceforge.net/project/expat/expat/$(EXPAT_VERSION)
 EXPAT_SOURCE = expat-$(EXPAT_VERSION).tar.xz
 EXPAT_INSTALL_STAGING = YES
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
