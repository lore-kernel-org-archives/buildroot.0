Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B865EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 11 Aug 2023 16:25:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83F1C4173C;
	Fri, 11 Aug 2023 16:25:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83F1C4173C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mbyUH0Vr_CqU; Fri, 11 Aug 2023 16:25:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EBE4A41DAE;
	Fri, 11 Aug 2023 16:25:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EBE4A41DAE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 977731BF342
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 16:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7166C4049A
 for <buildroot@lists.busybox.net>; Fri, 11 Aug 2023 16:25:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7166C4049A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SRV6RUrK-XTd for <buildroot@lists.busybox.net>;
 Fri, 11 Aug 2023 16:25:04 +0000 (UTC)
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 83E50404B2
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 16:25:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 83E50404B2
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-3fe1a17f983so18971965e9.3
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 09:25:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691771102; x=1692375902;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4r62XsStHSYEcsajzSpolZjbriTjdNZpThB7gEggxdA=;
 b=Z+s0dwkAZvZJobZulzVo6wZao6mc7Qf2LeaIK2f9TfgSRp1iYM9kvlKhsBcVakivVl
 UwHYw7q98v3u9TxPpXJequbJJALVSJr4kW3kz+tH6kbprpceSBJ9x7Jd1mcLSGiTV43r
 tmYMzClx9Wy3wVkr8baJ9LmDvimLG/7+YhOt20eor4eNz6FJwnC5LPj+1ZC21kN/wY6g
 93YLkeIec47pQ127W8Q7QEmC1mfLCjwBzKQc3LYQQYtrOofIdoupUXnyvCH2a6Jkx2pL
 UoIUL9MFfe2b4iVXem94aQrqdRAPZ0KPsxC5LtJFZVY1i4crV8s1BwQyIekK5pFnsQq2
 hUFg==
X-Gm-Message-State: AOJu0Yw+gZxeu1ASIRO6TAUX8oZbX3W7GehKWHz1OGqyuKfkmVgy2RrF
 9YDgq2q0jpBAjz9t8Ym58bTj+ry9GzVv8g==
X-Google-Smtp-Source: AGHT+IEvZYFXtN4SGJzPngl4OxIebidsMazSIQK7UKRQS0y3WUdpSKlCT2/FKp36B+tYnzxLcbEKbA==
X-Received: by 2002:a1c:7717:0:b0:3fb:dbd0:a7ea with SMTP id
 t23-20020a1c7717000000b003fbdbd0a7eamr2079098wmi.37.1691771101707; 
 Fri, 11 Aug 2023 09:25:01 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e34:eca2:2100:dea8:bf43:866b:a7e4])
 by smtp.gmail.com with ESMTPSA id
 14-20020a05600c22ce00b003fba2734f1esm8674337wmg.1.2023.08.11.09.25.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Aug 2023 09:25:01 -0700 (PDT)
From: Roberto Medina <robertoxmed@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 11 Aug 2023 18:25:37 +0200
Message-ID: <20230811162546.8088-1-robertoxmed@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691771102; x=1692375902;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4r62XsStHSYEcsajzSpolZjbriTjdNZpThB7gEggxdA=;
 b=cXRfH+aoHltFnvUBsG/haz+O/UkJYi1ZGBX0Dmylh6QD8lLOJYmtxDZRQ1/BkXqA4Q
 DT15nnApgwjaEicidCCQNLR1wXkFYsNyJNvuGIHIpOpxsrHDFLBSkDWBu8D2oxLBqvzw
 0WMGbcNurgjoDQvVCoEh49OUfv42eSzHdMIBwz5q4o22zoVXxK3r6pw2XOqC7ufdTJ3Q
 2Y771nmFZxQ7U30Bz7eHchs8ZznYsST03B3h/Z558D6jCNq+Y7FFuAiMeMCI5wxodLh0
 yMh3bc0Ti6ILa+c3k2xfPApLHBBTnscAH6HGiycwkZ/WKRLnD4+neyUQSDqDwT8gltlG
 CzsA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=cXRfH+ao
Subject: [Buildroot] [PATCH 0/1 v3] onfigs/roc_rk3399_pc: Bring back and
 update the configuration for the rockchip rk3399 built by firefly.
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
Cc: kilian.zinnecker@mail.de, Roberto Medina <robertoxmed@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

v3 -> v2:
  * Several fixes after reviews from Thomas Petazzoni.
  * Add myself to the DEVELOPERS file.
  * Remove the binutils version from the defconfig file.
  * Set custom version of Linux to 6.1.45.
  * Ext2 size needs to be increased a little to produce the final image.
  * Fix the tag for TFA to v2.9 instead of v2.9.0.
  * Set custom version of U-Boot to 2022.04.
  * Remove U-Boot host tools.

v2 -> v1:
  * Use a more recent version of U-boot.
  * Built-tested by Kilian Zinnecker.

Roberto Medina (1):
  configs/roc_rk3399_pc: Bring back and update the configuration for the
    rockchip rk3399 built by firefly.

 DEVELOPERS                                |  4 +++
 board/firefly/roc-rk3399-pc/extlinux.conf |  4 +++
 board/firefly/roc-rk3399-pc/genimage.cfg  | 22 ++++++++++++
 board/firefly/roc-rk3399-pc/post-build.sh |  5 +++
 board/firefly/roc-rk3399-pc/readme.txt    | 40 +++++++++++++++++++++
 configs/roc_pc_rk3399_defconfig           | 42 +++++++++++++++++++++++
 6 files changed, 117 insertions(+)
 create mode 100644 board/firefly/roc-rk3399-pc/extlinux.conf
 create mode 100644 board/firefly/roc-rk3399-pc/genimage.cfg
 create mode 100755 board/firefly/roc-rk3399-pc/post-build.sh
 create mode 100644 board/firefly/roc-rk3399-pc/readme.txt
 create mode 100644 configs/roc_pc_rk3399_defconfig

-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
