Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C193C3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 16:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEAE060E7B;
	Fri, 26 Jul 2024 16:21:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jfTZx-6P1rUK; Fri, 26 Jul 2024 16:21:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A629860E85
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A629860E85;
	Fri, 26 Jul 2024 16:21:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50FE21BF860
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 16:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B52740F73
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 16:20:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B1dKUf6q3s0x for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 16:20:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D6FB840118
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D6FB840118
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D6FB840118
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 16:20:49 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.115.174]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MG9kM-1sWJt70cF2-009jYe; Fri, 26
 Jul 2024 18:20:41 +0200
To: buildroot@buildroot.org
Date: Fri, 26 Jul 2024 18:20:11 +0200
Message-ID: <20240726162013.2183792-7-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726162013.2183792-1-fiona.klute@gmx.de>
References: <20240726162013.2183792-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:sh8ifhzjMLGSPGU3fIrwcsee+u+xOmpNrcglqzMUbuOs4WK7pfi
 tGCauuK7Ont29BXFIE2b2iBCMQheRjTipCBKUfUzjzRNZvxPqkJEj16BWUEPP0L1+tA1ZQ1
 LYxWaJBlbMBhi3nrtSuO8jR38Ybu9GjwNffHOHkB/EG7SIyhMp0fksH7o5eSmUaPgOawVnp
 /vpmFPaTJ2ZqHhfje1NjQ==
UI-OutboundReport: notjunk:1;M01:P0:vAG0aTqrvhk=;PqwCnqv4rDQ2495XY/t8VcMglXc
 mdeYZOVF/TiBptO0pdx0Rty9p3PI071mJfW5s6WmzObJIv6xMW86xn2frclGP1DOqXWlGanty
 GaEx6Pf0I37NxMXL0TFTzL6pSA484H6a/aA18yeuh3lHv8wtIsHsBM+CVdzyrLkjGVLMD4QQK
 gonPhzh78IvNpryRGchMn+fCPz+w6d8HpJq+xwxiAufE5c9uBP2uR37O73k7Fo7oqbiOxqKTU
 B72P2xNgevqm4unlK1nGreCD6/Nx4ThpSCLvatkjfgrmX05nbNB1DofRPNxb80Bi+6SV9+9YO
 QRwj5UdhvwRrGSMUl08HWtX86QMoUtBkAuuAqHXxgWcNcsBqzpUIP1CPNtQ5kbFIMA1FNLwjH
 ijtw1ISS/620w/bTos+Hhvbwd4LGfvNcrFzZQ5L7KHgJE7XPteShm8cdH1EhGG6VOIcUjkmWk
 7BL4MyCeAQYqAnSFKgeATSRgUTb5Cesbifbx7rvQxVkFtEQG1G6wCEMXrAaOV12RqbVy3LR6w
 YKjhCGMW/PrcgmsM2+/BL2VlgKVHr6g2Ghk+L84PPpe/IZHK7wFBEYzmw2MPAkr+uT3bV2Y6i
 iM4BpIayLHYL5EmhxxNWp0bZXNeLOwxZkgJDsA1Gf0ozXf9XwgWOWrG9jaY3I+iXy2RQBoZSt
 8xoeBzo06qIEuu9wN9br3MjkcPynNDlI0yf8bkr8hOA28/bmJVttPR0YPit6VMGj27LdhCt2T
 wcS948dnzVLiGCR4s0DzYnWTWqDl1UoruyUXsADs4MJqbhot633Pl9D0bGEeD4ZOygBTlhy4h
 RRq3o4aYU3nlHLhNPmWeiQcA==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1722010841; x=1722615641; i=fiona.klute@gmx.de;
 bh=QTbawq7YN9vk2UMCjZtdMo7/fUd64zxOa2Tpry5bhlo=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=IBZap7W2MfXr10bFwjAZZuNS7IlpEUFEvdUDHbECIC0KhKRjPVileJ69kIMiXvxu
 Ocr5ALfeIUz9bDmrGDj4Pssm4JdvKQ6lCjLB1Uhy/DSEXMg6BY4zMZDr6py3h5ttU
 gkt5T9g5IQKb7FTKN0dLSMYyjG3sR7VMB14mcGdqf+OGIwDkJosLocFTKFXiWe3S5
 eHqpRhfesGXmBa8TzrbqGO/+toRawh3SlxRFx/+GVTzgnLskuQ1kD5yOs4v/qTwHw
 X+McmrMCPak1KGZCSYnchpRvt1EF/T2uzHvgRoLOWPFs6kTdTS+lU6YCvBdrRhZSq
 1rdozJTFuO4Fj35O8A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=IBZap7W2
Subject: [Buildroot] [PATCH v4 6/6] support/testing: fix MyPy warnings about
 BRConfigTest
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
Cc: Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

This removes warnings in editors/IDEs with MyPy typechecking
integration. Test classes override "config" with strings (different
type than None).

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
I haven't seen any other type annotations in the testing code, if
they're not welcome please just drop this patch from the
series. Personally I think they're good to avoid bugs.

 support/testing/infra/basetest.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/support/testing/infra/basetest.py b/support/testing/infra/basetest.py
index 12d96415da..9fb9dffc53 100644
--- a/support/testing/infra/basetest.py
+++ b/support/testing/infra/basetest.py
@@ -24,8 +24,8 @@ MINIMAL_CONFIG = \

 class BRConfigTest(unittest.TestCase):
     """Test up to the configure stage."""
-    config = None
-    br2_external = list()
+    config: str
+    br2_external: list[str] = list()
     downloaddir = None
     outputdir = None
     logtofile = True
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
