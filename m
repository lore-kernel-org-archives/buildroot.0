Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F385FC7EE45
	for <buildroot@archiver.kernel.org>; Thu,  8 Jun 2023 23:30:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9045542470;
	Thu,  8 Jun 2023 23:30:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9045542470
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jUnrhhpGP2H3; Thu,  8 Jun 2023 23:30:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3949342474;
	Thu,  8 Jun 2023 23:30:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3949342474
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A5901BF97D
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5305E42037
 for <buildroot@lists.busybox.net>; Thu,  8 Jun 2023 23:29:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5305E42037
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6nL_ENU9pGwW for <buildroot@lists.busybox.net>;
 Thu,  8 Jun 2023 23:29:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C5CEC420F2
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C5CEC420F2
 for <buildroot@buildroot.org>; Thu,  8 Jun 2023 23:29:08 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-3f7ebb2b82cso11944575e9.2
 for <buildroot@buildroot.org>; Thu, 08 Jun 2023 16:29:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686266946; x=1688858946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=H04CYG1L6plEpOm0+0x8TTv/R6vUgmhy65snc+hJkC0=;
 b=Igdi7l5Z/W3c+rWkGqgosm3dra776cXv+pJsy3mkGgfjXa5fXMswZNOhnLNGM8kvj3
 s2LW5iAVBYJAV3182SmL9DTgr0wznFQvG4YlPu3hfScGwdb4PkrU2PS3+zFNGtAgkgNV
 +bf0W7+mO2mlnqXC9Dq+ejBPdDpHzd0wsYnQI0JwJNE4gc1+zjGlCbpsYHk+29MEtwS4
 vr9pBOjN3TNzoJ/qIQPa483S1bL2EXJ87VtCdFfmCFZvpyrtqfRY2aMv3MAs6nfWW7JS
 nfhWAJ6AEmTOpRbtErSR45BunkDrRogeQxTZM/Uzg8zkpcI8nh0PNCUWHKoqXLyiTXKV
 KS1w==
X-Gm-Message-State: AC+VfDxCpjw57+NxsFwdDScnUegYPPSDpTPkiVswlv9gaTE/Qdi0loh2
 SeM8hzHXZFjK7D2/etB6vKI2+1+gukE=
X-Google-Smtp-Source: ACHHUZ6UrBUFfiUW/NkROSjVhMoiG+xZ/LWOTfOMT1tv5zHEyn/XWW3sHYforBq03XHT7LIh/mB2GQ==
X-Received: by 2002:a5d:4a0f:0:b0:30a:e332:a3ba with SMTP id
 m15-20020a5d4a0f000000b0030ae332a3bamr8192090wrq.27.1686266946552; 
 Thu, 08 Jun 2023 16:29:06 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 c3-20020adffb03000000b0030ab5ebefa8sm2757522wrr.46.2023.06.08.16.29.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jun 2023 16:29:06 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  9 Jun 2023 01:28:47 +0200
Message-Id: <20230608232859.1245497-5-romain.naour@gmail.com>
X-Mailer: git-send-email 2.34.3
In-Reply-To: <20230608232859.1245497-1-romain.naour@gmail.com>
References: <20230608232859.1245497-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1686266946; x=1688858946;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H04CYG1L6plEpOm0+0x8TTv/R6vUgmhy65snc+hJkC0=;
 b=DyP6XPn9VR7CC9hjMLSMhB+TQPimbwClBGTjilDz2KCddJHU6fKoR6owC8ckozylZh
 1xJzy0l6fJYkgUJKMMrpoGmcGBi77zjZgYLwTtVBhACBKL631PfYjgFnal10S/10wo84
 Da73Tnhtbm0uEnivjO9nWkVxe59kPdm7f/EapLBRewWmdooQ2KATqpt48RyGeoJG+BCT
 Q3yEY2IeKSm9CUZRcJz7haKhygX7q/TFf6mkZXXHJ15jYSAEnr1K7/ywapxR8zLr44kj
 vmbpB25sHPEsaVBEADH6/4/LlRpqQwcv5FRJ8S9dNUUSJ0FchV6ilxLLiLPdlod28lb+
 Z9xw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=DyP6XPn9
Subject: [Buildroot] [PATCH v2 05/17] support/testing: TestSELinuxSystemd:
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
