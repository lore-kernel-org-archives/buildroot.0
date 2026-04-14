Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99300F531EC
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 05:52:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4859A61CA5;
	Tue, 14 Apr 2026 05:52:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YsBh5z5JDGmT; Tue, 14 Apr 2026 05:51:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4EED561CA2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776145919;
	bh=f5cZDtvWFabiQBIJlGlzLM6yZezD2uo39UPeC92d4fs=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=FrZFEiBY6iCaY9GxQvRM+Rw2HiLDuD0QaOkY8JJut5dk158OOxnxE6LPocReF9hAS
	 hyb1TLJ7xmDYbATWpAhDGR/MkHLpjhoWqhl6d4WfMm4fbfVbSsV7Ib2NoBgjxiIK0T
	 hVGW4z0AERD6TI63AggmrxtoEmOFGHlufjt84haUtptOq2X4w6ErFGN0Y4hv0XVXr2
	 pioER5d25Kx/OdxkRmkTBtV6XgMf5QSa6lY3Fpd5RDxOdceG8eea1qsxNrTsoe4QH0
	 Ed9VBhaKAx5M84Ej2QfBHQB4mx5wsX0pTiFb4Xx8k9fJAdFZuiRrYVKBHTESUA6Zic
	 Cp6V7KPwJ4TdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4EED561CA2;
	Tue, 14 Apr 2026 05:51:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E9AFE375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 05:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C6A764007D
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 05:51:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a_cuR-SGhV6D for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 05:51:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::42d; helo=mail-pf1-x42d.google.com;
 envelope-from=chakrabortyshubham66@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DEF4940074
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DEF4940074
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DEF4940074
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 05:51:56 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-82f41fce3e6so776956b3a.1
 for <buildroot@buildroot.org>; Mon, 13 Apr 2026 22:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776145916; x=1776750716;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GLO9rsxXTUJCgIRx3jcQZtHKRtqpFbTKDGhJEu6s2BE=;
 b=VTJiAR6wglbxLn/wXynndj49SgLQRkrdX8HiH9Xct/ZaH0XOYeyuYUsGwwEDYM8OnF
 wMWPeP/kCpMtyNKxhxOpLx5QYQFO/36VYsT7QyosfmvRzbgVLFtk0wGzoRXPiDR9L8yr
 VGjRN8ZgRGIkyVYH+FudphTBj42LUjNDToelIiIkibtYiZsR8SeDLtX5UFU7TolFCsJl
 oO5YF8NSKcOJ+E051Nk9+yXY0iKul5xbio3TGb7hVwc5h3oH5H8mCLZfsIYdtcyriU/W
 EUAR5s/QEAbpaRnSxsoMPw6VRsLXj0SLAusUyqJFmUR+HMLxWNGpYbdGskYK1QV4HqYr
 kOEQ==
X-Gm-Message-State: AOJu0YzOu78S2mdXzIctQ1hH5lOCs1CnhH7hh3IdcFWSfKn86SsRBFPp
 x1/JrhQTuGUHUishZUyWZlr0dLFcxOvzqy+sgEtGSqFhq33W2Q+NbZoTIsRWGw==
X-Gm-Gg: AeBDieubLLv5zYoRr1B39QGMXZspxsSTFWt0b3y7M8MgCwyLWDHoNHLLdj3hNyjhQ9M
 xXlYTrTcfTdrHa2kk1m7DYlC2WBElhJ6f4HVPBkPd604is2uc0GVFVqd3zGeaRAdrZdVGshh6Qv
 EB5/b5QN5yud2kCvwTPEJnQWsiwDzqylXSqf94MaGttWWNNrv8/p/TMFYBxHe/Fu0vYt0IHm/B9
 ygGmO0dSITn7dmWX7MCvSGafjy043UdhyKrvtrAz2p0QsAminuX0fBAQr/gHxF7DCOlxjc5LXFn
 MVvcgeMIReTS6GHx7bQKSkLO7cOE8BFO2S9xpbE+SwVp2+lZUHFaT8ldoQcseqSlocDsVqTrSjI
 fsKSEJJYMeoFd7S27efjDRUkP0cLBp58iOljab9q0XxMB1CFun2GgbvriAnqTczA18usVDFrSzp
 WY1wZRZoZALJmWOwn7EiujaDbkFbICWuzhOh8=
X-Received: by 2002:a05:6a00:114f:b0:82c:e0d7:2681 with SMTP id
 d2e1a72fcca58-82f0c276ff3mr16684543b3a.16.1776145915510; 
 Mon, 13 Apr 2026 22:51:55 -0700 (PDT)
Received: from fedora ([152.58.163.113]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-82f0c30e3f8sm13500555b3a.8.2026.04.13.22.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Apr 2026 22:51:54 -0700 (PDT)
From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
To: buildroot@buildroot.org
Cc: Shubham Chakraborty <chakrabortyshubham66@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 14 Apr 2026 11:21:29 +0530
Message-ID: <20260414055130.72888-1-chakrabortyshubham66@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1776145916; x=1776750716; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GLO9rsxXTUJCgIRx3jcQZtHKRtqpFbTKDGhJEu6s2BE=;
 b=Kj9Z6lPXKZR33azWYBrQloSSAooN2zTuByTVu1qttSAuRgqtGeioAqbA8/uJgcMNUG
 HWt/wrk/wW7XybW9Po9oUXVIztZFG9Mqf/+CvNLJnTgWnQ1Hh1oA6o66AvgCQOkkRXAj
 Ls6zu8gdQVcyuq5Fo237NBpMZFbFUO3RI9Y8r4RssRQtvfxAjhMOfEhV+FwQj94zwFzq
 j6I6n5hR++ePSzyAYE2WZVvbW7+0XRq+wIXlKChOT4uf5EnXFv0ls7XB577S6b9zpso9
 z3Xk55s3+DucvrAlNSyLcTTYs7Jme+vOyqS5As3nMVD+DDV8ZkmMMNHJcZYq5b48bzg8
 3Q4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=Kj9Z6lPX
Subject: [Buildroot] [PATCH] package/util-linux: fix LSMT_ROOT fallback
 definition
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
 ...api-utils.h-fix-LSMT_ROOT-definition.patch | 26 +++++++++++++++++++
 ...api-utils.h-fix-LSMT_ROOT-definition.patch | 26 +++++++++++++++++++
 2 files changed, 52 insertions(+)
 create mode 100644 package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
 create mode 100644 package/util-linux/util-linux-libs/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch

diff --git a/package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch b/package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
new file mode 100644
index 0000000000..672a2b2e79
--- /dev/null
+++ b/package/util-linux/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
@@ -0,0 +1,26 @@
+From 72ff3b8998a675900fcb7c18c0e03f1552b13a8b Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Tue, 14 Apr 2026 11:04:08 +0530
+Subject: [PATCH] include/mount-api-utils.h: fix LSMT_ROOT definition
+
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
new file mode 100644
index 0000000000..672a2b2e79
--- /dev/null
+++ b/package/util-linux/util-linux-libs/0001-include-mount-api-utils.h-fix-LSMT_ROOT-definition.patch
@@ -0,0 +1,26 @@
+From 72ff3b8998a675900fcb7c18c0e03f1552b13a8b Mon Sep 17 00:00:00 2001
+From: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
+Date: Tue, 14 Apr 2026 11:04:08 +0530
+Subject: [PATCH] include/mount-api-utils.h: fix LSMT_ROOT definition
+
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
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
