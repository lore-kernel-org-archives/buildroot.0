Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C14DC678D5
	for <buildroot@archiver.kernel.org>; Tue,  7 Mar 2023 09:35:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA11061049;
	Tue,  7 Mar 2023 09:35:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA11061049
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TzACfE7dbbBf; Tue,  7 Mar 2023 09:35:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E07EE61034;
	Tue,  7 Mar 2023 09:35:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E07EE61034
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 246A91BF255
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 09:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF87360797
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 09:35:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CF87360797
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4uUYEn7rOyky for <buildroot@lists.busybox.net>;
 Tue,  7 Mar 2023 09:35:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E18966100A
Received: from esa4.hgst.iphmx.com (esa4.hgst.iphmx.com [216.71.154.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E18966100A
 for <buildroot@buildroot.org>; Tue,  7 Mar 2023 09:35:18 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.98,240,1673884800"; d="scan'208";a="223280791"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 07 Mar 2023 17:35:18 +0800
IronPort-SDR: fA6TkVw7qlXJiKeb40BhroExTkTyn7aLb4uJo7OodtW4YDvlt7nlv+iM4weuCDSvRWm5rlCQLS
 1ebWkC43CiaawLYeHJPDGsXmFG4C+YukTO2o1I+mMJ3lD3Wjyz95k1aCxra2RzEkmF1Ub2iq9C
 ZKbvE+umJHxbSn4VeINlkjPEpi+EVvA6JLg7x1a8Idj2s2pKA1QjwDmRVSUszmPCAKPwMs23+3
 ql5CMBu9LCHvHhFBdydZn5tMfKEtikvqQIuIlcTtVnC2XfjdnnAp5OpjHL+XNcil5mK+f+u7ej
 Sps=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 07 Mar 2023 00:46:16 -0800
IronPort-SDR: me+oq37xO+YevN20JkV/3d7kiQKRyAFy2kIjvb6GuolH2otgEZtDxEasXYD1ksb8puUC5tL0kt
 FqoZ0pSxjztkALZ0J0YX5sNfDFBY4ufVcqDvBlxudPD4C/lTwcVJnugW0l9eP3kBuC8phY5R8/
 2peZI5Cdaa3ypUN6qgOc9QEBPHCR+6uDjMi5uwpwpvbCvhJKHc9NFNUD4IM/kqjPYHjyUsWAr7
 Q5siyo59s4dytmAzXO4rP9GXReRQ80uyzkcaPxZlsVdgsC6fr/AP1EHEgfvqXscM+4g1XoAJ7t
 AKU=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.wdc.com) ([10.225.164.41])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Mar 2023 01:35:17 -0800
To: buildroot@buildroot.org
Date: Tue,  7 Mar 2023 10:35:03 +0100
Message-Id: <20230307093504.3611941-3-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230307093504.3611941-1-niklas.cassel@wdc.com>
References: <20230307093504.3611941-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1678181718; x=1709717718;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3/4hqsEqII86Q5yPAfSYzh8AyXUQOHb8FHL2kMQkJTo=;
 b=FhGWsALEB3rmrquVi9yzPOxSwhm4shMwnsnt6sorl3xu5aTqGyMmBLBl
 KxXzkCadVHkiQQuXdGwj2VUAa229QYO+sqUUhAthEBFmAF2oxqkKn3Whc
 +xkH/JJRvjUeYcKhIBC6mP+eF0e1G95mo+HBCgmQXiOJcQAFFcEcuPL3W
 vof6Oz4l4t9DsFRD1CJaIjHZgL9HC9cwf2pgvm75IPFxqrSnxzN8m2XqD
 Y72xserWP9EQfwLynyQJKsLaMzL/GwzhGGICCdIMPxivT0funmV4Q4hzX
 9/85b/j3mzsMIDMrNnEsO7zvU9wagsp0a6hAWC2M7mSGn/DBUZvftzxCS
 Q==;
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=FhGWsALE
Subject: [Buildroot] [PATCH v3 2/3] board/qemu/aarch64-sbsa: use the default
 console specified by ACPI
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
From: Niklas Cassel via buildroot <buildroot@buildroot.org>
Reply-To: Niklas Cassel <niklas.cassel@wdc.com>
Cc: Niklas Cassel <niklas.cassel@wdc.com>,
 Romain Naour <romain.naour@gmail.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@arm.com>,
 Damien Le Moal <damien.lemoal@opensource.wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ARM SBBR (Server Base Boot Requirements) defines SPCR (Serial Port
Console Redirection Table) as a mandatory ACPI table that specifies
the configuration of a serial console.

In the linux kernel, ARM developers have decided that consoles defined
by SPCR are always enabled when existing, see e.g.:
https://lore.kernel.org/linux-serial/20200430161438.17640-1-alpernebiyasak@gmail.com/T/

Specifying console=ttyAMA0 (which is a serial console) is thus
redundant for an ARM SBSA board. (It also blindly assumes that
the serial console is on ttyAMA0, which might not be true.)

Drop the explicit console=ttyAMA0 on the kernel command line,
such that the kernel can pick up the default console defined
by SPCR.

This is similar to how it is currently done for
board/aarch64-efi/grub.cfg.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 board/qemu/aarch64-sbsa/grub.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/qemu/aarch64-sbsa/grub.cfg b/board/qemu/aarch64-sbsa/grub.cfg
index 39b7842f8f..d99e19c4cd 100644
--- a/board/qemu/aarch64-sbsa/grub.cfg
+++ b/board/qemu/aarch64-sbsa/grub.cfg
@@ -2,5 +2,5 @@ set default="0"
 set timeout="5"
 
 menuentry "Buildroot" {
-	linux /Image root=PARTLABEL=root rootwait console=ttyAMA0
+	linux /Image root=PARTLABEL=root rootwait
 }
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
