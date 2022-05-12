Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A97DC433FE
	for <buildroot@archiver.kernel.org>; Thu, 12 May 2022 20:49:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D88ED82EC7;
	Thu, 12 May 2022 20:49:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Dcawu7p9ruHN; Thu, 12 May 2022 20:49:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E04BA82EA5;
	Thu, 12 May 2022 20:49:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DC5D11BF3A4
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:49:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C612640393
 for <buildroot@lists.busybox.net>; Thu, 12 May 2022 20:49:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1bbmNlhRxmW2 for <buildroot@lists.busybox.net>;
 Thu, 12 May 2022 20:49:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9FEF240199
 for <buildroot@buildroot.org>; Thu, 12 May 2022 20:49:50 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id t6so8867432wra.4
 for <buildroot@buildroot.org>; Thu, 12 May 2022 13:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EK29CO7eYd8EqGu0J2nYihVY5QhCh5KpxA5GEjXTwwM=;
 b=Dy8ez5p+Tm7XCGxWG9SF6mqsi2CTvGGAsSerbpU7G3bHTe8GcavOW3qim8kwM1AxOP
 64tCRxK8aSxs1xCxmkpbUHoNgIO4xaXMKvWuvS0OIcpegu8ZbouyNxxKroRK1M/EmUJL
 jqQJCMc+ac0wf4XRjrfB88264Fo/0w2wsKY2+7GGr8kyjpk6e2Jv/rzhpxJB3oRWjFXM
 I6cbdQk+VbhwA6RrK3vDJ4palwOC9YkvPoG5rwzfVkZYj5PVTE4bjNXycy/cxy4ZEL6m
 QKum0+IVSHaCEgmvJUCigZUoIZb+iz8h15o709eqHyjt2x8vzdrLpvNL4II8GkGF8DgU
 Hw+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EK29CO7eYd8EqGu0J2nYihVY5QhCh5KpxA5GEjXTwwM=;
 b=BtvSaQM7jeAA4ykfsxeOoBAAl79sBAxOkzlg+Akbknur9/Nt7YEU9OtQWitD69nrVc
 MIKzwFDKX/eDWBBbdvOiHqEZ9SGpt282wsmbLIA7l0/pkoac2+zjVH/pr4rfcU/NSK3H
 bqWIdOO1EKmDJkpebfZ3/FpZsOvZ9JgXtNf+AOBMMtDA8bZQU9NGRku4OPDTdgXhyh8s
 ptVP2ykA6G4XG/LSlApNmYDypeDOOI4oJWMaWGa3aGFr9fAR3DCtPLDKPkebZgGdAvvz
 PpCnJnOzs5vxb+Y0iGiD9qh1xG74h23ATK+eY8Nnrdk+7PRh5NbT224NCUZY2fRMJQrJ
 WMTw==
X-Gm-Message-State: AOAM531Pn6dk37+R7L8hVG/cjoxx3/vwPZAo2nzimXYQ6NeZr5eCKoEV
 txiJkamEDbUEYSzMWRgcxBbSAX/5g1E=
X-Google-Smtp-Source: ABdhPJyBMGpJMpaztQlBPWyZygv5aYKOawpxzM0tldCo2sI45QAYJrbnQLKzlzqSFTBa6JuWUUQioA==
X-Received: by 2002:a5d:64e6:0:b0:20c:4f23:96fc with SMTP id
 g6-20020a5d64e6000000b0020c4f2396fcmr1235874wri.154.1652388588692; 
 Thu, 12 May 2022 13:49:48 -0700 (PDT)
Received: from atlas.home
 (2a01cb058f8a18003dbee9eed79eb521.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:3dbe:e9ee:d79e:b521])
 by smtp.gmail.com with ESMTPSA id
 l11-20020adfbd8b000000b0020c5253d91esm418304wrh.106.2022.05.12.13.49.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 May 2022 13:49:48 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 12 May 2022 22:49:44 +0200
Message-Id: <20220512204944.94312-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] support/testing: test_lxc: bump kernel version
 to 5.15.38 for complete pidfds support
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

As reported by [1], the lxc test is broken since lxc >= 4.0.11.
A patch was added to lxc 4.0.11 to use the new mount api for devpts
setup [2] but the fall back code doesn't work when this new mount
API is not supported. This API was added in kernel 5.6.

(kernel 5.5)
DEBUG conf - conf.c:lxc_setup_devpts_child:1682 - No new devpts instance will be
mounted since no pts devices are required
lxc-start lxc_iperf3  DEBUG conf - conf.c:lxc_setup_dev_console:1966 - Cleared
all (0) mounts from "/dev/console"
lxc-start lxc_iperf3  ERROR mount_utils - mount_utils.c:mount_at:661 - No such
file or directory - Failed to mount "/proc/self/fd/44" to "/proc/self/fd/43"
lxc-start lxc_iperf3  ERROR conf - conf.c:lxc_setup_dev_console:1988 - No such
file or directory - Failed to mount "10(/dev/pts/0)" on "43"
lxc-start lxc_iperf3  ERROR conf - conf.c:lxc_setup_console:2143 - No such file
or directory - Failed to setup console

(kernel 5.6)
lxc-start lxc_iperf3  TRACE mount_utils - mount_utils.c:can_use_mount_api:582 -
Kernel supports mount api
lxc-start lxc_iperf3  TRACE mount_utils - mount_utils.c:move_detached_mount:328
- Attach detached mount 45 to filesystem at 43
lxc-start lxc_iperf3  TRACE conf - conf.c:lxc_setup_dev_console:1990 - Setup
console "/dev/pts/0"

Bump the kernel to the current LTS 5.15.38 version that fully support the
mount API needed by lxc.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/2429013708

[1] http://lists.busybox.net/pipermail/buildroot/2022-January/635251.html
[2] https://github.com/lxc/lxc/commit/be606e16fd0fa967219d890745a425625eafe251

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 support/testing/tests/package/test_lxc.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_lxc.py b/support/testing/tests/package/test_lxc.py
index d98bed8761..f66b31f3ba 100644
--- a/support/testing/tests/package/test_lxc.py
+++ b/support/testing/tests/package/test_lxc.py
@@ -12,7 +12,7 @@ class TestLxc(infra.basetest.BRTest):
             BR2_TOOLCHAIN_EXTERNAL=y
             BR2_LINUX_KERNEL=y
             BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-            BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
+            BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.38"
             BR2_LINUX_KERNEL_DEFCONFIG="vexpress"
             BR2_LINUX_KERNEL_DTS_SUPPORT=y
             BR2_LINUX_KERNEL_INTREE_DTS_NAME="vexpress-v2p-ca9"
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
