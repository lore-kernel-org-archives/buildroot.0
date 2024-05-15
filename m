Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A831C25B75
	for <buildroot@archiver.kernel.org>; Wed, 15 May 2024 18:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4337481007;
	Wed, 15 May 2024 18:10:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eohEQVtS0xNI; Wed, 15 May 2024 18:10:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AADF81F22
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AADF81F22;
	Wed, 15 May 2024 18:10:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EBD0C1BF399
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 18:10:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D847C403A7
 for <buildroot@lists.busybox.net>; Wed, 15 May 2024 18:10:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ADDZ8BxIZiWP for <buildroot@lists.busybox.net>;
 Wed, 15 May 2024 18:10:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org AB823402A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AB823402A8
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id AB823402A8
 for <buildroot@buildroot.org>; Wed, 15 May 2024 18:10:55 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-42011507a57so32334445e9.1
 for <buildroot@buildroot.org>; Wed, 15 May 2024 11:10:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715796653; x=1716401453;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a6LjuCqrl0PVaVNu45whEUvOrxwMNzifMlT9+Mf3phg=;
 b=XjFr1DR4Q1VVpOKe9VVFDY4ytIsJfRSLeOcRJzI6mw+yrnAgLoZbJ3hW9Q+tmYPN5W
 TH5bUKbtv6lYgSwGjlh+cv3L9kqLVZzPplzEIkuxxq32AHTmUmfZ4CvJHF4wALRo6eCa
 HQgklDdnObM5TiEiQ1GAFHuWi0aQS+qjRCR/BJVNhBiuAyOtJQ/5MtYevQNzPZQ3Pq9X
 2Vf4QA60Y5Gi6IlwPQbBA7mldBXZGGEXx4InyMxx1PHpL+mwV28Ky3lXbLo2aK4oFmR8
 fU0HMpw7U8ACj7vrSnQhYOH0tlddojDGTrpPBHPVhIb0YR8ean7exHKLN9eDZo1DjxL3
 Hu+w==
X-Gm-Message-State: AOJu0YzQ5VwF1MudFIfTLZ5++FKyfENcdbRNSSJ4935OZk9BhY8lgLfJ
 el0Zonf/NNepKKSsnx/pumRKYzCtoeuLoBmu3SUelMRwUGonC5/Ytal6Hw==
X-Google-Smtp-Source: AGHT+IGaPZEb12wo32cFfXCJXpOTCFkRBBk44NVSTVtE0VXu4vLlCyuQNIILKhMz7/MDmB6YRWZbNg==
X-Received: by 2002:a05:600c:35d3:b0:420:14fb:de1f with SMTP id
 5b1f17b1804b1-42014fbe1admr76065395e9.14.1715796652933; 
 Wed, 15 May 2024 11:10:52 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-41fccce1912sm244598215e9.11.2024.05.15.11.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 11:10:52 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 15 May 2024 20:10:47 +0200
Message-ID: <20240515181047.1254290-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1715796653; x=1716401453; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a6LjuCqrl0PVaVNu45whEUvOrxwMNzifMlT9+Mf3phg=;
 b=BfQJhPV8OQvqRlZa8EPFKQNEd4XEE2ytaGYkr4IgP4sKDDWow/8H176dZ1fGuoeqVu
 XhbmfQzxudAOxnk2ydIlr32c2Rs1iBEHYxUmsOw/ZFA24QLXL1iv8E0H+RBgJbCbmxCc
 A8j5fm9XWw5/cDH3Nu0c1HA++G9TcxNl5uGMl4qchaouXBrE9hEtZmpJFG/kT/qqY0p7
 DPcivAGWetCIXaoRFss7g1Faa+5IfPwP9hXRWHZsOBZSuhu+4eksZegVLRpJ3+cKSUYT
 U1dk716T6n6DIzfbo2YE7yKLQk3RwY2/FFz1yebnfhjxkwn04dpk6CXWSRYWKn9qevt/
 QEpw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BfQJhPV8
Subject: [Buildroot] [PATCH 1/1] package/ustreamer: fix uclibc build
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
Cc: Kadambini Nema <kadambini.nema@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following uclibc build failure raised since bump to version 6.11
in commit c6c173dadb7b44ba4af92237d05503b8e83e51dc and
https://github.com/pikvm/ustreamer/commit/2d6716aa4762151f0fb1b900d3cd3295d328cab6:

In file included from libs/base64.h:25,
                 from libs/base64.c:23:
libs/types.h:30:9: error: unknown type name 'ssize_t'
   30 | typedef ssize_t sz;
      |         ^~~~~~~

Fixes: c6c173dadb7b44ba4af92237d05503b8e83e51dc
 - http://autobuild.buildroot.org/results/24498049d7beb4afaaf9f9a0c2fc0bcd26a3ee04

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...src-libs-types.h-include-sys-types.h.patch | 36 +++++++++++++++++++
 1 file changed, 36 insertions(+)
 create mode 100644 package/ustreamer/0001-src-libs-types.h-include-sys-types.h.patch

diff --git a/package/ustreamer/0001-src-libs-types.h-include-sys-types.h.patch b/package/ustreamer/0001-src-libs-types.h-include-sys-types.h.patch
new file mode 100644
index 0000000000..82fe596963
--- /dev/null
+++ b/package/ustreamer/0001-src-libs-types.h-include-sys-types.h.patch
@@ -0,0 +1,36 @@
+From 6c24c9ea610e7cc0e47d1e7124697098d5ef365e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 15 May 2024 19:56:49 +0200
+Subject: [PATCH] src/libs/types.h: include sys/types.h (#273)
+
+Include sys/types.h to avoid the following uclibc build failure since
+version 5.52 and
+https://github.com/pikvm/ustreamer/commit/2d6716aa4762151f0fb1b900d3cd3295d328cab6:
+
+In file included from libs/base64.h:25,
+                 from libs/base64.c:23:
+libs/types.h:30:9: error: unknown type name 'ssize_t'
+   30 | typedef ssize_t sz;
+      |         ^~~~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/24498049d7beb4afaaf9f9a0c2fc0bcd26a3ee04
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/pikvm/ustreamer/commit/6c24c9ea610e7cc0e47d1e7124697098d5ef365e
+---
+ src/libs/types.h | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/libs/types.h b/src/libs/types.h
+index 54e42325..b35bbaea 100644
+--- a/src/libs/types.h
++++ b/src/libs/types.h
+@@ -24,6 +24,7 @@
+ #include <stdio.h>
+ #include <stdbool.h>
+ #include <stdint.h>
++#include <sys/types.h>
+ 
+ 
+ typedef long long sll;
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
