Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 729B6C433F5
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 17:28:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 142C7408F2;
	Wed, 23 Feb 2022 17:28:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZpqekEJfcHZ6; Wed, 23 Feb 2022 17:28:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F04C6408E5;
	Wed, 23 Feb 2022 17:28:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E72031BF263
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 17:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D4C3882978
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 17:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IhEuqm3BG7vE for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 17:28:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EA0FA82977
 for <buildroot@busybox.net>; Wed, 23 Feb 2022 17:28:28 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id p9so40799027wra.12
 for <buildroot@busybox.net>; Wed, 23 Feb 2022 09:28:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nB81+t2sn9cSwZbpBGfq+S2ROBYTH5KaF/E3czOZncc=;
 b=aQT9/Hj/+M58jTQH/iGbHe+aZqztkUV9T+umPeCDDyxeWIyT3M4/Us3DeCVFh6Qo3F
 dEfaG83j1YuMI2hIHiIhUCpR83QcIrQr1qWfpsfnvdB3fg0cSXteDATApspEK4ZzBfxH
 +iccE1agVYVavQK9xDg3wQ0EJn7PnRe2tm58ekb0YU1xIGMv+t304tir9HdV+3gHyFIY
 t3XlEeJCU5+HEUDceF+9T0Fy7O71eWeCLdWMqyBzFnrxhn8rlMwmAT8ijSLNHCmoHaoQ
 Ffy4Y1QcTpL3N+luBOisfTtW/8VGl9TdtW8Rx7UwqFQwv16G3bdA5fmN/05SazM3DBfX
 YluA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nB81+t2sn9cSwZbpBGfq+S2ROBYTH5KaF/E3czOZncc=;
 b=mJRFGdRHqMxAGQFxpWnoOLTvn6+7CZMTBaC+Q/wNyfn5478STETRw20BX6TY8oHm5T
 zuVe64HtSqW0hjzSsE6WZEeRfUmAVpK7CKIgRT+9NGwUNQ6GWwgkQiZO+cE46YhpYZh1
 9BnBqBo69tByBYQxJkOi/bvdQzma3RCG9Juu8M6BhtizobMOUix2Fk9Zkdpf01XcsIpg
 k1g3VZnj3xt+frAiHrlfB2n7cQ8MaUnk1sPEAgHOHcXPDWHTtBE00Etq5pn4CxU9paxc
 0aRCwu/BMqRsMjKLjBo705eLK8tpCUYMexCzpUxvcUAdD5k4zdTS44yj9RVfcSVIalEc
 X0/Q==
X-Gm-Message-State: AOAM5306h9ymOu/q5yRcYd+z2iQmhOJWnoSEXzHZRV32cm5L6ZvQLvkX
 2MbbU+aIXS8hi04+ujLESFeq7UL1iaI=
X-Google-Smtp-Source: ABdhPJxNrO7tsIAhFwcOIrxCw5fUfRZGGRR9a94od2cVstZCReDYQwHBS8kWj5coTNpEv005RUnjUQ==
X-Received: by 2002:a05:6000:15c4:b0:1ea:80f8:dfee with SMTP id
 y4-20020a05600015c400b001ea80f8dfeemr511618wry.542.1645637307169; 
 Wed, 23 Feb 2022 09:28:27 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id w4sm131633wre.102.2022.02.23.09.28.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 09:28:26 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 23 Feb 2022 18:28:17 +0100
Message-Id: <20220223172817.3002782-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/gnutls: security bump to version 3.7.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

see https://www.gnutls.org/security-new.html#GNUTLS-SA-2022-01-17

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/gnutls/gnutls.hash | 4 ++--
 package/gnutls/gnutls.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/gnutls/gnutls.hash b/package/gnutls/gnutls.hash
index 5d4fd1a0d..2ffc6c1b4 100644
--- a/package/gnutls/gnutls.hash
+++ b/package/gnutls/gnutls.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.2.tar.xz.sig
-sha256  646e6c5a9a185faa4cea796d378a1ba8e1148dbb197ca6605f95986a25af2752  gnutls-3.7.2.tar.xz
+# https://www.gnupg.org/ftp/gcrypt/gnutls/v3.7/gnutls-3.7.3.tar.xz.sig
+sha256  fc59c43bc31ab20a6977ff083029277a31935b8355ce387b634fa433f8f6c49a  gnutls-3.7.3.tar.xz
 # Locally calculated
 sha256  e79e9c8a0c85d735ff98185918ec94ed7d175efc377012787aebcf3b80f0d90b  doc/COPYING
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  doc/COPYING.LESSER
diff --git a/package/gnutls/gnutls.mk b/package/gnutls/gnutls.mk
index dbf759385..7317a3bb1 100644
--- a/package/gnutls/gnutls.mk
+++ b/package/gnutls/gnutls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 GNUTLS_VERSION_MAJOR = 3.7
-GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).2
+GNUTLS_VERSION = $(GNUTLS_VERSION_MAJOR).3
 GNUTLS_SOURCE = gnutls-$(GNUTLS_VERSION).tar.xz
 GNUTLS_SITE = https://www.gnupg.org/ftp/gcrypt/gnutls/v$(GNUTLS_VERSION_MAJOR)
 GNUTLS_LICENSE = LGPL-2.1+ (core library)
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
