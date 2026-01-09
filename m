Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD7BD2F32D
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7769960BD1;
	Tue, 13 Jan 2026 19:36:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id abNdcm5x5WkK; Tue, 13 Jan 2026 19:36:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98BB360C30
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768333009;
	bh=goKFxRYEo8kZn016xDDzpjhW7e0LYPeVJE9yz8mJTxI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Dji7iarDqe9All76hBsGBMMPLdvDQkb1jnqwzaEABXUM+hkODWzCxzUvoVdh4Y7b1
	 fTM3xJi1sNLbTKfMu+0TBGv6CWKnJ55nfOF8AvaGNl0H9yj5NbZmjf6nq46eQsqpLq
	 MRGibOqKQOXt3/rF+/nph++EqDhdXvANgFl8+2ChZA+QmanI0gRmYGhLMRkPLeqWNC
	 sjh+USSAqJv2qQutONdas0wME5RDLOrJlgS98lEKjBG2ALP2xsl8dMXIhxgRIzrLnG
	 TWVeoF+W8Eu9D0YPLsX6Y/23CiCX1+umWzWaevOti4V1ARsQEAG6QVHZHl8khfuGUw
	 PHkh2Gue1t88g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 98BB360C30;
	Tue, 13 Jan 2026 19:36:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 063A21C3
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 34D4D82C84
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7SLH2Fhjyb4r for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E791082C04
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E791082C04
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E60F3884BB; Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:04:31 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 503adba18a0cae211e2f71e8ef0c08df6b612b07
X-Git-Newrev: 72fc25bba729b022dd4bac558461d5e0dbd58faf
X-Patchwork-Hint: ignore
Message-Id: <20260113193617.E60F3884BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/dovecot: remove
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

commit: https://git.buildroot.net/buildroot/commit/?id=72fc25bba729b022dd4bac558461d5e0dbd58faf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

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
index a48cd7536d..c4e366baf7 100644
--- a/package/dovecot/dovecot.mk
+++ b/package/dovecot/dovecot.mk
@@ -17,12 +17,7 @@ DOVECOT_DEPENDENCIES = \
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
