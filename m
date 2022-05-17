Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C390C433F5
	for <buildroot@archiver.kernel.org>; Tue, 17 May 2022 19:24:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D9B560E11;
	Tue, 17 May 2022 19:24:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D1swTFra0Qzp; Tue, 17 May 2022 19:24:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 921A660B85;
	Tue, 17 May 2022 19:24:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D09D71BF403
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 19:24:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CD3A260B6A
 for <buildroot@lists.busybox.net>; Tue, 17 May 2022 19:24:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lI1Sj9C6ZSl1 for <buildroot@lists.busybox.net>;
 Tue, 17 May 2022 19:24:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1BC6460B85
 for <buildroot@buildroot.org>; Tue, 17 May 2022 19:24:46 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id m6so20380473iob.4
 for <buildroot@buildroot.org>; Tue, 17 May 2022 12:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u1k9g5TLf8FiWat/MGtGHRpYjd/VsiHdpvNGN3S41+4=;
 b=oTt8964XF8Ou1kKqiE1zFh6Y4oX3Y9IKDDI25hh3IwnnM3FpUNDR4mFTv44vp+NpEp
 9YKwzD5mIX27GmMZAJEO9wmAtWELrTfcaP4anC8mFeTOnLe//DQQX0HwKOQRTf5vVZFk
 vdvSv/q0UmRcdoozVnvqdNVVidMQ24Ky80cvzpgm3Cr2CtCkOGZBQedawOya6Jm/ddUM
 LVNGrsZaqSk5P2hWHN8RBIky8WKMBhLVDaUClwmrTqbOx67EPzSa8NJXOrPB+pQipsaE
 MnU5zh9vAmXd/6EYsPwsVeyroIdJ2saI1fjjiJtSbKc6JgpUJ7agoqLj10I/fHlLEfZY
 mCmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u1k9g5TLf8FiWat/MGtGHRpYjd/VsiHdpvNGN3S41+4=;
 b=R8UGftgHAeTz+x60u4AKOdwMvC515mtl5XOhR7PveLbAE+P+CqSCRhDRIZQVNKlO0H
 Qk2ivymKQWGtUbiiNPFoNB987rv223q2F+xr64ocvbwWz7Eu8zW1XoCLoPfrvJE95Wpi
 uIfjFBqPB37EVIBxxbi2P0G9X/yLH1CcO+BoS7xXQBXaiy5YiFcYSoPUo3RSgZd4+SZv
 2IVcZ7VErmukiCiGbNAx4Jc3VEQJL6E/I+2oy7uCBIzyZglH+ohrSYpSj/p9SLG//+lo
 B1vzz7YstvNrTA4azAlluy/WStbLX7E4b8jtOUNkfQMrglaTGEsdToir1mF5/ARaZiF/
 BLpA==
X-Gm-Message-State: AOAM532T/GFNcb7iE6PIOPkejsphotgoHYzRlefhaeXxyoA+aTEiCF4F
 pEy3DWMXUSn+pYI0kgcjjYWLFi60nIk=
X-Google-Smtp-Source: ABdhPJz83EjiLRNgGYuZcNlFEGskeDb0KvubeiSRWpN4fa7JXzD65UJlO/nxlz9qNVwVZhsxyw2YPw==
X-Received: by 2002:a05:6638:3289:b0:32e:2c45:93b5 with SMTP id
 f9-20020a056638328900b0032e2c4593b5mr6726441jav.96.1652815486023; 
 Tue, 17 May 2022 12:24:46 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 b24-20020a05663805b800b0032e33767166sm1718849jar.9.2022.05.17.12.24.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 May 2022 12:24:45 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 May 2022 13:24:39 -0600
Message-Id: <20220517192439.1034654-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] system: generate and set C.UTF-8 locale by
 default
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that glibc/localedef supports the C.UTF-8 locale we should default
to it as software like systemd generally expects it to be the locale
used.

This should in general reduce the amount of locale related
compatibility issues and is what many distros have been using for
their default locale for quite a few years so it should be a well
tested configuration.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 system/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/system/Config.in b/system/Config.in
index 888c24ce81..7cc529d31e 100644
--- a/system/Config.in
+++ b/system/Config.in
@@ -440,7 +440,7 @@ config BR2_ENABLE_LOCALE_PURGE
 
 config BR2_ENABLE_LOCALE_WHITELIST
 	string "Locales to keep"
-	default "C en_US"
+	default "C.UTF-8"
 	depends on BR2_ENABLE_LOCALE_PURGE
 	help
 	  Whitespace seperated list of locales to allow on target.
@@ -455,7 +455,7 @@ config BR2_ENABLE_LOCALE_WHITELIST
 
 config BR2_GENERATE_LOCALE
 	string "Generate locale data"
-	default ""
+	default "C.UTF-8"
 	depends on \
 		(BR2_TOOLCHAIN_BUILDROOT_UCLIBC && BR2_ENABLE_LOCALE) || \
 		BR2_TOOLCHAIN_USES_GLIBC
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
