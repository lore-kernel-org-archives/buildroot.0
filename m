Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E38DFD9E10
	for <buildroot@archiver.kernel.org>; Thu, 26 Feb 2026 20:44:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D6EA407E4;
	Thu, 26 Feb 2026 20:44:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iXw8CTGr6jj1; Thu, 26 Feb 2026 20:44:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03F71407AD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772138653;
	bh=f9xEa8yjCsudcY7rBOh+6TMUkcLMT/E05tah1VxSh+c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ma94vd2b8+JKGfMLh6sG/ps9LX3/9A/FVCMHfpyT5K7QRu9PHaS0c1gDi2QGAjJEM
	 gUam5yrioPmmdxFeRElrqurVuJBUsD/ifwUBmSXh/u3Xzu+2xGRV1j7fEzE1RVREBg
	 dlTQqxxrZFVHPPlwCirDVw2tWxj7WgeHw4JUljSEXCqVQr7Dn3CoEtcsfUnR4DJCuZ
	 UrxHkMJ9zXjotX2GEi+GT8G/ack1YYBVyTQ+NAaVfuvWVjkAXL70QLcTPtSqsQbmCu
	 kfZVuZhVE63xUsEdx2/jTjWxVvMAZ72YKHMhv4jCOeWmcgucCJmtZNd7EhktH5vzLN
	 pbg7v4q+hD+bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03F71407AD;
	Thu, 26 Feb 2026 20:44:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C0F91F3
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:44:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D6CE280DFD
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ts_LWiVzQV-O for <buildroot@buildroot.org>;
 Thu, 26 Feb 2026 20:43:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A25D880DF6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A25D880DF6
 for <buildroot@buildroot.org>; Thu, 26 Feb 2026 20:43:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93A6287510; Thu, 26 Feb 2026 20:43:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Feb 2026 10:22:58 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0319847f4a333c9966319a743e2e7b084736d09c
X-Git-Newrev: 4e294ae91078e46f104d997d22748afb896fbc92
X-Patchwork-Hint: ignore
Message-Id: <20260226204356.93A6287510@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/postgresql:
 security bump to v17.8
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4e294ae91078e46f104d997d22748afb896fbc92
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For more information about the release, see:
  - https://www.postgresql.org/docs/17/release-17-8.html

Fixes the following vulnerabilities:

- CVE-2026-2003:
    Improper validation of type "oidvector" in PostgreSQL allows a
    database user to disclose a few bytes of server memory.  We have not
    ruled out viability of attacks that arrange for presence of
    confidential information in disclosed bytes, but they seem unlikely.
    Versions before PostgreSQL 18.2, 17.8, 16.12, 15.16, and 14.21 are
    affected.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-2003

- CVE-2026-2004:
    Missing validation of type of input in PostgreSQL intarray extension
    selectivity estimator function allows an object creator to execute
    arbitrary code as the operating system user running the database.
    Versions before PostgreSQL 18.2, 17.8, 16.12, 15.16, and 14.21 are
    affected.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-2004

- CVE-2026-2005:
    Heap buffer overflow in PostgreSQL pgcrypto allows a ciphertext
    provider to execute arbitrary code as the operating system user
    running the database.  Versions before PostgreSQL 18.2, 17.8, 16.12,
    15.16, and 14.21 are affected.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-2005

- CVE-2026-2006:
    Missing validation of multibyte character length in PostgreSQL text
    manipulation allows a database user to issue crafted queries that
    achieve a buffer overrun.  That suffices to execute arbitrary code as
    the operating system user running the database.  Versions before
    PostgreSQL 18.2, 17.8, 16.12, 15.16, and 14.21 are affected.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-2006

COPYRIGHT year updated in [1].

[1] https://github.com/postgres/postgres/commit/625e4495bf58733f1dac24e363b12e6f95d7e92d

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
(cherry picked from commit a5a1171ca3b5688eed233488744c5eb77ed69ec5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/postgresql/postgresql.hash | 6 +++---
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index efa1b5e751..b7a2397f8f 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v17.7/postgresql-17.7.tar.bz2.sha256
-sha256  ef9e343302eccd33112f1b2f0247be493cb5768313adeb558b02de8797a2e9b5  postgresql-17.7.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v17.8/postgresql-17.8.tar.bz2.sha256
+sha256  a88d195dd93730452d0cfa1a11896720d6d1ba084bc2be7d7fc557fa4e4158a0  postgresql-17.8.tar.bz2
 # License file, Locally calculated
-sha256  5ed3ce5c9373dff7f98b1fae7a6c7ccd98df7d734d46d24c1bcebf1240be8307  COPYRIGHT
+sha256  3d6af92ff8a4c2cdf69afb1cf44edea727922f5cd0cf8b5f72b11cdecac8fdfd  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 13abce8330..9856d6423b 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 17.7
+POSTGRESQL_VERSION = 17.8
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
