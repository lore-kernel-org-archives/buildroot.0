Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 191ACC25B5F
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 14:46:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A80EA608D3;
	Mon,  6 May 2024 14:46:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YpJEuE2q_-TT; Mon,  6 May 2024 14:46:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44D62608C9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44D62608C9;
	Mon,  6 May 2024 14:46:06 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B7141BF59D
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 14:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C4EC281E07
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 14:45:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B9eC6IOyve71 for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 14:45:59 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 75EE082024
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75EE082024
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 75EE082024
 for <buildroot@busybox.net>; Mon,  6 May 2024 14:45:58 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.65]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M9FjR-1s1X1v1VZf-006NXp
 for <buildroot@busybox.net>; Mon, 06 May 2024 16:45:56 +0200
To: buildroot@busybox.net
Date: Mon,  6 May 2024 16:45:46 +0200
Message-ID: <20240506144555.31709-4-ps.report@gmx.net>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240506144555.31709-1-ps.report@gmx.net>
References: <20240506144555.31709-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:EHIzcEfDGd2m7o0bJRsTRrnGaFgCmNsbK0TXMSCZlJf2R4mf+6F
 lgc5ZBCJg5Ou6ow6wP6q2K2NL0OhdqrQ2aJ82FqtniZDJTW1qYrUn+iyVWbgbMasdNVI7W/
 w4yWLpfbCshLT1vep6DYMM9PZ5MUeZ013KLdFBsIOT485PDs7WcsGGBwN0Sb9CT1ZEwgMtk
 J2huCn0uAT9b2kmicrtDw==
UI-OutboundReport: notjunk:1;M01:P0:l6U5v0TUJ4Q=;suZbzeCGK1K0FXAFLs1azY0RkKw
 wogmLtneecUHGT5TL130Eh/ymxdqIqfSeIt3wYY+FOS7TS4iJWCFMZq9uxk1mW+N2x4agPFF4
 89v1birK2ICLOCG5TdKDZ8gswRLumXDJ97gYdjCxeWPs+VS1D6VVY2+7eq7zV5AxN9UyyNNBT
 AlW8i3Cgf9rB58FypVoMmUkNyCc+aHNBMd/VIkZaTbrmCazCXeMOdmTEwhcChPGcu/iBvWbIW
 WezlvgneMq1Ad16QjXLbXvaFlQ27NVM0858flLDbeP19dC2O+xv+mqL5dR1KFJIGs9CUY1DjG
 q/2KSk/FEyplvydvKLlcisX7w+XCK+TdH71AKPmeiuiuMp8H0P9WEkimA8U9e4ockozAMvhYi
 2yaxdRD0sHwPMzO2Xu6mSqHZ7dj1AyYS26gMqysYZocv8Fnavkm75Dx3Cjh2HwYfBkypbE3PW
 +lUet1rybCzqaQgk/re3PDNiz2TKYr3FSukRoGtKXKWAE+J/nEJh5qyfiCcX4vMAUtkinzyHv
 DxBT++oNZuBbWv9RXDf/dg8agN+iFQtX04SJ58lCFbFKKbX0MnvQUqmrIeMg/qQDWRP11Oi06
 Bb32SK2irybBWozjlwdDpBT9EeJCmVtLGpDcMCuecU8FihhSS2GgLbe1s25JMKD4cO+Il9Em+
 xea30CDB/laIpZ5Obz4U2c6Oqoasco2enHhbdhOUZWlcofN6JhwRBy8e/Lxqc4FAF/LRN3IsT
 SIQrCXc0e+3Vbb83rgCb6oz1SGaGxR5XPqwSLf5FUUC6nk/Pt1cIXn7mt4tLw1uLzpNbxNiq3
 vB62jxgvVuw7FqQ4AaG3QBACU+VS3aAwOsg5AHvtCkneo=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1715006756; x=1715611556; i=ps.report@gmx.net;
 bh=aZdmbhg9iF9i3sXexmZqKfYZ+7Nux60M81fip+tpWhw=;
 h=X-UI-Sender-Class:From:To:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=sOWV3xnk3vTBhYdq6eAD/xGSM8mFVf6ePj5NwuRih98Iv+ygkDIF4wKOpiomtZbG
 rrQQcq1xO9T4YavnwkQJvnga93rL1MRXWgoXG+vqaEnw4YVg5i2weiihdQP7pSylC
 CcTc/VKV0L4K/YX2EiEO12AKzS/94hi31dfaLcAdqodnjKBeS0xhFlazvsM6DqtQd
 zjtgLaJDI68Ey3E8Cvng+KSp4BucnZ4u506cvksU/WLOQrmMCL+r9LkpkKP3Sevvw
 LhG3hxlGS+aU4BcCgLV+nXbZR2Zk+5UiaRPbj3CMC98FtGePovyKQwM3cCNOmTDq7
 s5OTrIm91o8Z1kOekw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=sOWV3xnk
Subject: [Buildroot] [PATCH v1 3/8] package/dovecot/Config.in: source
 argument needs quotation marks
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes the following error/warnings with kconfig from linux-6.9-rc5:

  package/dovecot/Config.in:36: syntax error
  package/dovecot/Config.in:36:warning: ignoring unsupported character '/'
  package/dovecot/Config.in:36:warning: ignoring unsupported character '/'
  package/dovecot/Config.in:36:warning: ignoring unsupported character '.'
  package/dovecot/Config.in:36: invalid statement

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/dovecot/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dovecot/Config.in b/package/dovecot/Config.in
index c94421526f..034dcc175f 100644
--- a/package/dovecot/Config.in
+++ b/package/dovecot/Config.in
@@ -33,7 +33,7 @@ config BR2_PACKAGE_DOVECOT_SQLITE
 	help
 	  Enable SQLite support.
 
-source package/dovecot-pigeonhole/Config.in
+source "package/dovecot-pigeonhole/Config.in"
 
 endif # BR2_PACKAGE_DOVECOT
 
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
