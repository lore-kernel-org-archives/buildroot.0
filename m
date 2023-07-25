Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E490C001DF
	for <buildroot@archiver.kernel.org>; Tue, 25 Jul 2023 13:51:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 218A781FC4;
	Tue, 25 Jul 2023 13:51:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 218A781FC4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U6sQ6XnUKQgT; Tue, 25 Jul 2023 13:51:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57BAC81FD4;
	Tue, 25 Jul 2023 13:51:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 57BAC81FD4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C039B1BF84C
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:51:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A75C34052B
 for <buildroot@lists.busybox.net>; Tue, 25 Jul 2023 13:51:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A75C34052B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jfos2Gmhbk8v for <buildroot@lists.busybox.net>;
 Tue, 25 Jul 2023 13:51:17 +0000 (UTC)
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A764F4016F
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 13:51:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A764F4016F
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-3fbc244d307so54878105e9.1
 for <buildroot@buildroot.org>; Tue, 25 Jul 2023 06:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690293075; x=1690897875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IE0e1ewsdNvQKaSl1Oc6b4kNMBOhRAvdeUJlR5K1Z6M=;
 b=PPtsEu5uhG/Ttwzmfq3ia+RXGgt9eY3560OEJbWQB8ORsMXqQg86ka4pjQj3O3XjLQ
 mlt2w98pSMOYgpW8X+UEe78ToXzWw2+fRyrnIpxBw4AwhQgSp4uIRdXiBk4hjJwS0NXO
 V0Il77kENKjR7GqRAG7IsDYqQ/2CybUKYRiEqOSX04iL3H38r/6Tfurn7C8aBRJcfEvV
 o9JpniVXBhCGrlOAQ6Kmle72IvE67IuiZ6jemezbTpztBpBU3BJRRk//3vzi4RIxmuKn
 YWTIOsqjaFrvl7V4QHwNqKv8doy9ZUo/mwl6JfQ8+ngTKHyfP/LJVyyV1LgmdHpKRzki
 /b9A==
X-Gm-Message-State: ABy/qLY3iQsF3OY72m+yw+gALOG5dul/JMF8y89ODG4HasDYayPFSk5T
 LRZHKSoosHpybEH9N+cOXVlQXByRAphiHBWDJRI=
X-Google-Smtp-Source: APBJJlFSATksXzJNWHFZ6KvrG3OGw2yLajBM/a/qKx5b4iRqA1lQVzGB9c7oKyD6V6l7wIAJc90BvA==
X-Received: by 2002:a05:600c:450:b0:3f8:c70e:7ed1 with SMTP id
 s16-20020a05600c045000b003f8c70e7ed1mr11015443wmb.20.1690293075620; 
 Tue, 25 Jul 2023 06:51:15 -0700 (PDT)
Received: from localhost.localdomain ([2001:861:5384:6b50:e537:2825:8aee:d1db])
 by smtp.gmail.com with ESMTPSA id
 y16-20020a5d6150000000b00313e59cb371sm16604581wrt.12.2023.07.25.06.51.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jul 2023 06:51:15 -0700 (PDT)
From: Sebastian Weyer <sebastian.weyer@smile.fr>
To: buildroot@buildroot.org
Date: Tue, 25 Jul 2023 15:50:57 +0200
Message-Id: <20230725135105.536310-3-sebastian.weyer@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230725135105.536310-1-sebastian.weyer@smile.fr>
References: <20230725135105.536310-1-sebastian.weyer@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1690293075; x=1690897875;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IE0e1ewsdNvQKaSl1Oc6b4kNMBOhRAvdeUJlR5K1Z6M=;
 b=ActqJ7bWxHB/RMOp6S6R7/3KnixBTOMwx7RDMvJRRK3kbXO0nImDUR7QvPqmHSNKkb
 Y7RTeC8qtjPP9bKPlhN9RvnZOEYllins9NH6xvjoc0ryKnfpOERp9UgWeOot405txBYZ
 rmZKviVDO5r07NnE6gAJe/PjJAIznhKnQs7DBGMC3En06OVw1tSD83fOOmlWl5Rve77E
 qnbwug86NXeHurBUqaFQHekVINNvFTtT5DfLRjb+aaKlJd79QWgZTuD5gcqY/BNyC/as
 9uMGAyIi5wUGI+QN5J9oYSXyIPIxnfK/pjvbzpMUitXfaiwWkDu9MOmjAtbXdZPDrzsn
 iqCw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=ActqJ7bW
Subject: [Buildroot] [PATCH 2/9] package/llvm-project/llvm: add llvm dump
 support
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>, Romain Naour <romain.naour@smile.fr>,
 Daniel Lang <dalang@gmx.at>, Romain Naour <romain.naour@gmail.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Romain Naour <romain.naour@smile.fr>

LLVM_ENABLE_DUMP required by mesa3d rusticl:

https://docs.mesa3d.org/rusticl.html

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/llvm-project/llvm/Config.in | 6 ++++++
 package/llvm-project/llvm/llvm.mk   | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/llvm-project/llvm/Config.in b/package/llvm-project/llvm/Config.in
index ebb0fca66a..4ee84b3bcc 100644
--- a/package/llvm-project/llvm/Config.in
+++ b/package/llvm-project/llvm/Config.in
@@ -57,6 +57,12 @@ config BR2_PACKAGE_LLVM_BPF
 	  Build BPF target. Select this option if you are going
 	  to install bcc on the target.
 
+config BR2_PACKAGE_LLVM_DUMP
+	bool "enable dump"
+	help
+	  Build LLVM with dump functions even when assertions are
+	  disabled.
+
 endif
 
 comment "llvm needs a toolchain w/ wchar, threads, C++, gcc >= 7, dynamic library, host gcc >= 7"
diff --git a/package/llvm-project/llvm/llvm.mk b/package/llvm-project/llvm/llvm.mk
index 556a2f8c35..6598d8b6c1 100644
--- a/package/llvm-project/llvm/llvm.mk
+++ b/package/llvm-project/llvm/llvm.mk
@@ -228,6 +228,13 @@ HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_RTTI=OFF
 LLVM_CONF_OPTS += -DLLVM_ENABLE_RTTI=OFF
 endif
 
+HOST_LLVM_CONF_OPTS += -DLLVM_ENABLE_DUMP=OFF
+ifeq ($(BR2_PACKAGE_LLVM_DUMP),y)
+LLVM_CONF_OPTS += -DLLVM_ENABLE_DUMP=ON
+else
+LLVM_CONF_OPTS += -DLLVM_ENABLE_DUMP=OFF
+endif
+
 # Compiler-rt not in the source tree.
 # llvm runtime libraries are not in the source tree.
 # Polly is not in the source tree.
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
