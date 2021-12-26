Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B4DC433EF
	for <buildroot@archiver.kernel.org>; Sun, 26 Dec 2021 18:51:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EDA6A400CB;
	Sun, 26 Dec 2021 18:51:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p7IZsvvb77Bf; Sun, 26 Dec 2021 18:51:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D15F400DC;
	Sun, 26 Dec 2021 18:51:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4A37F1BF391
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 18:50:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3855E400A2
 for <buildroot@lists.busybox.net>; Sun, 26 Dec 2021 18:50:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hl4-OJ6vwkvx for <buildroot@lists.busybox.net>;
 Sun, 26 Dec 2021 18:50:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com
 [IPv6:2607:f8b0:4864:20::735])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 981674008D
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 18:50:18 +0000 (UTC)
Received: by mail-qk1-x735.google.com with SMTP id e25so7083740qkl.12
 for <buildroot@buildroot.org>; Sun, 26 Dec 2021 10:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yNHfNn/uAEZyGNgvfF77L0s9+E91UMrh31IFxlq4zgo=;
 b=cIVb7vWSg6u0eO27pjgRHIydzWjsEUrqTFI0l2h1jLF6ZcvvPLY6WX5upAIde3WHSJ
 xmRljB9nxn9j2mklUEIzCVsFEAO+RDtHkiefZolA3qEhpXd/gSm+LBihsm6qlwFBb2LF
 bh6muo7BzahGenaiYUEYX6sZcIHmZYZ8BAbW2rmAIPSzjRRUxKfyjsJ+IN8YkY0uT3M/
 dTkHZqjsfKSelGiQG0i4qClI4rF5gBBWyLwMUj6ppesQAeM8teBKoPTn8uYNEScu+cQ+
 5yHwsOrUTZOtCkIggkYJLGuMe3oUqxvlXDvlilO8pGr7L/vUk33gAgwD18hxoa2Jw5G7
 Ik2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yNHfNn/uAEZyGNgvfF77L0s9+E91UMrh31IFxlq4zgo=;
 b=M0pgw2/1VM4Ma3XE4WLWo3RBs83bioW4ccUMoBBf4hgIVPQ+qw/Yfp7ht1WlAWkNBb
 FXzOZYumEYdB/mAR61n+vgqaLHpQ/7gUUAgFgq8Cqz1zRcIjYyEjaukxjn//m6Gh2YMW
 EsXuAQM9TnVUF4s/X/Gp4TEyT/k3FqZZxId5DN0h5I521WAe2I7WQtXIXmdjaQ878W+t
 S5/jnnVOI1+/U3dYJQtQ7to94oj7yZdMckpyss35dMzM9HGfv8Fa4LNPHbTqOrScs03Q
 qR5ZnwiD7XMMbJ1+iKm6dEKtrDMhGnMkddYezN1jPxXy5sPxDwE3UDwl7MniQLELZT7J
 mtMg==
X-Gm-Message-State: AOAM532dtVBmTvDxnaoyFl9s2qx6pWsLtDKc+F1BzNQn0RXDjuLAMqgx
 X0H89dGGitrMovgJciLdtiUWPKE6/kE=
X-Google-Smtp-Source: ABdhPJwjQgUrsg8SR8c028ANLLJMvDQoFTiO65K5mqL7To+xfsBdEu4amrb1k11dkYpuyts+UqWG8A==
X-Received: by 2002:a37:42d0:: with SMTP id
 p199mr10145886qka.523.1640544617459; 
 Sun, 26 Dec 2021 10:50:17 -0800 (PST)
Received: from localhost.localdomain ([179.232.77.5])
 by smtp.gmail.com with ESMTPSA id j22sm12349717qko.68.2021.12.26.10.50.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Dec 2021 10:50:17 -0800 (PST)
From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 26 Dec 2021 15:49:18 -0300
Message-Id: <20211226184919.2753591-5-ricardo.martincoski@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211226184919.2753591-1-ricardo.martincoski@gmail.com>
References: <20211226184919.2753591-1-ricardo.martincoski@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 4/5] support/docker: add shellcheck
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
Cc: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Allow developers to run check-package for init scripts, that call
shellcheck, without having to install the tool.

Since the docker have a fixed version of the tool, there will be no
difference between runs in different machines.

One can call:
$ utils/docker-run utils/check-package package/package/S*
$ utils/docker-run shellcheck package/package/S*

This change also allows to eventually run check-package for init scripts
in the GitLab CI.

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
---
Please read the cover letter before applying.
---
 support/docker/Dockerfile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/docker/Dockerfile b/support/docker/Dockerfile
index 792e70e292..2b14f0f7a7 100644
--- a/support/docker/Dockerfile
+++ b/support/docker/Dockerfile
@@ -44,6 +44,7 @@ RUN apt-get install -y --no-install-recommends \
         qemu-system-arm \
         qemu-system-x86 \
         rsync \
+        shellcheck \
         subversion \
         unzip \
         wget \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
