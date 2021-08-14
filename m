Return-Path: <SRS0=c1N3=NF=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D96EC4338F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 21:52:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7357E60C3F
	for <buildroot@archiver.kernel.org>; Sat, 14 Aug 2021 21:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7357E60C3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2903960626;
	Sat, 14 Aug 2021 21:52:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v9a7_zOretId; Sat, 14 Aug 2021 21:52:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D9446063F;
	Sat, 14 Aug 2021 21:52:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8A6F81BF350
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 21:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 86C6280EBF
 for <buildroot@lists.busybox.net>; Sat, 14 Aug 2021 21:52:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aYxDgh11BnmJ for <buildroot@lists.busybox.net>;
 Sat, 14 Aug 2021 21:52:12 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0651.aruba.it (smtpcmd0651.aruba.it [62.149.156.51])
 by smtp1.osuosl.org (Postfix) with ESMTP id ABC5780EB8
 for <buildroot@buildroot.org>; Sat, 14 Aug 2021 21:52:11 +0000 (UTC)
Received: from ubuntu.localdomain ([141.136.135.234])
 by Aruba Outgoing Smtp  with ESMTPSA
 id F1ZYm4rarxC2nF1Zame37z; Sat, 14 Aug 2021 23:52:10 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1628977930; bh=TA6GT+2yFsKkkr2Ccq9SJ4KjHln3e3BazVE7HOjLxQU=;
 h=From:To:Subject:Date:MIME-Version;
 b=DjEJCC/2NeUfXw26ETVzW3/5oI8FyT0VaEyM053d7wn7HoWommallbDm6YUTB/1gu
 3A9vIXmIZ1KQCKuCgjMVpvm5C7t2mPjXTNaZmEGsDNGJyKsFCd0/P+Np2pPoDh4qu5
 HJPVlO6fpgTf6o3b76uOKPDKA2e6Y7D5hpcjR+BZxnG4X28bX9lASbojfQ9wjyioCm
 IA9sYGlBjY4juhUxWqmQ1uky7F2Obawdsretnnzl7WkA4W1zgKXWXUDQkn3R3vOkEk
 FWDhthb94Kp+eMH/Eq+YQGjxSrOiOsoJTbxyZz1j/JVGWgZwlyUCFald6s///ygKvx
 pg4g2u6tBCtRw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 14 Aug 2021 23:52:07 +0200
Message-Id: <20210814215207.251908-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210814215207.251908-1-giulio.benetti@benettiengineering.com>
References: <20210814215207.251908-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKTvCC332rvabQ7UcSKIWi9dxmyGM1QFmrRI7evlVgCtqFJ1467e7dcaFz22rCbsAfaCWFyrt58hqWocQxyXrceOyBhEfLD7Z2G+rW48B9pxTXL5oGZM
 Lv7Ah44x81/bpR+DwDSL6oUqa87Q4mgD7J/XAsCW3+i2G8mxy1164Ve+qPVAQiNiPzWMJN7oOgx03re0gXqp80kU09H0er2Fwf5+0tmNTY5FPjsHp42CgnnW
 VIRrNb18D3ogAz6W+bmLJeqXzESjOZ5TI+IMYxwEvL9XAXIGvNkCLmFtu7x2yLTO+/RBgokELMjnOet1wuX8+/pk7ZxvjxIUBkP6Ehyea66UooDpcPN2TjyC
 Es7G7I8ZYRuAdd5ITwkAHtI8q563HqqbopXpVhWw/91/3aDQcic=
Subject: [Buildroot] [PATCH 2/2] package/lmbench: fix build failure due to
 gcc bug 101915
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

The lmbench package exhibits gcc bug 101915 when built for the
Microblaze architecture with optimization enabled, which causes a build
failure.

As done for other packages in Buildroot work around this gcc bug by
setting optimization to -O0 if BR2_TOOLCHAIN_HAS_GCC_BUG_101915=y.

Fixes:
http://autobuild.buildroot.net/results/ae1/ae1e4d61ed367c6cb64442c60d98882cc7985346/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/lmbench/lmbench.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lmbench/lmbench.mk b/package/lmbench/lmbench.mk
index 2f3b19b5f8..b0f99ff106 100644
--- a/package/lmbench/lmbench.mk
+++ b/package/lmbench/lmbench.mk
@@ -18,6 +18,10 @@ LMBENCH_CFLAGS += `$(PKG_CONFIG_HOST_BINARY) --cflags libtirpc`
 LMBENCH_LDLIBS = `$(PKG_CONFIG_HOST_BINARY) --libs libtirpc`
 endif
 
+ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_101915),y)
+LMBENCH_CFLAGS += -O0
+endif
+
 LMBENCH_POST_PATCH_HOOKS += UPDATE_CONFIG_HOOK
 
 define LMBENCH_CONFIGURE_CMDS
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
