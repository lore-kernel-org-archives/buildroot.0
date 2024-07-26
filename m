Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587AEC3DA4A
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 16:21:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 24CAB60B66;
	Fri, 26 Jul 2024 16:21:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zta9Dt6yr0zL; Fri, 26 Jul 2024 16:21:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B806660E90
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B806660E90;
	Fri, 26 Jul 2024 16:21:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB1DC1BF860
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 16:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C58E960BAB
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 16:20:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cxqui8GxGBj5 for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 16:20:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C1C7560B65
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C1C7560B65
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C1C7560B65
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 16:20:46 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.115.174]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MyKHm-1sNHLf3yrk-00rlTM; Fri, 26
 Jul 2024 18:20:40 +0200
To: buildroot@buildroot.org
Date: Fri, 26 Jul 2024 18:20:10 +0200
Message-ID: <20240726162013.2183792-6-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240726162013.2183792-1-fiona.klute@gmx.de>
References: <20240726162013.2183792-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:tRS+PqpQHR84jOiVS6CQna+rgSgS/eQ4zu64c9QQqN3N4PrzhW9
 X66Mw6IPmiIms+581v/AAJHoBxk7DbuTKOqSg28cjOIukg7/iNXHHBKD2wkzDJn9mbRegGL
 nS1SkhCClLzznrvE8vb0Q33ZvSqi4S9lrxrbTM3xouQNolKfre3MhlA3QlkjAWLZNtzrMw7
 ptI6godT4E2X8iSGp66TQ==
UI-OutboundReport: notjunk:1;M01:P0:8HAZkIylUNU=;9Ncc/CTRFhfvjRXVl6LTdsNeVn+
 NevR1QuzWuxpIjOQ3DJ/9f+JWbqwFRH0D/Q9pZf5Wtgq7Fb+dhHN6WxXtGE4xS+GuOqCdNH8O
 VXlXjRZEn1Xv0Tjz2HiZDxIyADoKvKDFt+t67+VV4aH4zE8AQ32y3etwGM3+GS6H8joayyv1H
 yZkk52WXU4v1lNXpWmdhR7+Yu6sggB+xkiS1EQzCWQHnzo3iwjz0bFpc6l/3rYDmIusRqv0YW
 ZViLGj66fzHv2ZY684t01PaZSuLtz4ZYQuKL+QsXQWTshE4RrMb1C1gu/PMTsS5dcIFzUjjYE
 lJMQsIJo8/Ml8a0ChsU5pjyHXTRvOS90OxHQMxPyLhkimq76ZbtU01ZNeAPICsWZuKU5S6ckb
 yLlHKBUQiGn1netdEtZUcUkSmbVmrChBfVmdNtSfttCs4R6a2WsqUMAPeS4aLQj1erm3iMu4Y
 KumM7h+FSuFZhvqH/MBVYCM2+DCP3Fn+3GzY6F5djiEtVBWTri7Rtaz25mBw7ihTY6LzWWUME
 WfE6TfCqFecv6JZn/4Iw34fTN8FPZdJ2JhtAX3BDEiv8qhVruZTBCiCon0S2V+NzPnq0zwmqK
 R+46goYQTTf39/i/HV6YiXFNiqtmQCaQSa2qPgs6FttJXIjatvZoVztnoMAwDQD1yHEqh2BBj
 tTHxs11b1N/cmoUccGeNEWxY1EwiX0UYpBhnZCLWh+xFqb3FslN/aBP7H5mV7+bKvcN6q6Cz7
 +xyoKoVrtn46Ko82CgAjIb4W+F696in1eJ7HRkFVzE6f1Dn5x1MLpH/9neDxa+CmO5PF1YXLg
 uN250e+V12zBJOp3h111VP3Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1722010840; x=1722615640; i=fiona.klute@gmx.de;
 bh=BN/FXo6B97C0eR9xXMWvWc+SIFPrj5qF6kwluHeap9o=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=clXJ/fi5dFeVQPdHap9mo22KfnSZlojkF5+HLoBi6J9vzoFVbcrzH2G0/1NQ4yhy
 1rXVpvv2L5oXcoBKQR1HNnB24jSsyUnD7reArBiEeAibwyf9hHPRuDcKE7OKMhNbp
 14J5ec90Be0Um4mxuLgq/DhqWqvbffQcPSNx/GlzooDZfjiju3VkBlPJctxNsyltd
 7eYRkk/9SP9ifHTfvzcKhIlNuBxxY/JSgR0Ewqpf6O59M/SymLoS9lt7KuuI5OBCy
 oFHqSxCxbKcRfxwMHQXgPMhdvMdweZID7fc8BfDPTn3l4QUZMnI2s2Sgr+WICeCTB
 jO3oSJZQpKs1sZLVmg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=clXJ/fi5
Subject: [Buildroot] [PATCH v4 5/6] support/testing: include init script in
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
