Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A1F7E7716D
	for <buildroot@archiver.kernel.org>; Wed,  4 Dec 2024 18:29:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2DA7412AC;
	Wed,  4 Dec 2024 18:29:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n_TqysSoJwsS; Wed,  4 Dec 2024 18:29:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE2134130D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE2134130D;
	Wed,  4 Dec 2024 18:29:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14BCA1DDB
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 18:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02A464130D
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 18:29:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eZgdGBTEZIhs for <buildroot@buildroot.org>;
 Wed,  4 Dec 2024 18:29:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9F27F412AC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9F27F412AC
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9F27F412AC
 for <buildroot@buildroot.org>; Wed,  4 Dec 2024 18:29:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.124.249]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MnaoZ-1u2ARV1JxN-00ZfCU; Wed, 04
 Dec 2024 19:29:24 +0100
To: buildroot@buildroot.org
Date: Wed,  4 Dec 2024 19:29:12 +0100
Message-ID: <20241204182913.4085670-6-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241204182913.4085670-1-fiona.klute@gmx.de>
References: <20241204182913.4085670-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:cQMlyh/P6UCXVvzJI/ajaRoPUJ5tKC4Ga6iVzHgqgSgnCtKZ4v1
 Q0284p7pKFWkRyaMNA7gGWHADfTvm7AmsZ5Guu+Ib4KQ+P4fZRMuhFY3ksEH2tBmUBsgN18
 0Su+nPha7i54QsWFb9laJOiDtuFBA+LUkI5MsZb5qtjAj3QoL/Mre2N165CX5KyBGvkUj7m
 VzJWW+sXXtQkl4dQ0sogg==
UI-OutboundReport: notjunk:1;M01:P0:9shwe/jfxRA=;CIVj+JXKsFlUdzygFpexz84lSGY
 tzYavJ+/eVzB54wbTgiHky9P1FoYAh/dsIMgRrIpmS6ViwB5oV1wnaT3v9T7gMtFYnrnmuR9H
 mJ8x7Spe1j8bLjjgazikZg06Cl8x3glgah3z1C022/WFNas3fivW9vw3hY0YXFzejj3gka35D
 M2TnnC9CQDtbON8hzdKaA3dRaY3vJ6xvgXIBy91VKP/izg07vPCzakOcQxMgrJILIHyh2v4VK
 +BeCjSoKapfWNlFu4uT2F/4zQKZtPs4ZDx+tvUAl9qf0HQ41SecnyaQ24X8IM5zwLdEX76Bdq
 ZSsCasWSVNfbm8NfgMY4VUeQQWlwC/ugPA4hAnd8p1kvWBxLALR/1qadmHf0e0NS4owagEcW8
 z+xoAwzQwjRJVqCYSvSmj4UX+5hwgx/plvueqrb/uRfmcmzv3rU4+x8qyekeytGGxjg0fagWQ
 uA9jJ/gppXOOA/F1rfzOvUSUiTq+MRVtOpbJtZXcusOaCJyOejlgj1CPOEWmeX2o+Viy5cDWL
 70sVrU8/ReOBjD3VG2VgtB5JfkVwxxCZiMyuz76gm2lBaRW1Yo9LobpqZO5TBRHMTF7zbVTyc
 9APpZGbj/nA1xoPmNRExxhKPElFNjt1QUHdsGaZ7+5+L8NpAMBWwPqRcPkc03HzsKfgLVLblO
 FDpiTq6dSehV0oNReI0ggDIfXXybN/4IORnEyJTb5pwrgH4bIlEZdJQKrXFQtK9H+Bt0e0XnC
 Ql7w7rnv5QIPUazHvWaUmDbJxnQO/00n0uueJjMKIU+hD8+ehXamwgKUe1++rjewHOMkLD1n1
 WrhL6p29x8qxmVVzIhhmE5TEi12oRy4KOxmLzs9fxpsJrVRQZOWVOMEuaFNUn+7aEcxSEUbEU
 mtAjDBR+BiZyX1+sqWZ+Hiyc6cOz5L63HpRkO3sSofz6H1rUlVj1286MZ9mFgv3w9c9gm9tzl
 SRQdKZAByLULfz4xYmHRclTklZkf9I3CP/aS4AyE9cjBe9AiuKtFO7fCa6DDvnQvITLeba/AA
 UU4hgQSN2ekBiB88jmWDz8O/uyYyp1N1Locgn4fFEIUH3ZCnSaACHHG3MQ2I/tjz9ctZOsBA2
 BeX47DaQ4WzvvaDRZh7tLZ0xth9F1G
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1733336964; x=1733941764; i=fiona.klute@gmx.de;
 bh=Wzj+BtLvoZJX+sM6IKjX2VtFwfjGvCJ+14Ipggpzg9w=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=CPZjLnRgN+1BkF1VkuRvPqr5G17jYvUo6WaLG3Y8aNH0YYFp75tcQA7k4pihKOae
 fGRRzUZR96N1OlTXti9Cw5B7amqphiHXw3AhUSEev41mMryz+LIWXiU3oh1iPzc1L
 2+b1zTFrKVLU35tois9ozwk5gk+V/oK3My625Nua19DGuoWyYU2t8SnBw1rsQi/tx
 l3v4LgwYWoKprs00G6/dSk8V4KC+Gx1Xm+MJ13+cf+x/v9n4siLQ6DnBuNEccCoA4
 paEy2ma1GC2tyqC1LFRtscocDmg6eEr9sMZnyCuKch4Q7I5YahJB1vbII7KxFZ0HF
 TQ0O5fd/icucUPFdqw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=CPZjLnRg
Subject: [Buildroot] [PATCH v5 5/6] support/testing: include init script in
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
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
