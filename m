Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43327C38150
	for <buildroot@archiver.kernel.org>; Sun,  7 Jul 2024 12:07:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB28881926;
	Sun,  7 Jul 2024 12:07:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jxCO9_O4aNcI; Sun,  7 Jul 2024 12:07:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEC358193E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEC358193E;
	Sun,  7 Jul 2024 12:06:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 56D151BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 12:06:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4355A40502
 for <buildroot@lists.busybox.net>; Sun,  7 Jul 2024 12:06:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aduXHWg8cQi1 for <buildroot@lists.busybox.net>;
 Sun,  7 Jul 2024 12:06:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ED1B7400BF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED1B7400BF
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED1B7400BF
 for <buildroot@buildroot.org>; Sun,  7 Jul 2024 12:06:56 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-57cb9a370ddso3784836a12.1
 for <buildroot@buildroot.org>; Sun, 07 Jul 2024 05:06:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720354014; x=1720958814;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y/irZWXi7t+YD3LLJoemrib/pZIgQA2qh/KiVuB0RSs=;
 b=qB0KT2rfC6WaFsBzwa5M+gRRTjY8c74QEQVSZ6upXn4yvPzXNGCaFqOP9h7WpQNCaE
 ACrQAGw0V2saQzf15mVAWyaMCEga1/oECi+Qucm9jFyTVZ97uI/Kjwxi8/WZ3R1O3h5z
 qZeIqRiIGgtKZ07SHCv4dmi0rzBPukc7EEjiVGj9pzZjPWQP867yY93BPsPwN+pYA8+B
 5IZ9b7qJdv60H3dk7XzS8Htl85VqBO4KjHqg2aQrAmy3k02TB8BD+QG0j8VcIl9McNua
 fvc0nQ8HotRdXuoxLKEBDCzqdIuwWfUm8LsYD+kIqvAX3xvbFofxDTV8IbvjCJ5W+AFR
 knDw==
X-Gm-Message-State: AOJu0YwyxI80c5gV8hpyxsxW7NbFZBUQ0KeC4G154fboI9tY2kVIH+2W
 g/tBzk/daxxe7obfP8m1Bgj/gW/tF/3mwctIHH3d/qmLgmBVSk2QNKn7ftG+/AIXUS9zuSOsdYh
 ab6U=
X-Google-Smtp-Source: AGHT+IHoqp8+JRfRs2FaAJ1LEQY3lHTvVsQS1Pz/WH3u7QtiYr8+VmkIZE7n3T5RdQV8JsKUViNQWQ==
X-Received: by 2002:a50:ed01:0:b0:58b:5053:eda8 with SMTP id
 4fb4d7f45d1cf-58e5b898ab4mr4306979a12.41.1720354014334; 
 Sun, 07 Jul 2024 05:06:54 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-79-30-97-245.retail.telecomitalia.it. [79.30.97.245])
 by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-58f63380f3csm3134851a12.58.2024.07.07.05.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Jul 2024 05:06:54 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sun,  7 Jul 2024 14:06:50 +0200
Message-ID: <20240707120650.4036307-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1720354014; x=1720958814;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=y/irZWXi7t+YD3LLJoemrib/pZIgQA2qh/KiVuB0RSs=;
 b=ZLD1A0eQxh6G7m0q4xdGmcmrPJwJyn0KlYT7jM4hyBvnS+hTuQpIo4c2wA+2P/dqTO
 ZzFnvBQbxrwtPGW9ETmlOYI7u80tqZ9M6vNceH9TzmmaZYdekdq+8BFfAEL+CMy2E9/v
 0+tkB2BJ0yRmE7XsOww8tqep/BBQRAC0ezEm0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=ZLD1A0eQ
Subject: [Buildroot] [PATCH 1/1] package/sane-backends: update the patches
 to be applied with fuzz 0
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 linux-amarula@amarulasolutions.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, sane-backends fails to build with output:

    Applying 0001-sane_backend-add-missing-config.h.patch using patch:
    patching file include/sane/sanei_backend.h
    Hunk #1 FAILED at 8.
    1 out of 1 hunk FAILED -- saving rejects to file include/sane/sanei_backend.h.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 .../0001-sane_backend-add-missing-config.h.patch            | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/sane-backends/0001-sane_backend-add-missing-config.h.patch b/package/sane-backends/0001-sane_backend-add-missing-config.h.patch
index 8e56b0284b5f..f3796933381e 100644
--- a/package/sane-backends/0001-sane_backend-add-missing-config.h.patch
+++ b/package/sane-backends/0001-sane_backend-add-missing-config.h.patch
@@ -28,6 +28,8 @@ Fixes:
 http://autobuild.buildroot.net/results/9f1/9f1f1cb727b5c5407e69172280a3dee880e55cdf
 
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  include/sane/sanei_backend.h | 1 +
  1 file changed, 1 insertion(+)
@@ -42,8 +44,8 @@ index 1b5afe2..2a96532 100644
  
 +#include "../include/sane/config.h"
  
- /*
-  * Compiler related options
+ /** @name Compatibility macros
+  * @{
 -- 
 2.5.5
 
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
