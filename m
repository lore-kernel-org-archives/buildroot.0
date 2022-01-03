Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A05C433EF
	for <buildroot@archiver.kernel.org>; Mon,  3 Jan 2022 23:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1EF60408B3;
	Mon,  3 Jan 2022 23:03:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id feOrut-NI-20; Mon,  3 Jan 2022 23:03:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DE4B408B2;
	Mon,  3 Jan 2022 23:03:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 22A101BF358
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 23:03:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FF8A408B1
 for <buildroot@lists.busybox.net>; Mon,  3 Jan 2022 23:03:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7r6VicyddDFq for <buildroot@lists.busybox.net>;
 Mon,  3 Jan 2022 23:03:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com
 [IPv6:2607:f8b0:4864:20::531])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50C99408AB
 for <buildroot@buildroot.org>; Mon,  3 Jan 2022 23:02:59 +0000 (UTC)
Received: by mail-pg1-x531.google.com with SMTP id x194so7936832pgx.4
 for <buildroot@buildroot.org>; Mon, 03 Jan 2022 15:02:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d4Yldcin7vEjgpgkP4jaRmE1OAfzClRtIaQOBC6nBE8=;
 b=NgFvDqFVbuG3P3vND1nsrcV2i3HuQdNI0rqCfF+IbmQSWKm7xOxCkJWlckE1z9jImN
 NgR70GNAZav066p6WinL7D69ngV9J9ypHHPT8uPWPwj8URfKJBlCaBqRy0RcREJxZLg9
 RgJpatKwevqMVCn4YoHKnifjbzM4bbR47MeTn37463iGgZS6/8KDfDDxxgloM2IgtjhK
 rKqhBghuZ+KlwtoI7PxtzBv3lTuwAY/fvpEqiJMat6xbzAlrrbIXD00On2musM2UNP0B
 yw13Po8kjI3gDWK0cjch7Gm3Z1MczGDOWaYJbZoNq6RzuRBl+AJ0VXMQpUTx9/CzGDcv
 nmQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=d4Yldcin7vEjgpgkP4jaRmE1OAfzClRtIaQOBC6nBE8=;
 b=qCQCwCCyTD5o6O9GqUTsx9PECLjFrQ2lYH3deaCR3nHkYjx3Gl0eYSkCJEWjbJpJ2o
 Bqis27+vGLn+HFBlZT/1wctVTPq5hx4m2gifjZjjkJn/mVkh69PihvS9Z0U3iuv6zrYd
 6X7+CdMf44tavDJQAlZQq8UONTJzMgaRCI2Xcepvm74a2LkEJhaio2OduFP6TaSTmBHR
 rBsw8Q47E3HWx7KzqVHar75nJ84sNVhOILZi+3WftvcHj6c210zsIC924Vd+IOO7vUji
 BoJDZhJCUaIvjmyBX5976qSrNKh3rlm8hKe8Jq/tubBmubY/4+NRK3+5xo0Pk89HHCBJ
 8mxg==
X-Gm-Message-State: AOAM533sPhHVggn+tZFyKClV7lrkdUhlyz7l6o1vELFapr749TS16EWP
 AEBFewLuQPkH0+eksIqqYoyO53dMIU4=
X-Google-Smtp-Source: ABdhPJx8KGlfrYiJaVnL4velIuCogPDFz9FDeTfdUyMbng0EPRuEBweGxyOCqnvYC1331/65M7J/3w==
X-Received: by 2002:a63:90c2:: with SMTP id a185mr41600205pge.90.1641250979149; 
 Mon, 03 Jan 2022 15:02:59 -0800 (PST)
Received: from localhost.localdomain ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id o7sm38954864pfu.108.2022.01.03.15.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jan 2022 15:02:58 -0800 (PST)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  3 Jan 2022 15:02:46 -0800
Message-Id: <20220103230249.310062-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/3] QT5: Fix per-package builds with
 non-qt5base packages
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
Cc: Adam Duskett <aduskett@gmail.com>, Samuel Martin <s.martin49@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Naumann Andreas <ANaumann@ultratronik.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

These patches fix per-package builds with non-qt5base qt5 packages.

Based off of Louis-Paul's earlier work[1] and And Yann Morin's feedback to a
different patch set[2], the simple fix is to add a few pre-configure hook
methods to pkg-generic.mk, pkg-cmake.mk, and pkg-qmake.mk which search for .pc,
.cmake, and .pri files for the $(STAGING_DIR)/ prefix and removes them.

Feedback is welcome!

Adam

1) https://lore.kernel.org/buildroot/a339f273-33f3-f232-eac4-6e50427abf6d@cordier.org/
2) https://patchwork.ozlabs.org/project/buildroot/patch/20200217212350.29750-21-anaumann@ultratronik.de/

Adam Duskett (3):
  package/pkg-generic.mk: fix absolute paths in .pc files for
    per-package builds Some packages (notably qmake packages) generate
    .pc files with absolute paths. Unfortunately, doing so breaks
    per-package builds because the paths in the .pc file point outside
    the per-package sysroot.
  package/pkg-cmake.mk: fix absolute paths in .cmake files for
    per-package builds
  package/pkg-qmake.mk: fix absolute paths in .pri files for per-package
    builds

 package/pkg-cmake.mk   | 11 +++++++++++
 package/pkg-generic.mk | 11 +++++++++++
 package/pkg-qmake.mk   | 11 +++++++++++
 3 files changed, 33 insertions(+)

-- 
2.33.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
