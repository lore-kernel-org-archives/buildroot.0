Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D98C433F5
	for <buildroot@archiver.kernel.org>; Tue, 22 Mar 2022 23:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6386640C97;
	Tue, 22 Mar 2022 23:23:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1KOBy8p8z_3V; Tue, 22 Mar 2022 23:23:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 112E540C95;
	Tue, 22 Mar 2022 23:23:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8AD781BF427
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 23:22:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79DE1418EB
 for <buildroot@lists.busybox.net>; Tue, 22 Mar 2022 23:22:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EGCP1knbPDLr for <buildroot@lists.busybox.net>;
 Tue, 22 Mar 2022 23:22:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1F0A418E7
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 23:22:36 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id c23so22051309ioi.4
 for <buildroot@buildroot.org>; Tue, 22 Mar 2022 16:22:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hTLt9L4jb3m/iBAw3YuekK0+9u1NphsmYcIdO1RDCj8=;
 b=mRz1pKmVkwj9yUByvcupO+0PRjhzfytjCf8D3SjZzqYDXW1QcXqlW52KAYEjFDiMrS
 iUuEFejbrAIW+LjGWC3ee+XZJfFIhFLrMN1dmFyvlitJRqILz7dDTG54xqDbqaZ8+pv8
 YWehRB7kQ/GItefnM/aXqsrKUdckpd3pYRlJFsexkYpt3EDE5lWcjhmyqJuHnG/KpjXZ
 gG+xHYBdfXu7j7dzB5WYbpLjFEQAOxpAcPBF/Pg7rRhIDbSuHxAg2ksE5Zv+4JdwVTdr
 Rgs/l/iUrANKqvWOfXu4+/uDkDSU2DChPacCxZyqeZcsRIub0m4o7dyE4qPT6mPKmNx+
 EeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hTLt9L4jb3m/iBAw3YuekK0+9u1NphsmYcIdO1RDCj8=;
 b=4PZGBsc+oXND1Z0FFX8Kksdl1yVizAgHLAmxFTIQw9j7Zo5KZgEqwPDJkYyLBkmkb2
 kJmGRsrIKIg7uCbFU2JYnGCcL1LEkwz3JlT59ha4rGzXt7DgUF/6nuNCK7beH2YR9sBR
 pvR7MDWA2JxeTqjxuQqkVN1CU/AombCqOPkxEG66xFVT1SYndP9ofw0jJkIT6NuTOhc6
 U6cz/+jdgNXLECX4lyc0IrjI2RFoRxD5+nLD2824+VZx0KhZCXzTVo6bbrqTJ94qkju/
 Fchz51mYRdwWlQ2QxybD5Sm7ACqDU1sO4YH7lNhepCbL+2Dmx3oftFTiGiWSJSKAjbHc
 hl/g==
X-Gm-Message-State: AOAM533FyO9bigpfzDrXCvPIUB65FUySvp9jqrmC946OkRqDzUiIjPPs
 qB02sBtn79IukVHxUeCi8WwdSTp+B6enpYNs
X-Google-Smtp-Source: ABdhPJzk3T0ZOwLe6PXNtqiHy7XP/F08h44S8Yjn8NfXIoHc3O2aEY9dOvYpIdJoaKLf762LIo/jWg==
X-Received: by 2002:a05:6638:d47:b0:321:460a:88c8 with SMTP id
 d7-20020a0566380d4700b00321460a88c8mr5263626jak.175.1647991355156; 
 Tue, 22 Mar 2022 16:22:35 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 i81-20020a6bb854000000b00649c1b67a6csm2006324iof.28.2022.03.22.16.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Mar 2022 16:22:34 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 22 Mar 2022 17:22:16 -0600
Message-Id: <20220322232224.2842266-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220322232224.2842266-1-james.hilliard1@gmail.com>
References: <20220322232224.2842266-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v12 03/11] package/lld: bump to version 11.1.0
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Bernd Kuhls <bernd.kuhls@t-online.de>,
 Matt Weber <matthew.weber@rockwellcollins.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>, Matt Weber <matthew.weber@collins.com>,
 Valentin Korenblit <valentinkorenblit@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Matt Weber <matthew.weber@rockwellcollins.com>

---
 package/lld/lld.hash | 2 +-
 package/lld/lld.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/lld/lld.hash b/package/lld/lld.hash
index 2144cc5666..17b8d18997 100644
--- a/package/lld/lld.hash
+++ b/package/lld/lld.hash
@@ -1,3 +1,3 @@
 # locally calculated
-sha256 86262bad3e2fd784ba8c5e2158d7aa36f12b85f2515e95bc81d65d75bb9b0c82  lld-9.0.1.src.tar.xz
+sha256 017a788cbe1ecc4a949abf10755870519086d058a2e99f438829aef24f0c66ce  lld-11.1.0.src.tar.xz
 sha256 f7891568956e34643eb6a0db1462db30820d40d7266e2a78063f2fe233ece5a0  LICENSE.TXT
diff --git a/package/lld/lld.mk b/package/lld/lld.mk
index cd1a03c1d3..4bf903cda0 100644
--- a/package/lld/lld.mk
+++ b/package/lld/lld.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # LLVM, Clang and lld should be version bumped together
-LLD_VERSION = 9.0.1
+LLD_VERSION = 11.1.0
 LLD_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLD_VERSION)
 LLD_SOURCE = lld-$(LLD_VERSION).src.tar.xz
 LLD_LICENSE = Apache-2.0 with exceptions
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
