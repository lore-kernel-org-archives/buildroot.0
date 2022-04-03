Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E421FC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 18:54:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BF6460E29;
	Sun,  3 Apr 2022 18:54:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MFqblAgUcVC7; Sun,  3 Apr 2022 18:54:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 923F7608A5;
	Sun,  3 Apr 2022 18:54:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A47631BF36E
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 18:54:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A0BC041477
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 18:54:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id S5sNPcYGrCyk for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 18:54:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 68B8741298
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 18:54:52 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id h4so11389448wrc.13
 for <buildroot@buildroot.org>; Sun, 03 Apr 2022 11:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n1FLnfVrZZdgPvKvhAYtngzH5a0PRRzWAUgsXkoVXLk=;
 b=ZP2RZC1CzqCrbYmwTxXQq23O2gTEX44+cjZGcSrUPkrR6TTMQHkP/imysA6FcYSXMK
 hiWPXhfXyfjTcCqI+dOWRC2Bkh2F0arMzFr2gjfjR1Nc1/grkpnmsXelWoEp9PKc5hdA
 yQvykG4hcv598mFV/jv1a+2Yl292Ak4y7EhH+u6LhS5Ts8oh3kMyUmbSME32tqGutXf1
 AyQpK3dsWZeDeod1lO0RjUvAhmnUOcoSQTyt6IpKGfbCefjym2Nh27JAi5g+UiwWGn/w
 5IlI8GeJ94UC0bFEHx8wRrXRXDJrkOdCXzbLlbYmc81S3PnYWavxgYM7PZwc0ETgZj5O
 UaEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n1FLnfVrZZdgPvKvhAYtngzH5a0PRRzWAUgsXkoVXLk=;
 b=Jo8Qm2hVe6ll/m6noJIKcTnUUP3ws56To3UR25KVpYkTVvjsuRtvq+KTo3DAuwb+K6
 Pb+GTM/nIcoxqAfolE8QzTgBepd+A46i6y5S5QPPOoT7pICUHcswKa3Cq1rQFejjBP7h
 G3ecEDqqt7K/yLQuZPcS4oApzQytswgNV3VVBmW0FQWN6MvWOn1o2Z8xfcBwB/g2pCQa
 KLmk8HxzubuJTjVr198JFrWdi6rVRaV1BCgML3ZBOwLg00znScMlNlGrd430Plrea6/i
 76IuALiGR0rxo6SWXOXvHoYTxV4YN6e/RZTDBDVBrkYA9mU73gDsn5T2UBLEU7cajRce
 ZLiA==
X-Gm-Message-State: AOAM531rUyImuCZbVV4l1bJLBdZJAB8c2ShFLc/6wey7d0+1f++x0kCk
 3ivA5tTEcogLzVT00ThjGrwPTg1boFk=
X-Google-Smtp-Source: ABdhPJxBWSj5FbhI9qSFnup+GE8v/r6z7eBHLrMXOVWouRuApWrkEv07gB3pKO0nBo+kR/4XtldpXQ==
X-Received: by 2002:a5d:59a5:0:b0:205:c33c:44ad with SMTP id
 p5-20020a5d59a5000000b00205c33c44admr14620184wrr.103.1649012090176; 
 Sun, 03 Apr 2022 11:54:50 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 r12-20020adfdc8c000000b002060878f735sm4011328wrj.65.2022.04.03.11.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 11:54:49 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  3 Apr 2022 20:53:06 +0200
Message-Id: <20220403185306.928833-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/fetchmail: fix build with libressl
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure with libressl raised since bump to
version 6.4.29 in commit ba6fd52195f2e3d0b04baae40cfe084226824d31 and
https://gitlab.com/fetchmail/fetchmail/-/commit/340d00bf9910ed55163be26435f70baf65a64f9d:

configure: error: fetchmail cannot legally be linked against LibreSSL for lack of GPL2 clause 2b exception. See COPYING.

Fixes:
 - http://autobuild.buildroot.org/results/95ca66091efa0dafb7c4e8e8c7da1f929ef32d76

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/fetchmail/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/fetchmail/Config.in b/package/fetchmail/Config.in
index a4bf5a7c20..1017df34b2 100644
--- a/package/fetchmail/Config.in
+++ b/package/fetchmail/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_FETCHMAIL
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_CA_CERTIFICATES
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL
 	help
 	  Fetchmail - the mail-retrieval daemon
 	  Client daemon to move mail from POP and IMAP to your local
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
