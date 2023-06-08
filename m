Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5EBC7EE25
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 18:09:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF0646151B;
	Thu,  8 Jun 2023 18:09:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF0646151B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aaTCZO5y0YfM; Thu,  8 Jun 2023 18:09:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DCDC26153F;
	Thu,  8 Jun 2023 18:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCDC26153F
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A39131BF3E1
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:08:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A40C8210D
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 18:08:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A40C8210D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wDmSszYq9Yyq for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 18:08:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8135F820F2
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8135F820F2
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 18:08:53 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-30adc51b65cso923668f8f.0
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 11:08:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686247731; x=1688839731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H04CYG1L6plEpOm0+0x8TTv/R6vUgmhy65snc+hJkC0=;
 b=l0wU4dLQWICRVwoKgZ3UQyovMFLaPxzhpCwkkwzEi1LL/yylafth8X7S5tH+t8UO8G
 4qa+nv8VKgZkbIvxf3WvxjQGWzRseaTzsxsOiXwswfQM9/JPNnXC3UajoJGrUNRdu2TY
 B6ruTLntnoj87hsFL1aJoaYo2uUFp27p0eadKAkLD/JTdfmRj+XJMAh2vnHY9h//g+iD
 qICdmqa5Q+NqKCK0WXYvtc92qYNqISSqPNR69XvAUAaywu6wOr5MH6g0TG3VPBH1Gx9M
 XqgkRztJ1CtWeUoXBGR1BGStE0HnKp0bVuqZskxjRU3dSLLVkG80DumiU9qeLgCCaGfC
 2ofQ==
X-Gm-Message-State: AC+VfDy3q5bU0BbVYBWy/A4+Y7nvc062mY21NWMvjJIopqy/vKmvFl9b
 dEk5sSWayLeGAOLPgmVWtxyGkAXmoqE=
X-Google-Smtp-Source: ACHHUZ4Kjqdl1jLWQM1C3ryY/zoLSxJ321FJ5x/9zfE36nLGfhb7dxLNCIsGpRYLjBiI1EzD517u+Q==
X-Received: by 2002:a05:6000:504:b0:30e:4886:425a with SMTP id
 a4-20020a056000050400b0030e4886425amr10495696wrf.40.1686247731609; 
 Thu, 08 Jun 2023 11:08:51 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 x2-20020adfec02000000b002ffbf2213d4sm2221238wrn.75.2023.06.08.11.08.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 11:08:50 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  8 Jun 2023 20:08:32 +0200
Message-Id: <20230608180844.189528-4-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608180844.189528-1-romain.naour@gmail.com>
References: <20230608180844.189528-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686247731; x=1688839731;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H04CYG1L6plEpOm0+0x8TTv/R6vUgmhy65snc+hJkC0=;
 b=fjGVWzYuxWtfpaRj42TxIZ8cDj4IuTsVNsfEEM68owuPUzunQjphQZB1NwCWo0R3qn
 6s/ymxj2Q8upCE67zXLcukfl9XGL/YdPaYQp9sE2bTLXqRN8zzGSTXL0wDcF12GcsUAy
 ScBPrevydQeV6/CFnxAQkh5EHX+UmzF7KIUMkRrdUsq/J6HM3Gjv1byA+l1zvyn81h9T
 L7m1hkkenCWrieqMgP4mI66jruaNqytvmS5kDUKE/kBIQ9JUlE+/sI80/UPF0jOdxVya
 GtCOZNy3WyYtsw5QvDfEP9Uy4VDo8kEyQGyWRleq1zzoRYa4dgHc1CqwpC/7clRx/eU/
 JPXg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=fjGVWzYu
Subject: [Buildroot] [PATCH 04/16] support/testing: TestSELinuxSystemd:
 kernel bump 6.1.26
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We are going to update the toolchain used by the Buildroot testsuite
and this update will break the kernel build with the Bootlin stable
toolchain due to an latent issue.

Fixes:
arch/x86/entry/thunk_64.o: warning: objtool: missing symbol table
make[4]: *** [scripts/Makefile.build:361: arch/x86/entry/thunk_64.o] Error 1
make[4]: *** Deleting file 'arch/x86/entry/thunk_64.o'
make[4]: *** Waiting for unfinished jobs....

[fixed since kernel 6.0]
https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=de979c83574abf6e78f3fa65b716515c91b2613d

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 support/testing/tests/init/test_systemd_selinux.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/support/testing/tests/init/test_systemd_selinux.py b/support/testing/tests/init/test_systemd_selinux.py
index 73604cfc32..5f91243f37 100644
--- a/support/testing/tests/init/test_systemd_selinux.py
+++ b/support/testing/tests/init/test_systemd_selinux.py
@@ -12,7 +12,7 @@ class TestSELinuxSystemd(infra.basetest.BRTest):
         BR2_INIT_SYSTEMD=y
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.12"
+        BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
         BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
         BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/x86_64/linux.config"
         BR2_PACKAGE_LIBSELINUX=y
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
