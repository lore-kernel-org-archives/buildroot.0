Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7FD3C30653
	for <buildroot@archiver.kernel.org>; Thu,  4 Jul 2024 19:45:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 872B684744;
	Thu,  4 Jul 2024 19:45:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnui_Y_RgvvX; Thu,  4 Jul 2024 19:45:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9336B84791
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9336B84791;
	Thu,  4 Jul 2024 19:45:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 24FEF1BF2C1
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:45:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11895404C5
 for <buildroot@lists.busybox.net>; Thu,  4 Jul 2024 19:45:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JEcGBMfQ5Bbw for <buildroot@lists.busybox.net>;
 Thu,  4 Jul 2024 19:45:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6AF93405E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6AF93405E2
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6AF93405E2
 for <buildroot@buildroot.org>; Thu,  4 Jul 2024 19:45:45 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.161]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N3bSt-1sG8hA0NIh-00ysd3; Thu, 04
 Jul 2024 21:40:39 +0200
Date: Thu, 04 Jul 2024 21:40:30 +0200
MIME-Version: 1.0
Message-Id: <20240704-tipidee-v1-4-5ef0942b2025@gmx.net>
References: <20240704-tipidee-v1-0-5ef0942b2025@gmx.net>
In-Reply-To: <20240704-tipidee-v1-0-5ef0942b2025@gmx.net>
To: buildroot@buildroot.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720122036; l=1271;
 i=j.neuschaefer@gmx.net; s=20240329; h=from:subject:message-id;
 bh=TCTMT7xm2zHoNEJ777JNOfxPn12TH+zZrVXaTMhbI8M=;
 b=2ChS07j3mtIl725v/4SzfIsKVJ71VV0TrcOfRCnWdEmSaosWz/bkofPDfKMFwsTx6lhQMJ9k7
 5yxAKGvUQdZBE8+pjJh9gnL8a8/nnstAJWApCYzUDkToP9xZsUsE5wW
X-Developer-Key: i=j.neuschaefer@gmx.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Provags-ID: V03:K1:BY7A/ar2IBIySITzuQgvT9o+ac9bpRkeyUibnEbh21+r93FOVg6
 n8B+YK5fWE1DRS8yMU1dOcPvZIc/AkJrwStu+nClOjOAoTBuzKP3Qd9r86WNkGlO2iH9XxD
 9mUm5oj1yRBDA6ZdyDXoL1dUrsDzF6hWJyybRw0VEFxazo+2cVAcvLfzDNR/R3a4FYYe8/o
 bFIG7n0xIlG2/cyEpT3ng==
UI-OutboundReport: notjunk:1;M01:P0:8n5IPblCHtY=;EZKeWuyitFS42LGEDTvmdhitSI2
 LzJwJCHiVqTChT/nK/U0cEcw7kpiDXxukG3x88UR0Iaibc/8a+r+sVzKChp3SMLVGnUC08BQ1
 vJDR59g8BDgqbThAQPTZ0MRZBHg+q7QSPRY7GNJo2LjjZQTBhcA5cw3JvqBnXtDflmQgfvhJX
 RHHf12oFaOd7OmomoFAegok0EUu/nbcnPLjc13KLAtkoRuBqro4+GWu3lgwRLG+gn6muYS7ew
 D030KP+ff5qQaSJ3ZigVEAM1aa2J/4IZOUOXNQoz+dRB7J5C/0ovVLzZjdP7NeltvVhPZvPZS
 A/7fLtQxSLCPqLeqOr9cHZfovuScYJgxxR0X7CiCnmiFwYwKkS9eARslesfDWWH1kZz4RS4gX
 4kZ1tcN2LmQi4QFKpSC916bm3rSZYS7pHb9whL+q4JHzC00BN7ooXtkxoglOh+PCiVwH/pqY6
 itNGVTKEtNn06K+O5VcYQ6EUFxSDXTYb7KRAfbjNn/tT2cv307Rw3Moazy/tYplso3fvSIr5S
 /tU4YAU8FIVg7j/PdtpoU0f85ZwI+f8AnRXYNrUQ34l2x7cD2HvZbargaZI3hDQH36NO8FIpA
 +XTbYy7aqShB1+4xJdlRlrth2H8uZxywEfDFWVY4rETh8U7Rh0InTeek5SKDjfSsZC4cVi3zF
 d5VlNYgQFIj042klluIESxvWtOMomYiQnSOIAi9dbyYyIHAD07KdceJ8ybVi1Iktsm+4lt+ws
 DD7HvqMwqDOR6k0yQmPjGGJcSGFGTRhbKBYeONIo9lvNMuxgQSAgLaLlBgISWcux0SbFPnYSC
 UI4YHieaLEw3oZI9DsltujAK2bBw0RPViWJChLAow7uTY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1720122343; x=1720727143; i=j.neuschaefer@gmx.net;
 bh=kzfrNbxziS6cJxleknVlQBtHfFYh0irMPc2tcFcT8q4=;
 h=X-UI-Sender-Class:From:Date:Subject:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=ncYl5egQqZKenz6aajxeJJbk/KEt/PyRFLvESIoPKQAPNwWxIAgxPGJZvuzdJNAm
 WWtoVkmjlreVMQsIVNWye5JDQZ/7Q6GOKy9hVot/VBFPh51z462JrK2wcG7TwdVX/
 +9FVH3+uRTz4k7enlWeQlokAxjkxJsLKr/cw8MBAHPTS5mdp/Aina9deDHZZKtDRR
 ZyR1YDWrAvnTCikrFwo7VbQ18IjuzHn+VqKSXdeP3SKoax13bhVA+cIQcxK37k3K2
 +qXCRKjTa0RQ8K/NYdgxc8fsVEwy7HM0WZUAN7mRMZ4k6n/QCSnI96DG5ephus6/C
 xrRzRuhTvkxt7osEhA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=ncYl5egQ
Subject: [Buildroot] [PATCH 4/8] s6-networking: bump to version 2.7.0.3
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

---
 package/s6-networking/s6-networking.hash | 2 +-
 package/s6-networking/s6-networking.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/s6-networking/s6-networking.hash b/package/s6-networking/s6-networking.hash
index df65274b3d..4eff4d49f4 100644
--- a/package/s6-networking/s6-networking.hash
+++ b/package/s6-networking/s6-networking.hash
@@ -1,3 +1,3 @@
 # Locally generated
-sha256  c33c6f1b2be16f89a21af946cfd06242a12f98184c898b755ddb24338671ceb1  s6-networking-2.7.0.2.tar.gz
+sha256  db411c54371a17ed7d4543dd86cf9530ce25fcf624bef83ae2b579520e5e70bf  s6-networking-2.7.0.3.tar.gz
 sha256  fdc931295525dd0009cdf339189cbecd228d65cefe33402f037f9b046f07989e  COPYING
diff --git a/package/s6-networking/s6-networking.mk b/package/s6-networking/s6-networking.mk
index 239d8a679e..212fae7361 100644
--- a/package/s6-networking/s6-networking.mk
+++ b/package/s6-networking/s6-networking.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-S6_NETWORKING_VERSION = 2.7.0.2
+S6_NETWORKING_VERSION = 2.7.0.3
 S6_NETWORKING_SITE = https://skarnet.org/software/s6-networking
 S6_NETWORKING_LICENSE = ISC
 S6_NETWORKING_LICENSE_FILES = COPYING

--
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
