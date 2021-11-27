Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323EDC433EF
	for <buildroot@archiver.kernel.org>; Sat, 27 Nov 2021 08:32:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B8668291D;
	Sat, 27 Nov 2021 08:32:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mHKssPNPqsAr; Sat, 27 Nov 2021 08:32:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F0911828E3;
	Sat, 27 Nov 2021 08:32:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 43A161BF376
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 08:32:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 331F8828E3
 for <buildroot@lists.busybox.net>; Sat, 27 Nov 2021 08:32:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hDb05u3lYib9 for <buildroot@lists.busybox.net>;
 Sat, 27 Nov 2021 08:32:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 02E97828DF
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 08:32:41 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id s13so23791641wrb.3
 for <buildroot@buildroot.org>; Sat, 27 Nov 2021 00:32:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2JIOx8cPOmOzkNLC25UlHe/Wcx/VXqko7jr82TVT7Rw=;
 b=I6VuJyM7WhpLL/+U/VB0uiN3toZWFAeUv7c/rxJjqpgxkQEcEsecd+8il79vyFKZ8M
 RhshcOG1lKmb8k4Apqwvn4MsMtVytEYAEgGLqG/PnMbr28n2QWsjl97smASabOBmwZej
 nVF+NqiwxF/j4FIjUmfP/JuV1ISM1wQ6FEK7HKCKhfgghPkSMX1COWujzDdCfEAxq9Gd
 DnLUiELO1Ed4i6j5Jvpp5WzDeAmRkDWIsjNRmmzbM9w3UV84isbbhhX7zVF8AEMYiqdX
 rbxBarmjHcxYvbwa5CpfwfXl1JS0JFHe+BNSkzesFklbOfU3JNXdutr3tnHlo0E11YKJ
 CmFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2JIOx8cPOmOzkNLC25UlHe/Wcx/VXqko7jr82TVT7Rw=;
 b=MD2R6/BmZ7DTan+bpqznY1/sGiD/at/aMZ/ujGJHYJzYUDFxF2pBn52T364aM4K18k
 liAg3as041uVq4OMj6o2vRv4czrNG2lH+iPSg+o1xNd2hqRvV4sZpBpfnADvCfPq5KfC
 HhkwjEsRWZ1aWNa89dihO8voe7qubPcZgx8zpy6AxNVqe7hplqifXo4OW0WNZZjJlVHg
 18kUDUcM/2SZEj2AxGQI6Y0BbRy9+Ptfx+p/tfNsf6XqjGYzl6u134CZgnd3yodLnviF
 S7Xa5BMOAjKbFcXNmQ+va2BAGJ0FGUkvybtbEsO1IiByQivsql4gzlIfIPXTd03P0qVF
 8rNw==
X-Gm-Message-State: AOAM530XOCUYAHmBCUiXwurd1XRYXHd55hWOE8APh8VXoXaYbY9PSEyD
 CTe5B833sQNjxtpH0Cjrn/2gsflL0cg=
X-Google-Smtp-Source: ABdhPJyjP5dBo5uspyJRTOOETLIX3C6WYW1WqEX5NT2b3NEcpTkw/e+gJVrcczJM9G0eECJwoykXkw==
X-Received: by 2002:adf:f0c5:: with SMTP id x5mr18371831wro.484.1638001959909; 
 Sat, 27 Nov 2021 00:32:39 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id h15sm15868113wmq.32.2021.11.27.00.32.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Nov 2021 00:32:39 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 27 Nov 2021 09:30:04 +0100
Message-Id: <20211127083004.1515239-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/xscreensaver: add xdg SELinux module
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
Cc: Simon Dawson <spdawson@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

xdg SELinux module is needed to avoid the following build failure raised
since commit 62b4fa2d7b543cfbacbc8fa112a88fa575b23eb3:

 Compiling targeted policy.31
 env LD_LIBRARY_PATH="/home/buildroot/autobuild/instance-2/output-1/host/lib:/home/buildroot/autobuild/instance-2/output-1/host/usr/lib" /home/buildroot/autobuild/instance-2/output-1/host/usr/bin/checkpolicy -c 31 -U deny -S -O -E policy.conf -o policy.31
 policy/modules/services/xserver.te:116:ERROR 'attribute xdg_cache_type is not declared' at token ';' on line 656367:
 #line 116
	typeattribute user_fonts_cache_t xdg_cache_type;
 checkpolicy:  error(s) encountered while parsing configuration

Fixes:
 - http://autobuild.buildroot.org/results/610484c288fa1923d9ee28a3cb780dcb67579eee

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xscreensaver/xscreensaver.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
index 8842d6c1ab..a2149fb3a0 100644
--- a/package/xscreensaver/xscreensaver.mk
+++ b/package/xscreensaver/xscreensaver.mk
@@ -11,7 +11,7 @@ XSCREENSAVER_SITE = https://www.jwz.org/xscreensaver
 XSCREENSAVER_LICENSE = MIT-like, GPL-2.0+
 XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h hacks/glx/chessmodels.h
 XSCREENSAVER_CPE_ID_VENDOR = xscreensaver_project
-XSCREENSAVER_SELINUX_MODULES = xscreensaver xserver
+XSCREENSAVER_SELINUX_MODULES = xdg xscreensaver xserver
 
 XSCREENSAVER_DEPENDENCIES = \
 	gdk-pixbuf \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
