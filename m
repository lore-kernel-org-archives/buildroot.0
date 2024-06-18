Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B34C27C4F
	for <buildroot@archiver.kernel.org>; Tue, 18 Jun 2024 19:40:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA17F41484;
	Tue, 18 Jun 2024 19:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bemT7PKMXqmV; Tue, 18 Jun 2024 19:40:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8792141444
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8792141444;
	Tue, 18 Jun 2024 19:40:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0C6F91BF295
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 19:40:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A645B404F5
 for <buildroot@lists.busybox.net>; Tue, 18 Jun 2024 19:40:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vKXsIYxq1WTH for <buildroot@lists.busybox.net>;
 Tue, 18 Jun 2024 19:40:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4D14940554
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D14940554
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4D14940554
 for <buildroot@buildroot.org>; Tue, 18 Jun 2024 19:40:12 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.119.83]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MyKDe-1sZyg21Hm0-00y0OV; Tue, 18
 Jun 2024 21:40:10 +0200
To: buildroot@buildroot.org
Date: Tue, 18 Jun 2024 21:39:59 +0200
Message-ID: <20240618194001.1907396-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:Io31sidjTivfCkIM1Tczsd8+R8hIGoX5kjc6qHaNkXdOjzV3Pld
 LjAHfjE6lu/6roSNbdAg/rie1+Ry98keVCAzWRTB0Kr/jGjhLVRy29UB3hOrnptEHIkV4ar
 qXeJsRoP0niYxe2Nsvnk5qBLRVTTEWArPdeNc2eA366nF2m3sOjq/hAM3OM/nO9sq/AL0Oy
 q2DdjH3ic3VuC/MkvbBgA==
UI-OutboundReport: notjunk:1;M01:P0:huQGRWzYRJI=;WJiay/oWOWJVZhdi5gnLB5/0bhS
 89fbXRZqJBZG+jBQp+veTlhDmdbR/4K1UuWRsQsOYwpygieigxxMJFJoIuciGnC7YU9Ypreby
 YuyEEliNBKkKKRw6DhoyE/aXWqtyRTF/ZKBVAf8/Bx51cV/s5EoTlozzNbGvih+oQIAiVnIMg
 5aJ13/Q/JfPWUHsbwFOWqDlSB2KYKjMlLROKIvE6NFgn00IeGFajkyWVG8qtm/CQkteF2Chhn
 eeT6HD4U0vXPiRDWxOuwQ2styQZjY66Mf5UCHfRJyRE1W74FZXzF39H++8/gsDk9otPzmiZDv
 Io1nQYMHqroJhykC5KkVgzVffbu7wQj/yCLBc8NK+xz7FV8oX2pi1YS9UUc0l1g828CH8pymJ
 adWRYZIN6U2N5JYdsZxOZPSWTg277k53wMrCjYhNB9KtUSrsqpdjqJZZ9cEKxx8Ruh3fe9tYw
 H3AY/pKEyYqfvPMrX5nAPy4L4F7RVU1nlvCFVhZCxuDgG+PuHtpSKSyetxvAn99jTVHS9JWez
 V8OhsOIW1wtp2D502rfQcxeTm+EKSoxfBcRiMIVa6B9xPs9SzLZqBepX8dvIVzD9SkA2owFxZ
 8sgkb764UW7rc/aC+eCQvSEADfMAifbBRkkSZ0SrVC0uhPNwiIC4V2V4vEYHq5SUxRORvQuud
 xeXHJhlVFbyYWy7Tpu8QnqoCwL3RtMn1ukn27vWsKINUlbOu/5wldeJG1QUqJIBDoreAbeMAE
 StVmzTWcW4f1B+GfInz2/ZKno1chyA2tctes97D5r+fnlWWGo6uRJ2amKkkJPKUgzMGeRk4rr
 V1sdh+tG25nDusVRikYNgcu0TKahvqtU2L0jywj1Cx3ZA=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1718739610; x=1719344410; i=fiona.klute@gmx.de;
 bh=bqM7ikmiCCCTMv6Nc3/kpHF+k1uFkWiYh6W7co+P4Fg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=txeJcMBPxs0MNt3ewSZGAbPtZJRJ4KbRqUlIfKEAwhMElOSnHmgh9OCUu+bWqeA+
 gMkPEOubTh7PuNzHtGqCSOvkruZMryVdaMIR0vPpkHY3Eo0+icL5PVEpOKyuuuwBO
 Mzg8kxDt+/kKf9+QTn4PNeV6A/RpglotQJ+gu4NpTRHbypQLdD9oPPPuguzK//O02
 CMn/XNBhI+YxOqxy/NAHSMMPrztfx3DQ0OgbFzW8r6QS9UTXCInPDYQ3c/q6kSA45
 lNqwNIvgKHJW9cyZger+x8r//JTE9c0Z+pEn6PBjhNI45sNabxZIee5MOJ3d/lbD+
 w3jNO8dOp1cFwydpiA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=txeJcMBP
Subject: [Buildroot] [PATCH 0/2] Improvements for U-Boot on RPi boards
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
Cc: =?UTF-8?q?Jos=C3=A9=20Mendes?= <jp.baltazar.mendes@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

I'm working on a system that needs U-Boot to manage booting on an
RPi-based board. These two patches make working with this setup
easier, though they aren't a complete setup (they do not include a
boot script, and do not prescribe where the Linux kernel is stored).

If there's interest it should be possible to expand this into an
RPi/U-Boot defconfig.

Fiona Klute (2):
  board/raspberrypi: Support boot.scr for U-Boot
  board/raspberrypi: Enable nullglob for DTBs

 board/raspberrypi/post-image.sh | 7 +++++++
 1 file changed, 7 insertions(+)

--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
