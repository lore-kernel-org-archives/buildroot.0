Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19736C001DF
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 14:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89F476113C;
	Tue,  8 Aug 2023 14:32:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89F476113C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dDGcO-d1V0eo; Tue,  8 Aug 2023 14:32:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 91C816113E;
	Tue,  8 Aug 2023 14:32:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 91C816113E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E1FF11BF398
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 14:32:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFA06416AB
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 14:32:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFA06416AB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q6cEXl02JKWK for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 14:32:53 +0000 (UTC)
X-Greylist: delayed 478 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 08 Aug 2023 14:32:53 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 50628416D1
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 50628416D1
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 14:32:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id 3D290FF805;
 Tue,  8 Aug 2023 14:32:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 16:31:15 +0200
Message-Id: <20230808143115.290604-1-clement.ramirez@bootlin.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-GND-Sasl: clement.ramirez@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1691505170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Vg4uko/57KX9U4HSlR74hZajgztwdTRFXhxtcHSKUoU=;
 b=idaWQ/XDy0n8edMJsjaVuiLh/BPT9PUaDzH/uXvMJac/rBFkgeRmbr+hx8vWTi/GxzBOUN
 9/fFL5EDoexn0LnoimvdT35jSMu1E5woPPQmxUYqzhqQNSSz8UcXPZQdrWNt4ZlzyTfyPE
 txHCqDJmkG5i4DIqVGc09dXGTqTQ5N9G69eHDAUCT2+YP6f+gV49ziJH4EloJrf1aBdAK9
 4kc4nCJjtAqwgvfvA57WhhIJ2r1gJI3VgTmQIJ7DkrA0Aoh3MEJJEIwZy25P7Tn2OIf9bQ
 HAUerFWHXteXDKEV2OitEf2i36Pub6aPh7IM0x3VSbCZwvSqE2Wz9828p+kPvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=idaWQ/XD
Subject: [Buildroot] [PATCH 1/1] package/chocolate-doom: add VENDOR AND
 PRODUCT CPE IDs
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
From: =?utf-8?q?Cl=C3=A9ment_Ramirez_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?q?Cl=C3=A9ment=20Ramirez?= <clement.ramirez@bootlin.com>
Cc: Rodrigo Rebello <rprebello@gmail.com>,
 =?UTF-8?q?Cl=C3=A9ment=20Ramirez?= <clement.ramirez@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Y3BlOjIuMzphOmNob2NvbGF0ZS1kb29tOmNob2NvbGF0ZV9kb29tIGlzIGEgdmFsaWQgaWRlbnRp
ZmllciBmb3IKdGhpcyBwYWNrYWdlOgpodHRwczovL252ZC5uaXN0Lmdvdi9wcm9kdWN0cy9jcGUv
c2VhcmNoL3Jlc3VsdHM/bmFtaW5nRm9ybWF0PTIuMyZrZXl3b3JkPWNob2NvbGF0ZS1kb29tCgpT
aWduZWQtb2ZmLWJ5OiBDbMOpbWVudCBSYW1pcmV6IDxjbGVtZW50LnJhbWlyZXpAYm9vdGxpbi5j
b20+Ci0tLQogcGFja2FnZS9jaG9jb2xhdGUtZG9vbS9jaG9jb2xhdGUtZG9vbS5tayB8IDIgKysK
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9wYWNrYWdlL2No
b2NvbGF0ZS1kb29tL2Nob2NvbGF0ZS1kb29tLm1rIGIvcGFja2FnZS9jaG9jb2xhdGUtZG9vbS9j
aG9jb2xhdGUtZG9vbS5tawppbmRleCA4MzE4YzEyM2JkLi41ODFiMmM1MWMyIDEwMDY0NAotLS0g
YS9wYWNrYWdlL2Nob2NvbGF0ZS1kb29tL2Nob2NvbGF0ZS1kb29tLm1rCisrKyBiL3BhY2thZ2Uv
Y2hvY29sYXRlLWRvb20vY2hvY29sYXRlLWRvb20ubWsKQEAgLTgsNiArOCw4IEBAIENIT0NPTEFU
RV9ET09NX1ZFUlNJT04gPSAzLjAuMQogQ0hPQ09MQVRFX0RPT01fU0lURSA9IGh0dHA6Ly93d3cu
Y2hvY29sYXRlLWRvb20ub3JnL2Rvd25sb2Fkcy8kKENIT0NPTEFURV9ET09NX1ZFUlNJT04pCiBD
SE9DT0xBVEVfRE9PTV9MSUNFTlNFID0gR1BMLTIuMCsKIENIT0NPTEFURV9ET09NX0xJQ0VOU0Vf
RklMRVMgPSBDT1BZSU5HCitDSE9DT0xBVEVfRE9PTV9DUEVfSURfVkVORE9SID0gY2hvY29sYXRl
LWRvb20KK0NIT0NPTEFURV9ET09NX0NQRV9JRF9QUk9EVUNUID0gY2hvY29sYXRlX2Rvb20KIENI
T0NPTEFURV9ET09NX0RFUEVOREVOQ0lFUyA9IGhvc3QtcGtnY29uZiBzZGwyIHNkbDJfbWl4ZXIg
c2RsMl9uZXQKIAogIyBBdm9pZCBpbnN0YWxsaW5nIGRlc2t0b3AgZW50cmllcywgaWNvbnMsIGV0
Yy4KLS0gCjIuMzQuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9yZwpodHRw
czovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
