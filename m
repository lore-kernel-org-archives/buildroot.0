Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2A5C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 07:24:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5577960D87;
	Mon, 27 Dec 2021 07:24:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3lA8YZGTzEV2; Mon, 27 Dec 2021 07:24:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B99BB60BDB;
	Mon, 27 Dec 2021 07:24:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 22C3C1BF573
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 07:24:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 114804088C
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 07:24:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8e5QxTjA70yB for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 07:24:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4874C40632
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 07:24:03 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id x21so33060406lfa.5
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 23:24:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rUfYO0917rTgaCkbXH9PbNJdP/Li6hjA8eFYenPHY8o=;
 b=oof7y4Ibzajt2xTkdzwKMFEZrZLPOaer5tOb354rXyN76JSo2h60kdh8SrP18wozpV
 m3Ff2k3g4bNte+rg1Mq84USGHw82dJiqNWz12aukxV01k+Xgv3DRgWSW+ksyNxdDpbK7
 N5alI/stZn9ReM1Uih3IVPPmI/uUUegJgFtZqA0lERiKOwW3FT41HWez2x6bwvFKZwWs
 YrqYMw4SJNyvXPkxUegO8KgFMKT2ziahz8QURc5HEyvffvELNL/ji9KAA5AFS1cthwKp
 R7zgSR8yl3KTHDlQ101FncRUuPV0PhfWbhH6hjCi8I35Wc5G4fg5negxman2zgYBV32e
 3DAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rUfYO0917rTgaCkbXH9PbNJdP/Li6hjA8eFYenPHY8o=;
 b=ZPN7HM5xsiP88jW23vLSSISSSuUWXYX5ZuzOyif4/AKgJZAgWAzrv8sRMRRo20tbYw
 KBLKMJbqDfWz3yieBwMxh3431jqBqLggV8/O4jtRfruOUk69QtosvikqEG6SqsaZR8NA
 147gA6PnEzNralfSwHDpgA+I8hy9bD64eMDl1bGa9oOYEaqJH5bMsJlznvNJebU4CSzp
 pkEMSgvnn4ZJ1dIpBy5zdNQVH/hTmHYTJywfCvDcfD+2E0NEgKfdR6VrPtv4+cGQA8l8
 muq0eQ5o0hRZJyEdmD8Ff2Zw89P76s60gs2k8U27kp53FsjlBmQK/YkSd5kTyutnIZg6
 6SDQ==
X-Gm-Message-State: AOAM530/2K3m02XOhb2KpgmJgA4IetKH92VghZ/OZtzcxKB61boA4TXe
 BUSdBo24jeNpn1myh+uj64zqRTFjfAo=
X-Google-Smtp-Source: ABdhPJxqimVKQM+IJAQf1W4LzpZN0nlwiReL2m3vDFh0FLKpzKwzDaLhXEiy2Id8oeaZm2NGUE+2ag==
X-Received: by 2002:a05:6512:25a:: with SMTP id
 b26mr14212611lfo.296.1640589840947; 
 Sun, 26 Dec 2021 23:24:00 -0800 (PST)
Received: from octofox.metropolis ([5.18.187.11])
 by smtp.gmail.com with ESMTPSA id h19sm809592lfu.250.2021.12.26.23.23.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 23:23:59 -0800 (PST)
From: Max Filippov <jcmvbkbc@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 23:23:44 -0800
Message-Id: <20211227072344.16697-1-jcmvbkbc@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/coreutils: drop
 gl_cv_func_fstatat_zero_flag=no from config env
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Configuring coreutils with gl_cv_func_fstatat_zero_flag=no results in
non-functional lchmod library function which causes 'mkfifo -m' to
always complete with the message 'cannot set permissions of ...: Invalid
argument' and an error exit code. gl_cv_func_fstatat_zero_flag=no is not
needed when building coreutils-9.0 for linux and its setting should be
correctly determined by the configure script.
Drop gl_cv_func_fstatat_zero_flag=no from the coreutils configure
environment.

For more details see
https://lists.buildroot.org/pipermail/buildroot/2021-December/631388.html

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
 package/coreutils/coreutils.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
index 9c0f46cb29e2..a31354ac5abb 100644
--- a/package/coreutils/coreutils.mk
+++ b/package/coreutils/coreutils.mk
@@ -45,7 +45,6 @@ COREUTILS_CONF_ENV = ac_cv_c_restrict=no \
 	gl_cv_func_getcwd_null=yes \
 	gl_cv_func_getcwd_path_max=yes \
 	gl_cv_func_gettimeofday_clobber=no \
-	gl_cv_func_fstatat_zero_flag=no \
 	gl_cv_func_link_follows_symlink=no \
 	gl_cv_func_re_compile_pattern_working=yes \
 	gl_cv_func_svid_putenv=yes \
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
