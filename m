Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 241BDCD98F8
	for <buildroot@archiver.kernel.org>; Fri, 19 Jun 2026 09:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EEDC16F5F9;
	Fri, 19 Jun 2026 09:05:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eanYz178jY7F; Fri, 19 Jun 2026 09:05:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1AA346F627
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781859926;
	bh=wA5WlGNPhG7+85TUikOr3d013UeVoishFY8y0VsjAYs=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=i9sMLBi5aNR0zsY/qpf9Q+WZzUnhk84bgXw+voJbz2VFZ5Aihjt3nFq0C1aLCfm5d
	 BNDQuH+9oOwfYPYo+irrpqAuSU5qrbQMXIhs8jSyDpwZJjp0wo8sfbjW5iZnf1qWo4
	 SNGvxAlI9xwPqloteD5xYtjtaFrK4L7zH8lo9TucrtNs/HnPJM+6xeQahMA930XTrx
	 qbxd5Pk7leaW5selCKrqWWIBvS0q3SawMy7qRxS2WMafJBrAZTCFJyjPlLgojt3Mje
	 VaKT8t+4ClIszpF9aGqz9CMvXEP3dhq8enXjW6VGk545fGTva/SaE7mOxQLQwZwDsd
	 pNkqUvbKBESPw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1AA346F627;
	Fri, 19 Jun 2026 09:05:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 18413D06
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EF48584BDF
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L45euamajSoZ for <buildroot@buildroot.org>;
 Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C72284C32
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C72284C32
 for <buildroot@buildroot.org>; Fri, 19 Jun 2026 09:05:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9C2EB81645; Fri, 19 Jun 2026 09:04:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 19 Jun 2026 11:02:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cb791850ada782beca4b03e26356fd8506912d52
X-Git-Newrev: f3942975c49804cec7b2e5288cc9fba906dcafdc
X-Patchwork-Hint: ignore
Message-Id: <20260619090446.9C2EB81645@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: test_iproute2.py: use
 assertRunNotOk()
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f3942975c49804cec7b2e5288cc9fba906dcafdc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Use the helper to simplify the test.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/testing/tests/package/test_iproute2.py | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/support/testing/tests/package/test_iproute2.py b/support/testing/tests/package/test_iproute2.py
index 91d9006e23..78f8dc291e 100644
--- a/support/testing/tests/package/test_iproute2.py
+++ b/support/testing/tests/package/test_iproute2.py
@@ -46,8 +46,7 @@ class TestIpRoute2(infra.basetest.BRTest):
         for addr in addrs:
             self.assertRunOk(f"{ping_cmd} {addr}")
         # ...but the IP outside is supposed to fail.
-        _, ret = self.emulator.run(f"{ping_cmd} 127.1.2.3")
-        self.assertNotEqual(ret, 0)
+        self.assertRunNotOk(f"{ping_cmd} 127.1.2.3")
 
         # We add a prohibited route.
         self.assertRunOk("ip route add prohibit 127.0.1.0/24")
@@ -57,8 +56,7 @@ class TestIpRoute2(infra.basetest.BRTest):
         # ...while the other IPs expected to fail.
         addrs = ["127.0.1.2", "127.1.2.3"]
         for addr in addrs:
-            _, ret = self.emulator.run(f"{ping_cmd} {addr}")
-            self.assertNotEqual(ret, 0)
+            self.assertRunNotOk(f"{ping_cmd} {addr}")
 
         # We should be able to see our prohibited route.
         out, ret = self.emulator.run("ip route list")
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
