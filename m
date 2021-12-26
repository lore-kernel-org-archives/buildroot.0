Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1137C433F5
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 15:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B36B40491;
	Sun, 26 Dec 2021 15:22:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VUb9vnDWgMET; Sun, 26 Dec 2021 15:22:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF6B8401DF;
	Sun, 26 Dec 2021 15:22:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 915951BF2EA
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 15:22:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E6CC401DF
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 15:22:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xUaehgRwJPPG for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 15:22:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 97CBA40199
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 15:22:07 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id s1so27517452wrg.1
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 07:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3C82Mbma7QKR5dOqLEWBA8kl1y9rUtRIVdscyNzy+fQ=;
 b=j4VB+L2ImdG9RTJ8vv80mzpjeA6pt/363HD89cIR4D6dSwLvX9nDELLAxqaGmTGvfq
 cyreie2b0UMwcHEdHLZGM2blqasXSs2LjcCydqFbWWnDGau9iG/NLwf21OS70FAdVtfH
 aTpo9cCSftwOi0U0Va1XPO/8Tg18xCOPs2KCHAFS8ANXwdKovqI8Z11P3SDrgR0qDRiu
 Oe1CZHAecOlftMIve7TbWSbwQXUDIzn0Yr42bw8x77fcMRiSeVEC752wMgBRFk+F3MfW
 zxBLKdNLvhiv5KrJ7vIhmNiTSZQgpHF7ssYpD1QjzuSu6VEA8YxkMcGkENae8THvIhu4
 d1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3C82Mbma7QKR5dOqLEWBA8kl1y9rUtRIVdscyNzy+fQ=;
 b=f805Qo3gwwTzNrUZZawiw9qM17bmR9WVkQXkRwHh92zzgdAHpML31UCfN9j8jEMYhf
 Ob+tRXiu65EZTl6mOHWhXixB7G8+noNWH3P9Zjz/wCXGZShoe63njOmEhK+UjJYXpHY1
 wjcKwhJ3drIZdcOMe2qnf/nr6RjAri6u1nArex3nUptso9s030GTfutT/8g8jElmollA
 MPJsN3SD2ImqaBXimpLBK/MvJAzIT5xbjHtgwjTxN6tm/cLm/cas6OCmFq3KaE8yAaVq
 EWrOdNUTj+mEyJl1JIYwfoRCzNW9MWx4TrXWw/RT+7l33jUekCxw42RsecCyET/urdkV
 oHYw==
X-Gm-Message-State: AOAM533hyfkL2uFTxNYPJIdYRAmPs/nCSDqTWuuTf3Cm8kVPCd1c1IU6
 3Z96kr6dwbD7U5m3z2qkRUkNqlCSiAFyOw==
X-Google-Smtp-Source: ABdhPJzuIIrtjag74BBJmfhZlMrj//gcrgYQEp/IqMrucDyYue56ZHGVYcEGPoU++nYufTD8r08MkQ==
X-Received: by 2002:adf:9d82:: with SMTP id p2mr10099866wre.414.1640532125835; 
 Sun, 26 Dec 2021 07:22:05 -0800 (PST)
Received: from kali.home (2a01cb08896fec001e062303fcff6330.ipv6.abo.wanadoo.fr.
 [2a01:cb08:896f:ec00:1e06:2303:fcff:6330])
 by smtp.gmail.com with ESMTPSA id p22sm21342512wms.2.2021.12.26.07.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 07:22:05 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 16:21:24 +0100
Message-Id: <20211226152124.790592-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libgpgme: bump to version 1.16.0
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

https://dev.gnupg.org/T5499

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libgpgme/libgpgme.hash | 4 ++--
 package/libgpgme/libgpgme.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpgme/libgpgme.hash b/package/libgpgme/libgpgme.hash
index 35767a27fe..ca2a79496c 100644
--- a/package/libgpgme/libgpgme.hash
+++ b/package/libgpgme/libgpgme.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://gnupg.org/ftp/gcrypt/gpgme/gpgme-1.15.1.tar.bz2.sig
+# https://gnupg.org/ftp/gcrypt/gpgme/gpgme-1.16.0.tar.bz2.sig
 # using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256  eebc3c1b27f1c8979896ff361ba9bb4778b508b2496c2fc10e3775a40b1de1ad  gpgme-1.15.1.tar.bz2
+sha256  6c8cc4aedb10d5d4c905894ba1d850544619ee765606ac43df7405865de29ed0  gpgme-1.16.0.tar.bz2
 # Locally calculated
 sha256  ca0061fc1381a3ab242310e4b3f56389f28e3d460eb2fd822ed7a21c6f030532  COPYING.LESSER
diff --git a/package/libgpgme/libgpgme.mk b/package/libgpgme/libgpgme.mk
index 95a419258b..f61e9fe41a 100644
--- a/package/libgpgme/libgpgme.mk
+++ b/package/libgpgme/libgpgme.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPGME_VERSION = 1.15.1
+LIBGPGME_VERSION = 1.16.0
 LIBGPGME_SITE = https://gnupg.org/ftp/gcrypt/gpgme
 LIBGPGME_SOURCE = gpgme-$(LIBGPGME_VERSION).tar.bz2
 LIBGPGME_LICENSE = LGPL-2.1+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
