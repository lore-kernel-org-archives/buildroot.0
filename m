Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCC0C433EF
	for <buildroot@archiver.kernel.org>; Sat, 18 Dec 2021 09:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5822184DA7;
	Sat, 18 Dec 2021 09:57:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1gQMUl1XamAo; Sat, 18 Dec 2021 09:57:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A916383E31;
	Sat, 18 Dec 2021 09:57:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F1161BF5F5
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 09:57:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 39B2660F15
 for <buildroot@lists.busybox.net>; Sat, 18 Dec 2021 09:57:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iRDMNfpfpYdj for <buildroot@lists.busybox.net>;
 Sat, 18 Dec 2021 09:57:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F0F060ED9
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 09:57:31 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id t18so8682740wrg.11
 for <buildroot@buildroot.org>; Sat, 18 Dec 2021 01:57:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=McBcRigofMSWPyxkSTfV24xZquA7a1/cJpYA7AhVgX0=;
 b=U5NP1KVI949CSaVTysq4HvtV++HaTO9x6vvIK4oBQkfZObi68RzzNYVTFnCbh+bNoW
 Aeacu8IROodVMJvfyt+cqX/JGRIEVLD/9q/ePT2X6hUmtHK687PFMWARMocN4eO6FjPp
 Delw6RxT+664rDfsVHnEnt89jbw+4rzn9znPmwdLvVbGN08dqgO18qpxNtoY5rGZE5Rz
 HkhIv5k9kKiPXKQFCHBXLcXSayK0r0lokcUcX1wegrnzaEibXy5u6ykYCtvJPKPwTQ2I
 B2wuylHeI6ltDmR0txDYn0oEXst0v2vAawTGhiSV9jmDg8YeKRYeOcVfWMeLUlLcL7MS
 oSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=McBcRigofMSWPyxkSTfV24xZquA7a1/cJpYA7AhVgX0=;
 b=vBRvnv27D0qi/RHwnxEVvyuVI2SVvHWdNIv1Y6eImxLf75RoEgqnkaVT5g9sAh8WYC
 GscTVLTcCr4+MEUNWS2uK6UmswD68aMTpnaq8l4j/dsfKM3p6TCksw2bMUXztDI++SIT
 ffAZemvDayebnoM0eYa3fKFJ5qxEXiCNEenKwjxy7+YIsW/+k85sKAz/SHFGXDhOspVW
 s0tzaiwo8NKQ+k4qBovNQq8WvdcsTK92Pz3KGxWvyS7hrFYI39B6qXep1igxT13u1wQt
 xzslfSUv5is/nWsGrUcVBEVi1oXDLAsX0SwV7aobylV8SpquQSD044sF1qrmQYGwxT/R
 0m2g==
X-Gm-Message-State: AOAM531xVtrIkjWF3trFXrb/z0hZV3R7L/RYlak0hZ+Lh90HuE0qUxFh
 p5JgZ07UeApXpJ3vEonb/qR3NGhI1N/ifA==
X-Google-Smtp-Source: ABdhPJx9NoQuGCmW8Xc9qTPMC+DRFo36ZfMaUE4KdPO4ZDYF5kg+7wpvY7sKTxZTHL71x4RSs0dQnA==
X-Received: by 2002:adf:bb89:: with SMTP id q9mr5771544wrg.337.1639821449195; 
 Sat, 18 Dec 2021 01:57:29 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id b19sm14522494wmb.38.2021.12.18.01.57.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 18 Dec 2021 01:57:28 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 18 Dec 2021 10:56:55 +0100
Message-Id: <20211218095655.521317-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/xenomai: fix build with glibc >=
 2.34
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with glibc >= 2.34:

In file included from timerobj.c:32:
In function 'threadobj_set_current',
    inlined from 'server_prologue' at timerobj.c:94:2:
../../include/copperplate/threadobj.h:252:9: error: 'pthread_setspecific' expecting 1 byte in a region of size 0 [-Werror=stringop-overread]
  252 |         pthread_setspecific(threadobj_tskey, thobj);
      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/ed93f916eda304b30f320816c85d1b0d4488c699

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...id-addresses-for-pthread_setspecific.patch | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/xenomai/3.0.10/0003-lib-cobalt-copperplate-Use-valid-addresses-for-pthread_setspecific.patch

diff --git a/package/xenomai/3.0.10/0003-lib-cobalt-copperplate-Use-valid-addresses-for-pthread_setspecific.patch b/package/xenomai/3.0.10/0003-lib-cobalt-copperplate-Use-valid-addresses-for-pthread_setspecific.patch
new file mode 100644
index 0000000000..0c39a4ecf7
--- /dev/null
+++ b/package/xenomai/3.0.10/0003-lib-cobalt-copperplate-Use-valid-addresses-for-pthread_setspecific.patch
@@ -0,0 +1,57 @@
+From 627d488db3aa71406e32d4d8934629e8b0f35905 Mon Sep 17 00:00:00 2001
+From: Jan Kiszka <jan.kiszka@siemens.com>
+Date: Sat, 16 Oct 2021 15:46:33 +0200
+Subject: [PATCH] lib/{cobalt,copperplate}: Use valid addresses for
+ pthread_setspecific
+
+glibx 2.34 and newer annotated pthread_setspecific in a way that gcc-11
+complains about non-NULL pointers that are outside of what is considered
+valid. So use dummy addresses instead. namely the related pthread keys.
+Those pointers will never be dereferenced in both use cases.
+
+See also https://sourceware.org/bugzilla/show_bug.cgi?id=28458.
+
+Reported-by: Vitaly Chikunov <vt@altlinux.org>
+Signed-off-by: Jan Kiszka <jan.kiszka@siemens.com>
+
+[Retrieved from:
+https://source.denx.de/Xenomai/xenomai/-/commit/627d488db3aa71406e32d4d8934629e8b0f35905]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ include/copperplate/threadobj.h | 6 +++++-
+ lib/cobalt/printf.c             | 2 +-
+ 2 files changed, 6 insertions(+), 2 deletions(-)
+
+diff --git a/include/copperplate/threadobj.h b/include/copperplate/threadobj.h
+index 7e6904f4c..c8363415b 100644
+--- a/include/copperplate/threadobj.h
++++ b/include/copperplate/threadobj.h
+@@ -173,7 +173,11 @@ void threadobj_save_timeout(struct threadobj_corespec *corespec,
+ #define __THREAD_M_SPARE6	(1 << 22)
+ #define __THREAD_M_SPARE7	(1 << 23)
+ 
+-#define THREADOBJ_IRQCONTEXT    ((struct threadobj *)-2UL)
++/*
++ * We need to use a valid address here. The object will never be dereferenced
++ * when it is identified as IRQ context, so the pthread key itself is fine.
++ */
++#define THREADOBJ_IRQCONTEXT	((struct threadobj *)&threadobj_tskey)
+ 
+ struct traceobj;
+ struct syncobj;
+diff --git a/lib/cobalt/printf.c b/lib/cobalt/printf.c
+index 8982ddc93..0aa5940c6 100644
+--- a/lib/cobalt/printf.c
++++ b/lib/cobalt/printf.c
+@@ -729,7 +729,7 @@ done:
+ 	pthread_cond_init(&printer_wakeup, NULL);
+ 	spawn_printer_thread();
+ 	/* We just need a non-zero TSD to trigger the dtor upon unwinding. */
+-	pthread_setspecific(cleanup_key, (void *)1);
++	pthread_setspecific(cleanup_key, &cleanup_key);
+ 
+ 	atexit(rt_print_flush_buffers);
+ }
+-- 
+GitLab
+
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
