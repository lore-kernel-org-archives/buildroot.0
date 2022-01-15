Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63A45C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 10:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0F8F681C93;
	Sat, 15 Jan 2022 10:18:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KOJreyKEjItS; Sat, 15 Jan 2022 10:18:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 52EB781C40;
	Sat, 15 Jan 2022 10:18:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F30251BF5DD
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E1B8181C40
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 10:18:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zC2ybI3va624 for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 10:18:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBD7381C21
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 10:18:13 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 f141-20020a1c1f93000000b003497aec3f86so10368321wmf.3
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 02:18:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tcM9myPSQznmL1CjLR4kAkv/JBDz3ozls4AlalcU/1g=;
 b=cKs2z3YY5Fcmyfo4hh/YRguG+LIuhvhtTHH6Si3+E3l7sNA+TdUSC5V3LlUSoPqUam
 NtLPahWY32rdTfdPg3nmLcDtLL3W1bS4GB5iR1o4CT3PPrsNPWnbTkQ9bLyngRuVrlNu
 mDF+InWQ4YJDMo5BBGdVSSRpZRHbkRbRG7CF3uwLVkHB5MxSC1D1nm1ZbEf5oRzlIk8k
 HUaBj23TiGDa5+sHl3SDx/gfBGI8wwBxW2iLn6a10x8mODBbQ6nj3Xmtwh+oXDuz6Wjm
 VlVvIWP3QXGWm60UOeCsj8Gydfe3Nk7A6kZdk1m3FKK7RBo9pXnukMrWP7C8mQe6Jz93
 Rdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tcM9myPSQznmL1CjLR4kAkv/JBDz3ozls4AlalcU/1g=;
 b=iBsT85U4GKV2sWu1k1jyD92xtryL4xAZ9QyHQ3ZYtVTgs4yMy0TUdmmR63mCPu2MQ4
 oTj/ATaY9ACzwqDmkIT20GnmIVcdrAMRKwdVZ40gFq3wUWqYAgG8VPsuZbbDnY8goM8C
 rtZrJhjZqioWP3O0YhFRDvTb2QrltsJO/0PfZVoFQC0pANPKi+RCjW7oZSAWHFj/HmIL
 vXqOiWvKEomZQCBkbOWypNKl3eDVinWtp9PSdhj8TuZib+UADuX2Th0teFtDuM7rKVPN
 lZ/HarvQ8E5Llg4i1G9WBnaYOeCeNvhk20kyoLeqZJd1tnjg3ZGzlOxaQNkhAlf2Ryhs
 rj7A==
X-Gm-Message-State: AOAM5334OYcth6DThs677Y/7nJmB9YkhLmNfcz97wX5eN77RUwVey39/
 IqZbm0L3SgtE+NmTgoFgnB0T5sN2cTo=
X-Google-Smtp-Source: ABdhPJyOoe2RvCeVo+2ESFPqgnxMR7Ajevm14Chu04akgoU+4xAaHPc0WOkBEWCupDwpXZj/43AB5w==
X-Received: by 2002:a5d:5887:: with SMTP id n7mr1652366wrf.499.1642241891988; 
 Sat, 15 Jan 2022 02:18:11 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id a24sm7770914wrc.114.2022.01.15.02.18.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 Jan 2022 02:18:11 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 15 Jan 2022 11:15:34 +0100
Message-Id: <20220115101535.1699671-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/ghostscript: fix CVE-2021-45944
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ghostscript GhostPDL 9.50 through 9.53.3 has a use-after-free in
sampled_data_sample (called from sampled_data_continue and interp).

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...ack-limits-after-function-evaluation.patch | 52 +++++++++++++++++++
 package/ghostscript/ghostscript.mk            |  3 ++
 2 files changed, 55 insertions(+)
 create mode 100644 package/ghostscript/0003-oss-fuzz-30715-Check-stack-limits-after-function-evaluation.patch

diff --git a/package/ghostscript/0003-oss-fuzz-30715-Check-stack-limits-after-function-evaluation.patch b/package/ghostscript/0003-oss-fuzz-30715-Check-stack-limits-after-function-evaluation.patch
new file mode 100644
index 0000000000..352f1754f6
--- /dev/null
+++ b/package/ghostscript/0003-oss-fuzz-30715-Check-stack-limits-after-function-evaluation.patch
@@ -0,0 +1,52 @@
+From 7861fcad13c497728189feafb41cd57b5b50ea25 Mon Sep 17 00:00:00 2001
+From: Chris Liddell <chris.liddell@artifex.com>
+Date: Fri, 12 Feb 2021 10:34:23 +0000
+Subject: [PATCH] oss-fuzz 30715: Check stack limits after function evaluation.
+
+During function result sampling, after the callout to the Postscript
+interpreter, make sure there is enough stack space available before pushing
+or popping entries.
+
+In thise case, the Postscript procedure for the "function" is totally invalid
+(as a function), and leaves the op stack in an unrecoverable state (as far as
+function evaluation is concerned). We end up popping more entries off the
+stack than are available.
+
+To cope, add in stack limit checking to throw an appropriate error when this
+happens.
+
+[Retrieved from:
+https://git.ghostscript.com/?p=ghostpdl.git;a=commit;h=7861fcad13c497728189feafb41cd57b5b50ea25]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ psi/zfsample.c | 14 +++++++++++---
+ 1 file changed, 11 insertions(+), 3 deletions(-)
+
+diff --git a/psi/zfsample.c b/psi/zfsample.c
+index 290809405..652ae02c6 100644
+--- a/psi/zfsample.c
++++ b/psi/zfsample.c
+@@ -551,9 +551,17 @@ sampled_data_continue(i_ctx_t *i_ctx_p)
+     } else {
+         if (stack_depth_adjust) {
+             stack_depth_adjust -= num_out;
+-            push(O_STACK_PAD - stack_depth_adjust);
+-            for (i=0;i<O_STACK_PAD - stack_depth_adjust;i++)
+-                make_null(op - i);
++            if ((O_STACK_PAD - stack_depth_adjust) < 0) {
++                stack_depth_adjust = -(O_STACK_PAD - stack_depth_adjust);
++                check_op(stack_depth_adjust);
++                pop(stack_depth_adjust);
++            }
++            else {
++                check_ostack(O_STACK_PAD - stack_depth_adjust);
++                push(O_STACK_PAD - stack_depth_adjust);
++                for (i=0;i<O_STACK_PAD - stack_depth_adjust;i++)
++                    make_null(op - i);
++            }
+         }
+     }
+ 
+-- 
+2.25.1
+
diff --git a/package/ghostscript/ghostscript.mk b/package/ghostscript/ghostscript.mk
index d502d19206..91871728ba 100644
--- a/package/ghostscript/ghostscript.mk
+++ b/package/ghostscript/ghostscript.mk
@@ -24,6 +24,9 @@ GHOSTSCRIPT_DEPENDENCIES = \
 # 0002-Bug-704342-Include-device-specifier-strings-in-acces.patch
 GHOSTSCRIPT_IGNORE_CVES += CVE-2021-3781
 
+# 0003-oss-fuzz-30715-Check-stack-limits-after-function-evaluation.patch
+GHOSTSCRIPT_IGNORE_CVES += CVE-2021-45944
+
 # Ghostscript includes (old) copies of several libraries, delete them.
 # Inspired by linuxfromscratch:
 # http://www.linuxfromscratch.org/blfs/view/svn/pst/gs.html
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
