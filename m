Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1407C55182
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 20:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7177D80C92;
	Sun,  2 Aug 2026 20:25:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hLY_oPfaRQdm; Sun,  2 Aug 2026 20:25:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D85380C7E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785702307;
	bh=+6KWrKWkwMpNAiRu9BllEbOJAQCo+fzSqo6zQ9LU6ag=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=cZw6rYyElnsyb/sf8pCE5/tJqhTen7tO6JLFtWlEeaQR/tcg950F2QlPL3Z+A2FFL
	 4Ie07XYE1Zq10VS81Vq0wG4DL4wW8U2m3k1c66ecHpn53H2GsVazm6KGmo5V9Pyu8P
	 nem6pAoYHIUJvIDUjii+034HaiOWMeBbMLTrvCcBSU2aahqR/v+wZOi7vSmbwtOwk0
	 f97Y2q0gbmJJKSQu+UKwCfzfJTflplT81vo+1zJ1khrVQdvP1Cr3yaITFO2fvBam0L
	 yfeJOAEVi5u3w/3WAwHJwlyM4mN3OpV0RouBJ17SPd4uHhjR10CxeRaNruTMbAbWqj
	 V1Uh5CuixbN8Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D85380C7E;
	Sun,  2 Aug 2026 20:25:07 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id D91442CE
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 20:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BF42140029
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 20:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FKUw7sJXw2QJ for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 20:25:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DED2540015
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DED2540015
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 20:24:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 82F8D8B845; Sun,  2 Aug 2026 20:24:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 2 Aug 2026 22:04:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 67d6e6602fec095084f64560050cb1195dff7765
X-Git-Newrev: 933a591d8a4a5423fb0dfae0937faa7eff0c1b00
X-Patchwork-Hint: ignore
Message-Id: <20260802202415.82F8D8B845@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: usbip: wait for the
 keyboard be detected
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/933a591d8a4a5423fb0dfae0937faa7eff0c1b00
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Running TestUsbIp may fail when checking if two QEMU USB Keyboards are
reported by lsusb. On fast host, the second QEMU USB keyboard may not
aleady detected when lsusb is executed. So wait a bit, to let the new
keyboard be detected.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 support/testing/tests/package/test_usbip.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/testing/tests/package/test_usbip.py b/support/testing/tests/package/test_usbip.py
index 2fae8f7f6a..62c7b59814 100644
--- a/support/testing/tests/package/test_usbip.py
+++ b/support/testing/tests/package/test_usbip.py
@@ -1,4 +1,5 @@
 import os
+import time
 
 import infra.basetest
 
@@ -91,6 +92,9 @@ class TestUsbIp(infra.basetest.BRTest):
         # keyboard.
         self.assertRunOk("usbip attach --remote=127.0.0.1 --busid=1-1")
 
+        # Wait a bit, to let the new keyboard be detected.
+        time.sleep(1)
+
         # We check "lsusb" now sees exactly two QEMU USB Keyboards
         # (the original one, and a second one created by usbip).
         out, ret = self.emulator.run("lsusb")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
