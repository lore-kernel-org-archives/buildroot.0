Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBFF8D2F35C
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 19:36:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A542360BDF;
	Tue, 13 Jan 2026 19:36:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9XaAvpbWtpyr; Tue, 13 Jan 2026 19:36:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B808360BF2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768332994;
	bh=hyLcuJZ4ndteJDfFmx4KFBRRC/wTZy6v3sEII868nkw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Q0ZyDe8sAwY91NJWfQXD7RdKEkG/gsY1r+61VPTfWsieYiNUd3tzUnwPtbTKM6tsC
	 VyNtlLd133qiPHw3CaNKL6VRZk4Pkqji0YCz2cdHq66O7tnJ+E1RWpvHC92fmT1hxZ
	 ljrGmU7BfQ0MG1LQqNH6V6zOT88ojgd66uQRV/QLCtggi6sKd3eSonmxI5J9bT++LK
	 Sg1mEc+eOJUUTa6Xue5i9JPKfbhnmF3mkC+FIEMyOOOKQ87NX86igoQih3Kh0FcWqT
	 OPpPpAvHtdOzMuZEIs5XD9NcZaUsudrxh3rg/wq6H395Eqj+rHk5uODVjPPC8QJSRa
	 XtKscviachVHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B808360BF2;
	Tue, 13 Jan 2026 19:36:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 37D00231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 59FEA4054B
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RU3TaE31Eylx for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 19:36:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7CA484043B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7CA484043B
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7B1DA84723; Tue, 13 Jan 2026 19:36:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 9 Jan 2026 16:03:25 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 90a58c761cdde9b2917954dbf789a79cc574c043
X-Git-Newrev: e7918ae91a1ec2440b84f45d6b1620251d187aa3
X-Patchwork-Hint: ignore
Message-Id: <20260113193617.7B1DA84723@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/postgresql:
 remove stale IGNORE_CVES
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

commit: https://git.buildroot.net/buildroot/commit/?id=e7918ae91a1ec2440b84f45d6b1620251d187aa3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Since Buildroot commit [1] the CVEs are no longer matched to CPEs with
versions using '-'.

The CVE-2017-8806 is then no longer matched to the postgresql package.

For more information, see the explanation in commit [1].

[1] 35f376d88e support/scripts/cve.py: fix CPE matching

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit b1ca8ca4ba4814dfa11e840cc94341d966a6e911)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/postgresql/postgresql.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 86761bf939..13abce8330 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -28,10 +28,6 @@ POSTGRESQL_DEPENDENCIES = \
 	host-bison \
 	host-flex
 
-# CVE-2017-8806 is related to postgresql-common package
-# It is false positive for postgresql
-POSTGRESQL_IGNORE_CVES += CVE-2017-8806
-
 ifeq ($(BR2_PACKAGE_POSTGRESQL_FULL),y)
 POSTGRESQL_NINJA_OPTS += world
 POSTGRESQL_INSTALL_TARGET_OPTS += DESTDIR=$(TARGET_DIR) install-world
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
