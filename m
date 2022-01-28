Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E274DC433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 17:47:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8691E41D24;
	Fri, 28 Jan 2022 17:47:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u91gmx0m-4fP; Fri, 28 Jan 2022 17:47:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6D9D41D20;
	Fri, 28 Jan 2022 17:47:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7FD341BF3B8
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 17:47:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E52041D20
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 17:47:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8Pi5znRsG4DF for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 17:47:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 843C841CEF
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 17:47:30 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id n8so4990975wmk.3
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 09:47:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PNT3BpTVZqKjtogEUtWar75F/9pQrRG23kL6CHpKpKg=;
 b=Zvy+tagFxPSRN6DHavxmrMF4sgTXiriXr674cGAlTyCcA4LE2KJnKzun/iIL25XDlx
 nFDQUZ0ambSbGwV1fkZ8Vmfi2HLuWiuLgzUPFrYoxe6hkxVwiKB6Sc59DaXUPhgyQ+TG
 ieRMJ+7DiG87yJ3aYRRR6BVnFMux+a+20WnDJtlC4BxBQsEbL3gqieN+mCoHkkDbDlzw
 mvoiJ9NWBLbF4jBacBQxLUtR9TcM7MqT9bnTGFmGs6mfsf7EKQKnEf4kV+khzcHj1VeS
 zrG8KShZ1BeE43DEN30X3jDjTtaomD7SLOZJQEy+J8/ony8sYt2owVhbQTJ3mek3EexI
 MtAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PNT3BpTVZqKjtogEUtWar75F/9pQrRG23kL6CHpKpKg=;
 b=vEhlcSdlmUMb9Dx8NQeckABc87jt/YCga7oxw24wPIjwI1gJpq5GYMwTe8gIx+zTrm
 pMGQ1Mczp/KUdev+zJqxNni+9weaRk75F0QQ6jdr5WsrPPRGSNMKIeFlhh0lNrGQodYU
 j8iGZIF42hgvSQlU+v4m8ryK2EGUUB2nt9kHq/Umpgt/44VeGmbSRYHa8tVutYOOdYXB
 3P7NWHDIYe8ijc0Y8bD9T/I4v8z8/ujkIbIB5VEGTPBG/DotEUFnYcjvf5Gr5p7cFU9w
 B8yYQa4iTli9RIiQ9ejB//n5RqG3/qp3sbvl3Lj7PNJQNvlymkPhf7vJmohhqb7T0rbO
 aAmQ==
X-Gm-Message-State: AOAM5310QzfTWA4iyRLBECzlPj5NHdai77hpUzX+xdRETF4IEzziJxlY
 ya68vyvVWavshOgTjrnG6QCiuKGx9v0=
X-Google-Smtp-Source: ABdhPJyO+AXwg369am4QgR3t3EW+l65dJA8fuKBaZj0Fvci+3KKUzWdMUfWR20MUDCwmUmm8D9sIXw==
X-Received: by 2002:a05:600c:1d17:: with SMTP id
 l23mr8324045wms.174.1643392048351; 
 Fri, 28 Jan 2022 09:47:28 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id a26sm2400630wmb.37.2022.01.28.09.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Jan 2022 09:47:27 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jan 2022 18:45:40 +0100
Message-Id: <20220128174540.2502417-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/htpdate: fix static openssl build
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
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following static build failure with openssl raised since bump to
version 1.3.3 in commit 163509a8e0d558e6339c5489f072dfe805e0cc34:

/home/buildroot/autobuild/instance-3/output-1/host/opt/ext-toolchain/bin/../lib/gcc/sh4-buildroot-linux-uclibc/10.3.0/../../../../sh4-buildroot-linux-uclibc/bin/ld: /home/buildroot/autobuild/instance-3/output-1/host/sh4-buildroot-linux-uclibc/sysroot/usr/lib/libssl.a(rec_layer_d1.o): in function `DTLS_RECORD_LAYER_new':
rec_layer_d1.c:(.text+0x124): undefined reference to `CRYPTO_malloc'

Fixes:
 - http://autobuild.buildroot.org/results/75ad8515916dfa056b17c97fdd95c7eb4d83a304

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...-config-to-determine-openssl-LDFLAGS.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/htpdate/0001-Use-pkg-config-to-determine-openssl-LDFLAGS.patch

diff --git a/package/htpdate/0001-Use-pkg-config-to-determine-openssl-LDFLAGS.patch b/package/htpdate/0001-Use-pkg-config-to-determine-openssl-LDFLAGS.patch
new file mode 100644
index 0000000000..c229ca6d89
--- /dev/null
+++ b/package/htpdate/0001-Use-pkg-config-to-determine-openssl-LDFLAGS.patch
@@ -0,0 +1,43 @@
+From 81fd178abed833defce18562e8122d5c85822ccb Mon Sep 17 00:00:00 2001
+From: Titouan Christophe <titouan.christophe@railnova.eu>
+Date: Fri, 28 Jan 2022 18:37:24 +0100
+Subject: [PATCH] Use pkg-config to determine openssl LDFLAGS
+
+Depending on its build configuration, openssl might not be compiled with
+dynamic zlib support, and programs that link against openssl need to link
+against zlib as well, as illustrated in this build failure:
+http://autobuild.buildroot.net/results/ae9/ae946ca72238840b3eaa5fe823e8d620618f7462/
+
+Signed-off-by: Titouan Christophe <titouan.christophe@railnova.eu>
+[Retrieved (and slightly updated) from:
+https://github.com/angeloc/htpdate/commit/72fcf9f82770e927e058a2eaa327d0eecb1e3c8d]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/twekkel/htpdate/pull/17]
+---
+ Makefile | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index 4796efa..46c8681 100644
+--- a/Makefile
++++ b/Makefile
+@@ -4,6 +4,7 @@ mandir = ${prefix}/share/man
+ 
+ CC     ?= gcc
+ CFLAGS += -Wall -std=c11 -pedantic -O2
++PKG_CONFIG ?= pkg-config
+ 
+ INSTALL ?= install -c
+ STRIP   ?= strip -s
+@@ -14,7 +15,7 @@ htpdate: htpdate.c
+ 	$(CC) $(CFLAGS) -o htpdate htpdate.c
+ 
+ https: htpdate.c
+-	$(CC) $(CFLAGS) -DENABLE_HTTPS -o htpdate htpdate.c -lssl
++	$(CC) $(CFLAGS) -DENABLE_HTTPS -o htpdate htpdate.c  $(shell $(PKG_CONFIG) --libs libssl)
+ 
+ install: all
+ 	$(STRIP) htpdate
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
