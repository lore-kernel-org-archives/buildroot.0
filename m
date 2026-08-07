Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3704DC5AC80
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:35:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE92440A96;
	Fri,  7 Aug 2026 09:35:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WKVRzfMSjM5o; Fri,  7 Aug 2026 09:35:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1867C40A86
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095355;
	bh=dTLKUI2SCuJ+uVYUimqj4BSIwVt+NviB2bJ7lIU22Qs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=e+qkJM1XeBHLdqwvWpBcii6iL22m+x7RPdJxXjhc6rKcrpSi6YpujKTAOdocetMts
	 FdBel2ZmsAFeGyou92NmVOsaYoAW0Ff8nArFJJtyS1Y7f51rn4uu2SjPMLNwnxKMqh
	 +zinKegNWaWRnsDaPfU541VUHUGdfdLvTm/KVWGA2TyzepHrXU/ETMiWs2CvVY/ac3
	 fZYtVm32yNfKamft9XYiOqc2N0jBfiEAkO3LOjCEHZAQtzIJE1CWwwvdCYAqqpT5n0
	 jilm9kieMjL4zJutnV86adgJ+ruR/SEUJ1O/QOpFxoJiE2I8trYSWSk4zjZ2DUqjeU
	 tJc2ZSyd/4YcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1867C40A86;
	Fri,  7 Aug 2026 09:35:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BA535D3
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACDC5409FB
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYqkDfpz5xl5 for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3132140A2B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3132140A2B
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BB0968CA40; Fri,  7 Aug 2026 09:34:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:12:42 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 1a3d80074cb489b1b93fcef7008ddebd93e17ef6
X-Git-Newrev: 772bf9f87356d2619e66c97936cc60e8bae18de3
X-Patchwork-Hint: ignore
Message-Id: <20260807093442.BB0968CA40@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing: usbip:
 wait for the keyboard be detected
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/772bf9f87356d2619e66c97936cc60e8bae18de3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Running TestUsbIp may fail when checking if two QEMU USB Keyboards are
reported by lsusb. On fast host, the second QEMU USB keyboard may not
aleady detected when lsusb is executed. So wait a bit, to let the new
keyboard be detected.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 933a591d8a4a5423fb0dfae0937faa7eff0c1b00)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
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
