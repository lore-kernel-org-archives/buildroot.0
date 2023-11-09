Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2D71C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 21:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 98CB2420A3;
	Thu,  9 Nov 2023 21:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 98CB2420A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id u3Tf6WQ_pOJV; Thu,  9 Nov 2023 21:29:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E751642094;
	Thu,  9 Nov 2023 21:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E751642094
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 088941BF995
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:29:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E365A420A9
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 21:29:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E365A420A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r4BlFJPyhhT8 for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 21:29:06 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 988BC42088
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 21:29:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 988BC42088
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.114]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mr9Fs-1rnES01s7q-00oIUT; Thu, 09 Nov 2023 22:29:02 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu,  9 Nov 2023 22:29:01 +0100
Message-ID: <20231109212901.5596-4-ps.report@gmx.net>
X-Mailer: git-send-email 2.42.1
In-Reply-To: <20231109212901.5596-1-ps.report@gmx.net>
References: <20231109212901.5596-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:gPyzvnwE/bycWNLd1Koo0l50WvKDe4LI5KIETcyUdHLxpaatxTF
 WuPhZGl1zJvIOJYD8IJyRDiGMxW0jghoAkF2hDxDfTlOByvgHuIRNC1IGWwo8OjssQH8qMX
 BY3erKP4hLxKVwnpxXTDmoY/mspNJNR9rCkmb84io1ukpb5ZbhwavtKUfi3ffICl291/mbC
 1u67ip4rmJWltA9oXGlxg==
UI-OutboundReport: notjunk:1;M01:P0:oHl4haBhzZA=;aYP75FtQ2JfDTH8u4o0xFKqrWzx
 IOSgb8zejMp+rhYke/sFBTpDlMF6VD+jx5eOWIyDF+o1/ud7h+7xqDMLQGncsiX5pDIvg6AR5
 PckfF8itR2R8fFTkfQmnrFkNstAMXks3IDeySFWJTjflgl667kYpEmRGuuAHIm5U97vhiUE0q
 4OPkblw735wbUx2ys+vB0WSSKiCBBMaTCEMCLMdWZiHhR+MwKVotTil6DNYjN9hukKwi1HJDL
 aTUCYKECasm+Gh+KFCi4iiG5QhGExdd9r4qJsXWFByg2D4Ww6UhQvZnilw07vkfDY4Hzu3/lo
 2uTaTydmGgbKc2AJ5AQgmo2/JGVxoLHhREaoJNfxz7z+5i77x6zS4hTjhaiidUCZKpe0h6mnE
 4s1F6I+eXWN1KgidfR9oUaHxkx4Kh1YrPLTbXfhWkRR70r+5ztMnbVig/e9QsIzr/mihVfNsq
 PtGKfHU7qR26susxq2BrjC5HrsmTOFgXzuQnuEhkay7eRNU8Npq1Ivcvo7HE1l0QZUfTFmCLR
 8FQqWD/NuOVmK3Aqh+ZhWVedVgvgAZ+L0qw1i3AyvFGdHtSRMWnxoG8CmzYYtfmacVHJflDkr
 wqiGVctn8LChwVp6jEwHjcDiatuAQtSsdagbiKePpFM7KJ5f7+vvVkMw4BLynaixNBVobX9lQ
 hJJoJ4f9BO5izRiCgcTOKnwPc23rA9UUtNyJRsKI+fA4xMU6a+ci50LHoeVbJGGRj7t1GNTDb
 MdYOM5qyegePvrB8ojm6lWb/gx4xDfyGMliJdLhAF81Sz/jBeoF0nyi29GiQ3FErw+T/0JCLx
 03HSYDubYIa6Bt+zHG4GAc2UgSUbVKmhQUkjKA/P2ONpkZIZjNqeKoOW5FxzpCVdM05YXLs+4
 xj7us4IFfMF4t2V4XSiECnTYs0kM2egKA7BmX8K/eNjMReQGfwhwG4oHpYNDX98bVDcXfydH4
 I/urnFwKP9xnnOiVivjf73lMfh0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; 
 s=s31663417; t=1699565342; x=1700170142; i=ps.report@gmx.net;
 bh=pmqWK3iP4aQyB/7RODZJa6+BaT1IakMbfxJ67DFv4Js=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
 References;
 b=diDJ7Zmd3b7pYHFziWR3AVZWOJbxPDc7PB6kZcmBeM5bk0Vo0WOvsVjkWoPgLMuQ
 kQ7jNchq2geJIA3rmwZ8yzKl1GjQQWedjwklTP2l828FfefUVOIHNj0zmJHjcE7n8
 Qh8bEqCU7de/5iv9QkuMdu+/QDNh1N+aF6/hhnkWIlYbWrsWy8/zmJbU7QOMnUVbU
 YDRxLfdPzl738ghATS6PQ+jQOe472TIVdysdN1nWSA5IJBpYAvIKxgH0pKmOB9Pt6
 JFss5hkHh8Bf6ytCVaag5uIejWknRq65ofJRI1wxBDMvrLhsQs/2GKr2Lc0GiNV6n
 FlcI02yobikHLqFzLw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=diDJ7Zmd
Subject: [Buildroot] [PATCH v1 4/4] package/libcamera: add i.MX8 ISI
 pipeline option
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add i.MX8 ISI pipeline option (introduced with upstream commit [1] (since
version v0.0.1).

[1] https://git.libcamera.org/libcamera/libcamera.git/commit/?id=0ec982d210861cc6aaebb5d6e8f1a755a16c9792

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/libcamera/Config.in    | 7 +++++++
 package/libcamera/libcamera.mk | 1 +
 2 files changed, 8 insertions(+)

diff --git a/package/libcamera/Config.in b/package/libcamera/Config.in
index 65d5fb37f8..ccb5281b4b 100644
--- a/package/libcamera/Config.in
+++ b/package/libcamera/Config.in
@@ -33,6 +33,13 @@ config BR2_PACKAGE_LIBCAMERA_V4L2
 config BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
 	bool
 
+config BR2_PACKAGE_LIBCAMERA_PIPELINE_IMX8_ISI
+	bool "imx8-isi pipeline"
+	depends on BR2_arm || BR2_aarch64
+	select BR2_PACKAGE_LIBCAMERA_HAS_PIPELINE
+	help
+	  Pipeline for i.MX8 SoC ISI capture interface.
+
 config BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3
 	bool "ipu3 pipeline"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/libcamera/libcamera.mk b/package/libcamera/libcamera.mk
index dd31d90e98..c9af90f35f 100644
--- a/package/libcamera/libcamera.mk
+++ b/package/libcamera/libcamera.mk
@@ -51,6 +51,7 @@ else
 LIBCAMERA_CONF_OPTS += -Dv4l2=false
 endif
 
+LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IMX8_ISI) += imx8-isi
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_IPU3) += ipu3
 LIBCAMERA_PIPELINES-$(BR2_PACKAGE_LIBCAMERA_PIPELINE_RKISP1) += rkisp1
 ifeq ($(BR2_PACKAGE_LIBCAMERA_PIPELINE_RPI_VC4),y)
-- 
2.42.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
