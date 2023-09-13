Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BA2FCA0ED1
	for <buildroot@archiver.kernel.org>; Wed, 13 Sep 2023 04:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B229416A9;
	Wed, 13 Sep 2023 04:09:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B229416A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ML_scj9TvHY1; Wed, 13 Sep 2023 04:09:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7CFC1416CE;
	Wed, 13 Sep 2023 04:09:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CFC1416CE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38D6F1BF5A3
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 04:09:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B61F60D88
 for <buildroot@lists.busybox.net>; Wed, 13 Sep 2023 04:09:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0B61F60D88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PaY-J6GYQooh for <buildroot@lists.busybox.net>;
 Wed, 13 Sep 2023 04:09:34 +0000 (UTC)
Received: from mail-vk1-xa2f.google.com (mail-vk1-xa2f.google.com
 [IPv6:2607:f8b0:4864:20::a2f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0E2CB60ADE
 for <buildroot@buildroot.org>; Wed, 13 Sep 2023 04:09:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0E2CB60ADE
Received: by mail-vk1-xa2f.google.com with SMTP id
 71dfb90a1353d-495eb6e2b80so1096693e0c.1
 for <buildroot@buildroot.org>; Tue, 12 Sep 2023 21:09:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694578172; x=1695182972;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+0I9Sr7isiwJhGG8o4NbpmfRKUaQFeSh/hruUVTZobw=;
 b=rf/bMLEVpIumyH5RjNJSQ9YAsbCnrgS+fmjwALuThvUrE/XNwl0xEnck3n1Fs5arO/
 r4Gc/dvutRHVF10djnG4Y3xXTGgX0ErV1GX52nN3b4BZVkW6+SwscuF4lVG2M/UwvcBI
 nzgbMchOVtWMxXuB9JFg3RqpbJemmldD7HZO3CFRQBq5qT5qOnbEH1rijKkeg16dQwfW
 JiZTbS9GRAYYoEgu24KMAujnhZG+9ZWlHLLmuQW458NkzTvScpXSqu3/IFCFPha+GV7J
 8gdvNpKYgFyACSgPXX7HAkZyo/9M6GVbWRIqYrXKQtgkDgYpXrUqBvQ5IY60VJQS6aUU
 7vTQ==
X-Gm-Message-State: AOJu0YzOxOaNixmNulxeGGEfxT2p4Liu3GR0JFywwbFUrUCFaPfmdUAg
 Hd3OQmmlkTCZo8x3UeFQYOW+U1BI74Om3g==
X-Google-Smtp-Source: AGHT+IFUDHg7Rj37//mdBF6oA0Yz2wvQqJ47gCnSDm8NZxxXoF7omp6Gs6ilFMMliJOhW2bdtScmSw==
X-Received: by 2002:a1f:c307:0:b0:490:b58e:75a9 with SMTP id
 t7-20020a1fc307000000b00490b58e75a9mr1365985vkf.4.1694578172347; 
 Tue, 12 Sep 2023 21:09:32 -0700 (PDT)
Received: from chrisp-dl.atlnz.lc ([2001:df5:b000:22:b7c9:b6c2:8b84:74a9])
 by smtp.gmail.com with ESMTPSA id
 e17-20020a62aa11000000b0068a690b44basm2033110pff.31.2023.09.12.21.09.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Sep 2023 21:09:31 -0700 (PDT)
From: Chris Packham <judge.packham@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 13 Sep 2023 16:09:24 +1200
Message-ID: <20230913040924.3702830-1-judge.packham@gmail.com>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694578172; x=1695182972; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+0I9Sr7isiwJhGG8o4NbpmfRKUaQFeSh/hruUVTZobw=;
 b=W4bzv51U3SpbDQidUZF7MfaxkKiCs/xMyC13org2CyqqhHrkBp6Gsk4oGWWj0d4+9o
 bh7PUYl1cMvSnEMWNCOq9+hN3KU37ck5h7S/AIyzaxZV99Ad8F7h7D8JadIoVvebRI+Q
 coqHTVBzo8Yw2MntDm00LD5KeSZnRk44xZhJBpMBJzl5gR290N95mEF18FdFAay7KjHk
 ElUWtfncQVctYhlMkOMvJeWUSnumQiKp7No+bPV68A7yIY6pQWc7fkp4sAqLhywk5ZRe
 1cjlLuZbRgUAk7ePwfA2gZVFLqgdAh4L2pL9dK3DsJ1C/yqmc0bTDQemUKZtGUFL5RQV
 i7PQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=W4bzv51U
Subject: [Buildroot] [PATCH v2] syslog-ng: bump version to 4.3.1
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
Cc: Chris Packham <judge.packham@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to latest version.

Release notes:
https://github.com/syslog-ng/syslog-ng/releases/tag/syslog-ng-4.3.1

Signed-off-by: Chris Packham <judge.packham@gmail.com>
---
Changes in v2:
- Drop reference to irrelevant CVE

 package/syslog-ng/syslog-ng.conf | 2 +-
 package/syslog-ng/syslog-ng.hash | 2 +-
 package/syslog-ng/syslog-ng.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/syslog-ng/syslog-ng.conf b/package/syslog-ng/syslog-ng.conf
index a3cfa8dacf..06e48cdd50 100644
--- a/package/syslog-ng/syslog-ng.conf
+++ b/package/syslog-ng/syslog-ng.conf
@@ -1,4 +1,4 @@
-@version: 4.2
+@version: 4.3
 
 source s_sys {
 	file("/proc/kmsg" program_override("kernel"));
diff --git a/package/syslog-ng/syslog-ng.hash b/package/syslog-ng/syslog-ng.hash
index a917331580..6841ed5eb1 100644
--- a/package/syslog-ng/syslog-ng.hash
+++ b/package/syslog-ng/syslog-ng.hash
@@ -1,5 +1,5 @@
 # Locally computed
-sha256  092bd17fd47002c988aebdf81d0ed3f3cfd0e82b388d2453bcaa5e67934f4dda  syslog-ng-4.2.0.tar.gz
+sha256  999dbab62982c3cffba02c0be22c596ee1ce81d6954689dc9b3a6afeb513cce3  syslog-ng-4.3.1.tar.gz
 sha256  c75dcbfc17ccf742f12042a370f825a40951085d2352dfc9d07e715dae3ca9bd  COPYING
 sha256  ce3324c9f22299cfc7c281e5a6ab40fbe9c2ea1a67cee87226cb8cd39db1e1d2  GPL.txt
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LGPL.txt
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 39433185b4..ff5aaee429 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -6,7 +6,7 @@
 
 # When updating the version, please check at runtime if the version in
 # syslog-ng.conf header needs to be updated
-SYSLOG_NG_VERSION = 4.2.0
+SYSLOG_NG_VERSION = 4.3.1
 SYSLOG_NG_SITE = https://github.com/balabit/syslog-ng/releases/download/syslog-ng-$(SYSLOG_NG_VERSION)
 SYSLOG_NG_LICENSE = LGPL-2.1+ (syslog-ng core), GPL-2.0+ (modules)
 SYSLOG_NG_LICENSE_FILES = COPYING GPL.txt LGPL.txt
-- 
2.42.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
