Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B58C74A5B
	for <buildroot@archiver.kernel.org>; Thu, 23 Mar 2023 21:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4121C81F3D;
	Thu, 23 Mar 2023 21:47:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4121C81F3D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HVw8fS0oCwzC; Thu, 23 Mar 2023 21:47:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8508D840AD;
	Thu, 23 Mar 2023 21:47:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8508D840AD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 295C31BF399
 for <buildroot@lists.busybox.net>; Thu, 23 Mar 2023 21:47:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 01D0841EE9
 for <buildroot@lists.busybox.net>; Thu, 23 Mar 2023 21:47:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 01D0841EE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mO1bVhrIeWIw for <buildroot@lists.busybox.net>;
 Thu, 23 Mar 2023 21:47:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4F5E141E72
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4F5E141E72
 for <buildroot@buildroot.org>; Thu, 23 Mar 2023 21:47:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([62.216.208.230]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MwQXH-1qVEWL1RMD-00sMwW for <buildroot@buildroot.org>; Thu, 23 Mar 2023
 22:47:28 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Thu, 23 Mar 2023 22:47:27 +0100
Message-Id: <20230323214727.3228-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:HMhXM3N8HkEOuA6zgbRU6SbdYFBDM/GGjWXOmIoPWilrDBv9WVg
 0O22gZhYQ/hGpFjJxRzlNrWK/lhXjzVC+8lGHdO+3085JnvEBpdql4KkC8kcuiW/Md21eVM
 dsAJ5HUHurNgBpJgtd4MTkS3DBAa38IXrRKNOVNoIBdbXPBap5kr23/b9UaD9uUEW7Hhp41
 AAPYFqGszVWEgqYgDUEyQ==
UI-OutboundReport: notjunk:1;M01:P0:UB7E/VXtxG4=;kItzAIJ3crWy9ZqdxvsyQJvgH0i
 q/0UztHYpn0KmDMtRGqJpcfyKj/Gs7j2dGPXtQIfgqpzBNSAfUskAIR3nN1u/NLhizkG/MDqR
 S9gl0RAGYNOuvH3BXG2DapOl0co6TtzkEsKBySPH3Be7TX17D/O4+VqTvmdBS9vwJCzpZo63j
 LBd1tdkY9XjZpQE1/Kr46EBMOZtZRJVa+jh2tWWm0qz0hpq/lfTVbuz/FpTUdSfMQSX+2a6dT
 M1hprJphTiLR+h+9+A06OwWy68dvgaLshsExKja+ltWJHdUFzUvSisdvw0DnEUXk/XOy/lGIA
 6Gpn96if0VsxZ4Faqbc9WKIRtG/iCUSM3W1QFWK1PF4IxxKkXDzr6oVk54Ze+kDU3Spw/mxmk
 vFkDmP5lIBX7SioiAWFL23KGvmjGQPei+GEniuNOazrUm7VVAmRkZUazkhyaELDCMtIjU9Thh
 lGCMMYBqAixKdTTCf63WfNVkpobqBuTENLN3x06v0QbUl2qMk9Hw6xGVJNV+EqP+3uxIaDXRg
 q79zvkUbtx0nptBeh/Rlq5HMsGbFP/hVP0e3dg+iZtvs+0abYKhKOktgbIdXyUqXROvpmqJjC
 EA+Jp4aNWAqOBIsqdaBwhs5XtjEtskbrVQJdDwObeJcnZfjPF/qCgCIUTRlCVhFK3UZrg87qv
 WZy7tsp7IxopZfZFC7aGaluAtoDbSsjxnQDiNnkEwsdfAfvzGVeOdEsXOsoVRSv140RYjMWG2
 XgDBgCX/NKOAIyGveVkis//ZmEQ5F/2dnlr6csv4WvS5riL00taYZ2gOADel+dKhOU1mVujjN
 209gnZPwxAJ3dPT0Tt68jSncxhM4mmkqRHZLjpw/gsEbXiNFuGZ5T0dMQY5CtjL7VyGCMHior
 k1FRe6DoZYrzM0Q/V7r+Aupb0u3pmPkWJf5EildTQZkfqKyBYG5sFFotN0TUPsQmvIDv1Ky4A
 BYm4yoAxdn4o2xmBFPzlVkpD3GQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.net; s=s31663417; 
 t=1679608048; i=ps.report@gmx.net;
 bh=DFePiV2cHACJDdFq2l/ZJJA+43LqRyw3MIhyKPc92Hg=;
 h=X-UI-Sender-Class:From:To:Subject:Date;
 b=pmuepgWgj1LFP1wwJpFi1pu/Dh+ayhbLSfsjksTEygccLL9RfxBJHwUfBlW69Cl9r
 ooQuEgxGfkuUCsGIXDKkI3MeCBAp3c3dRZAIaYH+WFLZPF893ZmkW5nq1AC3jEWZ9C
 ZShcWMz+aUs8W0hz3l+TpKEnqLOYNe0nFFKm8KyVwPbbmGDE2tiCoXowhTLpf2FZe/
 CinK1Z7IulMQ+8BcunXkpdh2epLnx8jYB5i2O5ElMDT0Kh3VTnx1I4zPDMpCryisPf
 POy49InR1jpItxrXhb/69A/oeBso6stjvu2Ov0ph/nwXfmxjBRVPEQoWHBdSmDhQA0
 kRYVhyW+voUSA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=pmuepgWg
Subject: [Buildroot] [PATCH v1] package/mtools: bump version to 4.0.43
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For details see [1].

[1] https://lists.gnu.org/archive/html/info-gnu/2023-03/msg00006.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/mtools/mtools.hash | 2 +-
 package/mtools/mtools.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mtools/mtools.hash b/package/mtools/mtools.hash
index b81830a7d2..412d67a328 100644
--- a/package/mtools/mtools.hash
+++ b/package/mtools/mtools.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-sha256  40a98fd9bcc865997866015013c3c64a304d98c2892fe4ab892ffd6ac3dd9bae  mtools-4.0.42.tar.lz
+sha256  997ffe4125a19de1fd433ed63f128f7d54bc1a5915f3cdb36da6491ef917f217  mtools-4.0.43.tar.lz
 
 # Locally calculated
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
diff --git a/package/mtools/mtools.mk b/package/mtools/mtools.mk
index 407ac1a2c6..96d8e43ea2 100644
--- a/package/mtools/mtools.mk
+++ b/package/mtools/mtools.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MTOOLS_VERSION = 4.0.42
+MTOOLS_VERSION = 4.0.43
 MTOOLS_SOURCE = mtools-$(MTOOLS_VERSION).tar.lz
 MTOOLS_SITE = $(BR2_GNU_MIRROR)/mtools
 MTOOLS_LICENSE = GPL-3.0+
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
