Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81AFEC021A9
	for <buildroot@archiver.kernel.org>; Mon, 17 Feb 2025 15:32:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 475A360EA7;
	Mon, 17 Feb 2025 15:32:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Pb8CMrSH9ZB; Mon, 17 Feb 2025 15:31:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43A3560EAD
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 43A3560EAD;
	Mon, 17 Feb 2025 15:31:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CD236C8
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:31:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B11F5408FE
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:31:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HLoJ_qlGOrvy for <buildroot@buildroot.org>;
 Mon, 17 Feb 2025 15:31:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 56B54408E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 56B54408E1
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 56B54408E1
 for <buildroot@buildroot.org>; Mon, 17 Feb 2025 15:31:49 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.115.144]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M5QJJ-1tks2p3tLh-009eLM; Mon, 17
 Feb 2025 16:31:47 +0100
To: buildroot@buildroot.org
Date: Mon, 17 Feb 2025 16:31:26 +0100
Message-ID: <20250217153127.1363472-6-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250217153127.1363472-1-fiona.klute@gmx.de>
References: <20250217153127.1363472-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:BdaUY8k4TqxgUTy2I3QJaXl4Kz0pj2OrySoFGLeSUpm5pVLkDVR
 Ukxt+SYVLTQGoq1UpgyO+sjKixQUDHRoqkRVUqn71AIgkn6l0Pq2IS6UBw2DvvWOmdempg9
 7Qznfw6MIU8IlBd7btSnx23VCfbrHBDGannfe+eTomtz6hFcQ431T6VTK0K9U4Iy9+HnQiw
 AitGng6uYuf0WTcs2R49g==
UI-OutboundReport: notjunk:1;M01:P0:++29iaOxA3g=;3JFqdfi4nJopKCfYLAVH4j6TEhE
 au0lIWiJg2SCsYUN71l1x+FjQ1beqcZ9ShY9RmpsbzNHD4kwHVK3yUdOvTA0+uR4P+vUUv8L3
 vBZag5fW6Ctk3G+8SeBmg37pjwkmUpql9bW0A+ihLQYxqefFIn9oPTzg9DA7JlmJ+dJ4wTlrT
 ZmA7ls/+4ke9OARAmcvBWl7uZmUCFWjdLzsenAlwzAGa0Y3fYgZW180BDtyZ9A2ZQt0Uv6PIH
 U8GAVGmEv7edhI8Fll6617aVJVKg61Tt3RlNbsukBe+H2T+ktkao4Gx5WGdqdYOaAgjQVvNTQ
 jBv/HVeIkpam3WJoMusfqaBT1M+qK7HDDSK1klGwOiJR/bBKAOKu0QsbLj3Z9QR/eC4QMn1EW
 xnrsP0EbYpybDG+HGfHFDGIXRZLzjUQMNQNsH//2OJZO1tXu2P/obt4aVFrTqvoU005rl7nSF
 sjCJzfLLPuVO1cI9OfrkOK1tJgJEiYH14dyKMvWhhzo4bmb1g67B+b6tF8GKt4HmiJNU/d28C
 Dgv+ePZ/9QXjVswvWspV/QLIl59SYnDl0cmgHyduJ6VNj4J8/bB/dypIOm8a7y9ZXVDgqaaxT
 KX6U623I0dOWhC5SI5p3mvRQoxBd4sDpoOOZPE9gT4fg7R66GQhDyJMVvya5pwPQIspaG3l+W
 7BQQxj79ias0Iukvp8/1OEIkHmouK/aCzMjYTRbMtujuwhNcAJTDwYLprLi+MVYhZs+5hy2Eo
 h3XFBrnhAvtJhxaF8F5K7LPSxhACEPw6CnNVx4MKytKaW3ELYMV39PeerddgMGZk1vzg3PWjr
 r2hjpQYAh01I6VyT4A3ivy4JL5O+MV3u84BpFDibFFOApM5NVLolaggQsb50DkRlskw9QPf54
 0m48uQQ8JY6IzITGhBq1be3+pIOPfM36OYzdJteTMy8FdtePJottWJIcg6jgJJAuXAxn7RRP9
 pigtFgn3jOCRcYH28rSU8eJL/QvKCWtG9ZXkFFhpXdzuOSVmdUlHkettvFOs0dVD8tNLtgU46
 eHz1OayC7GglOS5nRdyiAhwZmH1zNDWw8dQge8Q75/mTg+kg1ohNizAMRlVnLcU90svz8DEyh
 Xb2V0X+YxKmFAYU6F5yR76YzRKy/3BvnnEn59yyI7wJ9T+Ba56HqvM8tBQ3JtdPqY9a8yaR8n
 20nx+ODZeeBMrhKG1yFYyJaS9Of4odCwsrUaj5q38x1ZLXCvRQVgrd29mBKYBcN8FWLPWXBTH
 e/b2JXzAsaKvjdjXCCEcgULbx19Zzf43JBq4uaij91A93A1zfH4jN8Bx0tGD1Xo89OQoDgmJU
 x//ygMmZCSaSjPTbxvaPLtX1OFX3ZOw4nzFpNJx/s7gEAw0gfG8PzCvkPGQ3L8vDiGPxu5QQr
 Rn5LYDgxhW18e+yAyV8KoZf74DBK7G6uJX7U8KFpgbFouFVZenldvbQ6GKohQpq7g2+FAwRoc
 ZS9Hhew==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1739806307; x=1740411107; i=fiona.klute@gmx.de;
 bh=yFq7qXvX6AIrai1aDpud5Pfmsdnsp47L45K3TLBunb0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=aOTygGdsz7FGcf0O5ZpxTGr8erBXLd8t1INtErGdAg6oFaFz1PNs1DMsjUvfKu0o
 h8oYUV3ardyXSv2YOWObhAyUHCVBhLkqx4dG2bX/S7NQ5WdsrGeT2BQbBnz/pMiEF
 k9yZ2yXchPHPvuW6WUvHw1jly25tZ4rd9VmpUdWd3jSqy+aZrmDfXSIcAnYk+7acd
 Sv8jN8jyM3DsRamAbt5X6VLq9jGDjnVHii/0m523Lcl9NspSvjezf5G0Fq4QS2LK3
 6Idi7aPdFjG85E+/Kdo2q1p/0lFTka9K+XsHYZLQrjXX5gRVybdHo+BVE2WvYLQG4
 h4ei4Yt8be2kYFEqDw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=aOTygGds
Subject: [Buildroot] [PATCH v6 5/6] support/testing: include init script in
 iptables test
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
Cc: Julien Olivain <ju.o@free.fr>, Fiona Klute <fiona.klute@gmx.de>,
 Ricardo Martincoski <ricardo.martincoski@datacom.com.br>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (WIWA)" <fiona.klute@gmx.de>

Check a save/start/stop cycle based on the rules created by direct
commands in the pre-existing test.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v2 -> v3:
* remove change to init script that belongs in patch 3

 support/testing/tests/package/test_iptables.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/support/testing/tests/package/test_iptables.py b/support/testing/tests/package/test_iptables.py
index 924a483ddb..6e4db0ac06 100644
--- a/support/testing/tests/package/test_iptables.py
+++ b/support/testing/tests/package/test_iptables.py
@@ -11,6 +11,7 @@ class TestIptables(infra.basetest.BRTest):
         """
         BR2_aarch64=y
         BR2_TOOLCHAIN_EXTERNAL=y
+        BR2_INIT_BUSYBOX=y
         BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
         BR2_LINUX_KERNEL=y
         BR2_LINUX_KERNEL_CUSTOM_VERSION=y
@@ -70,9 +71,26 @@ class TestIptables(infra.basetest.BRTest):
         _, exit_code = self.emulator.run(ping_test_cmd)
         self.assertNotEqual(exit_code, 0)
 
+        # Save the current rules to test the init script later.
+        self.assertRunOk("/etc/init.d/S35iptables save")
+
         # We delete our only rule #1 in the INPUT chain.
         self.assertRunOk("iptables --delete INPUT 1")
 
         # Since we deleted the rule, the ping test command which was
         # supposed to fail earlier is now supposed to succeed.
         self.assertRunOk(ping_test_cmd)
+
+        # Load the rules as saved before.
+        self.assertRunOk("/etc/init.d/S35iptables start")
+
+        # Ping to 127.0.0.2 is expected to fail again.
+        _, exit_code = self.emulator.run(ping_test_cmd)
+        self.assertNotEqual(exit_code, 0)
+
+        # And flush the rules again.
+        self.assertRunOk("/etc/init.d/S35iptables stop")
+
+        # Since we deleted the rule, the ping test command which was
+        # supposed to fail earlier is now supposed to succeed.
+        self.assertRunOk(ping_test_cmd)
-- 
2.47.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
