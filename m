Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7358C021B2
	for <buildroot@archiver.kernel.org>; Sat, 22 Feb 2025 05:06:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47CB560A6C;
	Sat, 22 Feb 2025 05:06:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nPttx3jfeVCJ; Sat, 22 Feb 2025 05:06:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CBF060A7B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CBF060A7B;
	Sat, 22 Feb 2025 05:06:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 85032F11
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 05:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 682BB4032A
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 05:06:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tdjabwJRdLnT for <buildroot@buildroot.org>;
 Sat, 22 Feb 2025 05:06:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.168.172.144;
 helo=fout-a1-smtp.messagingengine.com; envelope-from=iliana@buttslol.net;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 56C764032C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56C764032C
Received: from fout-a1-smtp.messagingengine.com
 (fout-a1-smtp.messagingengine.com [103.168.172.144])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56C764032C
 for <buildroot@buildroot.org>; Sat, 22 Feb 2025 05:06:55 +0000 (UTC)
Received: from phl-compute-10.internal (phl-compute-10.phl.internal
 [10.202.2.50])
 by mailfout.phl.internal (Postfix) with ESMTP id 478191380DC6;
 Sat, 22 Feb 2025 00:06:54 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-10.internal (MEProxy); Sat, 22 Feb 2025 00:06:54 -0500
X-ME-Sender: <xms:bVu5Z8s5duYJzpc5udwMPBX8T31xnibPeewG_4N7tvsdlFRRR6AueA>
 <xme:bVu5Z5cZXfFfySoyV_mP0_5HRWJzp0O1CLBFhrSwzONT1ExLySvKagnp5eUJznmvv
 UN07OBWbtjxRgvqhTA>
X-ME-Received: <xmr:bVu5Z3znNeq7mfuajpIEiyc16yyzNLUzdrIILqoTWhQaAoHENVvjqPIDrRK7aQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejvddtvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffoggfgsedtkeertdertddtnecu
 hfhrohhmpehilhhirghnrgcuvghtrghoihhnuceoihhlihgrnhgrsegsuhhtthhslhholh
 drnhgvtheqnecuggftrfgrthhtvghrnhepleetheefgfegjeefledtgedvveefveffueel
 udegkefhudekgfegjeeitedtgeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
 hmpehmrghilhhfrhhomhepihhlihgrnhgrsegsuhhtthhslhholhdrnhgvthdpnhgspghr
 tghpthhtohepfedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepsghuihhlughroh
 hothessghuihhlughrohhothdrohhrghdprhgtphhtthhopegsvghrnhgusehkuhhhlhhs
 rdhnvghtpdhrtghpthhtohephigvghhorhhslhhishhtshesghhoohhglhgvmhgrihhlrd
 gtohhm
X-ME-Proxy: <xmx:bVu5Z_NjIFraLouISVvj50vGUzYcSQtnVH2kwU1rsTSFVHXFcp5xDw>
 <xmx:bVu5Z8-k3pPltxSq_TZuKwSYoZd0ogUICP0LAjGZrUDt33tZHocA0A>
 <xmx:bVu5Z3XCmO-7FyScx2H4AV20xMdg8SqHsSOA0wTkTXqXTiu2a4skoQ>
 <xmx:bVu5Z1d7OW-Np1Rw_6iC9MXq1gkG6Z88nJihO2E04jBdoj1Q8mOvnA>
 <xmx:blu5Z7YhCW-S4iN0YXT3EQUVKmhAcT0iQQqilSOIIwHcnoYjsMHbW_-c>
Feedback-ID: i86d947dc:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 22 Feb 2025 00:06:53 -0500 (EST)
From: iliana etaoin <iliana@buttslol.net>
To: buildroot@buildroot.org
Date: Sat, 22 Feb 2025 05:06:33 +0000
Message-ID: <20250222050637.107330-1-iliana@buttslol.net>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=buttslol.net; h=
 cc:cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to; s=fm1; t=1740200814; x=1740287214; bh=29QRx2snz3lcakF42MvxT
 XzS7yhfGU4rBE+cElpznJc=; b=RcKAAxNJ+8i+IMfVA4I2gRcu1cnB9W7ilrKHK
 DcbNZf0QMwb+nnpnE32gKLfiXM5q6azqlaaz192ZNMLHJo5sLr3B4CSF+6n+rQQH
 zmwfCWPIyPZeHc1yoSkVAJXK/FkX/h8MgqLJ88oLG6rHf5NABh8sDA4LkAE9K7+h
 iGxgw16FBbTyb5zEHvGzRpMME2CgBV1I5zanOQSDafCiGGhu4Xt4RDhcn+RDyyce
 9ja17j+GXIPr2wQVZ+QJMY2xP9razpOkpXnrENyimaVtAxEEMsHWWjXP20w9iQoj
 asHMA9IUQkMbvAOCBgkPSNxUVT24tjCF8oNQQO0R3AEQnV8Qw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:message-id:mime-version:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1740200814; x=1740287214; bh=29QRx2snz3lcakF42MvxTXzS7yhfGU4rBE+
 cElpznJc=; b=kq/m79aX1CMpw+ireK9kuCZb7cODHv9tG3R1QKR/4f3NTcIhsSf
 D1G9CAJfPACT0yZPbPm3Xta8iW093KIQYxMyxa86i6wIvady+HRx11QLWljhKvoe
 z6V+tXpB7ZwnuWc4C6lCOWu4tsmExEBDH8HXv4BZlHRZeDVEvtsMzjJ4nA729lYu
 ykcWg1j4gFybv+xf/BRsWesZKtGNdyBpVZ7qSrvc0H4/7Evyp6MBk3RSd8nUYxiZ
 UO5Fagw3Q5gR74ai7FF5SwgrGgylviMgOYh0yav79kz7jhpFgWMqMqOCtBA6Ag9G
 s6HlxKWBtOBYtXb406p1mm/4AoHxxuQQb1g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=buttslol.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key, unprotected) header.d=buttslol.net
 header.i=@buttslol.net header.a=rsa-sha256 header.s=fm1 header.b=RcKAAxNJ; 
 dkim=pass (2048-bit key,
 unprotected) header.d=messagingengine.com header.i=@messagingengine.com
 header.a=rsa-sha256 header.s=fm1 header.b=kq/m79aX
Subject: [Buildroot] [PATCH] package/linux-firmware: add option for Chelsio
 T6
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Bernd Kuhls <bernd@kuhls.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add an option to install the Chelsio T6 firmware files used by the cxgb4
driver.

Signed-off-by: iliana etaoin <iliana@buttslol.net>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 4630252c5e..af36b8a6b1 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -570,6 +570,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T5
 	  Firmware files for Chelsio T5 1Gb and 10Gb ethernet cards
 	  (cxgb4)
 
+config BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T6
+	bool "Chelsio T6"
+	help
+	  Firmware files for Chelsio T6 1/10/25/40/50/100 Gb ethernet
+	  cards (cxgb4)
+
 config BR2_PACKAGE_LINUX_FIRMWARE_INTEL_E100
 	bool "Intel e100 825xx"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index e73d688592..fac5733ad4 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -647,6 +647,11 @@ LINUX_FIRMWARE_FILES += cxgb4/t5fw*.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T6),y)
+LINUX_FIRMWARE_FILES += cxgb4/t6fw*.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_INTEL_E100),y)
 LINUX_FIRMWARE_FILES += e100/*.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.e100
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
