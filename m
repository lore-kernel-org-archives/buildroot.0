Return-Path: <SRS0=8Zio=PQ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0057C433F5
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 18:17:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D821860FC1
	for <buildroot@archiver.kernel.org>; Thu, 28 Oct 2021 18:17:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D821860FC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62F7660B63;
	Thu, 28 Oct 2021 18:17:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id abIYd-ADnGrY; Thu, 28 Oct 2021 18:17:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8F1460B5F;
	Thu, 28 Oct 2021 18:17:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 555471BF578
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 18:17:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 404BA60B5F
 for <buildroot@lists.busybox.net>; Thu, 28 Oct 2021 18:17:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ygz8m8jk75-B for <buildroot@lists.busybox.net>;
 Thu, 28 Oct 2021 18:17:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com
 [IPv6:2607:f8b0:4864:20::52d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36F9D60B5E
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 18:17:00 +0000 (UTC)
Received: by mail-pg1-x52d.google.com with SMTP id l186so7202997pge.7
 for <buildroot@buildroot.org>; Thu, 28 Oct 2021 11:17:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=broadcom.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=96KEGCwznozOmJsgWUYOy+IoCepktzQoOVvCfsy2mN8=;
 b=Y9pcIaR+uzcXJDbOr7I+GHeiKZdIXxUDHcbCkNOtEQDVeILXr4qwmWTyFIbwti+SrA
 oLQ8GDKsyqCGVSKvsyRj9xnBfKa5y8z2VM90OcUZwHE3vkruJN/IH+oRl4rp5K9loQwn
 l/+EpdSupFoNAlvsozYluBUr6EmC02waRlTes=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=96KEGCwznozOmJsgWUYOy+IoCepktzQoOVvCfsy2mN8=;
 b=2/fCnEp5ztww8hVq8HkNAfNzEj77Ue7O1oM64B6oddCwGWPMXbyfsS0oTu3lEgU6h8
 oyEKkry5t2fV6hpZe1CE1bcxNBBfLPliLzdLIh/93DnyAkccBLBZmAmepOYvkNX+V7dS
 r8M8T72Zl+DoCvfmGfXzBUnHq65ZSDIfSv2z7WeBh+utFA2X1pYpg8Yn8lmzWBWoY8KD
 fQmS2NByce63qMs5Is94vg0HboaSh04bWOwjwONrXFowB1a6NVNwX5Nkq3BHeIPrlHMj
 7uj1CICE1np8tIjMHNWMdoQI0/KbArTzb2195g6iPJqJw+i/DFK2uLIJOddHPdIg16ll
 LEyg==
X-Gm-Message-State: AOAM531QWI/jXakiQ6zR3RqCDJ3tGqIaQBvYUK/kdFyo5IsU6XjNk1rW
 4NViDPfNKz89L7gaVS0fiGsRlGYfpkgi6zGIeRk=
X-Google-Smtp-Source: ABdhPJwl80Ec6Y5Qc3nZKLohIOXcdLS5w7knkh0xEZs7v1UyqtbiCju00rDafCH1OIP99plUoASCbw==
X-Received: by 2002:a63:6dca:: with SMTP id i193mr4315140pgc.205.1635445019324; 
 Thu, 28 Oct 2021 11:16:59 -0700 (PDT)
Received: from lbrmn-mmayer.ric.broadcom.net ([192.19.228.250])
 by smtp.gmail.com with ESMTPSA id a20sm3997956pff.57.2021.10.28.11.16.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 11:16:58 -0700 (PDT)
Received: by lbrmn-mmayer.ric.broadcom.net (Postfix, from userid 1000)
 id 059CC2AF6FD6; Thu, 28 Oct 2021 11:17:12 -0700 (PDT)
To: Buildroot Mailing List <buildroot@buildroot.org>
Date: Thu, 28 Oct 2021 11:17:09 -0700
Message-Id: <20211028181709.391431-1-mmayer@broadcom.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/mkpasswd: define _DEFAULT_SOURCE to
 suppress compiler warning
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
From: Markus Mayer via buildroot <buildroot@buildroot.org>
Reply-To: Markus Mayer <mmayer@broadcom.com>
Cc: Markus Mayer <mmayer@broadcom.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We define _DEFAULT_SOURCE in mkpasswd.c to suppress a compiler warning.

In file included from /usr/include/x86_64-linux-gnu/bits/libc-header-start.h:33,
                 from /usr/include/stdio.h:27,
                 from [...]/buildroot/output/arm64/build/host-mkpasswd/mkpasswd.c:24:
/usr/include/features.h:187:3:
  187 | # warning "_BSD_SOURCE and _SVID_SOURCE are deprecated, use _DEFAULT_SOURCE"
      |   ^~~~~~~

As per GLIBC 2.20 release notes[1]:

    The _BSD_SOURCE and _SVID_SOURCE feature test macros are no longer
    supported; they now act the same as _DEFAULT_SOURCE (but generate a
    warning). Except for cases where _BSD_SOURCE enabled BSD interfaces
    that conflicted with POSIX (support for which was removed in 2.19),
    the interfaces those macros enabled remain available when compiling
    with _GNU_SOURCE defined, with _DEFAULT_SOURCE defined, or without
    any feature test macros defined.

[1] https://lwn.net/Articles/611162/

Signed-off-by: Markus Mayer <mmayer@broadcom.com>
---
 package/mkpasswd/mkpasswd.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/mkpasswd/mkpasswd.c b/package/mkpasswd/mkpasswd.c
index fd16230468a4..ae8594061cf6 100644
--- a/package/mkpasswd/mkpasswd.c
+++ b/package/mkpasswd/mkpasswd.c
@@ -18,6 +18,11 @@
 
 /* for crypt, snprintf and strcasecmp */
 #define _XOPEN_SOURCE
+/*
+ * _BSD_SOURCE is deprecated as of GLIBC 2.20; _DEFAULT_SOURCE should be used
+ * instead. (https://lwn.net/Articles/611162/)
+ */
+#define _DEFAULT_SOURCE
 #define _BSD_SOURCE
 
 /* System library */
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
