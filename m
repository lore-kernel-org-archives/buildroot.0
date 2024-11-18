Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D99D4920C
	for <buildroot@archiver.kernel.org>; Mon, 18 Nov 2024 11:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4132242F3F;
	Mon, 18 Nov 2024 11:20:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GCSMTJIfYP8u; Mon, 18 Nov 2024 11:20:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6FD7242F2B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FD7242F2B;
	Mon, 18 Nov 2024 11:20:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D857B14
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 11:20:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1DC9B80BE4
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 11:20:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3e0wZfXgI1Wp for <buildroot@buildroot.org>;
 Mon, 18 Nov 2024 11:20:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 244FE80B85
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 244FE80B85
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 244FE80B85
 for <buildroot@buildroot.org>; Mon, 18 Nov 2024 11:20:39 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.113.37]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MQMyZ-1tQ0O320kz-00UebC; Mon, 18
 Nov 2024 12:20:34 +0100
To: buildroot@buildroot.org
Date: Mon, 18 Nov 2024 12:20:07 +0100
Message-ID: <20241118112007.3120799-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:HHfBxInTpZFulRIElM3ZR1fJugQdqg51FR30bX6BNaTVjTk1oPp
 Y51+Rc7YG9KwRfS/mOC7TGf4FsuJRz1m1tFeRT9CbEipnRaHRD9lOvKP6yO5VBljYmeXfEo
 rtbgaOIjujFJmMkpEGN+HEQhwmofRkjXilkwt5xatZknT9kDw/rpN+Dpr5HMKzGKC0Onnr7
 1RWJCaJh9xV+d0KNv582w==
UI-OutboundReport: notjunk:1;M01:P0:j29sb7rse3U=;wcjlvm307V02jsurrIajtgXSPiH
 lrTCxj2EWHygFT+P3/TRpGy18m1c/R3Ke6YBM8fBgzos4ykD2zgADF3ITfEzKVwmiKv3YfVaK
 UZ7FrqYuuaoTpwQKL9Gd8tDdEUxNaeNQM3RSuUJ9krbCttIk8KGwRRC616ZNN2o8y8kau4WNs
 Bqht6KFPZno4B9mElXLHplxPHEOXuIQSrCd+b6/cAVIyQtEEFtzh+pqiNN6zemLyaWNC7SVV2
 lGmEliOk+67fmvFVwUZTIdYsRROg28RULE8Ly9NnpSlHUuPzdPq3A2bgdphhfcp64VA6Gqz5d
 xp0fGidMiqozi5E7O4hOlSfsFUY+FcXK1xynxnpuJ8zDpkl9RsSMgEXRlf0S+X6GtVlHsO7Q2
 eL/uNoFQ3o6URdl9fWpK673hZlMYwH9np01KWbFCOurQ9RCsNIUPrd6Mtg4WwATb5/9tsm5Gk
 TRs8rMpSFCUtl2gxg0XUPPCI8DlYSn1+75D0Dnkn6+zhgThi1AaOrv+i3mDwlIyNLDVFvZRsC
 VqbIFXy7SbLdNiBjubrAAyYq5nnWNrQvMgN+Xo+Fzzc9CDWUOZHdKa6W4tq06fW3OlUPbDLDW
 H4k5jUEGZj5I5e5WCIexVTbtLkpHxHAWyI/+DWFnrlRpYTbE2IjUej1a5+LrjK9zV93snzYrh
 UhCzD776LF0G66rOTQJYJVWm0TKDlN2HM4iyH97hjvXBprX9Y5Y+1mbGvd4C91otJ2Lnix7sm
 Nc+ko2mPcb25/nYjGykoj2WZVvbqVqD2bHoJfznrY8naaWsP0tqc2zrCIl+jRw62wWRIQNOa8
 GdnUtzViCjGXa9Pnc36qlHHuILgb4sqJAbVVG/76fJH+duxA41X8KsU8sqIJ0e83+WHIgCKwJ
 56yysXA0UEJs7UUi8m2K026BxodqfpLrIfpQ6U/npyhIoa+GWhsmDW3qj
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1731928834; x=1732533634; i=fiona.klute@gmx.de;
 bh=v9gN3ZpZqytyvTAnhzBQ/ASc9r+iS7kH/5SAcTyHDiQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=msLbA6yndGKyoUzWas4zLUkfzJozdx/YRhZ2/l4ZQlsEZix5OLmv3mUl7vZ1avOl
 e6vtm8Z/s3fMndM5XRioojA7n54RPmYqmt6EcP1rCDMVvKJKr0oeGH18l4r5OUDE2
 hWPmCtwNUXJqOW+jb8q8IVCX+xKGSENJ0zbmWzNhoch9EElUDNcA/9IO4yFvT9y00
 SihzxtdTZTUsYf3M0LSai/KeIVs163wbIKcAABQgQHXJSGX+GWDBIZvk+7NW6tADZ
 1yqdVbwhbQUDGguMxq2s7AWG/X4PndFb/XJMYshkzAYilpGIaywTtIeUvuNXOhKHN
 HUzhzEkkjXdpEFFioA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=msLbA6yn
Subject: [Buildroot] [PATCH 1/1] package/bmap-tools: select host-python3 if
 building host package
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: "Fiona Klute \(WIWA\)" <fiona.klute@gmx.de>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Host bmap-tools runs using host-python3, but did not select it,
leading to the confusing situation that BR2_PACKAGE_HOST_PYTHON3=n
even though it was built and working.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
 package/bmap-tools/Config.in.host | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/bmap-tools/Config.in.host b/package/bmap-tools/Config.in.host
index cb4d35a437..499f9d177d 100644
--- a/package/bmap-tools/Config.in.host
+++ b/package/bmap-tools/Config.in.host
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_HOST_BMAP_TOOLS
 	bool "host bmap-tools"
+	select BR2_PACKAGE_HOST_PYTHON3 # runtime
 	select BR2_PACKAGE_HOST_PYTHON_SIX # runtime
 	help
 	  Tool to flash image files to block devices using the block map
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
