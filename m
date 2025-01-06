Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6747DE77188
	for <buildroot@archiver.kernel.org>; Mon,  6 Jan 2025 08:48:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D831B804B2;
	Mon,  6 Jan 2025 08:48:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AOziOOaDD4Zh; Mon,  6 Jan 2025 08:48:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BCCE804EF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BCCE804EF;
	Mon,  6 Jan 2025 08:48:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8653DD92
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 08:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54F09804B2
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 08:47:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qESZt2_gmjNe for <buildroot@buildroot.org>;
 Mon,  6 Jan 2025 08:47:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.130;
 helo=mout.kundenserver.de;
 envelope-from=nicolas.cavallari@green-communications.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0F4038049E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0F4038049E
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0F4038049E
 for <buildroot@buildroot.org>; Mon,  6 Jan 2025 08:47:56 +0000 (UTC)
Received: from evilbit.green-communications.fr ([88.171.60.104]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis)
 id 1MMp08-1tEIO62DPI-00Wsch; Mon, 06 Jan 2025 09:47:54 +0100
From: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
To: buildroot@buildroot.org
Date: Mon,  6 Jan 2025 09:43:53 +0100
Message-ID: <20250106084411.22759-1-nicolas.cavallari@green-communications.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:Gtcqcktm5u+RtZq+N6age/6UUZEDT66as0hcUZ3iN2h7PGdPhrE
 o6N8FuH2xUBxJy1GZK0aYnOmFfRLr16WXh2PH6EXb01mibF5zZNawhnKof8rYtC/8teT7+Q
 KvFXirSMyiRIcHSc6jeDYJ3gGZ5485BNwsGAJq9dRYCUF807eP06bTFR13T9JHl6RdDU5gZ
 K60BgmFociZ1dymarXHbw==
UI-OutboundReport: notjunk:1;M01:P0:/BkB6/zCYKg=;TVGeBTJ0pSo1mQtol0DUy4RAQYn
 y25yv+Sntj+13OF/alsNJjPjBYouDpySERc4WqM6IMluq6F3POXvZCAqONQr9Jsd473znKr1k
 LlVDx6M4rP0CTAxo3tr0m8+0h9s/GTa+VRPcLJyhuBuUf1ti7W8HeSMp/PIfz3OUMPGv5pp8f
 /99OpRkaYNlwhTtyY6EQPwlDaDTWrOoGNSauGKZVSxjjWeGzG/n9cCvo0OXCMcqnIfaSXrEH7
 c7/FgubrMqoeXeujKE6ErNbscWiRrPSXuutYJwZVHZY/avH4+BnweTGIFN3KKBJ+vLugDiToS
 XBiGVN0IMcTaYoc6JnlGFdiitt3ffua+23QKbKzKok+tCnAXiuyc9z5UvcKzZCK+YSu9g5ULI
 dHQioj4zDNPFijy4vkotzL76ga/Ur37DlSR1Ipxf1ZWmiAEucVxsPMBTENQsXgk2sy5Rmz+tI
 xFLlaTbCWyQHw8ALoHZ9KfOgqbYnrOArpozbclmSFRVGgJYhLmvZPMByd2VoJ5HpdX2tRlmWk
 7/anL89EYkWgqAaDIn3hYj1WDVbWcaAWZA1xeqoLPPumUVsZL7mdgPVUexIJMtTig9wHikiqQ
 1r86iAGkYe94jV9lYerHF8QiqcjgQjwIwPCMLW93syYWg1VzQRHmTdx2asP65SQt/EKu7L8gl
 VViGbi7wqKYW6uBQue0NqtaxYHnglD03xijCbifRGWeX1ChTSLhZ1BgHjsJrY6YLf73T+HqCM
 kDuTqy0KwfJuVh7PwHohsFicLiQI/33CPDyeGz+eEm0T/LB4LYx8u6vHtEykU7ebYKpX2+Tzp
 sWhxFozD0t/nAP9ImXC4S5NOgaN0ikh2OCH4yoGcsjL2Lt1nIx541TyzVkp4rPtdrEiAlOv4r
 M5YOGdJChF9b3lfkFdOiGgUcmZlMy1f+Dv/Sa812I8CGY+vKjKSYVyMf0nSXNJ1tmAPv6aNEZ
 9vhdCHKsHAHE7ylTVGlYD3XSlZHicWpstDnNWmNSDjI8xym8dgLH+smxy5227xCWyJfetstIL
 7PiD57kvY1vYECP1ePoLw4QO/0wtJcP8a5Kly22
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=green-communications.fr
Subject: [Buildroot] [PATCH 1/1] package/libgit2: bump version to 1.9.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Nicolas Cavallari <nicolas.cavallari@green-communications.fr>
---
 package/libgit2/libgit2.hash | 2 +-
 package/libgit2/libgit2.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libgit2/libgit2.hash b/package/libgit2/libgit2.hash
index 536a0b7405..3f11309750 100644
--- a/package/libgit2/libgit2.hash
+++ b/package/libgit2/libgit2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  49d0fc50ab931816f6bfc1ac68f8d74b760450eebdb5374e803ee36550f26774  libgit2-1.8.4.tar.gz
+sha256  75b27d4d6df44bd34e2f70663cfd998f5ec41e680e1e593238bbe517a84c7ed2  libgit2-1.9.0.tar.gz
 sha256  e3712465634e97cfd850822a4eb5ac7d2f8a10f753189366d5a2060046f28288  COPYING
diff --git a/package/libgit2/libgit2.mk b/package/libgit2/libgit2.mk
index 3bf3dbb647..4026ac1f7c 100644
--- a/package/libgit2/libgit2.mk
+++ b/package/libgit2/libgit2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGIT2_VERSION = 1.8.4
+LIBGIT2_VERSION = 1.9.0
 LIBGIT2_SITE = $(call github,libgit2,libgit2,v$(LIBGIT2_VERSION))
 LIBGIT2_LICENSE = \
 	GPL-2.0 with linking exception, \
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
