Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420FFC433F5
	for <buildroot@archiver.kernel.org>; Wed,  1 Dec 2021 09:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8D2F81A4E;
	Wed,  1 Dec 2021 09:52:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gIiv3YDeabLE; Wed,  1 Dec 2021 09:52:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08ED781A3E;
	Wed,  1 Dec 2021 09:52:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 131751BF59F
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 09:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3D964019F
 for <buildroot@lists.busybox.net>; Wed,  1 Dec 2021 09:52:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wXnv_-n2rl88 for <buildroot@lists.busybox.net>;
 Wed,  1 Dec 2021 09:52:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12f.google.com (mail-il1-x12f.google.com
 [IPv6:2607:f8b0:4864:20::12f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C2AF04014B
 for <buildroot@buildroot.org>; Wed,  1 Dec 2021 09:52:30 +0000 (UTC)
Received: by mail-il1-x12f.google.com with SMTP id i6so24572421ila.0
 for <buildroot@buildroot.org>; Wed, 01 Dec 2021 01:52:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eJ+kEXHAxGkpYcvhbH9RJup190S45qkvEGqKpVIHGUk=;
 b=DWWmXI2J6ikSk56mBY9Dnvm8oqor2PzDCEbTldw2NmiMBmYZYb28nqNSDGytC13d0V
 tI84833YPJIFk62ZRtVDt6jt5nHnq+Qwk77WbSq4v+0AO4SWpPRNq4dvOBTvgyRaY+zE
 Fs/nQoxYVxSP32kerw1zxnPJkRzaTHKEQB7l2zjAUoY8aXVnWG87XdLZhDrRqNsNv47o
 3CYXOd7vGNFI5V+FTvcbNf+ryco9HY82InYMAkrJmjdUYp0uUA9HtSSVilJjCLs2hxZ7
 6xWsXUm5o5ZU1zb2XU2nfc9/G5GIUQCFEKKwC73rMu+ox3ChmuKRK7Vg3nfnqzDYcYg9
 9RxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eJ+kEXHAxGkpYcvhbH9RJup190S45qkvEGqKpVIHGUk=;
 b=yyqdbj6CxpBWljoVCBp9Nurux0uQVASgPqVfuKOxRnx4z1XU+NA3v2lrUD/VP46AEf
 LPxYHlvxfBA9x+mRvvgrpwgMqBQPZzhKCD2nYqWVMRbQzxMWfzSzBW48xo8ZlLA2hVMa
 vHaHF2wvepdeqNzIBsa1WQpWmi/a7WhymEfqgbRM6Nan9VT9Ui5cnHzCp8U5Jb7dfwSO
 jhurVbTVEL6npQvUz3otE8E0V/Y4J+g0gqZjtoASnOPVFqPv1OS9m1jNGfBFNqxYHIVE
 djT+AizTsbO3+Zjsnd3sQT8zmqbxtt8tMtcCjypJpMfsRz+XkKjlEOeylzzCc/oPT+GW
 w02Q==
X-Gm-Message-State: AOAM5325NU5ivczBViC2TRrzyc5IOOihW10IQEpchM3xEyE9LDtcBhQQ
 Frgvwucw4sV3RZ1EK2rFHR1sPdvuRGM=
X-Google-Smtp-Source: ABdhPJyMsMhXYq6UOTahGQ1c0PEg2rOhOX1onr75alw2TjmWS9Pj1YdIEo56vE6X1b8MfyiSAnSqqg==
X-Received: by 2002:a92:c244:: with SMTP id k4mr5620699ilo.169.1638352349767; 
 Wed, 01 Dec 2021 01:52:29 -0800 (PST)
Received: from james-x399.localdomain (71-33-128-47.hlrn.qwest.net.
 [71.33.128.47])
 by smtp.gmail.com with ESMTPSA id l18sm11518884iob.17.2021.12.01.01.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 01:52:29 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 Dec 2021 02:52:24 -0700
Message-Id: <20211201095225.90511-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/ell: bump to version 0.46
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Peter Seiderer <ps.report@gmx.net>, Matt Weber <matthew.weber@collins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/ell/ell.hash | 2 +-
 package/ell/ell.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ell/ell.hash b/package/ell/ell.hash
index 84016c0ce0..20b568dde4 100644
--- a/package/ell/ell.hash
+++ b/package/ell/ell.hash
@@ -1,5 +1,5 @@
 # From https://mirrors.edge.kernel.org/pub/linux/libs/ell/sha256sums.asc
-sha256  41a6f8fa4d285b52cb7a5a87bda3e7370ecaac02d94aaa7ec1a23f0480b8bc3f  ell-0.44.tar.xz
+sha256  f4fc647eff32f622e21f8851ed0c8b7270f4800149c91be601754e22d82cbb4d  ell-0.46.tar.xz
 
 # License files
 sha256  ec60b993835e2c6b79e6d9226345f4e614e686eb57dc13b6420c15a33a8996e5  COPYING
diff --git a/package/ell/ell.mk b/package/ell/ell.mk
index 47137e2530..4fad6e8d1b 100644
--- a/package/ell/ell.mk
+++ b/package/ell/ell.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ELL_VERSION = 0.44
+ELL_VERSION = 0.46
 ELL_SOURCE = ell-$(ELL_VERSION).tar.xz
 ELL_SITE = $(BR2_KERNEL_MIRROR)/linux/libs/ell
 ELL_LICENSE = LGPL-2.1+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
