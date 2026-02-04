Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA2FE9D41A
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:07:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2EA95611B6;
	Wed,  4 Feb 2026 17:07:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cweT3KHuh7L0; Wed,  4 Feb 2026 17:07:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E4A9E611B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224876;
	bh=xcUsZTCDYH6QieY7CFznQmdaUUCJQUa43SCC4JT5b8M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bUCNnkVWHg8aJUit8sF2lC8O6LYX3S0llcHbM/uu1AHi1yY/B2yaNGg2rq+lfO1vE
	 KNa4lSWOlyYCpTRUplDEFbxvvncLKam71UrUP85QMHcEEwhFvxYxCRn9Be2oZikOP/
	 SjT1ZQr9+DlalO7aq/QLv6m1NvoJwQdPIQk453cclieH6cx6836KYUZNOnReYdesYq
	 SkIrj6mzBiAPcmDmXOam0l2/aCwJ7diJ0JMSxMG18gpEDt9YqpzAfwUCQ93nq9sEsZ
	 IpI7URq/iI0nbmxm4T8xPPIiloMWbjtEI2FDm7eyCYDTIkhf612G/Z8M72IYSDwFlt
	 I9PY6rXWFmV7Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E4A9E611B8;
	Wed,  4 Feb 2026 17:07:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DBAC4F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 765CC83E49
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Jyr8dh0iBskA for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:06:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9BDFC83CA3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9BDFC83CA3
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 763958697A; Wed,  4 Feb 2026 17:06:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:30:02 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 438c811740e2cf7514e5e41828412f6e99e9752a
X-Git-Newrev: 0adba001b4dbc831d9b339e99b1c4103e1850133
X-Patchwork-Hint: ignore
Message-Id: <20260204170637.763958697A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/glibc: security
 bump to v2.41-123
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0adba001b4dbc831d9b339e99b1c4103e1850133
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This contains backports for the following vulnerabilities:
- CVE-2025-15281:
    Calling wordexp with WRDE_REUSE in conjunction with WRDE_APPEND in the
    GNU C Library version 2.0 to version 2.42 may cause the interface to
    return uninitialized memory in the we_wordv member, which on
    subsequent calls to wordfree may abort the process.
    https://www.cve.org/CVERecord?id=CVE-2025-15281

- CVE-2026-0861:
    Passing too large an alignment to the memalign suite of functions
    (memalign, posix_memalign, aligned_alloc) in the GNU C Library version
    2.30 to 2.42 may result in an integer overflow, which could
    consequently result in a heap corruption.  Note that the attacker must
    have control over both, the size as well as the alignment arguments of
    the memalign function to be able to exploit this.  The size parameter
    must be close enough to PTRDIFF_MAX so as to overflow size_t along
    with the large alignment argument.  This limits the malicious inputs
    for the alignment for memalign to the range [1<<62+ 1, 1<<63] and
    exactly 1<<63 for posix_memalign and aligned_alloc.  Typically the
    alignment argument passed to such functions is a known constrained
    quantity (e.g. page size, block size, struct sizes) and is not
    attacker controlled, because of which this may not be easily
    exploitable in practice.  An application bug could potentially result
    in the input alignment being too large, e.g. due to a different buffer
    overflow or integer overflow in the application or its dependent
    libraries, but that is again an uncommon usage pattern given typical
    sources of alignments.
    https://www.cve.org/CVERecord?id=CVE-2026-0861

- CVE-2026-0915:
    Calling getnetbyaddr or getnetbyaddr_r with a configured nsswitch.conf
    that specifies the library's DNS backend for networks and queries for
    a zero-valued network in the GNU C Library version 2.0 to version 2.42
    can leak stack contents to the configured DNS resolver.
    https://www.cve.org/CVERecord?id=CVE-2026-0915

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
(cherry picked from commit 18de297a5ad3d1fc1b44f54ae69289ca10200ad5)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/glibc/glibc.hash       |  2 +-
 package/glibc/glibc.mk         | 11 ++++++++++-
 package/localedef/localedef.mk |  2 +-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 0deba84dc7..a7f1daacf9 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  166b6e7637bb45cb9352e4813005f83dd48f03ef634d3e9e94a30aa5a0300fab  glibc-2.41-70-g1502c248d58cb99a203731707987a4342926e830.tar.gz
+sha256  7ed7900a90fd1b05fd49a25b1877515c6c3f1ab9ea9248af9d5d0e7fdb3fdd82  glibc-2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 37752416ba..3f519bfdca 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.41-70-g1502c248d58cb99a203731707987a4342926e830
+GLIBC_VERSION = 2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2
 
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
@@ -39,6 +39,15 @@ GLIBC_IGNORE_CVES += CVE-2025-8058
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
 GLIBC_IGNORE_CVES += CVE-2010-4756
 
+# Fixed by glibc-2.41-121-g1e2c1ea4307197ccece0cda574bcfebf9080894c
+GLIBC_IGNORE_CVES += CVE-2026-0861
+
+# Fixed by glibc-2.41-122-g15c9839a0b853f552b4ed9047841b6223f3c104d
+GLIBC_IGNORE_CVES += CVE-2026-0915
+
+# Fixed by glibc-2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2
+GLIBC_IGNORE_CVES += CVE-2025-15281
+
 # glibc is part of the toolchain so disable the toolchain dependency
 GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index c76a8d82a0..925998a5f4 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.41-70-g1502c248d58cb99a203731707987a4342926e830
+LOCALEDEF_VERSION = 2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
