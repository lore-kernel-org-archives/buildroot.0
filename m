Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA8EC433F5
	for <buildroot@archiver.kernel.org>; Tue,  1 Feb 2022 23:10:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C41C60DC6;
	Tue,  1 Feb 2022 23:10:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FvlH4sfBVJrH; Tue,  1 Feb 2022 23:10:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F37060BBD;
	Tue,  1 Feb 2022 23:10:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CAF0B1BF2BD
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 23:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B7A2C400CC
 for <buildroot@lists.busybox.net>; Tue,  1 Feb 2022 23:10:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X0v3ZmY3LZOQ for <buildroot@lists.busybox.net>;
 Tue,  1 Feb 2022 23:10:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4FF2A40017
 for <buildroot@buildroot.org>; Tue,  1 Feb 2022 23:10:49 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 bg19-20020a05600c3c9300b0034565e837b6so1782475wmb.1
 for <buildroot@buildroot.org>; Tue, 01 Feb 2022 15:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c8oxgWFeU7rl9DUh31JPfVOvqusflm+aN2rarpyNAsY=;
 b=HkjGcDDx3V8Z+fRw4+7eyZBsHbzUJOvePqAbga5482q+MGIFJNlmzUml5saO2JNo9k
 O9g2K5EF4trmnCaJgzUceFvEq1Jk1HkaqUNBeaSwINNZfDXsELj3S+jT+Kvw70rh2Onz
 r17Q5/ck+FYvyS4gPEmsluC6fIJQr4PNK/YaPzZXQX6QLdFfW9ijmzFDWbh6NT9QvPHH
 2uXkqc97qpJhZ6y0pgJ3NE/j5KAXIRdLFzgYqW7brz8Nvph82GuZQ6HC6ifDddm7OKGH
 ucOcoYUn5ldDBcXoc8dnbSadRhCvXpQeRQUzHXICBzY1iGOjA/JxGXvlr/XGhnSN0+hS
 8/gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c8oxgWFeU7rl9DUh31JPfVOvqusflm+aN2rarpyNAsY=;
 b=IqaB73T5XuyWdssmKu6yzRD5jH8rEYeyHldI7WRPlNsyE0BuRbVTcN4rUB2GCmLVvZ
 ejAKAowMLKJstcrbQLmzy8PItsrF2XTMU0SVwBQ+M+7xbBq1YM9RyjacwVpNzo5iJMSo
 51VGO82MQtbzeojEnby4muNgMdZIVVQT6GAtqRxacXH8Yw3RZttBg4kli6OjYnT42lX6
 3klhmOArU7n4DYWIkqY5WeK6gVWu64vltDxY4LKeISDk8yclv2bcwmFuwQ0cF4/VNJWA
 kcAIU1HgNZyc/ajPzINLPzTabvT1gxcK276thNTF/+K5vYiurGBW2Y7/dS/EZ82Ah1sN
 w4Zg==
X-Gm-Message-State: AOAM533jNvPUaj+HvJ3m1+JotsQn/xflauL6NDKdf9ah+xM3prHbMAM5
 M9EsrlG/vM5KI650dqGeNEoNbVAe7is=
X-Google-Smtp-Source: ABdhPJzROoX21gZnQNHeEEgDEWv2vxhhjUqD3ZXCaFs0piNo0nwiELB7b+pv28NUu/XjMyKRGpYJrQ==
X-Received: by 2002:a05:600c:1986:: with SMTP id
 t6mr3615416wmq.77.1643757047134; 
 Tue, 01 Feb 2022 15:10:47 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id j5sm106214wrq.31.2022.02.01.15.10.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 15:10:46 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Feb 2022 00:08:45 +0100
Message-Id: <20220201230845.888962-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libblockdev: fix build with
 libglib2 >= 2.69
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

Fix the following build failure raised since bump of libglib2 to version
2.70 in commit 079923d5fabf4f887bb140808cb16067ca08b19b:

exec.c: In function 'bd_utils_exec_and_report_status_error':
exec.c:239:5: error: 'g_spawn_check_exit_status' is deprecated: Use 'g_spawn_check_wait_status' instead [-Werror=deprecated-declarations]
  239 |     if (!g_spawn_check_exit_status (exit_status, error)) {
      |     ^~

Fixes:
 - http://autobuild.buildroot.org/results/8f9ca895cb07014804130a7ccbcb758b1d519470

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ec-Fix-deprecated-glib-function-call.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/libblockdev/0002-exec-Fix-deprecated-glib-function-call.patch

diff --git a/package/libblockdev/0002-exec-Fix-deprecated-glib-function-call.patch b/package/libblockdev/0002-exec-Fix-deprecated-glib-function-call.patch
new file mode 100644
index 0000000000..2c370a133f
--- /dev/null
+++ b/package/libblockdev/0002-exec-Fix-deprecated-glib-function-call.patch
@@ -0,0 +1,32 @@
+From aad927a81fd9067865dc391c5bbff12ac51a0002 Mon Sep 17 00:00:00 2001
+From: Manuel Wassermann <manuel.wassermann97@gmail.com>
+Date: Thu, 1 Jul 2021 04:45:49 +0200
+Subject: [PATCH] exec: Fix deprecated glib function call Glib will rename
+ "g_spawn_check_exit_status()" to "g_spawn_check_wait_status()" in version
+ 2.69.
+
+[Retrieved from:
+https://github.com/storaged-project/libblockdev/commit/aad927a81fd9067865dc391c5bbff12ac51a0002]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/utils/exec.c | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/src/utils/exec.c b/src/utils/exec.c
+index 317fb5525..8faeb289c 100644
+--- a/src/utils/exec.c
++++ b/src/utils/exec.c
+@@ -236,7 +236,12 @@ gboolean bd_utils_exec_and_report_status_error (const gchar **argv, const BDExtr
+     /* g_spawn_sync set the status in the same way waitpid() does, we need
+        to get the process exit code manually (this is similar to calling
+        WEXITSTATUS but also sets the error for terminated processes */
+-    if (!g_spawn_check_exit_status (exit_status, error)) {
++
++    #if !GLIB_CHECK_VERSION(2, 69, 0)
++    #define g_spawn_check_wait_status(x,y) (g_spawn_check_exit_status (x,y))
++    #endif
++
++    if (!g_spawn_check_wait_status (exit_status, error)) {
+         if (g_error_matches (*error, G_SPAWN_ERROR, G_SPAWN_ERROR_FAILED)) {
+             /* process was terminated abnormally (e.g. using a signal) */
+             g_free (stdout_data);
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
