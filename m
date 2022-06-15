Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28679C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Jun 2022 01:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 975CA40A8A;
	Wed, 15 Jun 2022 01:15:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UqvU_Pe4d6AO; Wed, 15 Jun 2022 01:14:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id A61E240236;
	Wed, 15 Jun 2022 01:14:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AFF461BF3C1
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 01:14:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AC87A40236
 for <buildroot@lists.busybox.net>; Wed, 15 Jun 2022 01:14:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id imTJy0bEjZ6N for <buildroot@lists.busybox.net>;
 Wed, 15 Jun 2022 01:14:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D845C4002B
 for <buildroot@buildroot.org>; Wed, 15 Jun 2022 01:14:56 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id h8so11166645iof.11
 for <buildroot@buildroot.org>; Tue, 14 Jun 2022 18:14:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FlB0EmQ/sv+SZrwjsayrpFsrNXA2zIR3p3DRUTx9TC8=;
 b=dEZaGt+GnmbPp0l853GDwD3sKy4AIEy9QfXkRCz7V2LfJHd9q6S6uE52trSq/h4jUR
 tIqxay2IyppS5YKWzcKjqsUFVxrCaG6E4dYZLLIov3NoP/mGH0KANgRjlKpyFA6f4HQ8
 hE7rMfYq5i9lLJxZZrWT/Po7N+xN6y76eQOrrNMWNc7fAY1XqjNMu5pMsIxGkvcsaACd
 xyzYUGHhWEPKwbMW+otrXhRL6b6HGNjRr6ck5CxDgj4/ZGvFJGGy4IPp9crUYQta/buE
 pCAY1210S1c+1IIL2qZWio4SdyA9c6CNsPsdnkAJ+QeBIUXW8YX1Kfzpqy+mTKPc4JCc
 hrEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FlB0EmQ/sv+SZrwjsayrpFsrNXA2zIR3p3DRUTx9TC8=;
 b=4n1TvqCd8ed0so9vptKXeVHk05qrTHH1iMsmcGNGHSh/UCfs2bCrXvdSRYd+ummY0F
 jKdaF3ZDMg4m+H4b4nwR0Aieum9Zr27nBte2kiFCfDcSG3Bzdo7qwHqF90dF1Qs9ZnVU
 oDC/SN9ZKgrDY03Ub3KMhvamIpcsx1sGjvXKTz2T3CYmXeH36BnVp9rXQEnS/5BJmOym
 qCOpENzvy7Nh5iOOA0JAujHyMrYvW1YNLnGfe3qnMnt84M0ctpT7TTJoUDomOjo5ytq3
 FuCtUonC8RISpnHdP9o31S9e/7cjuzhTIcRTh/NnhclLbiiHTRlDyr1trliwisOYWoHM
 wX9Q==
X-Gm-Message-State: AOAM532ouCZRDFoJtTFUMModhGbGsJKIRviRpOCHXtXp1pLJJlBZuK2c
 zyNRxab7zOgg2kymVH9tbaUQA9uKp4c=
X-Google-Smtp-Source: ABdhPJyZtpUfvY15hs69ACwnb8hfBXqqFDyItOvjzfXEjyp4tnI1ZF31llpJMyZo4Do/dgmihMy/Zg==
X-Received: by 2002:a02:6412:0:b0:32e:acad:ce33 with SMTP id
 t18-20020a026412000000b0032eacadce33mr4418482jac.150.1655255695444; 
 Tue, 14 Jun 2022 18:14:55 -0700 (PDT)
Received: from james-x399.localdomain (71-218-113-86.hlrn.qwest.net.
 [71.218.113.86]) by smtp.gmail.com with ESMTPSA id
 f9-20020a056638022900b0032e174e945csm5537662jaq.32.2022.06.14.18.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 18:14:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 14 Jun 2022 19:14:50 -0600
Message-Id: <20220615011450.1900765-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/{glibc, localedef}: bump to version
 2.35-134-gb6aade18a7e5719c942aa2da6cf3157aca993fa4
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
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Contains various fixes some of which may effect pthread fork handling.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index e0bbf341eb..016467cd81 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  fc3c1d25640fd4cd09fbf7e17eafcc7943731e901cc0a3686503ae8adfb11d31  glibc-2.35-96-g2c4fc8e5ca742c6a3a1933799495bb0b00a807f0.tar.gz
+sha256  f339586a104a8e12ff44d38fb24574d2abe694ddba322404f8bc1a50f4343228  glibc-2.35-134-gb6aade18a7e5719c942aa2da6cf3157aca993fa4.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index f3a08fbf24..5af539ca62 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.35-96-g2c4fc8e5ca742c6a3a1933799495bb0b00a807f0
+GLIBC_VERSION = 2.35-134-gb6aade18a7e5719c942aa2da6cf3157aca993fa4
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 061b7c7fc2..ae4cc55f30 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.35-96-g2c4fc8e5ca742c6a3a1933799495bb0b00a807f0
+LOCALEDEF_VERSION = 2.35-134-gb6aade18a7e5719c942aa2da6cf3157aca993fa4
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
