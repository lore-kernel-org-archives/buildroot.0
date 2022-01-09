Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8E0C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 13:12:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C83280B16;
	Sun,  9 Jan 2022 13:12:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nis1rCtMUbtV; Sun,  9 Jan 2022 13:12:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 894998132E;
	Sun,  9 Jan 2022 13:12:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D5C7A1BF4D7
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:12:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D295C813F7
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 13:12:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rIBl9thY0hzd for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 13:12:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0197E8132E
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 13:12:38 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id t28so14785491wrb.4
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 05:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LYAFYzQYDqadjMzddSTVWOV810EsKXl24r8tcp9eg5Y=;
 b=o/BoCQFnUXkwbKsKE7vSzRABi9Y6yhHCIsrgKbFbMDftwLUKZXcq1IpgtjnOfqqy1L
 L+ZMmuV84VUB7ubxOTgivNn68NAJyp0RJ78qpKV6iJsQG2T7NDCLjXMr4zx6eTfom42c
 XafLkxaCvLGaf3KBsvMSeqSf1swWP5yuYDpgnL8XGkHyzOdWQos+utAwzmz3s/LqX9sm
 /p0dBkp3fS+jW6oQbXgC8sHOq4GB+nqJVytpRKhAQ9xTxGxvUyaIVrjrHoyLvnhHIhDC
 jo+XSmpESPDSEcFy3lBK76Uw6wBJNpgW5PqiD14ZmuCMrADVosj5NcTFr8JeijADA7Yz
 9FZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LYAFYzQYDqadjMzddSTVWOV810EsKXl24r8tcp9eg5Y=;
 b=miZnGmQuk+lcyTGPpREXHTsVfUNXWYtTXdR2hpHhAdCatqN/ITuCLL1TBaDjZD54Ok
 ozjJDnk1jdroMyDwxGevQHndsCiAFcWl8NkhzGzKTv3ALWR1O1kaJhZPwWSBywcui63x
 26fCfWxcp6Ifyc4nh83RbCN76O+AFyiiKBewUoTor2yNuPLYDJDGT6lxhp5fB+Mvlmdw
 +GmFENsl4MfcD5z/hWopsWsUS2Q+VOuMxnYaWwKyfhMNl/XIvORdW7wwEazVe417Hwx3
 6w/7JrvjL8sPfF4nJJiiNqnpvYrZscwPL0AlSlCGOQYOX/4aHYeJq60MMbARKmcYa2Lk
 Egxg==
X-Gm-Message-State: AOAM531FMCbpM+wxW3g1iYjQSMPlkJBti0xGsneHJB0/RsyJD48bV/Hc
 YhbhyxwD+teFmoISwOSw4emEcKPn3jw=
X-Google-Smtp-Source: ABdhPJw7E/fUnPkI0Ax4Be9Vg0cptxRm0COkgYFHgxMxgpBekeaQ1l0WuaIXxgfWSNK3AqcuuIeLGw==
X-Received: by 2002:a05:6000:108a:: with SMTP id
 y10mr60514130wrw.335.1641733957045; 
 Sun, 09 Jan 2022 05:12:37 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id n12sm4488742wrf.29.2022.01.09.05.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 05:12:36 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 14:11:28 +0100
Message-Id: <20220109131128.468829-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libbytesize: bump to version 2.6
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

https://github.com/storaged-project/libbytesize/releases/tag/2.6
https://github.com/storaged-project/libbytesize/blob/2.6/NEWS.rst

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libbytesize/libbytesize.hash | 2 +-
 package/libbytesize/libbytesize.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libbytesize/libbytesize.hash b/package/libbytesize/libbytesize.hash
index 51fa43aef1..2dfa97dd6a 100644
--- a/package/libbytesize/libbytesize.hash
+++ b/package/libbytesize/libbytesize.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6305addae2b7be313dbfc36b96094ec0544d5144859ab4a5685ca6d314d6fdda  libbytesize-2.5.tar.gz
+sha256  efaa2b35b2bb3b52bf7b4ff5d0ed2c5c61360a5196053808d615dd0aa2cf0741  libbytesize-2.6.tar.gz
 sha256  97bdc721d875501b6243a456333fdfdb1ab64d31c4da2554de845caf4674b946  LICENSE
diff --git a/package/libbytesize/libbytesize.mk b/package/libbytesize/libbytesize.mk
index 0ba380dc74..2ef08211c5 100644
--- a/package/libbytesize/libbytesize.mk
+++ b/package/libbytesize/libbytesize.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBYTESIZE_VERSION = 2.5
+LIBBYTESIZE_VERSION = 2.6
 LIBBYTESIZE_SITE = https://github.com/storaged-project/libbytesize/releases/download/$(LIBBYTESIZE_VERSION)
 LIBBYTESIZE_LICENSE = LGPL-2.1+
 LIBBYTESIZE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
