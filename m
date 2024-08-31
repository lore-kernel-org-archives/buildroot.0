Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71329CD13DF
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 19:02:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 69318419A6;
	Sat, 31 Aug 2024 19:02:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x2qpQumf6UuQ; Sat, 31 Aug 2024 19:02:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0FE4D405E6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FE4D405E6;
	Sat, 31 Aug 2024 19:02:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A406C1BF316
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 19:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9E9CF4026B
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 19:01:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7utcqqP84Lly for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 19:01:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 32B08400E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32B08400E4
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 32B08400E4
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 19:01:52 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.123.38]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MwQTF-1ruZgm1ho5-00xcDA; Sat, 31
 Aug 2024 21:01:49 +0200
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 21:01:25 +0200
Message-ID: <20240831190126.366600-3-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240831190126.366600-1-fiona.klute@gmx.de>
References: <20240831190126.366600-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:4Sx7+UbIilHxRB1W6F7ZKHwl+tVcJBxda1h2kRE4wtWVESlmLtt
 fggJseMI8M8xNX9dY1IcmwidexwEBfumrVnMFWYISRnFfv8P8PEJV/B9sT15ysWY8PxsdiY
 OH78fdys1Il4vjiShTxyjvwGBTOu3lizPf8J/KLZBE/6JNczX210mNkOAIz+xl9MOtuR7GI
 TlcT5pKH7tbV33ZcGRLkg==
UI-OutboundReport: notjunk:1;M01:P0:2snym1W3meI=;0Iy7/0qJ3aSZ3kgnyNq1z8X1ZLq
 Uh/C+PVxTZ+gn2E13Y6UDKq5Y+sJHRHIAAEE5RcJp84Kaejp48xy5sB7JNp5F4cw6D39PyTpH
 rGCKyh5EbYQCyxsZVsn48VvEJw7rxyRuy05Ak95SQthO8KYbNkljQNqONhkT9dNog9ZIh/EJj
 LUta3M7esNspBft/PXi4GFWFk1TR3BQUvt05ozIYv8LIMeanZb0SsyaCj6zZY3dLx70iucBWD
 gLTCvPsxIib02+ePqsAswDqLEidndz58m8OzB1qiWeRTl7S419qvczzgEBK/9Vsz+zLMdaaEv
 rPqiCKScGKTzmbBxatvToNroL9ClB4RCG2qXfAZ/JItpiSMEDqKTBrssIYGD+mXNejSNFGlF0
 tdR9m4IU/EpV3dRklnADxZ/m9pu0hYCoK1s1Fs+ymNPzLU27rbQ63NGj95Ogazm2howp1ZYFu
 CkzbcVIE66XV03YiBOhtCS4lKYpED4Fi3hdC5dIX98UW55Ys4f/+6sxOtdLpir5WqJWmY9Mbf
 ELo+W5XCDkdz5hBxv0APH3v2edgv/FSiEDvoXToXgjYszESzhpjTlDggx/DFmLohfCtMYiNNi
 U7+zmYEMJbWBglI0dQDz5wQ6fOpTxuWGYFOTBuNlcfrPnoxIem8QEbolr927lebyKiuipFPOh
 dIIF8Ui84tnHMRo46Ioofl+/uLmrnNheEmGxaW+kIlfpttcx52orNY+/8NcfaSvQO+bTUyz93
 MJ7GrmSXkEha23vCEWOMCCQLPx9ucEFRmhfcIsk4X49xxfwIGcz6A1xhK1g/Fy8NaaxY3Ick4
 P0CoqKyDfB5/XVkXao0qgH1Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1725130909; x=1725735709; i=fiona.klute@gmx.de;
 bh=bQjLBLiaBIrqpCsl+dORmGPJlCVZ2fProFo6u4MhRMw=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=QmDi74sx8yEgQ9/e0TOgBkMHIrhhvdypuNa0NTN/S2WtQrMh6tVVuTz/k6QqGDuQ
 pt9Expq7wmcnC09xrJFZlO3Uwt1RHHfSLFZYg+KZKf/NuJ2+WGXVmtYK58kQM+nSl
 b6yUerxD4QGg9sNd0AsG2CiBBYx/S8rtkShqpT6JCvM5fT9hb14EvwqyQ0KPEOzH4
 JELoNYjW6TDaB+AVtaBZU8PHlcePYFWU6bNtftxKI6ElWfFYjCV8l/Pfv4Arh3/ZC
 naHXGnLgK1nu1SWBlO8zPIODB1CsEXFhCX/+0I5GgBdfa2grFzk3B/CnNy1MFfTq1
 k6ePalaO7zgBdMLIkg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=QmDi74sx
Subject: [Buildroot] [PATCH next v2 2/3] board/raspberrypi: allow
 non-matching globs for DTBs
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 =?UTF-8?q?Jos=C3=A9=20Mendes?= <jp.baltazar.mendes@gmail.com>,
 Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

When installing DTBs from the rpi-firmware package
(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y), there's no DTB directly in
the images directory because the kernel build doesn't provide one.

Using pre-compiled DTBs is discouraged, but useful for using mainline
kernels until suitable DTS can be merged, or to provide U-Boot with a
DTB (via the firmware bootloader) independent of whatever kernel DTB
is in use.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v1 -> v2:
* Check for existance of paths returned by the DTB glob expressions
  instead of changing shell glob behavior

 board/raspberrypi/post-image.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index e4611d05dd..a3a2d8d620 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -13,6 +13,8 @@ if [ ! -e "${GENIMAGE_CFG}" ]; then
 	FILES=()

 	for i in "${BINARIES_DIR}"/*.dtb "${BINARIES_DIR}"/rpi-firmware/*; do
+		# ignore literal globs that didn't match anything
+		[ -e "${i}" ] || continue
 		FILES+=( "${i#${BINARIES_DIR}/}" )
 	done

--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
