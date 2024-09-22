Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD0FFCF9C64
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 18:43:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47C436061D;
	Sun, 22 Sep 2024 18:43:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v-NVlfTOEIIB; Sun, 22 Sep 2024 18:43:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36E196061F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36E196061F;
	Sun, 22 Sep 2024 18:43:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A69B91BF3E1
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 18:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9566F40251
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 18:43:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XG_rHlVrtfrT for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 18:43:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::633; helo=mail-pl1-x633.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5FA2C400F8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5FA2C400F8
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5FA2C400F8
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 18:43:30 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id
 d9443c01a7336-2068acc8a4fso32978005ad.1
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 11:43:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727030609; x=1727635409;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FUcJFtcKmrI8LZyGEauuSitBKmi9/G8k7PxeHlnBviI=;
 b=p0m9+e1R1pXqBxFiPhXosL/fzsJkWQ1eXJxFSHYA+3HjyCYwMHUXPfs5gHElKL1CiI
 OEg/Ivyr5NNv4oN2x65iZNqjjKrjO8ox687SJbTJbftbsbjhGcCxUYcR8H5o1FUqKEyb
 obJT4xwKCKejtHMxXqK0emYQC6tAIZUMEDsSwauk0tUd0QhhZHfLxnAb/88Xc+2rkPyf
 n/uzTutMj4GVoVBu+YhRLmNI+1UO4+c9oCYQMoD+DqlImW57zOfOkchlUPGn2KH/ocdT
 B7INfietxYY3lh0eXFEuipp5DM1tJBzAZLFmXP7CNN0r8+RsaR+xdq7u6P/VUaPq7/lB
 EdGA==
X-Gm-Message-State: AOJu0YxsE+TJkyTIE6Ym3Hx9tLarfRZ29SdZO2FYvp+e0Dy/dpu+kCOu
 KxvOcxNBOMN3jRhmVG33wS9S7FZyPSQnhRcms5KbOQjKHhf0H9hPJfHf4zX0u6A=
X-Google-Smtp-Source: AGHT+IErcz1TLmA3NwIq5OdgPfZVoabD/bcARfYRtp1XuRGq1DCDM6F3497RQMW41VpacKHdBqyGNw==
X-Received: by 2002:a17:902:c404:b0:205:6566:cb07 with SMTP id
 d9443c01a7336-208d83861d1mr145890235ad.17.1727030609207; 
 Sun, 22 Sep 2024 11:43:29 -0700 (PDT)
Received: from localhost.localdomain ([2600:8802:2a05:9000:ad2f:66c:ef69:238f])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-207945dc6d8sm121835545ad.29.2024.09.22.11.43.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 22 Sep 2024 11:43:28 -0700 (PDT)
From: Akhilesh Nema <nemaakhilesh@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 11:43:24 -0700
Message-Id: <20240922184324.3469302-1-nemaakhilesh@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727030609; x=1727635409; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FUcJFtcKmrI8LZyGEauuSitBKmi9/G8k7PxeHlnBviI=;
 b=H4aaNGnP7VBkMrNT3g9QlIFXQAdT1gzRgRe10ny7GMrQb87Ii1kN55fS9T3axRjh9i
 6TtCEMNaGhUDpMon3ycHERp40AVVpqdZrbqZUSgblNgelVTYOvlL4t9X4zbZ4QB134pZ
 V0Y83sNEyBUpDtEW88z8OC//enSXRY/0lZrdv0Wov8vFsCV+IW/rdFiOdGZsTDqk6uyS
 zQ1IDQprjOnZVtmWcWc36bOyOh9oD/2seSp+QcsnzC0aqr+K8bPSHXvbJSwiYc1orslT
 iQ6jxlYKnxk9XjnwdQUsebIhVp9ZSFX1UCtTNfZ4ROut/o9z7M7c2qOH7GYGcEl+a6m3
 l+dg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=H4aaNGnP
Subject: [Buildroot] [PATCH 1/1] package/strace: bump version to 6.11
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
Cc: Akhilesh Nema <nemaakhilesh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog - https://github.com/strace/strace/releases/tag/v6.11

Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
---
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index dcaf1ad5d4..e167f9d20a 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/6.10/strace-6.10.tar.xz.asc
-sha256  765ec71aa1de2fe37363c1e40c7b7669fc1d40c44bb5d38ba8e8cd82c4edcf07  strace-6.10.tar.xz
+# https://strace.io/files/6.11/strace-6.11.tar.xz.asc
+sha256  83262583a3529f02c3501aa8b8ac772b4cbc03dc934e98bab6e4883626e283a5  strace-6.11.tar.xz
 sha256  1988d0e1aa101d68855e8c4f940aacf2531051b82f6b608eb026c5fad1f33df1  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index 34a154357f..367a44da6e 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 6.10
+STRACE_VERSION = 6.11
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://github.com/strace/strace/releases/download/v$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
