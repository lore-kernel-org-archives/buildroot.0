Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B640CC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 20:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 66DA6408A9;
	Wed,  9 Feb 2022 20:35:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id afhXEty_UDg9; Wed,  9 Feb 2022 20:35:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E57440886;
	Wed,  9 Feb 2022 20:35:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 922101BF42C
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 20:35:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CAFA40150
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 20:35:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f9xwFMt07Lg6 for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 20:35:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 45A59400B9
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 20:35:06 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id h6so6005345wrb.9
 for <buildroot@buildroot.org>; Wed, 09 Feb 2022 12:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bn4K+m1ewfckoi7D9Bf97NoUgHeL0Ex9moM3NgrFBls=;
 b=GJK2H12M04Hnd06/pDJcY6DcCVt69MMqf/6G+ZKi1FR6AyrllT1aPu2cFO6FUPVHBW
 zhllU1nHL79EhtXKblF9KCxW/NyIleIaBqjEAdHWJSolzMfs57ZMtRZblye/2duzyFQn
 RuelMFCoR2NUGsRVIXN5p3mkb9oz04j+gU0V0dyLFT1wgUvJ3ZS6iEG8wjzVMPP2bOo+
 3G6kqy55i3QTESdFB3+OclYCjVt5w4VhffCCinEh/DM7Y6NdJeS/kqcaiRDtUYMvTWya
 BINSA3BHo+qAuZzT3HIv4j7V9nQtz6u85cIVjgLyRzIXQFWOyOeyU4u8UbLx3E6PRBON
 61VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bn4K+m1ewfckoi7D9Bf97NoUgHeL0Ex9moM3NgrFBls=;
 b=p8KJ8KG8Br3s83U/6VQNqr98l6SNy3Szji1MsYvg8332Iddtl8hY7R1gyxgTMcSS/0
 TU74A+YtusNG9beJXNTezsBZS+HE5NNlKHd5xsm5sofSvR3366AMybXe1j/tbtOYNSeY
 cQI6szSouClM8BAR6i6zTVoTuSliIrg7oNjX83QOEEu3oLRY1nBaGRNFdSFeo4JlEkQO
 0KxdpTBAeYsiKZGcmeBij3I2SdU3wy+5Sp4zVVWHJt5FByF3ul4KUBtHyLsbqDjm1bps
 l8qbvuQfSoxyyELNotbvjl8HZ+fzsWDFmaUAD0Cka85I+fWCHWwpOwiDrVBzthCl/GVu
 neEw==
X-Gm-Message-State: AOAM531SyEZ08q69QmDCeZZ42NpniReTk66apEyxbM+HX38vbCK+Vu4G
 QF0gpPEocCx783BVzK4jGneyB2K0g3A=
X-Google-Smtp-Source: ABdhPJyOrkOk2cC+/m6Dn+AnBrEuaDoVaLYeBcA8dVLDD+/d3GdN4Na23tOj/oC40ZaqO61HIxiDIg==
X-Received: by 2002:a05:6000:1e07:: with SMTP id
 bj7mr3402723wrb.154.1644438904227; 
 Wed, 09 Feb 2022 12:35:04 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id n13sm6179732wms.8.2022.02.09.12.35.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 12:35:03 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 21:35:35 +0100
Message-Id: <20220209203535.361814-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/lzip: bump to version 1.23
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

https://lists.nongnu.org/archive/html/lzip-bug/2022-02/msg00000.html

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lzip/lzip.hash | 4 ++--
 package/lzip/lzip.mk   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/lzip/lzip.hash b/package/lzip/lzip.hash
index 57e7eb43f4..5e285a5ad8 100644
--- a/package/lzip/lzip.hash
+++ b/package/lzip/lzip.hash
@@ -1,4 +1,4 @@
-# From https://lists.nongnu.org/archive/html/lzip-bug/2021-01/msg00008.html
-sha256  c3342d42e67139c165b8b128d033b5c96893a13ac5f25933190315214e87a948  lzip-1.22.tar.gz
+# From https://lists.nongnu.org/archive/html/lzip-bug/2022-02/msg00000.html
+sha256  ea02b9e6fb25d0e1a1d3ef4fdeb6ab26b931f1ece66fa1cee2983c95215e930a  lzip-1.23.tar.lz
 # Locally calculated
 sha256  3d77c1a58fbde5ddba612d1fe09965e20a3804953eca12e8c1892298bb8a5eef  COPYING
diff --git a/package/lzip/lzip.mk b/package/lzip/lzip.mk
index cca6da07d0..e3cc86b956 100644
--- a/package/lzip/lzip.mk
+++ b/package/lzip/lzip.mk
@@ -4,7 +4,8 @@
 #
 ################################################################################
 
-LZIP_VERSION = 1.22
+LZIP_VERSION = 1.23
+LZIP_SOURCE = lzip-$(LZIP_VERSION).tar.lz
 LZIP_SITE = http://download.savannah.gnu.org/releases/lzip
 LZIP_LICENSE = GPL-2.0+
 LZIP_LICENSE_FILES = COPYING
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
