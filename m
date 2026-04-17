Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBE8F8E4AB
	for <buildroot@archiver.kernel.org>; Fri, 17 Apr 2026 06:06:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53F8E812DE;
	Fri, 17 Apr 2026 06:06:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hir8fxFHb_WU; Fri, 17 Apr 2026 06:06:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CB6B812DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776405974;
	bh=4eNeg3uqkq/1GIV1gQlL7WXT7V6xp8+K53TsWVjgBUE=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=TaXN8/K7bgpwY9JlTqHPVhBkEIqsubQ12iTR4dros7AuTYnpH/QC20u5MYcpvM0do
	 W7o7QZ4PK1y0ClDcVVQPsR/sh/xlDN9PL6hTaenIUYtrzCJgH/sH4tR0YKyF8S9/aA
	 d5zaf84xxySiVCfLs6NrxZOBOa52KBocBFPGkSNRjBBFdTZlre0KNFZ4QWHo6oA2sz
	 /z06yp1N9Nvis0Iceo22ZCpl1nDZGyyD5Bal4ZjK72IllHXiBXmac6L760a5Oin8E3
	 sdcK3KJEtpWW105za7mKdG+nO6dHGudiBhvaew2Jr/pjBa94sOjxeMZU23P2XoI/Ut
	 GzumcfoLIchDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CB6B812DF;
	Fri, 17 Apr 2026 06:06:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C1FD259
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 06:06:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DBD540CDA
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 06:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5mVvnZ6bf6pu for <buildroot@buildroot.org>;
 Fri, 17 Apr 2026 06:06:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42e; helo=mail-pf1-x42e.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8B74240CAC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B74240CAC
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8B74240CAC
 for <buildroot@buildroot.org>; Fri, 17 Apr 2026 06:06:11 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-82f8cebc935so113230b3a.0
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 23:06:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776405970; x=1777010770;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rphi4UYKAK1ma0zQauxPb53EQEBwGfCfoOKDbOMKqyE=;
 b=CQbrZinbiT8SdQHqc7/Gi5P8DogeK7d9KwzNcDSwKtk/GSllDlRbX40S/JlsvZSKPt
 aW6lw38nOrVpDUKvpfWW1uQ7a/a8wCrcYCEFYwYuesMsUiaa3IVMoA2GDqLJh/NPSMo0
 i4LoHrCd3ZmnEkk4uDPOr4chRstdU8Hda2hpYvam1dduMKdsE6IrHH0gSYURV0znbdzX
 0zBDVmKyciXju+BZYTbQj3yPEljH8D1kT8iOgP33Cgu3J8Udst/NX5BVp7bKPhAxd7NO
 CtSovwqvyk2+dgXRxf9JYwLCvGKvbJG3sd52Za4Nzw7ahQy4SvQnr92RTUdoiIkKWMSf
 uUfQ==
X-Gm-Message-State: AOJu0YzexH8AcCaf+zVKtYX/BkjcsC9/gb1CWrzQ/utQk0V2qLwxM2qx
 9rpjoye+hbF0ma7/F/094VGRBc/1Cn97knsCK8U9IfeMgXBvJvCDvlK1OYsCQQ==
X-Gm-Gg: AeBDievCprMDpxnAw2e8xSxIcCQTESvcOV+HritmqPVv8WUlrID8R2xkE9x6Q1mLL/O
 DNOI++1AbPff+7ilGdEY4qwQptU6pQ596SnuaUsC4vf1C/+mhYqoyY3G/SDDGwbDi6wkoe0IFfg
 MqP4OBFxv7P9hUHvZtMZGLcvXpXNPJyroPgLCzo4Al73cmIJKhrykfszSBh/x+/TfppMCn7J67i
 8NpRmH/DUU4Y94pyIFaMWpzzc8ptN9UPJ6yosoKbnzvFMeivsT+Xf5qKyLYO4KslvoXKQaQbxpS
 nqi0otakeJY9Egt+ldRoM9aiJTHeSYSXPZ3HPf2P1oNetP9b3XpbjWBg+poxkbfesGTpSHDojQf
 mHVF3sWa8a4508ChOjH6oCL/apGuXv9pRgW2wbLMm96yLRSAqhvs/egARsZQoiX8SM3iwAkyNJk
 LP2xXg4eRNcgXemPCO/56GMca3IDemZYDtKBjrR4xKeb0=
X-Received: by 2002:a05:6a00:3004:b0:82c:ded1:261f with SMTP id
 d2e1a72fcca58-82f8c8bbc9bmr1454615b3a.27.1776405970295; 
 Thu, 16 Apr 2026 23:06:10 -0700 (PDT)
Received: from fedora ([2409:40e1:23:1576:ac1a:5ed4:aa7d:8ed4])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82f8ebba485sm916263b3a.38.2026.04.16.23.06.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Apr 2026 23:06:09 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Date: Fri, 17 Apr 2026 11:35:53 +0530
Message-ID: <20260417060553.10171-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776405970; x=1777010770; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Rphi4UYKAK1ma0zQauxPb53EQEBwGfCfoOKDbOMKqyE=;
 b=O7A1oyjNsFxqr4EwXelfG5coCjUFA4E45hoXeqlduG161GHxdmP54pf/VfTljUHzQs
 BcLcTLzT7ojkXLetxvQU5m5i2a+ogETypIC2Xky0ggFhB6MyocW/VLklboBpfaK7Zmyx
 pU7+7XUbkuIcihFh4YZLvCSlP1bdgpmHm5vXNZMou8b+zP7uB0tJvIgNK3GRJRw2U5Ib
 RsiKJ4AxuZCgdRv0cxMB0Jtiz64Lw8SVzI0negGvZqgHB+b8ZPkkAnh7AGdzU39iSBLb
 N/ABM41Tp6wUG45AJTHrUuOFLcuvxmkA03PfPuCw2bFk6RiAVFkm89aScuqrdNBLuztB
 /cNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=O7A1oyjN
Subject: [Buildroot] [PATCH v2 1/1] package/util-linux: fix LSMT_ROOT
 fallback definition
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

The fallback definition for LSMT_ROOT was incorrectly guarded
with #ifdef instead of #ifndef, making it ineffective on systems
with older kernel headers that don't define this constant.

This caused build failures with "LSMT_ROOT undeclared" errors on
autobuilders using older kernel headers.

Fixes:
 - http://autobuild.buildroot.net/results/ac2/ac2bc633db0c605564c79bfdfa0e257a9b4f1b28/

Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

---
Changes v1 -> v2:
  - Add missing 'Upstream:' tag to patches (fixes check-package failure)
  - Use symlink for util-linux-libs patch to avoid duplication
---
 ...api-utils.h-fix-LSMT_ROOT-definition.patch | 27 +++++++++++++++++++
 ...api-utils.h-fix-LSMT_ROOT-definition.patch |  1 +
 2 files changed, 28 insertions(+)
 create mode 100644 package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
 create mode 120000 package/util-linux/util-linux-libs/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch

diff --git a/package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch b/package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
new file mode 100644
index 0000000000..3d0de62bfd
--- /dev/null
+++ b/package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
@@ -0,0 +1,27 @@
+From 72ff3b8998a675900fcb7c18c0e03f1552b13a8b Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Tue, 14 Apr 2026 11:04:08 +0530
+Subject: [PATCH] include/mount-api-utils.h: fix LSMT_ROOT definition
+
+Upstream: Pending
+Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+---
+ include/mount-api-utils.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/include/mount-api-utils.h b/include/mount-api-utils.h
+index a916f99..87e173e 100644
+--- a/include/mount-api-utils.h
++++ b/include/mount-api-utils.h
+@@ -339,7 +339,7 @@ struct ul_statmount {
+ /*
+  * Special @mnt_id values that can be passed to listmount
+  */
+-#ifdef LSMT_ROOT
++#ifndef LSMT_ROOT
+ # define LSMT_ROOT              0xffffffffffffffff    /* root mount */
+ #endif
+ 
+-- 
+2.53.0
+
diff --git a/package/util-linux/util-linux-libs/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch b/package/util-linux/util-linux-libs/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
new file mode 120000
index 0000000000..88f6b841f7
--- /dev/null
+++ b/package/util-linux/util-linux-libs/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
@@ -0,0 +1 @@
+../0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
\ No newline at end of file
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
