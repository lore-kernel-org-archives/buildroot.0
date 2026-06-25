Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9333CDB466
	for <buildroot@archiver.kernel.org>; Thu, 25 Jun 2026 08:37:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 92C1882894;
	Thu, 25 Jun 2026 08:37:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kpriul4-YEKs; Thu, 25 Jun 2026 08:37:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BC90F82897
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1782376677;
	bh=E4cgr75ZSA4Q8O9OwzBf9yD8fqZ9PRT/G9T+vdKPgLw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SRRP2gQDDbWY7UkTCo193re7xOK9ALFOuL4IjPcMeDdtABb3kVRCvGs/XVB8EESyQ
	 l6C1qlmDYR5sSp9JVAyh5wpSuSJXEhoXEHsOiQeeiQWw7ZdFLbSALQqiZHohiY/er4
	 NRT3lNf1OvyjR9xLxS0UWm/lRefMTm+I9tEmROXYUTj3+XgmGQOXqD+c63O+sj+lT0
	 xOqg4r5Dj+g4iFvjuC+TiJJa4YSt+XBRbyJyAJdm+3jONTw1aJxGx0nLyzUi//aCsq
	 6GJyxusk2BNueuDtwh7abNq6MzeLDvcnYCUsXnLXtqPltBZonrR4REsikSCX1PJljY
	 rH2M4leA55hGw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BC90F82897;
	Thu, 25 Jun 2026 08:37:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87430254
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 08:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 650AB8289B
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 08:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 42UcC7QWjORR for <buildroot@buildroot.org>;
 Thu, 25 Jun 2026 08:37:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AAE382897
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AAE382897
 for <buildroot@buildroot.org>; Thu, 25 Jun 2026 08:37:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2912B85171; Thu, 25 Jun 2026 08:37:30 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Jun 2026 10:35:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c57bcf0d4352bf53edf436522918bbb3e75b43ec
X-Git-Newrev: 1b2f65bbe942ae3f662294bad5cbb839475db92e
X-Patchwork-Hint: ignore
Message-Id: <20260625083730.2912B85171@busybox.osuosl.org>
Subject: [Buildroot] [git commit] support/testing: TestIptables: check for
 netfilter legacy tables enabled
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1b2f65bbe942ae3f662294bad5cbb839475db92e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
