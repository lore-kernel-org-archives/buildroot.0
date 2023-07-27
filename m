Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C03C0015E
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 23:22:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED2E3409C8;
	Thu, 27 Jul 2023 23:22:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED2E3409C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OYhQsrVtR7CL; Thu, 27 Jul 2023 23:22:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3AA1240913;
	Thu, 27 Jul 2023 23:22:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3AA1240913
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7524B1BF3AE
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 23:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4944E41FBA
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 23:22:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4944E41FBA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EvrLIKLIXy6Q for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 23:22:38 +0000 (UTC)
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0F37841FCC
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 23:22:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0F37841FCC
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1b89d47ffb6so9948295ad.2
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 16:22:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690500157; x=1691104957;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c+VqsyY+j/fI3PmgPUl19UBFUwIaIlVDHKSD63fp6LY=;
 b=UPvA9f1qiRkK9sd0rE9WPed6hDQWtJOI2hJIDl0iyILDPCpWz2lrMad0R+Ti7J6K/P
 C0CXzLvyvomMjzI2ZKrUCXb6ISHb8M8gumqOyVcp7KhfEAiIDdlEPg2ZhTtdoyenLB5n
 HsJrVnu0f5isgHa0SgWyEDtIpsPXgbNi6YRKr4c87MTS16SkHuBfwQP7556Z8T1iRPfh
 AzQbVMf0ANd2by+8Jp9tO6EJYDjdwXc4WShsQ0rEhbM9iAFilahhEXGxumXTQ+KyW4ar
 0DmTPuW5ByV9DRMzgEaW8Qu4BSNky0ApkIl5V8BKOopBjCfZbtBzcGypoW3Xt9dVLTqj
 +GQw==
X-Gm-Message-State: ABy/qLY/aJHzHz6VREiGxzQD+8tu3td8Z4xw5KHFbE6iM5CM0PNaDfu7
 +DhYMQDNdeArBDE+KqQgOrGKzHnJdHNXXI7aq5lUKqY7hGhwJA==
X-Google-Smtp-Source: APBJJlHMritwVobzl/4UCOWKbrmBInl58Yy8ljIIyeUVa+nF2yeG7NFhBDBmcHVU9INTkQnvrHxeOQ==
X-Received: by 2002:a17:902:8697:b0:1b7:f546:44d7 with SMTP id
 g23-20020a170902869700b001b7f54644d7mr16700plo.17.1690500156984; 
 Thu, 27 Jul 2023 16:22:36 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 ix14-20020a170902f80e00b001b9bebb7a9dsm2176076plb.90.2023.07.27.16.22.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 16:22:36 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 27 Jul 2023 16:22:35 -0700
Message-ID: <20230727232235.449788-1-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1690500157; x=1691104957;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c+VqsyY+j/fI3PmgPUl19UBFUwIaIlVDHKSD63fp6LY=;
 b=cZjKXk8xFAiwc4cwi8MXwegZMt4ovq2FXdZx0lyS6W95BrsZHyL4V6S4WXj86Itx19
 X5hYG9jd88M+E6pXrMDZkQKggmGw4tvyiIlthZCJPC+lR4dVZrSUPpkA1HizZqXIEvNU
 n3FqIai4WcSsISpZr5CyyFMHv/fj7jBDL8FI9jbZeUXKKHMPFnZipeZHFF/USp79tl66
 EY8g6KTtlbf2jRMbJmchDhUzOKVegB+KyPz9b5mV/0OPk7vo10RWc4aSWBh3lhQnVb6w
 xhUWodAmh8nd33a14erBs6glacsJGlFVthTVi/3yDuHMtv/Egi44xjgUwGuw7neogEkC
 bX4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=cZjKXk8x
Subject: [Buildroot] [PATCH v1 1/1] package/containerd: bump version to
 v1.6.22
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bugfixes and updates.

https://github.com/containerd/containerd/releases/tag/v1.6.22

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/containerd/containerd.hash | 2 +-
 package/containerd/containerd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/containerd/containerd.hash b/package/containerd/containerd.hash
index 345a7b16ff..8404675e30 100644
--- a/package/containerd/containerd.hash
+++ b/package/containerd/containerd.hash
@@ -1,3 +1,3 @@
 # Computed locally
-sha256  9452e95455d03a00d78ae0587595d0c18555bae7912068269efa25a724efe713  containerd-1.6.21.tar.gz
+sha256  b109aceacc814d7a637ed94ba5ade829cd2642841d03e06971ef124fa3b86899  containerd-1.6.22.tar.gz
 sha256  4bbe3b885e8cd1907ab4cf9a41e862e74e24b5422297a4f2fe524e6a30ada2b4  LICENSE
diff --git a/package/containerd/containerd.mk b/package/containerd/containerd.mk
index 83489a3abf..c4a6d854c3 100644
--- a/package/containerd/containerd.mk
+++ b/package/containerd/containerd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CONTAINERD_VERSION = 1.6.21
+CONTAINERD_VERSION = 1.6.22
 CONTAINERD_SITE = $(call github,containerd,containerd,v$(CONTAINERD_VERSION))
 CONTAINERD_LICENSE = Apache-2.0
 CONTAINERD_LICENSE_FILES = LICENSE
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
