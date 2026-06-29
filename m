Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 752CCC43458
	for <buildroot@archiver.kernel.org>; Mon, 29 Jun 2026 20:06:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3132582161;
	Mon, 29 Jun 2026 20:06:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H7R9-VDpyCFC; Mon, 29 Jun 2026 20:06:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4DD9C82164
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782763566;
	bh=S0W90kMiudUdPgi9blCORoI8AghojPCz4nUVb6eYlAA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oF6aDjezlkeAJTErCZtZUKTd6MtRAM0i4ZQyZzeaaVFCxXgLfJfrjTvLJ7grZlk2v
	 2tQknoVicJn6iUKLCeab50S01OxqmxkO8b+GvfmaaluLDlIDEOUJOZSxPA5NB2OjF1
	 +iKwC7uYOZkb4GPsRmMG7Qi2xGRg/I59Lu5Ha7OgKDv/riMJhnPB22zuI+Rhus+ofZ
	 IhmOwlcGFac8gr1SlA1qJSfOO/cjtN3kDv3ixVIfCc5jjV5duNeFgo1JcTqIC+GEfv
	 2b+aTekTDJbeNbruMIl8864psKNkC9OaQ3BQaqhak29XmEFiFP3mf7H0wKM2nkYvtq
	 Z1jGNiSsM6QIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4DD9C82164;
	Mon, 29 Jun 2026 20:06:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D6072F3
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 20:06:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7397540A99
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 20:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UmDBrb-J86g4 for <buildroot@buildroot.org>;
 Mon, 29 Jun 2026 20:06:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD6BB4086A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD6BB4086A
 for <buildroot@buildroot.org>; Mon, 29 Jun 2026 20:06:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 244BF8741C; Mon, 29 Jun 2026 20:05:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 29 Jun 2026 21:45:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab3c1ec3b6a5fea7dfb9602af73f422e2d83f12a
X-Git-Newrev: 4245fefb345e13826be4f088f6491ee013849638
X-Patchwork-Hint: ignore
Message-Id: <20260629200536.244BF8741C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestIptablesNft: add test
 for iptables with nftables backend
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4245fefb345e13826be4f088f6491ee013849638
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The new test inherits from TestIptables, with only minimal changes to
use the nftables backend instead.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/testing/tests/package/test_iptables.py | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_iptables.py b/support/testing/tests/package/test_iptables.py
index 918fa4fb29..c37c615e06 100644
--- a/support/testing/tests/package/test_iptables.py
+++ b/support/testing/tests/package/test_iptables.py
@@ -24,6 +24,7 @@ class TestIptables(infra.basetest.BRTest):
         BR2_TARGET_ROOTFS_CPIO_GZIP=y
         # BR2_TARGET_ROOTFS_TAR is not set
         """
+    iptables_backend = "(legacy)"
 
     def test_run(self):
         img = os.path.join(self.builddir, "images", "rootfs.cpio.gz")
@@ -41,7 +42,7 @@ class TestIptables(infra.basetest.BRTest):
         cmd = "iptables --version"
         output, exit_code = self.emulator.run(cmd)
         self.assertEqual(exit_code, 0)
-        self.assertTrue(output[0].endswith("(legacy)"))
+        self.assertTrue(output[0].endswith(self.iptables_backend))
 
         # We delete all rules in all chains. We also set default
         # policies to ACCEPT for INPUT and OUTPUT chains. This should
@@ -95,3 +96,14 @@ class TestIptables(infra.basetest.BRTest):
         # Since we deleted the rule, the ping test command which was
         # supposed to fail earlier is now supposed to succeed.
         self.assertRunOk(ping_test_cmd)
+
+
+class TestIptablesNft(TestIptables):
+    # Build iptables with nftables backend, and run the same test
+    # procedure as above
+    config = TestIptables.config + \
+        """
+        BR2_PACKAGE_IPTABLES_NFTABLES=y
+        BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT=y
+        """
+    iptables_backend = "(nf_tables)"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
