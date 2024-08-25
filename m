Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4976C5321E
	for <buildroot@archiver.kernel.org>; Sun, 25 Aug 2024 19:41:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 29ACF401F9;
	Sun, 25 Aug 2024 19:41:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YypEli25x3Cl; Sun, 25 Aug 2024 19:41:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1021401DC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1021401DC;
	Sun, 25 Aug 2024 19:41:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 49F551BF33A
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 19:41:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 385F5606C6
 for <buildroot@lists.busybox.net>; Sun, 25 Aug 2024 19:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VpY36bdLs3ar for <buildroot@lists.busybox.net>;
 Sun, 25 Aug 2024 19:41:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::134; helo=mail-lf1-x134.google.com;
 envelope-from=geomatsi@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A97F3606BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A97F3606BD
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A97F3606BD
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 19:41:33 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5334fdabefbso3341417e87.1
 for <buildroot@buildroot.org>; Sun, 25 Aug 2024 12:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724614890; x=1725219690;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Rbnq0OLANw1HYtn1HIqZ6ScwmLvIQjxdpKh3nB34zVU=;
 b=XfkkEWCrMi+5yWg0YBZK43G67rq1J8crym7q5onrulWpSpkSigVbjNzMHaDM0oorWN
 2PZcjaCPxWuft+1X53iIICQ3POlNaQviKWNQNkuiLsdzsE63En6fruz16mi3w0VTYlef
 wGG/5UzG4GQw/egZfb/9ujlY8uJvTXSOgKn0dsA43JK9xj82XVCDbv5qjURRjGaaBRQH
 ytrm3ZHjRCt9fxM9/4didUtIqRF7RQqE2XC54/OooBozgNjDRH677HGr6QS/NIkzVUVz
 1Cn8qmBB6OwZ89Vmcl7JyLsBiamTZDRMsy9P/kCdzlKhPZzqTgipI4XhN3bg8MipsMjy
 ga2Q==
X-Gm-Message-State: AOJu0YxAPbKLDZIG/sMeG73wpAJRCJHMkcBl5+0MxA331n1/EPDUrJiA
 /x/14jiE71Akz+1vSpPQF6dLPlmqSeR7kI+ZCoOBI+Ws7DaYERUZcPqpsKHI
X-Google-Smtp-Source: AGHT+IEcYMYtWfPU/2XiGeYob5UGhCznBgcbPi4obNvtbon1JnApzJ1OVgjf0SpGT1eYEm94kc0m6A==
X-Received: by 2002:a05:6512:2214:b0:530:aa6d:9ea0 with SMTP id
 2adb3069b0e04-5334cab2324mr4083187e87.22.1724614890015; 
 Sun, 25 Aug 2024 12:41:30 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.4])
 by smtp.googlemail.com with ESMTPSA id
 2adb3069b0e04-534365f8061sm1004737e87.250.2024.08.25.12.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Aug 2024 12:41:29 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 25 Aug 2024 22:41:07 +0300
Message-ID: <20240825194124.4719-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724614890; x=1725219690; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Rbnq0OLANw1HYtn1HIqZ6ScwmLvIQjxdpKh3nB34zVU=;
 b=SlsTHWTDyueVOP5ATBQ8sJawk7bitzTBcpYejrnvr6BN3soQmx+BPyOBZIUtc2H07b
 JF8NHlIWhJN3xJzMlzEnHpDlkPL9sL7MfWw+xD2qOpjRe031HuR3S+8oKLK9gUUcHOZz
 XhZXNrvPgfIO1ScCqDSHgdbNL3myRFykaX3iK0MOdQG66ywF97P+mLUjXE6vII3AT4qo
 5ziFMd7vGisS/LTRhEHu8P5HHTuYgK8Il6HjRZJmN7xgsUyJy5038q95v4L41YQ2UsLy
 ymnkaenDOKFM4FcY2fV/AI4V22Fn/EQ2R/I2MEYPGCPSHrHGzZKDpytQ0ZWcfb1p6Ouq
 HFNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=SlsTHWTD
Subject: [Buildroot] [PATCH 0/2] perf: add binutils support in new kernels
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

This patch series fixes libbfd (binutils) support in perf for the
binutils >= 2.40 and the Linux kernels >= v6.4. New kernels have
a new 'opted out' perf build option for libbfd support. At the same
time, new binutils provides new libsframe library, which should
be installed to the target together with libbfd and libopcodes.

Sergey Matyukevich (2):
  package: binutils: install libsframe to target
  package/linux-tools: perf: explicit option for libbfd support

 package/binutils/binutils.mk              | 1 +
 package/linux-tools/Config.in             | 6 ++++++
 package/linux-tools/linux-tool-perf.mk.in | 7 +++++++
 3 files changed, 14 insertions(+)

-- 
2.46.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
