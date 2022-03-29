Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63321C433F5
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 21:54:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D06D8149B;
	Tue, 29 Mar 2022 21:54:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 51Kpwtf-q09q; Tue, 29 Mar 2022 21:54:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A20281462;
	Tue, 29 Mar 2022 21:54:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 16B161BF41A
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 21:54:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13C4A8142C
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 21:54:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2q5kaOO2aN0W for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 21:54:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93F9081425
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 21:54:41 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id q19so15931084pgm.6
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 14:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0Fme8UuD9az1xqdNzC/oIv7dhjA5B5GUUos9LooiTro=;
 b=Xz7xVTYY8m1wOPCaM7pPxS6oy9MHgDqHJPphJcVgaul1OGSLjOpZPe1AaWOdTDK9iW
 y2vUjDjNvZLWKKesNygG8tK3AcCZ3VXID+N7OvOmHU8O5Ny5S5ud3Oc7iSPI3T3Mk8eB
 aS0YuWv3V7bm0TKzrWjqZOmvSrLdUZL0gZ0MjFf+ShilXyUYGvJVsfFhm2clMu6slitr
 zAAIDuxtyj5dbyN62sN8gUVp0f4IRwSKwWzZx42fu7uA0DQVhCXEXiqIxt2MazafLJif
 +Vr7d+pmu050UAcW9WTu1ZZuucgFgFmmxWmBTWxZFTo1s+LiR7rwnmejW6xSG2anVIYa
 JLzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0Fme8UuD9az1xqdNzC/oIv7dhjA5B5GUUos9LooiTro=;
 b=Y31qrMnGoiKTxPI7yYZHiPTbQM9ItaSC8EKvYT1uTEjyW2eFHdtcYOR3mHOnJiPS6V
 RUD8UetjA91pgBhMYPliI0bkTzsx4fYH1MzqI6ecFFG7OVC0LSu6A4HwHZzj85nQmjUe
 9mY/aND7Rv+57nMZjQQemF1CpMQt2nMeVWVFYE8rEDJCUs23cb6C77hbbWxt5LHVwyoe
 nCIeA4BGP8PzGG+VhLj81YC5Gx260xg2YiwJpkCI8wzsGNQTc1ecTyR+EGeBk1IQfYjQ
 0AZ/GAbFni97U3ScEcxcxjJNbv4Ebnv1sGXF+PagJzDfmeXqzOO70G+oprVygvsq5VHU
 fAWA==
X-Gm-Message-State: AOAM533wfzQi4b80xDAGrtVS5qsWN1FoXGPV1DKN+GC2PfxFzSKMP+wc
 t6lsJxykaNDRw9Wn46fzYWSVJdqX8bf1CA==
X-Google-Smtp-Source: ABdhPJwKic2GthX88zWhjdM6Wg8B6Qw5Um2rhRLvfO5hZk/7qn+/tV9dSby95O6xPNJQ2elPy+/49A==
X-Received: by 2002:aa7:81c1:0:b0:4f7:6ba1:553b with SMTP id
 c1-20020aa781c1000000b004f76ba1553bmr30211502pfn.45.1648590880585; 
 Tue, 29 Mar 2022 14:54:40 -0700 (PDT)
Received: from mac-mini.. ([2806:1000:8003:5c6c::13])
 by smtp.googlemail.com with ESMTPSA id
 f15-20020a056a001acf00b004fb2ad05521sm13084559pfv.215.2022.03.29.14.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 14:54:40 -0700 (PDT)
From: Alsey Coleman Miller <alseycmiller@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 29 Mar 2022 21:54:33 +0000
Message-Id: <20220329215433.1018660-2-alseycmiller@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220329215433.1018660-1-alseycmiller@gmail.com>
References: <20220329215433.1018660-1-alseycmiller@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/libdispatch: add fix for 32-bit arm
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
Cc: Alsey Miller <alseycmiller@gmail.com>,
 James Hillard <james.hilliard1@gmail.com>,
 Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
---
 package/libdispatch/arm-yield.patch | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 package/libdispatch/arm-yield.patch

diff --git a/package/libdispatch/arm-yield.patch b/package/libdispatch/arm-yield.patch
new file mode 100644
index 0000000000..fa7cf7cce4
--- /dev/null
+++ b/package/libdispatch/arm-yield.patch
@@ -0,0 +1,13 @@
+diff --git a/src/shims/yield.c b/src/shims/yield.c
+index 43f0017..d0c5fff 100644
+--- a/src/shims/yield.c
++++ b/src/shims/yield.c
+@@ -36,7 +36,7 @@ void *
+ _dispatch_wait_for_enqueuer(void **ptr)
+ {
+ #if !DISPATCH_HW_CONFIG_UP
+-#if defined(__arm__) || defined(__arm64__)
++#if (defined(__arm__) && defined(__APPLE__)) || defined(__arm64__)
+ 	int spins = DISPATCH_WAIT_SPINS_WFE;
+ 	void *value;
+ 	while (unlikely(spins-- > 0)) {
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
