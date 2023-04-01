Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D505C76196
	for <buildroot@archiver.kernel.org>; Sat,  1 Apr 2023 17:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2278416AF;
	Sat,  1 Apr 2023 17:37:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E2278416AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b12THbWgMW8s; Sat,  1 Apr 2023 17:37:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7CDF41BEB;
	Sat,  1 Apr 2023 17:37:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7CDF41BEB
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 783AE1BF318
 for <buildroot@lists.busybox.net>; Sat,  1 Apr 2023 17:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45894402F6
 for <buildroot@lists.busybox.net>; Sat,  1 Apr 2023 17:37:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45894402F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o-S8fGMjQ0GP for <buildroot@lists.busybox.net>;
 Sat,  1 Apr 2023 17:37:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83E844010F
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83E844010F
 for <buildroot@buildroot.org>; Sat,  1 Apr 2023 17:37:06 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id j11so32885807lfg.13
 for <buildroot@buildroot.org>; Sat, 01 Apr 2023 10:37:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680370624;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=J+NBt2LL64ZPEFV9KLGYTUkKxMrVVJRtsGJ/JqlEydc=;
 b=27l4xa5KhrLf8/WwGaR2vYd/sDoE5hUKSGsHci7b3cRB7lVHJByVZqA1hCy/w/To+8
 g0chBuFpLtrL8MykpHlDttdNrWNk2k0+L1jmJCIOyT2QBOQqe2+uGPJ8Hd6UyrDMWGIz
 YQh7DsrYA3JPu78iKNoNHO+z46Dk6pUj4IxqE0g+ll5quASwd8CiLHhfJMb5fxpnadn4
 R9rSlhiGNzK1jA4RvYkvgHG9GI8gM2o4PVHQFX247rKsQPUm/U2zesEsc9SG/GiuY8Eb
 y8bHnj+jZKbIFE/eHtqdYw5ZPLlY+iJ3uIx4z2Sh0jocudty3tscq/BJklO/HlyeH//6
 Qciw==
X-Gm-Message-State: AAQBX9d2CpZ27eBjVkM+NS1rXaxp1c21Lfb69rJt0dHxqHMHr5+wJsGq
 nOqcE1q2w3XN4VvStkT/X0zG46bucI3wwPBb
X-Google-Smtp-Source: AKy350azSMPGrmq4fUeSS0Dc/0WP92pr6gIjYtqr/VR3bc4Cgro6/NXkJo44Fa5hS110nrsA5C+kDA==
X-Received: by 2002:a05:6512:3885:b0:4db:268a:4ec5 with SMTP id
 n5-20020a056512388500b004db268a4ec5mr8176579lft.52.1680370623808; 
 Sat, 01 Apr 2023 10:37:03 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 v5-20020a056512048500b004e8451948desm892056lfq.227.2023.04.01.10.37.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Apr 2023 10:37:02 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Apr 2023 20:36:57 +0300
Message-Id: <20230401173700.3341224-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680370624;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=J+NBt2LL64ZPEFV9KLGYTUkKxMrVVJRtsGJ/JqlEydc=;
 b=dw8ZY5zizVQ3nS+DlCxTFaNIrd+oNFnT1b20x8GNTmtbvsAOSl/kyK2IW86VKcyqfd
 F+QuEY9MEqgjvhMZQ+Um6RdBeN88E7N7QCkOKbcYVGLg//YYpGsNvOewYXiPeLKOMa3K
 eL+08POFfDMqfnpfuDYJ/2x+nRywWYxtQSWL0k4NMognG52PbRHjUQrYsNRfZp+HdHd4
 4kykhJLN3TWRPznESrjEwSoiHnTAQmzT3hLCxzgQyYqU/Y04w9R3zGyHI41LuBm+9PFW
 rgpMea9v3bv1okrCaGjGW3+VXHxKnzFa+oUuP7KrM+3Wt62hH6uMyv45Aqh12tMF7HXy
 YLyQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=dw8ZY5zi
Subject: [Buildroot] [PATCH 0/3] allwinner: arm: misc BSP updates
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Here is a patch series with BSP updates for several boards with Allwinner
arm CPUs. U-Boot version updated to 2023.01 and Linux version updated
to 6.1.14.

Note that orangepi-zero and orangepi-zero-plus2 are not updated in this
patch series. I observe WiFi issues on those boards with Linux v6.1.
So those issues need to be investigated before updating BSP.

Regards,
Sergey

Sergey Matyukevich (3):
  configs/linksprite_pcduino_defconfig: bump BSP versions
  configs/orangepi_one_defconfig: bump BSP versions
  configs/orangepi_pc_plus: bump BSP versions

 configs/linksprite_pcduino_defconfig | 6 +++---
 configs/orangepi_one_defconfig       | 6 +++---
 configs/orangepi_pc_plus_defconfig   | 6 +++---
 3 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
