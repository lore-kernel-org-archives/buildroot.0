Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0047FE95A74
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 10:57:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C6DDC4038D;
	Tue, 30 Dec 2025 10:57:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p9PTSF0dkbCQ; Tue, 30 Dec 2025 10:57:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 024F540418
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767092266;
	bh=trCaBh3hRHXEO3X/1jf9CYE9G7mx6bJCBcsnFxEUgYA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=khAPgbPH/rK8PbMtwovlatgsxlSQXrxGdUYRgwZjzXhTRgoIcaMv4KFWfs8M9GCCj
	 U1xHTko17T/iCgnLni5jzsKsNhKZUumKLvRX5yCH5oHCJ+3VhYUsleq2W6+AdtX2to
	 oWfxqRXfDQCsMlSyyDY3VWIcA9oLS+lTY2VCs6buSavl4fJvLm67/x2kA1APFOAgRP
	 O4P7y3PSBSF22J/W21ts/j+b9J8dwJ0cUGH/G2qQEvZKuFr4Wwgu8IdkJRvAGtX7j9
	 2m5HRV3jrDOl3eg4HNwklaQkdqTlkdkkoZXEw++bQDHgvmJ76pWxcvmrzzTcrtvHci
	 T7nJwUKb3d+SQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 024F540418;
	Tue, 30 Dec 2025 10:57:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 16E97177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F07748129B
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lFyHk_yGfY9f for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A596811C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A596811C1
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4816587BD2; Tue, 30 Dec 2025 10:57:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 11:54:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b3007ebcaf4736dde948a43ea6f8abee6b83c8c5
X-Git-Newrev: 9dbd14df2291b5c6566d7fcd73c3934b931aed1a
X-Patchwork-Hint: ignore
Message-Id: <20251230105735.4816587BD2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dovecot: remove stale IGNORE_CVES
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=9dbd14df2291b5c6566d7fcd73c3934b931aed1a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
versions using '-'.

These IGNORE_CVES entry introduced in [2] is then no longer matched to
the dovecot package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching
[2] 948e71689a package/dovecot: ignore CVE-2016-4983

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dovecot/dovecot.mk | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/package/dovecot/dovecot.mk b/package/dovecot/dovecot.mk
index 6612787a94..a4c799221c 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -21,12 +21,7 @@ DOVECOT_DEPENDENCIES = \
 	$(if $(BR2_PACKAGE_LIBICONV),libiconv) \
 	openssl
 
-# CVE-2016-4983 is an issue in a postinstall script in the dovecot rpm, which
-# is part of the Red Hat packaging and not part of upstream dovecot
-DOVECOT_IGNORE_CVES += CVE-2016-4983
-
 # 0001-auth-Fix-handling-passdbs-with-identical-driver-args.patch
-
 # Note: this ignore CVE entry is reported as stale by pkg-stats, but
 # the NVD database is incorrect:
 # https://lore.kernel.org/buildroot/20250517181815.02ce0393@windsurf/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
