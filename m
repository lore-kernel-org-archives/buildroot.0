Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24A8DC5DF93
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:12:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 784DF81DBF;
	Fri, 21 Aug 2026 15:12:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id izdXYRF4i5vC; Fri, 21 Aug 2026 15:12:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325123;
	bh=QWgK9UkNboZxA2iaxDlma6r9CQobKU5c8vVQsq6A09k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s6/TPITM86EySxV8Qmj6rjrWIH9ud7h6w3fkvNne+VKfEwMlc/Kb5YFsalHmunGn4
	 8avAK5ojMfdGwafp7p5tIA+snDALux7FHW8eg5lCAUIIE+n+JDwzW7t2ccbtR204mH
	 QowglsbIy76DPRtTj27aaSEmMNj/G4nbhQneZMGoLRh6ygyX2VlWSN0AOr3iKXG+tY
	 pJND9h/O5FZNbCQCvKtaPM4vIL7bOjQgvjx5BGuXJlaITYx/zsuBsfBdCvjvXFFaQ8
	 AVAX39PgqM42aUmKgyHnctjZe6Tr6rFaQcKCBjqzUQOFeOs7LCzFAk2JszSWK0omLR
	 cG8tC5f9LpcYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EF0E81D4F;
	Fri, 21 Aug 2026 15:12:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C2BFCEA3
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B378C400C1
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RhncTIpLsDhP for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EDB494004E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 603E68DE49; Fri, 21 Aug 2026 15:10:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 14:18:56 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: b5628e2437bad7bdafd6e4f5465f670718eee86a
X-Git-Newrev: 8d4e5f9cccd1e5866dadd500cc3457f72b32d3bb
X-Patchwork-Hint: ignore
Message-Id: <20260821151017.603E68DE49@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/postgresql:
 security bump version to 18.6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8d4e5f9cccd1e5866dadd500cc3457f72b32d3bb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

https://www.postgresql.org/about/news/postgresql-186-1711-1615-1519-1424-and-19-beta-3-released-3365/
"This release skips PostgreSQL 18 versions from PostgreSQL 18.4 to 18.6.
 18.5 was not shipped due to a regression."

Fixes the following CVEs:

CVE-2026-6464: psql COPY FROM STDIN early failure processes data lines as psql commands (CVSS v3.1: 8.1)
CVE-2026-6469: ALTER TABLE ALTER TYPE resets extended statistics ownership (CVSS v3.1: 3.8)
CVE-2026-6470: Fails to check type USAGE privilege (CVSS v3.1: 4.3)
CVE-2026-6471: Logical decoding can dlopen arbitrary file (CVSS v3.1: 7.2)
CVE-2026-14662: tsvector and tsquery undersize allocations, via integer wraparound (CVSS v3.1: 8.8)
CVE-2026-14663: pgcrypto, for OpenSSL-disabled ciphers, silently encrypts to and decrypts from cleartext (CVSS v3.1: 6.5)
CVE-2026-14664: Regexp heap buffer overflow executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-14666: Row security caching disregards role modifications (CVSS v3.1: 4.2)
CVE-2026-14668: ctid type confusion in selectivity estimator discloses derivative of arbitrary read (CVSS v3.1: 8.1)
CVE-2026-14669: to_char heap buffer overflow executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-14670: plperl tied object heap buffer overflow executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-14671: refint plan cache type confusion executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-14672: Observable response discrepancy with non-default scram_iterations provides user existence oracle (CVSS v3.1: 5.3)
CVE-2026-14673: amcheck does not clear untrusted search path (CVSS v3.1: 3.8)
CVE-2026-14676: pg_stat_statements heap buffer overflow executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-14677: 32-bit pltcl and plperl undersize allocations, via integer wraparound (CVSS v3.1: 8.8)
CVE-2026-14678: pg_trgm picksplit reads past end of buffer (CVSS v3.1: 4.3)
CVE-2026-14679: Stack buffer overflow in argument match writes 0x0 and 0x1 to server memory (CVSS v3.1: 8.2)
CVE-2026-14680: Type confusion via "internal" arguments (CVSS v3.1: 8.8)
CVE-2026-14681: Improper enforcement of GSSAPI encryption when coupled with SSL (CVSS v3.1: 4.2)
CVE-2026-15741: Expression deparse allows SQL injection via EXTRACT argument (CVSS v3.1: 8.8)
CVE-2026-15742: fuzzystrmatch writes effectively-arbitrary addresses, via integer wraparound (CVSS v3.1: 8.8)
CVE-2026-16238: Type confusion in pg_restore_attribute_stats() executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-16239: Type confusion in cursor CLOSE + DECLARE executes arbitrary code (CVSS v3.1: 8.8)
CVE-2026-16241: ECPG integer underflow can crash the client (CVSS v3.1: 3.8)
CVE-2026-18024: ascii() function reads past end of buffer (CVSS v3.1: 4.3)
CVE-2026-18408: psql \unrestrict lets superuser of pg_dump origin server execute arbitrary code in psql client (CVSS v3.1: 8.8)
CVE-2026-19385: pg_dump heap buffer overflow executes arbitrary code (CVSS v3.1: 8.8)

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2456e44d6779f9664b45c8d2b85f3ea8a250ecc0)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index be57f216f1..da6c37b519 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v18.4/postgresql-18.4.tar.bz2.sha256
-sha256  81a81ec695fb0c7901407defaa1d2f7973617154cf27ba74e3a7ab8e64436094  postgresql-18.4.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v18.6/postgresql-18.6.tar.bz2.sha256
+sha256  555610c24d53e4316da5b7d3fc25c279d96856d5e0e23ee308c328c5fa881d9f  postgresql-18.6.tar.bz2
 # License file, Locally calculated
 sha256  3d6af92ff8a4c2cdf69afb1cf44edea727922f5cd0cf8b5f72b11cdecac8fdfd  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 16ed591df4..d852dc0e1e 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 18.4
+POSTGRESQL_VERSION = 18.6
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
