Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CF36C678D4
	for <buildroot@archiver.kernel.org>; Fri,  3 Mar 2023 12:23:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 024E841199;
	Fri,  3 Mar 2023 12:23:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 024E841199
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7PFbUf7BgpRE; Fri,  3 Mar 2023 12:23:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 45D6F41195;
	Fri,  3 Mar 2023 12:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45D6F41195
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1BAE81BF239
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 12:23:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 770914118B
 for <buildroot@lists.busybox.net>; Fri,  3 Mar 2023 12:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 770914118B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k5MNKPQF_vUz for <buildroot@lists.busybox.net>;
 Fri,  3 Mar 2023 12:23:01 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 901FC4118A
Received: from esa6.hgst.iphmx.com (esa6.hgst.iphmx.com [216.71.154.45])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 901FC4118A
 for <buildroot@buildroot.org>; Fri,  3 Mar 2023 12:23:01 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.98,230,1673884800"; d="scan'208";a="224726813"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 03 Mar 2023 20:23:01 +0800
IronPort-SDR: NaN/v5me1RscMrGttjX+GYmsXHfoG/s8qfwLym+Dsh9CBzKTXwP3gKT9oys1wKNJLuEbkOs6lR
 gkwoTbVoKyI26YjEM1i7FAgQz96PZU/9/VyXggK0p4l306caxitCJo1dO545VNjVX1+LGe2hh/
 sRWBZkT71LVXDOngf1YpsrbrjOaf8pzaT7h//sA0C4eIRacP5FL1WaUj7hOUG1HPZqeVH6oyuF
 F35R8Z6RueJuXqyLufkTOuQ2+8V2T1c1vjZMH4jq4BW0EN+dgjX7UMbiFk0mt0styisYQYOVG6
 5GA=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Mar 2023 03:39:45 -0800
IronPort-SDR: yV9CMlhIbCjkCa0n3FHYBK3Lz1YH70ORzfogF1aVvl/NQTeCah2Oi4sMzOOCWH/TqJxhFbouku
 KQ2xCcyIc2ZxMAXFUNOAjroY1cvMJzZNQmUzIgdnOdS77XHg0+XpFE+JekI5JL6yRC1ABMxswf
 nb4+Z8cGL0cs8ZgHbdKbl+HFiha2ymGQy6fFgEFZeMukNd3J1Hxdvo7/GBtVyT74PdI9Sha0ra
 vcriym/shuuuke3yfVHF1NrWG6Bnp75U9nqJZmj0Xc+hXWydz9Rg5JXSwHpWfvtfJW804+V0WC
 IMQ=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.lan) ([10.225.164.35])
 by uls-op-cesaip01.wdc.com with ESMTP; 03 Mar 2023 04:22:59 -0800
To: buildroot@buildroot.org
Date: Fri,  3 Mar 2023 13:22:50 +0100
Message-Id: <20230303122251.3392998-3-niklas.cassel@wdc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303122251.3392998-1-niklas.cassel@wdc.com>
References: <20230303122251.3392998-1-niklas.cassel@wdc.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1677846181; x=1709382181;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3/4hqsEqII86Q5yPAfSYzh8AyXUQOHb8FHL2kMQkJTo=;
 b=VXnQ3uVLX47e+la0mzSDeOpOJgdajjxEKguVkEJxAbmUa7UpnIUGATFX
 ASYIXOIfbX8zBC1cQl9u2R3Dz0rsH0AWU/n1bPNoUbqKc9nCRgopvrnEo
 +YBP+fYZF+DC+C88yTpnzEVtUplxyz3krxnHlOW4RNDxO5Z65CWy2zBZw
 3Yt/ZWOjIg8v8rkjr4DYgNwXBoM4dau2tXMCmClCw/pV5A+v/L8HRfMj2
 iZGtOp6wt8KxRjEv4uqNVRg85PJbdQejr8u0WLL9+WBjh0R9hDcAQzN+h
 czSFqklcV4eqy0CKrq62xVlCiyJOcAsNRVXl1+ZBM3Mzr4LpLUK16gnOx
 Q==;
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=wdc.com header.i=@wdc.com
 header.a=rsa-sha256 header.s=dkim.wdc.com header.b=VXnQ3uVL
Subject: [Buildroot] [PATCH v2 2/3] board/qemu/aarch64-sbsa: use the default
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
