Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B51AC30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 19:41:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3BD684725;
	Thu,  4 Jul 2024 19:40:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3HJhMxmUHIz7; Thu,  4 Jul 2024 19:40:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B96E584802
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B96E584802;
	Thu,  4 Jul 2024 19:40:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 996D41BF2C1
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:40:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8439384725
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:40:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J3JlucWkcQMQ for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 19:40:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2703A8471B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2703A8471B
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2703A8471B
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 19:40:41 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.161]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N2V0B-1sHEcq3yGt-00vaFW; Thu, 04
 Jul 2024 21:40:40 +0200
Date: Thu, 04 Jul 2024 21:40:32 +0200
MIME-Version: 1.0
Message-Id: <20240704-tipidee-v1-6-5ef0942b2025@gmx.net>
References: <20240704-tipidee-v1-0-5ef0942b2025@gmx.net>
In-Reply-To: <20240704-tipidee-v1-0-5ef0942b2025@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720122036; l=1047;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=upGceXk0bvcrgHflrdvOUFKW2DsYfaecjxTCdP/ewm8=;
 b=Ul9l57fw3sDSs2d/ZOLSys3fcHeIiAkO/Sry3qAn8JVcn1OV8MDqLHZvyeLMspDmORtuHTHWf
 +pOf6Qb6tFfAySq3GbT/ai350AW7jHbfUGrk8QH1FJhQXVewVEHTOzZ
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:5dHzlXM9jj2Vwv3ukTCoivprS9xL6m1hzSQMOzApH1CNtwHgS2H
 KA3FkilcFDRNSDFeaDx1Q6L0DUP0ZXMw2ccAiE88mWgUT0quLqCgZoFXuOiZ7GKEgJJ1E5l
 FSgWLcE9iNbu8sRoQ3/NpfVFVYH1uegjEj3kA+w8EVvg1KZs/rxFOKI9whjyBaU5dh+CcoO
 Txj7Io8lc8OnyBVNU9/kw==
UI-OutboundReport: notjunk:1;M01:P0:aTlesuW20PE=;p0Hv7MNR2mkvGw1vL8bW5kZnePs
 Hyd6ukx2pzvOCsBpYiTcT3S6KWPYzCEvUCAE4jqShCaE2kLeUBm7D/YYIqIkQsixdiMBM+NSn
 kXmkUo2uvveqO9v7mxmdv3BaQMV+neyWC+US551cbXmmpX6LNPEYRtF7g/cMra48atL5PYbHm
 jZOs4niDyYBkBMxcbUwb7fiLaSIjs86yt4G75EofJA19z+lODewo7oNIWlSUqr0aaub+CTexP
 GnM59D1oK4VmPMxENMq0M/yhLklyuffanYussmb6YHLg9Bf66RPaAlwHUy1k8RGh2YZt2JG2t
 X1MGrKiobfpR55lhd/MKwx1w5pJOLG2/Es6Y+mHRV0Wlao3XmwdCD669Am51FhlqzTybqMRgw
 2Yks7dBu3rgmVDn4ETb2ROROm429qJJtOZjRURtHYxwvZxsv0+erzwNvfC1eytyV0fkxBTPG8
 WHYX52HTFIFdiMxbStzFzoW2C4W1+DvfGgpaIGb9Iu4qFGWQI3Y+9ANtBVImMX2bCi7ffZuUD
 Y1wCVqZyq/+d7aniFfFHXPE58HqDlylavdk40RX2d0Le4v8t+At2jelRyY/9W6gjeZ5qAngu5
 LngtE1kpMwCalrK5ve9Kn5hfgyxz5BOfDiyXr0HDMktQSSd2S0Uul6JPmcQDf4fOeeh7x4eqL
 BTFVmQfXtWNoor3sB4hgewawhfOID7mpF1y7PrXUWbvZpWKlD6jwHYm2yyy55C05pWbsUu7XX
 QyrD5UFKIdykubZ0cvyJ6WEyYVtQIwyA4KwvIVMOv7OGoRdTT7otS8GXz2+hAMdVgkJ9/UeXY
 AoDhitGyGD8SIP7IpBHxvbzEqHTejaYR19Gw1c/TCYXeQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720122040; x=1720726840; i=j.neuschaefer@gmx.net;
 bh=QTQeIiRaAAKXJtpv+8qmaiesbYUGEkyF4rb82W6/Wpc=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=YFRbCPBLDAFtIr6M0Sparg3SFsH72gaMfBY81uJAOFTmymZxTex/vLa6wYGYdzhS
 PP0XO1ihR4Ql0NADm8v1wILpWyUYGA+BRANa5/2RmmfQTLLtKpGq2npMAAVSmAa2J
 ScK5vMkdw40noeVfMwrq2enNl2Sh2rl8wrlUKtbNmom8TgJyBk+grGdGW7KF6x4U7
 QXqXYMbg7RCRQqKoSHQdVHMpukffdsiDP5IaHHaSuUIFRUUGv1Y/iRgn2+GQS0xl5
 9Vhxoryh6l7pfIgmKpjAE+ZYz98NhxGR65+9ploNHgeLw0v+gbQYpe17rP3TWxt2L
 y2NLAZaUHqJU01okFA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=YFRbCPBL
Subject: [Buildroot] [PATCH 6/8] mdevd: bump to version 0.1.6.4
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/mdevd/mdevd.hash | 2 +-
 package/mdevd/mdevd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mdevd/mdevd.hash b/package/mdevd/mdevd.hash
index 9436ed8b01..daf2f48c04 100644
--- a/package/mdevd/mdevd.hash
+++ b/package/mdevd/mdevd.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  f6ecf0ef7cd48d04efc75acb2dad967d850bc8815bdb0098f1c9ef043394d430  mdevd-0.1.6.3.tar.gz
+sha256  7358ce530b6b9befb715e48190981e9b69a12cca858519e6d2e4b46eab7e2470  mdevd-0.1.6.4.tar.gz
 sha256  b2edd59a202a710440522f05dcbf418b0493540120efcb407876772ee42d2c7c  COPYING
diff --git a/package/mdevd/mdevd.mk b/package/mdevd/mdevd.mk
index c92659d961..a1d9e17cef 100644
--- a/package/mdevd/mdevd.mk
+++ b/package/mdevd/mdevd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-MDEVD_VERSION = 0.1.6.3
+MDEVD_VERSION = 0.1.6.4
 MDEVD_SITE = https://skarnet.org/software/mdevd
 MDEVD_LICENSE = ISC
 MDEVD_LICENSE_FILES = COPYING

--
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
