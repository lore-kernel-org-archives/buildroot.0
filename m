Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D227CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 18:12:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 434F34062A;
	Tue, 22 Feb 2022 18:12:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iDsKUadck27o; Tue, 22 Feb 2022 18:12:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 405314061F;
	Tue, 22 Feb 2022 18:12:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D252B1BF2E3
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 18:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C0D3681B0A
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 18:12:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZFgZhSSzHrjg for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 18:12:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp1.osuosl.org (Postfix) with ESMTPS id F10F381992
 for <buildroot@busybox.net>; Tue, 22 Feb 2022 18:12:11 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id d17so141789wrc.9
 for <buildroot@busybox.net>; Tue, 22 Feb 2022 10:12:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lcpc6s6uESUptkCZLbzjt8b4Hh3Wv9/Xz2lHOmS+zjI=;
 b=R8CIs4sZsVVayljTDW2mkoaB8pxbhYxOWwEWrCOYJuVJ513LVMZgoogWhVj2wL5UxD
 i6NccMMvCa4TlRSa/7EkURi6BA7meB5ZpvPsUuKp5NYwgusgbYQauXBRzSc5berRFoUL
 p2hBwkkB7ymGG16QJqldFlyqBPoficYn8auqmxa9uOPOBowrRBBNgqyuaWjsvPbESAnV
 8MHNTu4OHrW3567tuwB3Sbde0mzB+Kf3kTHDpY7EquQdZ8D6UIVPuyR0JppgGxbxgfrX
 SxQZbO6k1Ns5oVHXLF4fSTQ5U+ympf/9S9TjpxoPLAxcntbrhdKxJf8nv4K/JpiG/xfS
 8wtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Lcpc6s6uESUptkCZLbzjt8b4Hh3Wv9/Xz2lHOmS+zjI=;
 b=LZQuwptir3uFlrxH9b8wSx0dWvX6Qlp/tRwDpr2RA7Fwh5Xi9weLF30aoGpVvqoC9w
 p7Ps0rnJVCDd72kTYm0P5OpaVQFPtnt9aXyQPlBngvqHFmwWCaHpQnM2p6qrBZppyZA2
 4ZJGkpVv5aEPldkompS8LNNEtZ9HTpIKSXZ7B+7lo4Z1M8DgZdjsBiMEA43XTOqU720a
 6MHHRCUGpAQzKWD8iZ4wWGN0irl2MnzrqzUrgJK7Sd9WoxVdgshIecxJ7VV3RbZ89kfC
 musg409WSEqnyBnqnBU3xh2am0VF5vkM3ewipdWqiuuFi3rjrEgNHOhgDvpsK763tXiP
 NQvw==
X-Gm-Message-State: AOAM53385w0eSwvtSFIhpi03gG9IuhP6PCIyyTIFqbc9K8vJAS6V/hDE
 rNAFM0bkSM1C7yjbgeYLKMyLdtg3lTE=
X-Google-Smtp-Source: ABdhPJxVT/dDeoZbWTs0PgQzllD79sJaDigGuB6Eohfj8j1l0ZhC93MFGJd+S3KFfO7ssEGfJV9iUg==
X-Received: by 2002:a5d:648f:0:b0:1ea:81c7:c5ae with SMTP id
 o15-20020a5d648f000000b001ea81c7c5aemr4284352wri.462.1645553530194; 
 Tue, 22 Feb 2022 10:12:10 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id d14sm47589365wri.93.2022.02.22.10.12.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 10:12:09 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 21 Feb 2022 05:30:31 +0100
Message-Id: <20220221043034.2736010-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/3] portable services: another use case of BR
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

This series allows to build a rootfs suitable for portable services with systemd.

A new value of "Init system" is introduced : BR2_INIT_PORTABLE.
BR2_INIT_PORTABLE is like BR2_INIT_NONE, but with all FOO_INSTALL_INIT_SYSTEMD executed.

A new type of skeleton is required : BR2_PACKAGE_SKELETON_INIT_PORTABLE.

see https://systemd.io/PORTABLE_SERVICES/

Francois Perrad (3):
  package/skeleton-init-portable: new skeleton
  portable: new init system
  portable: tweak some default values

 DEVELOPERS                                    |  1 +
 fs/squashfs/Config.in                         |  1 +
 package/Config.in                             |  1 +
 package/ifupdown-scripts/Config.in            |  2 +-
 package/pkg-generic.mk                        |  2 ++
 package/skeleton-init-portable/Config.in      |  7 ++++++
 .../skeleton-init-portable.mk                 | 23 +++++++++++++++++++
 system/Config.in                              | 18 +++++++++++----
 8 files changed, 50 insertions(+), 5 deletions(-)
 create mode 100644 package/skeleton-init-portable/Config.in
 create mode 100644 package/skeleton-init-portable/skeleton-init-portable.mk

-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
