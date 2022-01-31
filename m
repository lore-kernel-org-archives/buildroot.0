Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EFDC433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 08:12:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C092B60BA1;
	Mon, 31 Jan 2022 08:12:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B9aBo7wPdFnM; Mon, 31 Jan 2022 08:12:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1021960A88;
	Mon, 31 Jan 2022 08:12:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BA4881BF313
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 08:12:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B061740909
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 08:12:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kfWEg_X5JIBZ for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 08:12:19 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E58A1408F8
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 08:12:18 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id c15so18251407ljf.11
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 00:12:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rC+iR1ibVhRm2scS67tu7X12y9+1uQtIWx+8suBToLI=;
 b=LwWyT4K2tXLPbxGMuqKnobpEPls8ZoOw9fJ3C9GViQod1T34tEBQThbL2e9F7XR2er
 fQOSKiY7kPU29OzWyzeaVoudQLJggnM450++YiNABhYwd7ys53LQ/UchIqcSq+sKJCIn
 Pq5zPgjpVl2it3Sy7rhNPn9mo+1dTvmKjM/Gf1zTNNtzIK8p5J+Tr1pDC5kUYoUo2eAM
 L0+AYU/3B7GrBvE/9qcjWzIMNmbTZVWmtNOslHSa+IhPNo/JasV39Kq45SRdVxqOI8OU
 VAdev3jpa7GkdDgR2ylMM7aVYYjxOPo68cHTox9pRhO7GpFloU8qlvWYDPJBcdUyFJrt
 tLkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=rC+iR1ibVhRm2scS67tu7X12y9+1uQtIWx+8suBToLI=;
 b=ndsPR8PAggwnh765XTzNncTxUl7SeIkSGHzLRLukzGY8GTGCNaM1q4tDIvOficc5QX
 O0ID6ir+gcnnWP3qKeTQxDCPJAYbVJDuU+MKy5bTXk57qAD0rOXDEImPhTyX8XIGo1Nn
 KXgt2xlk7H5T4R34pf4hrSPdN2S7FWbDVJRmw8K6NqAPs6Kgy65L7oiard6PY47ANN04
 dDBimkfvv3xRebE5cVAlLp13e06tqm6TSKoSs8OrqAAfX2FFSeN71ozBWK5l08Znd52p
 tfllCTOyqauXSWgf7SsQqdRPOB7GOJk6eOgpnd0TCvvzC/x7/XZSIiE0V6JhRmCT+DA7
 cFbA==
X-Gm-Message-State: AOAM533enduf26b3095ZUw8YtiSNq9n6q8OZkmMVRcoFjQnIw3t2pW4q
 e/0dXe0f0sK/UYHVdSSaMSKes9mIBqk=
X-Google-Smtp-Source: ABdhPJxuu0mJYyK7MEY5dPwD12wa+3LF6FrJv09+Ej2nZ3G/IwVSLfEfXaz1WoAop9/NCKle0RfkMQ==
X-Received: by 2002:a2e:7d01:: with SMTP id y1mr12478347ljc.505.1643616736643; 
 Mon, 31 Jan 2022 00:12:16 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id j17sm815095lfu.14.2022.01.31.00.12.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 00:12:16 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 11:12:09 +0300
Message-Id: <20220131081214.12773-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/5] synopsys: boards maintenance
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
Cc: Joao Pinto <jpinto@synopsys.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

This is a maintenance patch series for Synopsys boards. Outdated
and unused VDK configurations are removed. All the other boards
receive Linux kernel and U-Boot updates.

Regards,
Sergey


Sergey Matyukevich (5):
  configs/snps_arc700_axs101: bump kernel and u-boot versions
  configs/snps_archs32_axs103: bump kernel and u-boot versions
  configs/snps_archs38_hsdk: bump kernel and u-boot versions
  configs/snps_archs38_haps: bump kernel and u-boot versions
  board/synopsys: remove outdated vdk boards

 board/synopsys/axs10x/uboot-fragment.config   |   1 +
 .../synopsys/vdk/linux-vdk-aarch64-defconfig  | 143 ------------------
 board/synopsys/vdk/readme.txt                 |  65 --------
 configs/snps_aarch64_vdk_defconfig            |  12 --
 configs/snps_arc700_axs101_defconfig          |  10 +-
 configs/snps_archs38_axs103_defconfig         |  10 +-
 configs/snps_archs38_haps_defconfig           |   6 +-
 configs/snps_archs38_hsdk_defconfig           |   7 +-
 configs/snps_archs38_vdk_defconfig            |  20 ---
 9 files changed, 20 insertions(+), 254 deletions(-)
 create mode 100644 board/synopsys/axs10x/uboot-fragment.config
 delete mode 100644 board/synopsys/vdk/linux-vdk-aarch64-defconfig
 delete mode 100644 board/synopsys/vdk/readme.txt
 delete mode 100644 configs/snps_aarch64_vdk_defconfig
 delete mode 100644 configs/snps_archs38_vdk_defconfig

-- 
2.35.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
