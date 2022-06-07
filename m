Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 706FEC43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 09:33:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 052E584322;
	Tue,  7 Jun 2022 09:33:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id am9cJ5ENxqPJ; Tue,  7 Jun 2022 09:33:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C876184310;
	Tue,  7 Jun 2022 09:33:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A94091BF2A9
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 09:33:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A1213613E8
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 09:33:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4YbAtlHvj-zL for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 09:33:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D6053613E7
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 09:33:04 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id f9so3900875plg.0
 for <buildroot@buildroot.org>; Tue, 07 Jun 2022 02:33:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BWIWvzJow8Dv24zqIP1sHW3nuYsbGVsM4aHZotP9dSI=;
 b=jwcOM4oibcbZ0l62IjukJ2KuATUV7+4D8+y7UHPQGXmJfzifH2T6qi4LV4GSDQXZ8r
 Gg7Y24Umjstx2vgScXyhHMggwdmSeZiiDXZSUYYcoEkbxPGcOv4o0zyXn+16rGus1KLN
 tf2bdpD5HjXJidFyQjNO66mfS+m9Jup0tNdmbKKrZ4oWe7OMNv06eAXBkrKVEDRBhJgG
 VU9Va3g5sy8HmW5Vj3XWEYd//RP58JTp2w7AWWLTpfmdJbXcTaRfVpX9Amao9kG3wU/Y
 70FSgmO9Is7Ag8LICQMBa2yt6ygXjwVTMinwF/Ohl/Q/aKx+2zJ3ayGvyD8CL9wBeE6b
 NA5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BWIWvzJow8Dv24zqIP1sHW3nuYsbGVsM4aHZotP9dSI=;
 b=w4HAU+FBUvAV+d0fx4cZFJmfsb7SYaZMaXWsTpZDEWog17yZ4uJ59pEcpycMut890O
 omm3NjplHsi1Xg4+3vlfArbWkMXtb7HvF868KJYvS6RDHRXAISy1CRKHDnfK0wu5dGFC
 jWOf2Ok4k0VKak5IR0fcwVwiqc7to4AvCI4+8ynPvI7W/LBDO/3EbidUFdIey1pyaSuz
 8TqKPbSYJ/utdm8XUbBFBYOg3HFUBLYEEOThALujuOtf4X+we1D+qjIfw6bcz3qxtjAW
 8s5/dHia8rr41p4t8F3iyitMz+1FISalxLNIzdzVM5i6IjLvHhbWhfW7XDm308Xcv72L
 UcPA==
X-Gm-Message-State: AOAM530ibfgTL9cAXOjLSZe4xUksaBqOWGj2vlusbXcj1m85DTWkrQ65
 deIxJrxwDShvyPp/ZLYww8i7bxk9qTg=
X-Google-Smtp-Source: ABdhPJxr+SC5gQQf+5iV3Dtr5UAhIkhvQaFJ0tkuSyRNwnmacD+pbUVdpbA9CoW/+PUFj8/ZJSURrA==
X-Received: by 2002:a17:90b:1809:b0:1e8:7495:3c6d with SMTP id
 lw9-20020a17090b180900b001e874953c6dmr13092118pjb.193.1654594383983; 
 Tue, 07 Jun 2022 02:33:03 -0700 (PDT)
Received: from chrisp-dl.atlnz.lc ([2001:df5:b000:22:494a:c636:827:7ced])
 by smtp.gmail.com with ESMTPSA id
 k189-20020a6384c6000000b003fcde69fea5sm10404449pgd.81.2022.06.07.02.33.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 02:33:03 -0700 (PDT)
From: Chris Packham <judge.packham@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  7 Jun 2022 21:32:43 +1200
Message-Id: <20220607093243.2806482-1-judge.packham@gmail.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/syslog-ng: Bump to version 3.36.1
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
Cc: Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to syslog-ng 3.36.1 and update sample config.

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
 package/syslog-ng/syslog-ng.conf | 2 +-
 package/syslog-ng/syslog-ng.hash | 2 +-
 package/syslog-ng/syslog-ng.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index 64ff980593..49e1519179 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
-@version: 3.35
+@version: 3.36
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index ab643627e8..6e451b9a2e 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  1d0238b06b3e5987c859e5b529ecee738f75bacff04b149398b1fe8cbb121e53  syslog-ng-3.35.1.tar.gz
+sha256  90a25c9767fe749db50f118ddfc92ec71399763d2ecd5ad4f11ff5eea049e60b  syslog-ng-3.36.1.tar.gz
 sha256  e912cf1e1c09b81d61c0154eb6c179588622c31ad07bfb4a90c612d07ff09d9b  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index fc57a56820..fab8357438 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 3.35.1
+SYSLOG_NG_VERSION = 3.36.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
-- 
2.36.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
