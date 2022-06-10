Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C6EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Jun 2022 16:57:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1FB484445;
	Fri, 10 Jun 2022 16:57:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id f5kqmxmrQsuZ; Fri, 10 Jun 2022 16:57:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 071FA84442;
	Fri, 10 Jun 2022 16:57:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66E8A1BF358
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 16:57:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 649518443D
 for <buildroot@lists.busybox.net>; Fri, 10 Jun 2022 16:57:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QrhA9C5DHVSL for <buildroot@lists.busybox.net>;
 Fri, 10 Jun 2022 16:57:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CA4184422
 for <buildroot@busybox.net>; Fri, 10 Jun 2022 16:57:29 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id k16so37317279wrg.7
 for <buildroot@busybox.net>; Fri, 10 Jun 2022 09:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XE54XtOjFln9RpPhsPZeZswzwNGPq6gLr9XojG5FUbI=;
 b=XQTNU0WQB6CEaFzYNdTmDTTX2E1YmwBpeX7Iv70ehnBtuZJY18MDAop0oywTZAmsns
 6aPS/vIBve8dz9xLtjnIkWa4HHkQsJDD7IQ3VkabZ0+c2Nc4oJ9ZmDDQ4SfFmFs2Ixfq
 1lr4vKxneZFOiqewli7ABbRzB34qFdJKFjGq6KoJBy/aRNZlKvqZ1AcLJxUqCE4b9YPF
 oC+VLFAlSK5oYL9cerTyvhBhL0D8oNk39OEapQCcgnOAZH7AhnyIvZLGuf7QfnBY0pI5
 InY0iGreLEuWK7wRjzpv/G0mR/OHcvyISgB2xHMQEOo1xG/sOKGuDW7wWX+kEgOYszQa
 N4Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XE54XtOjFln9RpPhsPZeZswzwNGPq6gLr9XojG5FUbI=;
 b=oug91ktBm4phXaHzzNgZPF2/Ys+WQ2A8GEmAWvFCHSqpn/tntJMk35o7W9XYZlRA/b
 j6uSoGMOF7tW8MDAySI/+TaHCpl9PudDH8v29ew0n9FQTsctCHILKMXizFOBKk1MMwhH
 a52Nezie7aIxxuiIDw2SX72921BIW3gprvE8qBdW6aS5ovWBBMstxfHe6FVY5ema5adf
 39i/yxp2Y/sVROj5aGe46vQrM/fRvCwRbkLbzP9CPn+xDsCQUcq/WjJ85VScfrssXLuG
 jmxtqeWUaEx2sy3cfsurPEpihooRAx6o5xUG+Ujf6apuJPdVxa6oRF/U1nWSrXVrQN3N
 3dzw==
X-Gm-Message-State: AOAM533+oUUkRdcmOue1kKCqsCXPwzC1NP9Au37843RQL60Mn+/LoC7D
 4gRNYeGCjSddRO/nKz49wMXtPBJRG7D28w==
X-Google-Smtp-Source: ABdhPJxqA7u1267lGT6nHaNypWC2+07O2BeTI54cfRCLVJXUO82aYVHRA1GZZ7AjF2zHhiJEoqv9yg==
X-Received: by 2002:adf:fb90:0:b0:20c:62bd:652d with SMTP id
 a16-20020adffb90000000b0020c62bd652dmr44961382wrr.402.1654880248308; 
 Fri, 10 Jun 2022 09:57:28 -0700 (PDT)
Received: from vm22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 l14-20020adfe58e000000b002117ef160fbsm27968420wrm.21.2022.06.10.09.57.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:57:28 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Fri, 10 Jun 2022 18:57:24 +0200
Message-Id: <20220610165724.2574514-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/nettle: bump to version 3.8
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/nettle/nettle.hash | 4 ++--
 package/nettle/nettle.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nettle/nettle.hash b/package/nettle/nettle.hash
index cd32ad442..14467977b 100644
--- a/package/nettle/nettle.hash
+++ b/package/nettle/nettle.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/nettle/nettle-3.7.3.tar.gz.sig
-sha256  661f5eb03f048a3b924c3a8ad2515d4068e40f67e774e8a26827658007e3bcf0  nettle-3.7.3.tar.gz
+# https://ftp.gnu.org/gnu/nettle/nettle-3.8.tar.gz.sig
+sha256  7576c68481c198f644b08c160d1a4850ba9449e308069455b5213319f234e8e6  nettle-3.8.tar.gz
 # Locally calculated
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LESSERv3
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYINGv2
diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 3dbd0cb94..7520fb9fd 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NETTLE_VERSION = 3.7.3
+NETTLE_VERSION = 3.8
 NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
 NETTLE_DEPENDENCIES = gmp
 NETTLE_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
