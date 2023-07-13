Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BF8AC001B0
	for <buildroot@archiver.kernel.org>; Thu, 13 Jul 2023 07:57:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E2176130E;
	Thu, 13 Jul 2023 07:57:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E2176130E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S-dBupHG5VOO; Thu, 13 Jul 2023 07:57:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6037661306;
	Thu, 13 Jul 2023 07:57:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6037661306
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3779D1BF397
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 10BD040A85
 for <buildroot@lists.busybox.net>; Thu, 13 Jul 2023 07:57:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 10BD040A85
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BebrZ611fJF3 for <buildroot@lists.busybox.net>;
 Thu, 13 Jul 2023 07:57:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36F7B404F4
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 36F7B404F4
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 07:57:45 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-345f4a3ff76so1461205ab.2
 for <buildroot@buildroot.org>; Thu, 13 Jul 2023 00:57:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689235064; x=1691827064;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iOvtG55r9biOYvkS9eoiv+/H6Z/qGK69vJ6WMA47/xs=;
 b=KtXDYh/YkLaSfxdZWL18Z0K+8oxRL46S4wRkeEQuKtuIjiCjPitnYlQCDNRhNNSTq/
 H71HvugnBMt6dJ7QRXB2MiK4XODHSXnrxwizAlDpsVsSP2sZaZFGnL9J0ln2dHlnKFCQ
 vF4K+tDOp7bwXhItR2vx2D7Em7rGOsdHQEQ4aN+6c1Cvg4FIgwR8KxAMDLAAt9n8IUvR
 LGMF3nrYQ0TpVHibfCwiilPnELYY8tWFBq1pfjI+tn4XajcBNEaU9F0C74zpxCg4RsIK
 7Vb4FftFUI/VAGV5BJLpAAkgB5h6O9Qm7G/7ifAZBdgbnTUbQDrC4NLUpl9kH/aZoxhc
 jLRw==
X-Gm-Message-State: ABy/qLbzJAdMab/DNAONLsPLtTWsx7T8wGCKTl4u0p2/rWOpUU59Z6w4
 Io0w8KPqxeyXOk9tdj18NpeGaRKV2dA=
X-Google-Smtp-Source: APBJJlF/9Ivcrf2VzZJf2ToeDlJqGTZ+eieHUhSpT/ZW88dJ+9Jwunj3a7mtezLzqBKg9KmuJLu1bg==
X-Received: by 2002:a92:cd0d:0:b0:346:5a8b:540e with SMTP id
 z13-20020a92cd0d000000b003465a8b540emr910984iln.0.1689235063754; 
 Thu, 13 Jul 2023 00:57:43 -0700 (PDT)
Received: from james-x399.localdomain (71-218-225-212.hlrn.qwest.net.
 [71.218.225.212]) by smtp.gmail.com with ESMTPSA id
 i15-20020a92c94f000000b003460bb48516sm1841356ilq.67.2023.07.13.00.57.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 00:57:43 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jul 2023 01:57:40 -0600
Message-Id: <20230713075740.328213-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689235064; x=1691827064;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iOvtG55r9biOYvkS9eoiv+/H6Z/qGK69vJ6WMA47/xs=;
 b=fkLkmoQyLJO7P2ufruJk2crkwiJ6auxfCywL79jSWrYr4Ys/3xkTNgid84XdSyJ9qh
 ti2nr47pvyDoXbRa0tIDu2V3+1pEv/IYVv/LxSrhG8eLFTYaSAQjNTDC8HeBcbifNW7S
 YKR004lHdHSO2eVySVbM5vfOL7YRRb/+lqQMiWbNDNAqP1p15RFC67ub30ckmKKA1esI
 1rdUsXuvBZ6umqisKyQUFynRWxpyJIMhozdQP+C8UqAtu3eJew3vMmW0TnDOMxQY1T1e
 ZzzxNZp6kFeQ5aJOYck1URTlDaFSbY2QHKUSIO8+96zqvYHZC86scY6rw8psjhDdpIum
 uy4g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fkLkmoQy
Subject: [Buildroot] [PATCH v2 1/1] package/strace: use bundled headers
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

There is a bug in the configure script, while we could apply the
upstream patching fixing this bug the better solution is to switch
to using the bundled headers instead.

The reason for this is that strace needs the headers of the running
kernel rather than those that were used to build the toolchain.

The running kernel is often more recent than the one used in the
toolchain so we do want to use the more up-to-date headers.

As such we should use the strace bundled headers as they will be
the most up-to-date headers.

Details: https://github.com/strace/strace/issues/253

Fixes:
 - http://autobuild.buildroot.net/results/867/8675aeca53653d9d792182be61a28ea550dc530d

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - add more detailed description regarding bundled headers
---
 package/strace/strace.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 6514bfe354..9f6b333318 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -10,7 +10,7 @@ STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSI
 STRACE_LICENSE = LGPL-2.1+
 STRACE_LICENSE_FILES = COPYING LGPL-2.1-or-later
 STRACE_CPE_ID_VENDOR = strace_project
-STRACE_CONF_OPTS = --enable-mpers=no
+STRACE_CONF_OPTS = --enable-bundled=yes --enable-mpers=no
 
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
 STRACE_DEPENDENCIES += libunwind
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
