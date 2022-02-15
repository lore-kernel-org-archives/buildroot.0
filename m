Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605E6C433F5
	for <buildroot@archiver.kernel.org>; Tue, 15 Feb 2022 22:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DCDF882572;
	Tue, 15 Feb 2022 22:24:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VdiVQi9ctDfZ; Tue, 15 Feb 2022 22:24:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3171E8196E;
	Tue, 15 Feb 2022 22:24:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 774301BF32B
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 22:24:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 655FD8196E
 for <buildroot@lists.busybox.net>; Tue, 15 Feb 2022 22:24:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 50FtIK_nSPWm for <buildroot@lists.busybox.net>;
 Tue, 15 Feb 2022 22:24:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C9EDF8124C
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 22:24:30 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id x13so201984iop.4
 for <buildroot@buildroot.org>; Tue, 15 Feb 2022 14:24:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0thZ4VPreR6NZTHNh0IUycls7dePPpl2QAitfIzS9IU=;
 b=gJLveP3udubOEcg/2O1BDNqAACzXmXLnYRAp8oFgW9Cno0Enp423Zn0b/NFRlcthdx
 FIqt6RsyDnOCji2JCcZIDSUPDBLp6RGLiNEkNRG1j5OPQ9ypuEcYhLM+uxlQcpYsEza6
 KOT8ouVVw0LrGK0I4NCVvbgZXXUokRfGtZ0t/R29zk/eusWesRWM4nvuy/hLuVmA6AFG
 94rj4yErrLTeiaTc0qzLCD5MU1sW2YqLwKA1NxZu6t5TOHFZBnaqBUUUHylQzbEIBLfI
 6LryvrJTALRk8Vq2tRxi3E0zMHO/dEvxYibtASm2BjfuVoDhn6TXmqsZlfN4xkR7DrAk
 s0Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0thZ4VPreR6NZTHNh0IUycls7dePPpl2QAitfIzS9IU=;
 b=eQq1wz77WNcC0UEl/PlXuMzzdeBI/Tl4POvHs4bbHGbieeVR2RWdqOKMaxUmRQiJpG
 pIE9ZAUPTlUiBoLWvVrygocnzhdIG9Ae+/girjaPfVcSCkyZvqG4QjDsNyba0fOxozu7
 YosFEqKzdiq2UQ1QdRi6crqhSutpqKn4q6esLY4oVsxUKb3IKLd+pGIuk/NOkbRa25j1
 ZRF7WJ4SwT2IVUAFMzwYen5rE5H+JwiD1BEn71BwC0jxQPYwyCkO03DyzPzMcV00A1lm
 OdAtFN/0SdRjD0ba+HeXr2jaq/SP55v4wEmfzUSgM0Je99egp8L48J0IEnFhQ+9uUTUI
 5I5g==
X-Gm-Message-State: AOAM531/cefS25ODgsCn1e1HF26JMlUBlXJxhxdCudiBM9YlIZVIMLCS
 hmORaG/UYEPOnCX5cgMf/YdYzYDRZSY=
X-Google-Smtp-Source: ABdhPJzTrz4o0rPIuE7nF6DRI146602BC+m2H4dpgm1lrLn7wxvByUyJEaWYQkWajIvixNuKwCccWQ==
X-Received: by 2002:a05:6638:1386:: with SMTP id
 w6mr666926jad.19.1644963869742; 
 Tue, 15 Feb 2022 14:24:29 -0800 (PST)
Received: from james-x399.localdomain (97-118-156-98.hlrn.qwest.net.
 [97.118.156.98])
 by smtp.gmail.com with ESMTPSA id p11sm26203198iov.38.2022.02.15.14.24.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 14:24:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 15 Feb 2022 15:24:22 -0700
Message-Id: <20220215222422.1865613-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libbpf: bump to version 0.7.0
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
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/libbpf/libbpf.hash | 2 +-
 package/libbpf/libbpf.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libbpf/libbpf.hash b/package/libbpf/libbpf.hash
index 27e22be9e9..06adc09885 100644
--- a/package/libbpf/libbpf.hash
+++ b/package/libbpf/libbpf.hash
@@ -1,5 +1,5 @@
 # Locally calculated
-sha256  ce3a8eb32d85ac48490256597736d8b27e0a5e947a0731613b7aba6b4ae43ac0  libbpf-0.6.1.tar.gz
+sha256  5083588ce5a3a620e395ee1e596af77b4ec5771ffc71cff2af49dfee38c06361  libbpf-0.7.0.tar.gz
 sha256  847f4addbd56e2d5be20c4ea0845e972672fc07b755fadaae5f7abd35d71e349  LICENSE
 sha256  6313108c23efffa36948f8b2cff1560a5935373b527b0e1a837cc77e6ed1bacd  LICENSE.BSD-2-Clause
 sha256  0b9a4febcdee6de55872501d5c1a8f5d8b0d1650cd4d5351995ceb22e889f8ca  LICENSE.LGPL-2.1
diff --git a/package/libbpf/libbpf.mk b/package/libbpf/libbpf.mk
index 6750b063c0..ff018f5c24 100644
--- a/package/libbpf/libbpf.mk
+++ b/package/libbpf/libbpf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBBPF_VERSION = 0.6.1
+LIBBPF_VERSION = 0.7.0
 LIBBPF_SITE = $(call github,libbpf,libbpf,v$(LIBBPF_VERSION))
 LIBBPF_LICENSE = GPL-2.0, LGPL-2.1, BSD-2-Clause
 LIBBPF_LICENSE_FILES = LICENSE LICENSE.BSD-2-Clause LICENSE.LGPL-2.1
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
