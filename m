Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 652C8C3DA70
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 13:40:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3312360849;
	Tue, 23 Jul 2024 13:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m0UKKbXy2e9g; Tue, 23 Jul 2024 13:40:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D19C26085C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D19C26085C;
	Tue, 23 Jul 2024 13:40:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3C85A1BF2F5
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:40:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2A70360815
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 13:40:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FXNbtMwkC4kG for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 13:40:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E2C23606D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2C23606D3
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2C23606D3
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 13:40:19 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.125.116]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N4hzZ-1sLQcd3Cv1-00tNYQ; Tue, 23
 Jul 2024 15:40:12 +0200
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 15:39:47 +0200
Message-ID: <20240723133951.3542206-6-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240723133951.3542206-1-fiona.klute@gmx.de>
References: <20240723133951.3542206-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Siof4oyS/ujU1oXTbndIPgKvEz0/LCJ4pw7heUxfeG2GS9vJ8OV
 i/yDFssHTfEvh7bb3o70XE8Hi2VdNK3nyCi16gCYS7jS/skRmOQxnorZ3p06vSBVhHXh0jH
 Scf4WjhtgvIOfQFzM797sKww7Jar5vGFHJxRDooS026kUZkB6e+TmsZYhhp3dC6wbtMNzkF
 d3HiU2+h1sIpqH4VfE0BQ==
UI-OutboundReport: notjunk:1;M01:P0:dRzJrV79Q4Y=;c7b9Zsd6NJEG3rMTVurEmY4l2jj
 4LbkqlRrk+RHY6FXFD/Juv1z8wVchnoT1U0O5hIg62Mrj5zGHejcT9qfIElV4dm5RisVrCm7i
 e8aSKt+bWS2JMw6VLpRb1B2mttvk5bOJnTM0HvWbTkJ2HozKAQpD1BmcOkeZh2ixxjqAgKG8o
 atluxJZpG108j6TOKPa7M8Kzkxtf1vtqKmRK2TzdxB9gqMh1erxSBPKYLkD9VzkON900PV3cZ
 gqleD2rVQHJAqR49799mxQvQ4vf3zvkbDDIH/5W1RnsogiXv1TKjA2UkI8Nd/fSUZIWPyi6IX
 20o4j0MNhmqA7/YuScK2j263/pr36sY5AviDG940xkQEgkwn0IYOXyCX9SbAmRXML6K8jBzfx
 1cJ2JNXBpRmR8e5lxcy7Say3HbnBzuw+CcpYSF5WMhHa/FpapiyY04+J95z/bN9bwXmCpI0bP
 3cYQKQmp0XednSQ16DRmf+n1AN2ptxTirF+9fIUcreL8aq2KFBIxzI/ifoZmX4L0aEUzcZLWt
 0fnm9y12nL/LJyL2W0SLkSQflky3Hp351k9xbNpI/JPSFKcVAJ9+pTjA0mevPvDFFJL4evwsT
 ImfC7IhUpgB+as06MPNowwEPdJ6qzqm3ZlicG7X87ecwsIDAZwy2o3TZSsz5EZEe8mBi+IPr8
 p7qnCfycQqUWln3Ilqh93/0Ht6XnDsOG5qm1XVNpHzV7jvs/7cpzDFIEO4kPYEeiZywHl4xn9
 1iwDJDZzLIYkL15ZD9yNWn2aQcGqrpkrizzacjRyWcrr2XolZS+seTiOOUOWo3ElJ6sJmhUwq
 iWCvMJA+n5rIn0CDXxJoRSMw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1721742013; x=1722346813; i=fiona.klute@gmx.de;
 bh=BN/FXo6B97C0eR9xXMWvWc+SIFPrj5qF6kwluHeap9o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=Licyhiha31haTztfwzREhDP3ChL3ZNY9yjqymvPsdxsqBmpY9aoeZ5H15lroLcDS
 qTzMFwCN1DaI6ve2iOOctPOBkLuRbXQHnnq5oyciGdap9JpBwMbRRShZ57za3UbEW
 Do7ZSJ5u4lmfWTVRTFgqNANR5ADkWUBrazu4iMrpkCBFy341Bxkj1vqJ8k5mQom+W
 neR0mMforLdrxO3L+kzY2wW1Bd363F4mmYZoX9GzdYbKUY8ulTZmnGikDqK6C1YNA
 7yIXMQ8OjQ2i8dHq96XkKaBw+vYIFv4z/MOfhN8eHnvrj7i4ysLoZTcRSAtP1teur
 ds/Ta/DuB0Hs5zdkwA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=Licyhiha
Subject: [Buildroot] [PATCH v3 5/6] support/testing: include init script in
 iptables test
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

Check a save/start/stop cycle based on the rules created by direct
commands in the pre-existing test.

Signed-off-by: Fiona Klute (WIWA) <fiona.klute@gmx.de>
---
Changes v2 -> v3:
* remove change to init script that belongs in patch 3

 support/testing/tests/package/test_iptables.py | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/support/testing/tests/package/test_iptables.py b/support/testing/tests/package/test_iptables.py
index ee57b31558..e807fc9e83 100644
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
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
