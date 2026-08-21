Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F72AC5DF94
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1BC381297;
	Fri, 21 Aug 2026 15:07:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BpqYWTJM9ehC; Fri, 21 Aug 2026 15:07:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324861;
	bh=TVk+PB/IkpKsHZjVu2U0Gfwn44Q4bQpixqmWTKtFAaw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=smvqRcoKNHbk5TbKNXA00RDBdSvMswDEKYa1siO2F7tkjFSFuXF57OOCdnFiHCK5e
	 Wfsczw0dtSyO9roPn7UPZMHYO9s07Cl9g3T05TofRWtzmoKkOMOg2UxYZtEBAAjqt5
	 FcqRbLDhcpQRv+KRPK6GoGUo6rZ62GKbcxe12OdiGzQgq2eoWR2+EarYyOCbs99IF+
	 2uJmnv8aNf7SzvN2eqyH3H+5lrx0mMdDUt2HTXLmEajBaCwnpOYRMSLrYQ7htkxNgW
	 Jyem3AHFEJhWIozpb/7vOeZEm8R/7BCsjCHkG7PXd0SIFj3yUwaMExEi7/B2/y/MJZ
	 sQxGMd7qd4IQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86BD681228;
	Fri, 21 Aug 2026 15:07:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 354702D26
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AC9F60884
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SILJtXet2a58 for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 734B96063E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB79B8E127; Fri, 21 Aug 2026 15:06:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 17:04:22 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cdbb84c3ae7dc0637820dc7d5a3a8ba3e24a9146
X-Git-Newrev: 5c47b9236d887572496295cd77162cee915c2e4c
X-Patchwork-Hint: ignore
Message-Id: <20260821150614.DB79B8E127@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/postgresql:
 security bump to v17.11
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
Content-Type: multipart/mixed; boundary="===============3590442403286440256=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3590442403286440256==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5c47b9236d887572496295cd77162cee915c2e4c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For more information about the release, see:
  - https://www.postgresql.org/docs/17/release-17-11.html

Fixes the following vulnerabilities:

- CVE-2026-6471
- CVE-2026-14663
- CVE-2026-6464
- CVE-2026-16239
- CVE-2026-14669
- CVE-2026-14664
- CVE-2026-18024
- CVE-2026-16238
- CVE-2026-14668
- CVE-2026-14662
- CVE-2026-14679
- CVE-2026-14680
- CVE-2026-6469
- CVE-2026-15741
- CVE-2026-6470
- CVE-2026-14666
- CVE-2026-14681
- CVE-2026-14672
- CVE-2026-16241
- CVE-2026-18408
- CVE-2026-19385
- CVE-2026-14670
- CVE-2026-14677
- CVE-2026-14673
- CVE-2026-15742
- CVE-2026-14676
- CVE-2026-14678
- CVE-2026-14671

Assisted-by: Claude:claude-sonnet-5
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
(alternative to commit 2456e44d6779f9664b45c8d2b85f3ea8a250ecc0)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 48bbbd2443..ca0d350708 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v17.10/postgresql-17.10.tar.bz2.sha256
-sha256  078a03516dcdbdb705fecaf415ea3d13a956c589e46f09fed68a06fb00598c90  postgresql-17.10.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v17.11/postgresql-17.11.tar.bz2.sha256
+sha256  dd27f2b3c59e73ed14aa3324901242bf69a032a6347805f274e6260322d42979  postgresql-17.11.tar.bz2
 # License file, Locally calculated
 sha256  3d6af92ff8a4c2cdf69afb1cf44edea727922f5cd0cf8b5f72b11cdecac8fdfd  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 6f6f36702f..d7fad7c5a1 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 17.10
+POSTGRESQL_VERSION = 17.11
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL

--===============3590442403286440256==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3590442403286440256==--
