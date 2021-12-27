Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04589C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 09:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73650813D4;
	Mon, 27 Dec 2021 09:50:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C8pD2FP2KLeQ; Mon, 27 Dec 2021 09:50:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9360813CB;
	Mon, 27 Dec 2021 09:50:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B5F0D1BF3FD
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 09:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A500B813CB
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 09:50:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A86-uPrQ5hd1 for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 09:50:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 07D5F813CA
 for <buildroot@busybox.net>; Mon, 27 Dec 2021 09:50:12 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id bm14so59699931edb.5
 for <buildroot@busybox.net>; Mon, 27 Dec 2021 01:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HK03Cf3oL6EhC3AbPRoCjX5SWcXCa/kjsXZhTnsKOOM=;
 b=MH0omIkZh0x1S7HMXk8+L+rZ/7PQilyf55KCqJz/jglISwUn3KHhUKhV1d1iXplsG1
 jEvQnzwcOQTGP2wpWF/usLhyyk/+WkzDub6MRlGnQGm6Fo+pqI95loQMubkGJMwS5lLa
 H98IihA0cYGCntb2SWu+Lt4j7BY9fbAt+ccCkLJXa8nS2gdY80/GTkbcCRz28+MOFEa1
 /zRA63jqBoA8F/3BlCbWvHWnvrg7qQ39iVqcUFaM112OXW9YqxoQ3xaGZ6W0jPI5DKg5
 S1DkKJYeMaPuPClRetcXEJOXx1JA25MdjdmI+8E3VES03nffiPNY4vZNXFTsclzgfFQd
 fyeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=HK03Cf3oL6EhC3AbPRoCjX5SWcXCa/kjsXZhTnsKOOM=;
 b=Wa6lFnvkwmPI5Av+Wlgm16BY1vOCNoVWOx9E/c6AfRJniodXoIrJnrNKFCjcMPWefc
 O/E6VKIVvwFu+5TAJVJlcsowDfBIqzQBQDdVn9lCvWYLfmyX0KLtvuChx14N1fxgeGkI
 6bVjkeG/Ubrn7wMjgi3uo78tNDQl0ebYx8JGBlupum4vG3K+JHv4OFB03IefNetXfkVm
 y2nEQzCNT/B2lQk7H1nexUqxkNEXmoP9aHf/oC2YV2zSqRwAU2GQia8ddlKD9ebK3ShZ
 ZvZhX76NtIY3qCZY/3HQH5B36d71eTrp6uIaSu6aJ9U6s5SFQOtK1Hp44TCl+17pflHJ
 Fqfg==
X-Gm-Message-State: AOAM533P9t4sXrEtPOtw9zVmLCeNSW1zN7CWzY5aNWoilywVbwJ+W4Im
 ZYVBxFVX9tVzGc4pH6IlZ3dyujYG+Uc=
X-Google-Smtp-Source: ABdhPJxWvkBuF33JVOoqpxyyWvDUf2rimzGllJsMvwkeDBvmpNCBUPRkXnPwxyjEANGQDUaR1qnO5Q==
X-Received: by 2002:aa7:c54f:: with SMTP id s15mr15894363edr.240.1640598610966; 
 Mon, 27 Dec 2021 01:50:10 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id 16sm4976582ejz.34.2021.12.27.01.50.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 01:50:10 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 27 Dec 2021 10:50:02 +0100
Message-Id: <20211227095002.1051348-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/htop: bump to version 3.1.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/htop/htop.hash | 2 +-
 package/htop/htop.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/htop/htop.hash b/package/htop/htop.hash
index 9de7926e3..dffe5ca1a 100644
--- a/package/htop/htop.hash
+++ b/package/htop/htop.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  b52280ad05a535ec632fbcd47e8e2c40a9376a9ddbd7caa00b38b9d6bb87ced6  htop-3.1.1.tar.gz
+sha256  fe9559637c8f21f5fd531a4c072048a404173806acbdad1359c6b82fd87aa001  htop-3.1.2.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/htop/htop.mk b/package/htop/htop.mk
index 12e48f437..7caa47ce1 100644
--- a/package/htop/htop.mk
+++ b/package/htop/htop.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-HTOP_VERSION = 3.1.1
+HTOP_VERSION = 3.1.2
 HTOP_SITE = $(call github,htop-dev,htop,$(HTOP_VERSION))
 HTOP_DEPENDENCIES = ncurses
 HTOP_AUTORECONF = YES
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
