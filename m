Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5917C43458
	for <buildroot@archiver.kernel.org>; Fri,  3 Jul 2026 14:28:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BAA060B43;
	Fri,  3 Jul 2026 14:28:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wmkNShnM4OdN; Fri,  3 Jul 2026 14:28:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA2D960C1E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783088919;
	bh=RfRnBz16u5zfVf92FNezspENkOucIFx9eyC0lS9htWw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o5Z/SpaJkGHMGOKyfaPj6bmk1zpygggn/o+DKHjeQbXKxSm10Rxfvro4xkF4Ye6yq
	 oCqYogoDRyzqDR3nv0PlI4VKUhTUluaz5rzGxmpieMOvWVbxBAbY/ZCBiJqXIyyoBx
	 d7idRSpoFkI00rAli/t3icNfseM0qg10Ylaa2X2tjPS0s7hYS47UuL3eBkf/VCNw9P
	 3tuFKWC6/XOuJ0U61En221YMQSbahsDSdYjRjk7IfelBZ0yTyWo1vvRIu0OD1/vK6L
	 DJWwKyMZmOAnAChXTcRdQOIeHTXzFsOTWmbEyTbk/FlvXjaQN1UuAtxtKv4SkrnJUh
	 RrFO+WUCJe+PQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA2D960C1E;
	Fri,  3 Jul 2026 14:28:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 6A5AF9E5
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50CB040FC6
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wIwz15tcOfRK for <buildroot@buildroot.org>;
 Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 570D541143
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 570D541143
 for <buildroot@buildroot.org>; Fri,  3 Jul 2026 14:28:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ED4E1883A1; Fri,  3 Jul 2026 14:27:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 2 Jul 2026 21:31:02 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 8e913e6c385ce234e1d541ba923e3aeab091f719
X-Git-Newrev: 7d8f9f6c0f7139c2cefc7579fe593f59870e092a
X-Patchwork-Hint: ignore
Message-Id: <20260703142757.ED4E1883A1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] support/testing:
 TestIptables: check for netfilter legacy tables enabled
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7d8f9f6c0f7139c2cefc7579fe593f59870e092a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

TestIptables expect netfilter legacy tables enabled in the kernel.

Make sure we use iptables-legacy:

  iptables --version
  iptables v1.8.11 (legacy)

The test would fail if nftables compat (iptables-nft) is enabled.

  iptables --version
  iptables v1.8.11 (nf_tables)

Add the following configuration fragment to enable iptables-nft:

  BR2_PACKAGE_IPTABLES_NFTABLES=y
  BR2_PACKAGE_IPTABLES_NFTABLES_DEFAULT=y

Acked-by: Fiona Klute <fiona.klute@gmx.de>
Tested-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 1b2f65bbe942ae3f662294bad5cbb839475db92e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 support/testing/tests/package/test_iptables.py | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/support/testing/tests/package/test_iptables.py b/support/testing/tests/package/test_iptables.py
index 72f2dd71a4..eeb4ccb5dd 100644
--- a/support/testing/tests/package/test_iptables.py
+++ b/support/testing/tests/package/test_iptables.py
@@ -38,7 +38,10 @@ class TestIptables(infra.basetest.BRTest):
         self.emulator.login()
 
         # We check the program can execute.
-        self.assertRunOk("iptables --version")
+        cmd = "iptables --version"
+        output, exit_code = self.emulator.run(cmd)
+        self.assertEqual(exit_code, 0)
+        self.assertTrue(output[0].endswith("(legacy)"))
 
         # We delete all rules in all chains. We also set default
         # policies to ACCEPT for INPUT and OUTPUT chains. This should
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
