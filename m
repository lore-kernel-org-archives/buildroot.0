Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 825C7C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 20:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14BCF60F64;
	Sun, 27 Mar 2022 20:06:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QkyBm3ntMn79; Sun, 27 Mar 2022 20:06:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 314ED60F4F;
	Sun, 27 Mar 2022 20:06:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 87DC61BF3EF
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 20:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74D5940949
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 20:06:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id P0hqOTry6tmi for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 20:06:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ADF2440111
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 20:06:54 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id r2so14768663iod.9
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 13:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QHnQwyThXUx6MFs5ylQJpZ/lcJBuGPyzvaij67/gh/M=;
 b=CRYyGVJKz5JmTUOKateM9vEgABghuFsHTK0tFmO2TTPlgAUoY3z/rsPLo6+I2AIoUn
 Nsqtd8ZYap8XEiMdp61QszIgg7g9uSMyP349cIDyMdxw/Oy43bXEUmKjiXDbbXBn1W2b
 WU7rMKWauVxzst2FPG2TtoKjapfKb4YS2eXfbfD9S1zzVV9R66ENgU8UP08U9f3Rzux/
 BhQ+0pPerpsNWDgO5UwSo5jF4+ZWvAqW+rYHA6lLnuCoDz6RxOAnZF3QxCdcK5jtXh51
 3mwr2brksW8k7TOKPPpoy7cK3u/4pp7/TGhqR/vC7Q+ZGu2PSFEnYkNOORzJMsmIX5Yi
 el6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QHnQwyThXUx6MFs5ylQJpZ/lcJBuGPyzvaij67/gh/M=;
 b=QbB43k9k1iESErD98MOfbQiq8AMGdbPHIVqp1XubUFixCT9fGflUoLIOP94KGJJhol
 3ZTPeJrLr2ZIJ1XGxrobhU442DTjnptb33nqa5GlgAYcJn0NC3Gtw5iiMvPOoPKOD84N
 GhcU41xrR28g8VeloITSYGtCEh5rCd4eaqTCdokblsMZkWYklpDczqXLa29D0nkBmbxl
 Gbdr916W4i4f0+n70c1+Gp+97NCHYBdV1xH4V6LVP1O/aS2pEjCfnkrXv9U5+mL71zSr
 Qk0HvSBV4rDbnLSlWhw8+AnBmuy7083EHnY8WlOz/W4nxEm0gxL/8O/z0jLjvxApS6ax
 Xz9Q==
X-Gm-Message-State: AOAM533UdetfZ5FpkNGcDOxdMQ2XnuNuqVMyt2wxKBsKX0rdTH5Z2EQk
 XLUF+vA//soHe+qWE8S1OSikNxvjQNjSMw==
X-Google-Smtp-Source: ABdhPJySQX3+mi79XdYl9u9oig3jInG54ZnKymp0J4YxLVQ9zqSZuktcAvlQhpvybaFWPgPpdXnjHQ==
X-Received: by 2002:a6b:8bd7:0:b0:646:2804:5c73 with SMTP id
 n206-20020a6b8bd7000000b0064628045c73mr4545908iod.112.1648411613576; 
 Sun, 27 Mar 2022 13:06:53 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 r13-20020a6bfc0d000000b00649e7a72afcsm6579314ioh.29.2022.03.27.13.06.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 13:06:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 14:06:51 -0600
Message-Id: <20220327200651.4189748-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/systemd: bump to version 250.4
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
 Norbert Lange <nolange79@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/systemd/systemd.hash | 2 +-
 package/systemd/systemd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/systemd/systemd.hash b/package/systemd/systemd.hash
index 81f51eac20..3572b25965 100644
--- a/package/systemd/systemd.hash
+++ b/package/systemd/systemd.hash
@@ -1,5 +1,5 @@
 # sha256 locally computed
-sha256  87b0eee7b6e5aaab2ab56d158f9536daa6bfd5de011f2a5fc6ccdd81ee1e7a24  systemd-250.3.tar.gz
+sha256  d2bda9d225da11dc9ff48b48e59fc36798d3e66902ed400a9f78fa370c596864  systemd-250.4.tar.gz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  LICENSE.GPL2
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  LICENSE.LGPL2.1
 sha256  e5a8645ad94aab24e312dd0c6be2aa54236eb9374480b1b14ea5c61598874fd5  LICENSES/BSD-2-Clause.txt
diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
index b07fac27d4..9feed9c084 100644
--- a/package/systemd/systemd.mk
+++ b/package/systemd/systemd.mk
@@ -19,7 +19,7 @@
 # - Diff sysusers.d with the previous version
 # - Diff factory/etc/nsswitch.conf with the previous version
 #   (details are often sprinkled around in README and manpages)
-SYSTEMD_VERSION = 250.3
+SYSTEMD_VERSION = 250.4
 SYSTEMD_SITE = $(call github,systemd,systemd-stable,v$(SYSTEMD_VERSION))
 SYSTEMD_LICENSE = \
 	LGPL-2.1+, \
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
