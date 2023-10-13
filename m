Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E32CDB47E
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 08:30:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08A2B81D65;
	Fri, 13 Oct 2023 08:30:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 08A2B81D65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BhpnYxmxiabR; Fri, 13 Oct 2023 08:30:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8365781D7D;
	Fri, 13 Oct 2023 08:30:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8365781D7D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E70CB1BF348
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 08:30:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BFCB6404C9
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 08:30:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BFCB6404C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QQOXYOBsPJ4S for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 08:30:47 +0000 (UTC)
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3F9CC400B8
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 08:30:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3F9CC400B8
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-9ae2cc4d17eso303448466b.1
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 01:30:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697185845; x=1697790645;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=j9MmoMjv/rE0cLDl1hCwFCGbFHAkzt4du199w6mPpVc=;
 b=JdsZpkydTuDUdtIbJhkubofdnpmGm5LPGj89bxnH4tnvjLc9iyHmhhVbzE45Znc+EC
 lKPT+3OIUTWrViQwwMD0ss7f4bRdtrL1+njYFphN6wbgDdK2VwvTY2git18pgLbMbOg4
 FLDhNUpT51gzuX1mPVoY8lN5+m2BDX7adA3AWZF4CEIZ3lwOkm7aHb7BbL7LmzL/qQwi
 ttaD3yocT7v4r9TzAySl0KxNinVg/6eXCWlZZG8BcE8O6zqzflNR1zQTElYPcr6haJ2e
 dIAbW5Iy/tR811dNAuveWsmF/ETBgRV+QUg1T3ziC3eMX0Ti4stBwAvW6+rpJM4jBFsL
 fKbQ==
X-Gm-Message-State: AOJu0Yys8FBJQhjjSYR3Woy980lo7966x0xCevIOd3Vv2YXjlEPtAe5O
 fh0ZPrRUBt8HuvH0UAasEyavHfrFYk9rwogWiiGGWQ==
X-Google-Smtp-Source: AGHT+IE/NFMMEHWRJ9aXDx05zeirMU6sM6qqNyxVNpzQpUIxiHJHFU1K8HiJUiSZgKBT8tSkvM04HQ==
X-Received: by 2002:a17:906:256:b0:9bd:84af:e67c with SMTP id
 22-20020a170906025600b009bd84afe67cmr5527986ejl.29.1697185844980; 
 Fri, 13 Oct 2023 01:30:44 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 d21-20020a17090648d500b00997d76981e0sm11926801ejt.208.2023.10.13.01.30.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 01:30:44 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 13 Oct 2023 10:30:37 +0200
Message-ID: <20231013083037.1349119-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697185845; x=1697790645;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=j9MmoMjv/rE0cLDl1hCwFCGbFHAkzt4du199w6mPpVc=;
 b=ZgvBYlamXZ39xmjDrP7Y9GCe0QNreghBY47x9d6JyWxuMviBUzXIhVjPQGTwBoroKd
 q/9//83+PmhZshpKWzsxy9ejEGofTDwisEG+BpVZshDOQjBoLxxsedMM11qY9YuqjFl2
 p/E0yl5Nkfd8herJVpObPmNBORNz/u5GC/Jw0=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ZgvBYlam
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump version to 254.5
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
Cc: Norbert Lange <nolange79@gmail.com>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, Sen Hastings <sen@phobosdpl.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

All tests passed in Debian 11 with the following command:

./support/testing/run-tests tests.init.test_systemd

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 10f4bc04fa..f0c3db60e7 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  18db69c8fc33afebf95a40cfa3769df5f0e4a07bccdebd33b2fd81c8b75e7a02  systemd-254.tar.gz
+sha256  41873783aa1c680e10d2f2626797a1c2fef8018d69b68c8c77639e140ee7846d  systemd-254.5.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index d220673572..d428765ec3 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 254
+SYSTEMD_VERSION = 254.5
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
