Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6455C433F5
	for <buildroot@archiver.kernel.org>; Tue, 26 Apr 2022 16:41:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92F5583E3B;
	Tue, 26 Apr 2022 16:41:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sh-cGF2EPxOl; Tue, 26 Apr 2022 16:41:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B277F83E38;
	Tue, 26 Apr 2022 16:41:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8AB321BF94D
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 16:41:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7936383E38
 for <buildroot@lists.busybox.net>; Tue, 26 Apr 2022 16:41:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RPjJAUxsAgPw for <buildroot@lists.busybox.net>;
 Tue, 26 Apr 2022 16:41:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1F03C83DF1
 for <buildroot@busybox.net>; Tue, 26 Apr 2022 16:41:48 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id e23so2043142eda.11
 for <buildroot@busybox.net>; Tue, 26 Apr 2022 09:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RbKysAftQOcFEI8u+pom0wZ/WaZbFhicplIoKL/C5VY=;
 b=Fm6FjakhjRy1ZEtqwjkEpxYX/38O/LhXFUPKm2WGx1fQ6laBzVqoOpJeXarMjizpSY
 WdAXy+NhyXV0HaKPRRarlz+z8jFyIaU827++d0SY3kPiVWeGu8kkguc3s9cipq3zwZ4C
 4k/4EB+I9Qgeto4KNIV0AbnUGzrIXQ5yeMqHixnABFM2h7kWpXmzGF53vCR5fzpoUihb
 xYryeh/3J8TVcEzoOg0rb8HgK//fxVK9mJVH5Ujl77HT/exHfkgQqwcw7S0wGBn3TAMl
 c5O31cYv+80lQRECvPyrDCtQS+VdNkuGdJulsrnWlOJZlDKita/PfJwasc+ahZMwnJ0W
 /EPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RbKysAftQOcFEI8u+pom0wZ/WaZbFhicplIoKL/C5VY=;
 b=q+P2NWz+T+Rj6Bk8yqOzqYAYYfda813vhyXhjqQDHf5N3LKGoRG3x3nBSxboG7AjR8
 YPy9vrU08rZjzAtgmYhwpKh/8ZG8nzC3dcJFLKkRot5Ynnm695rn7SvfBmSN5QgB8T5c
 ZxOlyUYieQK/UgA7YLhe1LYaKec016n//zOqthBBHjz3ooOUV4YIMnOXQAdHKZBmk+Is
 nF3ylyWeQHD4/TNARPneZPPjAyKyRmkrvJqZ3CKvkYkKugBTvzn3AIAHqX66LbkGWxuB
 BPYP7ywiyp5y/jtAp4xsU70HMGKvbZtK4yqmIReMBKEUUCtUFlc2PwxlvzrsjCn3OOq5
 A3fQ==
X-Gm-Message-State: AOAM531LPPmYx9b8MW+ADPyVRJM/vfoMoCDEfgMa+VCQGDwR0R62OdFI
 E9pEc2AAtpHIPESfoBgmCN9fohSOrrI=
X-Google-Smtp-Source: ABdhPJwEVLFsUkjgQoM9TlMs7Y5s5tbRaGDxcQQw6dTu2RAh7Yk98CcR6QdWwUk22AwcJidsCvHo+w==
X-Received: by 2002:a05:6402:1a34:b0:425:ca01:58ec with SMTP id
 be20-20020a0564021a3400b00425ca0158ecmr20124066edb.373.1650991307382; 
 Tue, 26 Apr 2022 09:41:47 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 hf3-20020a1709072c4300b006f392c2bf71sm2753841ejc.175.2022.04.26.09.41.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:41:47 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 26 Apr 2022 13:39:20 +0200
Message-Id: <20220426113920.3544925-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/strace: bump to version 5.17
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
 package/strace/strace.hash | 4 ++--
 package/strace/strace.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/strace/strace.hash b/package/strace/strace.hash
index 30c90e8e3..f3567db63 100644
--- a/package/strace/strace.hash
+++ b/package/strace/strace.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking signature with RSA key 0xA8041FA839E16E36
-# https://strace.io/files/5.16/strace-5.16.tar.xz.asc
-sha256  dc7db230ff3e57c249830ba94acab2b862da1fcaac55417e9b85041a833ca285  strace-5.16.tar.xz
+# https://strace.io/files/5.17/strace-5.17.tar.xz.asc
+sha256  5fb298dbd1331fd1e1bc94c5c32395860d376101b87c6cd3d1ba9f9aa15c161f  strace-5.17.tar.xz
 sha256  d92f973d08c8466993efff1e500453add0c038c20b4d2cbce3297938a296aea9  COPYING
 sha256  7c379436436a562834aa7d2f5dcae1f80a25230fa74201046ca1fba4367d39aa  LGPL-2.1-or-later
diff --git a/package/strace/strace.mk b/package/strace/strace.mk
index c8c3590f6..cbd737e12 100644
--- a/package/strace/strace.mk
+++ b/package/strace/strace.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-STRACE_VERSION = 5.16
+STRACE_VERSION = 5.17
 STRACE_SOURCE = strace-$(STRACE_VERSION).tar.xz
 STRACE_SITE = https://strace.io/files/$(STRACE_VERSION)
 STRACE_LICENSE = LGPL-2.1+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
