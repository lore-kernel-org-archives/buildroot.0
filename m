Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D77ECD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51E5C41028;
	Fri,  5 Jun 2026 12:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IzOVMft4q55Z; Fri,  5 Jun 2026 12:39:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 12FDC41032
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663150;
	bh=l1ClD2+MS/EnqQ+SA2ZMf8MpMJ7tAtp6GXL3GbXTsyA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZP+VaalNivlz4elexV1VuwVYvypm4Ksj9ciz5vd5GtyQs4zftoGcwaoM4I5rsZqUi
	 ZSP1ECGQuadnHv83pylNcr1AGHKtXswlyIb8BWszPRA6umdQhYo/4nlq3zlmY6PRET
	 6289/l8JS31gf3JOJuAR8/51bG0vkbIMH9agJOQXtGjVj2O1MFxjwFA2aJAC9CXSeM
	 VHPeyoomm3LfUWKCcZZDMcoJHgza9zERL2H1Du+xEJLKxrRQQI50BFYO84dz2scd/O
	 8PwEIM/hxxWcVabRV3c6a1sTdSCLZ/QE+fk2YJtFZzGiSd2efU/kda3vyOgWzN/1oh
	 4iGtQPhq5IRFw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12FDC41032;
	Fri,  5 Jun 2026 12:39:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 11E54388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66B5781EBE
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 84pJWah3dW3y for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C5E381EC5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C5E381EC5
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B604D872F5; Fri,  5 Jun 2026 12:37:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Jun 2026 14:00:44 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2012b9e4b9416df22f9f58637b0515e246f59c13
X-Git-Newrev: ef93b47d98a2ed0a41b6c45d769acba8a2cb2279
X-Patchwork-Hint: ignore
Message-Id: <20260605123714.B604D872F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/openssh: add
 patch trailer
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ef93b47d98a2ed0a41b6c45d769acba8a2cb2279
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Commit [1] introduced a patch to fix CVE-2025-32728.
Since [2] the security patches neeed to reference the vulnerability with
the `CVE: ` trailer in the patch header.

This patch is no longer present on master branch with openssh bump [3]
but hasn't been cherry picked to 2025.02.x branch.

The 2025.02.x version still had this patch present and thus need to add
the trailer to it.

[1] 211e822d43 package/openssh: apply security patch for CVE-2025-32728 (sshd)
[2] 1167d0ff3d docs/manual: mention CVE trailer
[3] a127b7e999 package/openssh: bump to version 10.0p1

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch b/package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch
index 2c64ec1910..d068002638 100644
--- a/package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch
+++ b/package/openssh/0001-fix-logic-error-in-disableforwarding-option.patch
@@ -9,6 +9,7 @@ Spotted by Tim Rice.
 OpenBSD-Commit-ID: fffc89195968f7eedd2fc57f0b1f1ef3193f5ed1
 
 Upstream: https://github.com/openssh/openssh-portable/commit/fc86875e6acb36401dfc1dfb6b628a9d1460f367
+CVE: CVE-2025-32728
 
 Fixes the following CVE:
   - CVE-2025-32728: In sshd in OpenSSH before 10.0, the DisableForwarding
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
