Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3307D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:40:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 76DCA83DE4;
	Tue, 13 Jan 2026 19:40:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bWAw-wm6jLTO; Tue, 13 Jan 2026 19:40:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8A9983DFD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333251;
	bh=8TxkDJr+/8v+I0m4JfN9msAqNjxhqelUeAbwd6oDj/o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z89RmR+e/KKz/SPdgb3Z4v9WnJ48baya4EKhHujbNZj234V+u7kzGsES5YT+PqrWE
	 LsnLIHh1RTeZTmncXtazn8Nafay1trtQGWA9NSXuZyrpGG8lWTTsDF9ImnM41zJPOr
	 tjqaZDnk6+fh/HhztH8ezpX44RAEIxPc/Mip4zIGV4FmiL9mHE8Z3vyN2bgmnIt8qC
	 iq7lUKpMVLZ02AlA64u8TiEBxl3GWttjQf6ptuU8CxflsXcTW1HnlMqTzyHYJdIubk
	 dkAJSpj2FBEcTWIGx/tHDdFHqLdv2pYhmaQphCHIrBouWd3r2IOKSsC9V9edinwNbM
	 MToUdW6oqsUXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8A9983DFD;
	Tue, 13 Jan 2026 19:40:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E187231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60BE482F20
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PpLmFjPRBy78 for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A36AA829DC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A36AA829DC
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9FB3C86E70; Tue, 13 Jan 2026 19:40:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:04:33 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: a43ad685df16d25940d836ddf5bc3a88c90c3eb3
X-Git-Newrev: 700f6e24a1d4f3d7712397cda711ae1bc1eac993
X-Patchwork-Hint: ignore
Message-Id: <20260113194032.9FB3C86E70@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/dovecot: remove
 stale IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=700f6e24a1d4f3d7712397cda711ae1bc1eac993
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.11.x

Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
versions using '-'.

These IGNORE_CVES entry introduced in [2] is then no longer matched to
the dovecot package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching
[2] 948e71689a package/dovecot: ignore CVE-2016-4983

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 9dbd14df2291b5c6566d7fcd73c3934b931aed1a)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
