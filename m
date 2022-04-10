Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF30BC433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 04:32:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54ACB60BE9;
	Sun, 10 Apr 2022 04:32:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ShvNS1IkiHqP; Sun, 10 Apr 2022 04:32:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6ABD860B71;
	Sun, 10 Apr 2022 04:32:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A83CF1BF2EA
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 04:32:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 857B184291
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 04:32:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vkFL4ouBUNT8 for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 04:32:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4413E84290
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 04:32:32 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id d4so8553897iln.6
 for <buildroot@buildroot.org>; Sat, 09 Apr 2022 21:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tIuhi3O6q/YhoeiEZI/BiEin8glZsBnIrM80OakzRBw=;
 b=DhTcAc6zAuiy4soNx3rTYIhGj28a+6GKd0VZhQAEVdTLvgX7L+PMmAz8BReCBbcl+5
 3E/trGfJtiII6ntTtB/J8vbTThRuyksbJsyurGnrk6cD5ywermFChkMpx7HtjtOD8rRO
 5VfmO0vUxozyLH6BO6kbJWEh8Miq8mr0X0qbJD7z5gzgTYqw6LLXvFymWg+Wt/K+J16S
 wEdmAm/ECpIlFi9VXUSxqycMhE+e/CYhvUefH11DXTLaiEnsjBv8WP5Q638cIorquj7n
 mVXHYTv8cxzAt1zgy7W02OIhEFMg3l3PYC5NnK8CJnRC3+Gw17Hh/TXkh9yeOGxgnbEs
 Eijg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tIuhi3O6q/YhoeiEZI/BiEin8glZsBnIrM80OakzRBw=;
 b=wYmDHrwU1FqEjBVUUGxpGbCLQgy+lH0Tj9hmkKYR5qg93tKRLejT6X6stRJ47FiJ8Z
 32d+WKIdOeF85OUH6RVhVgXhwGuyoO2Lw2Q27NjR+wGPKHpyj8KHIkY33Li58RmljYRB
 8SfMehp6aovi9AvGGupxHFHjTpHtztr9aSy5YiRqF5ZP1A7ekSw6x0zug1vvHT3z8mBs
 dBzxi5m9MueQeMwD75oP9jjZyOtbikxZ80HlGlZLf6hma78lYLB0h+bSuihJUTUDUeWQ
 xDb8iOS1SozgarMZX80k32HVocaTk6AQUwAHS7x9VzwhxJwgHLAIaU7FL4WFyIsPXqPo
 u6Dw==
X-Gm-Message-State: AOAM533/k3+Vn0oPYsGIkyQzDFJCEaGcGzpQCJ5e3CG8Nt3N/Yi3qgZd
 ZI3AnxvZZ2Lh976bAk7zSi7A63kof3188g==
X-Google-Smtp-Source: ABdhPJyHfwJQJJ0DCiWaYXYzUesmZRct0RSYFVML39RIo6SdEhk3SNZEdV3ygKW2jRZo/cSrBohNXw==
X-Received: by 2002:a05:6e02:1c89:b0:2ca:7d34:6a1f with SMTP id
 w9-20020a056e021c8900b002ca7d346a1fmr5593191ill.203.1649565151087; 
 Sat, 09 Apr 2022 21:32:31 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 y17-20020a92d0d1000000b002ca8027016bsm5017843ila.45.2022.04.09.21.32.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 21:32:30 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Apr 2022 22:32:26 -0600
Message-Id: <20220410043227.602485-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 1/2] scripts/autobuild-run: fix and default
 to python3
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 scripts/autobuild-run | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/autobuild-run b/scripts/autobuild-run
index 346928f..9219134 100755
--- a/scripts/autobuild-run
+++ b/scripts/autobuild-run
@@ -1,4 +1,4 @@
-#!/usr/bin/env python
+#!/usr/bin/env python3
 
 # Copyright (C) 2014 by Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 #
@@ -794,7 +794,7 @@ class Builder:
         while True:
             try:
                 self.run_one_build()
-            except URLError, e:
+            except URLError as e:
                 sleep(30)
 
 # args / config file merging inspired by:
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
