Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD0BE82CAE
	for <buildroot@archiver.kernel.org>; Wed, 27 Sep 2023 16:47:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02B83428DA;
	Wed, 27 Sep 2023 16:47:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02B83428DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x3Pk6kE-nNKT; Wed, 27 Sep 2023 16:47:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0526B428DE;
	Wed, 27 Sep 2023 16:47:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0526B428DE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EEE291BF280
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 16:47:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6CA360F83
 for <buildroot@lists.busybox.net>; Wed, 27 Sep 2023 16:47:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6CA360F83
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 44NlxkVReG0v for <buildroot@lists.busybox.net>;
 Wed, 27 Sep 2023 16:47:09 +0000 (UTC)
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0A93960E15
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 16:47:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A93960E15
Received: by mail-pf1-x430.google.com with SMTP id
 d2e1a72fcca58-692a885f129so7865335b3a.0
 for <buildroot@buildroot.org>; Wed, 27 Sep 2023 09:47:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695833228; x=1696438028;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c/BUv6w5sn4LwZe+B5qpKNBeeie1ahlYDkCb9zw6uIE=;
 b=kKQC9ECs0vC9A8m7uEsgTubxF+Zn45H3/oF909+PjoFt6tRvur3FxBgNaCI/l6fxr1
 k4BDBLk0ind+XBXr7kCILXJIkZdz6vRfUrEHlnSxb/3jhr/otivfWk5Ljq7rJjGmT3yS
 mla0MjWiDWVtSDTA1QgZeIZ5BRF6iAP9VEWh7IK5P7yuU4n6+lOs/n19jyVxUQp2xefZ
 9P+GcjrAx3uAlrIpFuQf/l0mYgp3sfNThquV4X6Qz9YRHvhKOctLiC+8/drWFsWCUq9a
 4/LfBWBC/wgpOZVHArQWQFlE7LFZ/VOd9ou6ZmA5XtEzpCttUVjJTte+PzBpg+XdRq6p
 XBHA==
X-Gm-Message-State: AOJu0YztwyOUDk28k4V2iWDcwenmmSmJAq0pR4AdMYzabpKlrxMFZudC
 q5qFDlngLY8qvHCSYjpa8wy294jLJ6acO3AD
X-Google-Smtp-Source: AGHT+IGa5YWFGq9F+GVNH800aC/45I1KM3TYpFgKYrI/ruxqrzjsKQj5x6Fyiq+yNy6Jf5F5hRVzQA==
X-Received: by 2002:a05:6a00:4888:b0:693:3e7d:cb4c with SMTP id
 dk8-20020a056a00488800b006933e7dcb4cmr1155620pfb.16.1695833228100; 
 Wed, 27 Sep 2023 09:47:08 -0700 (PDT)
Received: from chris-jammy.lan ([136.52.75.52])
 by smtp.googlemail.com with ESMTPSA id
 r2-20020a62e402000000b0068fe9f23bf4sm11999270pfh.103.2023.09.27.09.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Sep 2023 09:47:07 -0700 (PDT)
From: Chris Dimich <cdimich2188@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 27 Sep 2023 09:46:35 -0700
Message-Id: <20230927164640.67592-1-cdimich2188@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695833228; x=1696438028; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c/BUv6w5sn4LwZe+B5qpKNBeeie1ahlYDkCb9zw6uIE=;
 b=NO5LVQJ/aiCEdsSOFWDt/UKO4PIob/rIQK1nhk/cCJ6ZHGcuavES8VKhJ0CcCQjCAi
 EG9+qnkWym3PMC03nieLWY5z8rnUOZ1X42/+toe3wsWaLZliZd5WVVOOljQsCTK+uLNg
 XBUBdkMQdJcVvHO48CvkFth7cNopNdz/z6HqSwixiWVG0pks986ixgBgW+qvfjIE/pcc
 36TNUVGsMUsg3BsMP/QqX1FoI5kYnDU4/qkbOA04pVllwN6Xv/n6Iy+D1ZogiK1fFjis
 JO/RcGUppR/GgkUaeGoPIH1k9yo/QyDMZ+xGjFknMhQh7lmXO2McqFOkH+N6ioLIa74s
 5c/Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=NO5LVQJ/
Subject: [Buildroot] [PATCH 0/5] freescale-imx: update various packages
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
Cc: Chris Dimich <cdimich2188@gmail.com>, Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This serios updates various freescale-imx packages as per 
NXP 6.1.22-2.0.0 release.

Chris Dimich (5):
  package/freescale-imx/kernel-module-imx-gpu-viv: bump to version
    6.4.11.p.1.2
  package/freescale-imx/imx-gpu-viv: bump to version 6.4.11.p1.2
  package/freescale-imx/imx-gpu-g2d: bump to version 6.4.11.p1.2
  package/freescale-imx/imx-vpu-hantro: bump version to 1.29.0
  package/freescale-imx/imx-vpu-hantro-daemon: bump version to 1.1.7

 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash        | 8 ++++----
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk          | 4 ++--
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.hash        | 8 ++++----
 package/freescale-imx/imx-gpu-viv/imx-gpu-viv.mk          | 4 ++--
 .../imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.hash      | 2 +-
 .../imx-vpu-hantro-daemon/imx-vpu-hantro-daemon.mk        | 2 +-
 package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash  | 6 +++---
 package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk    | 2 +-
 .../kernel-module-imx-gpu-viv.hash                        | 4 ++--
 .../kernel-module-imx-gpu-viv.mk                          | 2 +-
 10 files changed, 21 insertions(+), 21 deletions(-)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
