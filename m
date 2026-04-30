Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFAAFF885A
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 14:47:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3FD7A845B8;
	Mon,  4 May 2026 14:47:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wmgsj_UGBZdY; Mon,  4 May 2026 14:47:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4067F845BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777906021;
	bh=g8PWUXmc/2oqa7snYUxQzMtHD125Q3cmWlbo4NYxWn8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=irKQAefeHsIiSSE+p5nPwatL/uyHRi4tI2V8p4MnzZiD0XYUojFq7zbeJfZ/hSb5k
	 e+Sq88mLjFR4ea3eFoR2UAGQcvYkzWwdUmDjyzZOLPi3c4JZQEv/G76RrIeQk5C9rl
	 RF5hYemvhrCuz993d6tvk/w3DiXD1KbI/GEDFy5ArMb8OCQ4K+Beu3gTFwRXoGKFHA
	 ZlPNMN1uZwm8k/62W/lOZcdEV64NYjmWpWlgHwwT/IjOCK5C/2kdPyVjm4pyHrYEFY
	 jMB70fdjBIEVlLwXm+V4EzMu1ld6FRlbUMKhHw8RcTu6m7FPmz6LvVRTirDk+Ze0Tg
	 SU67/XSH08YCw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4067F845BC;
	Mon,  4 May 2026 14:47:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 276E825D
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60332844CF
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GtDTYwh2kfeI for <buildroot@buildroot.org>;
 Mon,  4 May 2026 14:46:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14C32844A8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 14C32844A8
 for <buildroot@buildroot.org>; Mon,  4 May 2026 14:46:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D61EC84285; Mon,  4 May 2026 14:46:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 30 Apr 2026 13:47:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: cec032245a9edd15538c31eae261db8168896eb8
X-Git-Newrev: f23d2f654af11ce413259d468c88d0856ba789ea
X-Patchwork-Hint: ignore
Message-Id: <20260504144642.D61EC84285@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/cups: security
 bump to v2.4.17
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f23d2f654af11ce413259d468c88d0856ba789ea
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For more information about the release, see:

- https://github.com/OpenPrinting/cups/releases/tag/v2.4.17
- https://github.com/OpenPrinting/cups/blob/2.4.x/CHANGES.md

The new release 2.4.17 contains the following security fixes:

- CVE-2026-27447: The scheduler treated local user and group names as
  case-insensitive.
  https://www.cve.org/CVERecord?id=CVE-2026-27447

- CVE-2026-34978: The RSS notifier could write outside the scheduler's
  RSS directory.
  https://www.cve.org/CVERecord?id=CVE-2026-34978

- CVE-2026-34979: The scheduler did not always allocate enough memory
  for a job's options string.
  https://www.cve.org/CVERecord?id=CVE-2026-34979

- CVE-2026-34980: The scheduler did not filter control characters from
  option values.
  https://www.cve.org/CVERecord?id=CVE-2026-34980

- CVE-2026-34990: The scheduler incorrectly allowed local certificates
  over the loopback interface.
  https://www.cve.org/CVERecord?id=CVE-2026-34990

- CVE-2026-39314: Fixed the range check for job password strings.
  https://www.cve.org/CVERecord?id=CVE-2026-39314

- CVE-2026-39316: Fixed a printer subscription bug in the scheduler.
  https://www.cve.org/CVERecord?id=CVE-2026-39316

- CVE-2026-41079: Fixed a SNMP string conversion bug in the backends.
  https://www.cve.org/CVERecord?id=CVE-2026-41079

Also updated patch offsets.

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 1f801dc616113c11d335c45b2f5e1ebe648a75c1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch | 2 +-
 package/cups/0004-Remove-PIE-flags-from-the-build.patch        | 2 +-
 package/cups/cups.hash                                         | 2 +-
 package/cups/cups.mk                                           | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
index 30c3ddb48f..3c00bb1b49 100644
--- a/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
+++ b/package/cups/0001-Remove-man-from-BUILDDIRS-in-configure.patch
@@ -18,7 +18,7 @@ diff --git a/config-scripts/cups-common.m4 b/config-scripts/cups-common.m4
 index 613f01ddf..6f1bcb07e 100644
 --- a/config-scripts/cups-common.m4
 +++ b/config-scripts/cups-common.m4
-@@ -462,7 +462,7 @@ LIBHEADERS="\$(COREHEADERS) \$(DRIVERHEADERS)"
+@@ -467,7 +467,7 @@ LIBHEADERS="\$(COREHEADERS) \$(DRIVERHEADERS)"
  LIBHEADERSPRIV="\$(COREHEADERSPRIV) \$(DRIVERHEADERSPRIV)"
  
  AS_CASE(["$COMPONENTS"], [all], [
diff --git a/package/cups/0004-Remove-PIE-flags-from-the-build.patch b/package/cups/0004-Remove-PIE-flags-from-the-build.patch
index e4081d0e07..82251d0fec 100644
--- a/package/cups/0004-Remove-PIE-flags-from-the-build.patch
+++ b/package/cups/0004-Remove-PIE-flags-from-the-build.patch
@@ -23,7 +23,7 @@ diff --git a/Makedefs.in b/Makedefs.in
 index 0d8df733b..2560c0c36 100644
 --- a/Makedefs.in
 +++ b/Makedefs.in
-@@ -156,7 +156,7 @@ ALL_CXXFLAGS	=	-I.. -D_CUPS_SOURCE $(CXXFLAGS) \
+@@ -154,7 +154,7 @@ ALL_CXXFLAGS	=	-I.. -D_CUPS_SOURCE $(CXXFLAGS) \
  			$(ONDEMANDFLAGS) $(OPTIONS)
  ALL_DSOFLAGS	=	-L../cups @ARCHFLAGS@ @RELROFLAGS@ $(DSOFLAGS) $(OPTIM)
  ALL_LDFLAGS	=	-L../cups @LDARCHFLAGS@ @RELROFLAGS@ $(LDFLAGS)  \
diff --git a/package/cups/cups.hash b/package/cups/cups.hash
index 7c08a68c10..e421c6457b 100644
--- a/package/cups/cups.hash
+++ b/package/cups/cups.hash
@@ -1,4 +1,4 @@
 # Locally calculated:
-sha256  0339587204b4f9428dd0592eb301dec0bf9ea6ea8dce5d9690d56be585aba92d  cups-2.4.16-source.tar.gz
+sha256  89c703238de210d4f4f4e5d4269e3d60c4b2f487aad75a8a1eaecd659e4d0b77  cups-2.4.17-source.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  977206f041b9a6f47ac00531e1242c0fab7063da71178f8d868b167b70866b6d  NOTICE
diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index d3e6094c67..f79e3846df 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_VERSION = 2.4.16
+CUPS_VERSION = 2.4.17
 CUPS_SOURCE = cups-$(CUPS_VERSION)-source.tar.gz
 CUPS_SITE = https://github.com/OpenPrinting/cups/releases/download/v$(CUPS_VERSION)
 CUPS_LICENSE = Apache-2.0 with GPL-2.0/LGPL-2.0 exception
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
