Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B06AC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 19:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E529D408A7;
	Wed,  9 Feb 2022 19:36:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fx32sB2p9iGC; Wed,  9 Feb 2022 19:36:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 194E8408B0;
	Wed,  9 Feb 2022 19:36:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 94B411BF422
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8021C82BE5
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 19:36:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S08zQzhGT5iS for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 19:36:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 753EA82BBC
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 19:36:11 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 l67-20020a1c2546000000b00353951c3f62so2379076wml.5
 for <buildroot@buildroot.org>; Wed, 09 Feb 2022 11:36:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8fqRBnBuf4ggAP1jnmIvBkWiJhrIZr+Fx7eN2BaGrfg=;
 b=U3Mmudt0jnV2CRD2WAqITaQ57tG8tPbBbtIWpNvjIjKtY2fLY/jxDEKw5190pI472b
 CUMIE0Fl544MLfRC8fY/NoPKyKAVUEevabCzfLcePtmQZ7vtdSSFswWsgvYNhtwQqB27
 9OSD7sLSZFcHb0LvAf7wxFQHb42p8MGfjORFCE0Is13sbchSoefyzS/4l1JxA+ysafct
 hAV4MMxKoQt1c+JQrjIeIJvwkfGrKOMGgeoDru8AAVPqHs7//YGzAPSHkLeZ4JvERmHu
 mn96UB27uYZsHeycMZdxntp6jdlhJ9dIcuPDDNiUXVwPRvMHLyFjzgd8YC/tdeJfqLmP
 3J3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8fqRBnBuf4ggAP1jnmIvBkWiJhrIZr+Fx7eN2BaGrfg=;
 b=fjtqlPadWxq9mj2cFZDNEVASyf7QGgylFX4Zj2ED5r9xmYPwN5ijKoFJhZB48ZVVXr
 ByR1Atak9N+u0VL77ufeayVNdgS+Pxnx2yUXHQpz9UP4lEx91WUeWc/IvfN5YscFSZyJ
 Uf3jt1ErTB3J61f1SpsAT4aJ7F5OcMaHDohdfZ8pdoys0UHrswhF5OxIxah8CrRrO3AL
 fS9xdfqZSk9VwzyK5pHeE5LcKeBXttOU7n8QWPMMCbUmlKXCfiGpQno/Hp3Hzd6RiR7p
 ke92VFlHD6WsRuUA/tPv1lDg+RmCei1sEha08P4Vmx06JGfdn3OJn+ck54YExeX8+JeI
 +b0Q==
X-Gm-Message-State: AOAM5310J+CfpuS6Da0tittnXI0dDm+SvKZdocQAKGcY4oijDIb0GyNr
 w4pWRFDlXTMesy1bZOeBXpzNvgt2qFQ=
X-Google-Smtp-Source: ABdhPJyrnw7jJC4MzM51IjftK/HidSVe4n7EuoAKaQGO8MyZQ0fAdsp/EK9CEfZI5ZibtyB0BKAI0Q==
X-Received: by 2002:a05:600c:2c49:: with SMTP id
 r9mr3581415wmg.51.1644435369549; 
 Wed, 09 Feb 2022 11:36:09 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id 3sm10373231wrz.86.2022.02.09.11.36.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Feb 2022 11:36:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 20:36:14 +0100
Message-Id: <20220209193614.330861-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libarchive: security bump to
 version 3.5.3
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
Cc: Pierre-Jean Texier <texier.pj2@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Libarchive 3.5.3 is a security release

Security Fixes:
 - extended fix for following symlinks when processing the fixup list
   (CVE-2021-31566)
 - fix invalid memory access and out of bounds read in RAR5 reader
   (CVE-2021-36976)

https://github.com/libarchive/libarchive/releases/tag/v3.5.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libarchive/libarchive.hash | 2 +-
 package/libarchive/libarchive.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libarchive/libarchive.hash b/package/libarchive/libarchive.hash
index d31e9f55f4..5dd8e5c167 100644
--- a/package/libarchive/libarchive.hash
+++ b/package/libarchive/libarchive.hash
@@ -1,4 +1,4 @@
 # From https://www.libarchive.de/downloads/sha256sums
-sha256  f0b19ff39c3c9a5898a219497ababbadab99d8178acc980155c7e1271089b5a0  libarchive-3.5.2.tar.xz
+sha256  5cac725dd4be31c4a10b65d30f29dc957ea29ef3d758df6e46e8ae90a996a19a  libarchive-3.5.3.tar.xz
 # Locally computed:
 sha256  b2cdf763345de2de34cebf54394df3c61a105c3b71288603c251f2fa638200ba  COPYING
diff --git a/package/libarchive/libarchive.mk b/package/libarchive/libarchive.mk
index eec256ba75..cf16c27e67 100644
--- a/package/libarchive/libarchive.mk
+++ b/package/libarchive/libarchive.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBARCHIVE_VERSION = 3.5.2
+LIBARCHIVE_VERSION = 3.5.3
 LIBARCHIVE_SOURCE = libarchive-$(LIBARCHIVE_VERSION).tar.xz
 LIBARCHIVE_SITE = https://www.libarchive.de/downloads
 LIBARCHIVE_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
