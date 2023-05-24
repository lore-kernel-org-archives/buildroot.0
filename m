Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE69C7EE23
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 13:16:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D840D84071;
	Wed, 24 May 2023 13:16:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D840D84071
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vYIgmVurcNvs; Wed, 24 May 2023 13:16:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 053CD84041;
	Wed, 24 May 2023 13:16:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 053CD84041
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A560E1BF322
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 13:16:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7DB2141DF8
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 13:16:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7DB2141DF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7zxYmHpjYklA for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 13:16:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 336A041DF4
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 336A041DF4
 for <buildroot@buildroot.org>; Wed, 24 May 2023 13:16:51 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-30789a4c537so593889f8f.0
 for <buildroot@buildroot.org>; Wed, 24 May 2023 06:16:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684934209; x=1687526209;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=95yS4hgTVwIn0fzF0CuDpIaS0Mm+2Hd/bGwiyYOXPsc=;
 b=X4NBVAO1+xxlbPEouyFKt8Uwte78pqRUhmVDDMszhZ4opgswt+5/Kha7uFWe/sMJ1K
 Zi/o5KySDJZUYQg+Y75M0GGWGtl8BJ37fpnP8RU0/O7+lORNsKypKzuMfMxb4rOGt5Gv
 0soFxUWGzlrZ1QlsmLyDaaNzcrpyR4CPO3wnIUoCanv72qE7pPm1rqG5iTd7z142Jpy6
 dCKgiubau4L9AdKuBRRAC37whDNiZ6RfbOgEQqILtS/b1nY/vWqJEhh9mtasGC/1ZFkj
 oWk1Iz3dWdjc3nuch/On1V8ZqRezbzpVcPqwYazrrZW9QaO51cV0Ftg46eo+5D8AqsYT
 p+Ow==
X-Gm-Message-State: AC+VfDxTuhYLrWp5VcE7F6lsylqyXJb6b6BrsMwmc8jiA/5JT+xt4hD6
 qTxWWCrEexKADD8rKCu9ekdRFhxlP4qLOFxVoZ4=
X-Google-Smtp-Source: ACHHUZ5m7+ZTGjsOyGnRUcXG4jLNGOkVm6yLvR5il42iFaTq4Hz3BQdEazNsDQtYtoIqAdgaE70VPg==
X-Received: by 2002:adf:f485:0:b0:306:36ef:2e3b with SMTP id
 l5-20020adff485000000b0030636ef2e3bmr11476403wro.70.1684934209139; 
 Wed, 24 May 2023 06:16:49 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfdcc2000000b003077f3dfcc8sm14359056wrm.32.2023.05.24.06.16.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 06:16:48 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 24 May 2023 15:16:42 +0200
Message-Id: <20230524131642.88902-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1684934209; x=1687526209;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=95yS4hgTVwIn0fzF0CuDpIaS0Mm+2Hd/bGwiyYOXPsc=;
 b=m84SkHI40ovEbYV4NRK1bV4Q5H49riz1EQb8Zx2Ssm41WVQVmewrujkUCPBC1gVUwn
 oiTSyE4va3QC6jZ7LiEyOUz8EeEI3AYq4urDIs6x1aJic1SlXQuyZzm1Vapm+caREbvg
 7ZMA8KYK3nGSu7W912KUHAKM6Xi9whOSOBpgt/ImmgqOdTZPdzVrUeLjgmpWoAz0ztGZ
 yVDfRKWnpPAfuEYd3USxbgM+bfO0ziWtU4jfixXCdfQJfsnUEnOB68r0b4LHYzm+ElJW
 CpIJv4Du+KHFdRD8rUMCGLXijVaq9xaCj8uXIbvoKMcNQ8am26zl3DjW+JuVQZvztSNf
 WwNA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=m84SkHI4
Subject: [Buildroot] [PATCH] support/testing: test_clang: update to the next
 LTS kernel (4.19.x)
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The kernel 4.16.7 curently used by the test doesn't build with host
bison (GNU Bison 3.7.5) probably due a missing fix [1] in 4.16.x branch.

Since kernel 4.16 is EOL, bump to the next LTS kernel (4.19.x) in order
to ease backport to previous Buildroot releases.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4114986744

[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=d59fbbd09d5d6bdf4ea1f0b4090d175e081ff421

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_clang.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_clang.py b/support/testing/tests/package/test_clang.py
index df3990c6be..f36faa059a 100644
--- a/support/testing/tests/package/test_clang.py
+++ b/support/testing/tests/package/test_clang.py
@@ -14,7 +14,7 @@ class TestClangCompilerRT(infra.basetest.BRTest):
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.16.7"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.283"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/aarch64-virt/linux.config"
         BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
