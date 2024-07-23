Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C503EC3DA63
	for <buildroot@archiver.kernel.org>; Tue, 23 Jul 2024 10:29:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AC58812B7;
	Tue, 23 Jul 2024 10:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j2shF2OyE4R3; Tue, 23 Jul 2024 10:29:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62EFA81295
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62EFA81295;
	Tue, 23 Jul 2024 10:29:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A615B1BF20F
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:29:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92DD7402BF
 for <buildroot@lists.busybox.net>; Tue, 23 Jul 2024 10:29:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N0S5qU25nEhb for <buildroot@lists.busybox.net>;
 Tue, 23 Jul 2024 10:29:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.21;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 24005402AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24005402AB
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 24005402AB
 for <buildroot@buildroot.org>; Tue, 23 Jul 2024 10:29:04 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.125.116]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M1HZi-1sTSwP0Yxu-00FaQS; Tue, 23
 Jul 2024 12:28:55 +0200
To: buildroot@buildroot.org
Date: Tue, 23 Jul 2024 12:28:30 +0200
Message-ID: <20240723102832.2522307-6-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240723102832.2522307-1-fiona.klute@gmx.de>
References: <20240723102832.2522307-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:So/zTiVAkUjvEua2+vMsn+2jCQJGVQPxzScXr+X5wJCi8Hcro5M
 PU6t+ZD0b82nD/hQKO2IqxTaw/4IibXpghi2W+75VdLvhH6bvEQ7JgfuYVdmeKhCaYgYNo3
 BsMp1irPviPTZwluQ2rhIqx7018zqQ5Xm4giGmDvKuvdw4fHVIKsJlmFnOg1KD6Cyn7k/Kg
 YL0ngaOVT1+ifMPWKofFw==
UI-OutboundReport: notjunk:1;M01:P0:1KB1PMZmrQ0=;Oouk1tppOsHPkhEPel7neIRHHtw
 SDCaZDcR7l2j3oT3KEnjM70iv+bdFkVnV70rrtMaDzJrU8Unh9Zay+kkemfOBcmRMXbU8rYz8
 eNH+dIrNIrvfySWnAk4GRDjvmf+ib1rO925mPQ1RSc2dfs9e/hCS0gP8uR2rRXQKs7owZCh3T
 j0ZOJpZDFxsn6M2KO9H01hIKGsExwQjmp21bSo0eFpb1gK2PYd9Pfgt0UbLzo81BLiMFsfQh5
 RnDc58z5vwrK/rWSWkIPcYG5Buh64/ypD1c7hVa3Oc7aVHW1Aeg7AtxXcWekK8Bf11HJsLMqi
 kTBOv91TpX6lBQBBaKy/+9hmVgbL316a34MZiQ1VUN4PG3WvfjIe1ioD22/dN2rGQyd5PUEKr
 CD8Yc5RFlfzwHNElvD8tG/6YXEgwWAnbFO4PTYDHIbhhaGZVdG2Ix7cLdYn2hJgdc7mmKc7Yr
 cqXR+AnphQZFT46/PkpsKyEFxShal1Q9NhNfxZ2FGLu+hyei7CokB4A2Y4amCKpvDjoND8gc7
 QvfLtlduYlyj38w5fI+6TY5AIqFzxyrIEA8HRuZK6RB5PqXWw5ejVtqchIwb9FbUZlq6YLZTU
 qr0LH2yo+FAMH4RwUeoCDnHmnq9pQe7GzSnb5AsmGCEaOTuE3XEevimfV9TjEiMFfBfBwKOaU
 1BDXwtExeuqkwBT2VnJjUnr9YKRQz0PQYNkvSTO9kcgz8yEbLT9fno/nVidhVcJx5FH35il7V
 2oGwLFj3vg2fnYNZS2jMTmSm7bMmOfsB1x+Ha2L0YB5RDAsd9ewgsujafldt428bJI77tfUNT
 zrdjJrWeBokxOBDHzecMBfBg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1721730535; x=1722335335; i=fiona.klute@gmx.de;
 bh=5c7xNOLw40thNTl1Tp0LD91YMs7Wp4xUyJcbzvtRJLg=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=hn6N7Hwvq/0/Teo7eu0TnXKUjH7rxu93fVc0uU5e/M9I8D0XmVDUn4jKC4gTeHl4
 nyENJxphVe9rYbfdFv5r5Ae7uuLtrKcUarNswM8ePr6or1HEvhT76m9KdsEunm2v9
 8AU3DE6NSZXVM9iZoK57Ur7VQsagihMYdLg+Ynp9frq2QJDktv6imWVKo9IqbvN3v
 S41TOs63my10Y82huB+FPw3kv2pn1G+407zyhvMPFFonlXv7C8BOWGkU66QINxiMR
 gwGRHZOGQ1DOAtGTWuAKDCVbcyZyqKB2u6ELB8uK47tk5UOHaYubV5IjhFuyAHX7D
 1bPPgrH/SFNJnSK9Bw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=hn6N7Hwv
Subject: [Buildroot] [PATCH v2 5/6] support/testing: include init script in
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
 package/iptables/S35iptables                   |  2 +-
 support/testing/tests/package/test_iptables.py | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/package/iptables/S35iptables b/package/iptables/S35iptables
index a67d0886a9..d6ff4a4762 100644
--- a/package/iptables/S35iptables
+++ b/package/iptables/S35iptables
@@ -23,7 +23,7 @@ start() {

 stop() {
 	printf 'Stopping %s: ' "$DAEMON"
-	iptables -F
+	iptables --flush
 	status=$?
 	if [ "$status" -eq 0 ]; then
 		echo "OK"
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
