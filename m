Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3096CD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 14:12:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D209608B0;
	Sun,  7 Apr 2024 14:12:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jx5utqyuE-A7; Sun,  7 Apr 2024 14:12:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8662A608BD
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8662A608BD;
	Sun,  7 Apr 2024 14:12:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 6C0901BF30F
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:12:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5962981F77
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 14:12:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fYD3utbczzOg for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 14:12:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 34F8181F71
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 34F8181F71
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34F8181F71
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 14:12:52 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-41650ee55faso4253525e9.1
 for <buildroot@buildroot.org>; Sun, 07 Apr 2024 07:12:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712499169; x=1713103969;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4jltGxnqSmLaohXJn5+V7hT0eifZ1hMkLBfidJsZJVY=;
 b=kD05EC8fKHcv9FslbaAy5ad+NrRgPsoc2YBmPfnlshbYf74Hh1685FYYBM4PEU6lXD
 7LmTIPOlYpwfMDce4GTJIFpuEaMR13ure9N+EEyUPSTF5Jt9C44hDL8Uy1gi3fOb/Kdh
 ZCSRj7iJ/ih9dPfpcN8Di64XJPzuEnvb2cIs628sr+i4/ZQOYgO8PAynXplrwjjAl/YX
 Uq51lVS5KeBMjvcM6PYZSRuhhSi7VZys0VDTqTptI84IYkW9AjKKw3raYMeyN9/4nf9y
 x+YjvPopb01RrW2V0Y5vDElgfT0MUcQIvsLQi0IRxpyYNpKGwaHew2+nAVOTfWKAjUvM
 bcoQ==
X-Gm-Message-State: AOJu0Ywt3i6K7ojbFv0JQhoU3RUDRsAbNx+jE8ZGcISUsmg0bfEzWV0t
 G0YI4db8nS+aWAQx30Nb6L3IyyqVT6goSpJ1JaCeHpaV3uygaC6ZaA/kCJhM
X-Google-Smtp-Source: AGHT+IHVMBUCVE1bw1Lf5q0vHx+HEzDDqAxByG50YIWC1LQ/ur8CW3rCtko+WVrHokJWFhvdM0YjuQ==
X-Received: by 2002:a05:600c:3c92:b0:413:3941:d9ae with SMTP id
 bg18-20020a05600c3c9200b004133941d9aemr4298782wmb.31.1712499169299; 
 Sun, 07 Apr 2024 07:12:49 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 n10-20020a05600c4f8a00b0041493aae77esm13531455wmq.23.2024.04.07.07.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Apr 2024 07:12:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  7 Apr 2024 16:12:47 +0200
Message-ID: <20240407141247.1875759-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712499169; x=1713103969; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4jltGxnqSmLaohXJn5+V7hT0eifZ1hMkLBfidJsZJVY=;
 b=gGE4AzQxGrwUhcRvnY4017Hr0h1Avbr19o+AOjvZrDmXcc97i94FVkCnFOCa4toiL/
 Er4mUpjvWFSaOj6yRVqLm0YmbMXgctyF08QRip92+vYkyc7pzN8ejcb5x/+MlpWpubWo
 EOsdLqsVsNXd8bEXq4eL+KDf9Uij8q9V7wgTVeIvIn8yuklB6r7Ss5eP6lZ5w3mWHYgi
 xjivxmeA93sUpXzXupdVi5OxJdiPKZyPJ0AVmhXejQo34bA95OZUx6YwbkaoermLWKzP
 CM76FQc5zyGtCB9ivLSevMoKlM88K5pR7+Tk4fLBKndfJOfbQpH5Jtm4f+B2CD5iBcD6
 V/6Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gGE4AzQx
Subject: [Buildroot] [PATCH 1/1] package/vsftpd: add libxcrypt optional
 dependency
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

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-5/output-1/host/lib/gcc/mipsel-buildroot-linux-gnu/12.3.0/../../../../mipsel-buildroot-linux-gnu/bin/ld: cannot find -lcrypt: No such file or directory

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/062dbadf1f2f8e25747f7689974a693163932113

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/vsftpd/Config.in | 1 +
 package/vsftpd/vsftpd.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/vsftpd/Config.in b/package/vsftpd/Config.in
index 464d6f27e3..fb74b14501 100644
--- a/package/vsftpd/Config.in
+++ b/package/vsftpd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_VSFTPD
 	bool "vsftpd"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  vsftpd is an ftp daemon written with security in mind.
 	  http://vsftpd.beasts.org/
diff --git a/package/vsftpd/vsftpd.mk b/package/vsftpd/vsftpd.mk
index 6742843c19..14c1b6be13 100644
--- a/package/vsftpd/vsftpd.mk
+++ b/package/vsftpd/vsftpd.mk
@@ -35,6 +35,10 @@ VSFTPD_DEPENDENCIES += libcap
 VSFTPD_LIBS += -lcap
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+VSFTPD_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 VSFTPD_DEPENDENCIES += linux-pam
 VSFTPD_LIBS += -lpam
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
