Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F3A7CD3427
	for <buildroot@archiver.kernel.org>; Mon,  4 May 2026 19:23:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 453AF846DD;
	Mon,  4 May 2026 19:23:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pPcvK0--xzbi; Mon,  4 May 2026 19:23:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FD5E846DE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777922622;
	bh=jf4Y/HWeWmLQbFsxL+05mQOqHPTpvKtHjEZxjlJXdYc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BTCNFnLMoT6Q48/bdE6cWel0TUmD182qN9e6WZQg4YlHvtV3xnO0Lho1MfKC6g64k
	 eO7BZx7xkvp3FnvR2HqU3xDWr2bX7VoyaPA3z4YyVusIIE2cQZBZxcpoXtD+l9iqso
	 BZkEriUhMzJrScXx16QiRTPs2bo81/MfBMfXia5R1RsKQmszM2LbhnAirQ5eCFWfcE
	 47GfJ+Y83+Wnx8HfgY7mnPbHrOr7uyVHfmCVTiHEKZuA1kHe7KDpwTGyPdXGS3HQUx
	 jkx+DHe6b5h75YnJ3VzoDbzoXFto8rpd8sbwteTtQF8VC2eg8nwAWOTkpIBHQf7hyY
	 qrWAmk2Pc7+jA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FD5E846DE;
	Mon,  4 May 2026 19:23:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3FD57204
 for <buildroot@buildroot.org>; Mon,  4 May 2026 19:23:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 254A3612ED
 for <buildroot@buildroot.org>; Mon,  4 May 2026 19:23:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c8njZJxt15ml for <buildroot@buildroot.org>;
 Mon,  4 May 2026 19:23:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 557A5612C4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 557A5612C4
 for <buildroot@buildroot.org>; Mon,  4 May 2026 19:23:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 356BD843C0; Mon,  4 May 2026 19:23:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 4 May 2026 21:04:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f513a952076e99fe008eb80d8180c0172c6e4764
X-Git-Newrev: 35e475bf06f15becdbb57308145b742e636a9108
X-Patchwork-Hint: ignore
Message-Id: <20260504192340.356BD843C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{glibc,
 localedef}: security bump to version 2.43-22-g8362e8ce1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/35e475bf06f15becdbb57308145b742e636a9108
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following security issue:

CVE-2026-4046: iconv crash due to assertion failure with untrusted input

https://sourceware.org/git/?p=glibc.git;a=blob;f=advisories/GLIBC-SA-2026-0007;h=b880fb55449693b879beae443e5d9bc1070b938b;hb=HEAD

git shortlog  2.43-17-gdd9945c0b..2.43-22-g8362e8ce1
Adhemerval Zanella (1):
      elf: Use dl-symbol-redir-ifunc.h instead _dl_strlen

Adhemerval Zanella Netto (1):
      riscv: Resolve calls to memcpy using memcpy-generic in early startup

Florian Weimer (1):
      Use pending character state in IBM1390, IBM1399 character sets (CVE-2026-4046)

Michael Jeanson (1):
      tests: fix tst-rseq with Linux 7.0

Xi Ruoyao (1):
      elf: parse /proc/self/maps as the last resort to find the gap for tst-link-map-contiguous-ldso

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 5 ++++-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index d7731eb280..c9215dac6f 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  742023f6c13500a56ae834f51c4453998b2dcd1ccb576fec457d49cdec3f22b3  glibc-2.43-17-gdd9945c0ba40d2dbc9eb7c99291ba6b69bd66718-git4.tar.gz
+sha256  c5d012c0417d1a8d72e72ea2cd917422fa04f9ab525f418c537cad5cd9042803  glibc-2.43-22-g8362e8ce10b24068bacc19552c128dd10e082fd9-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 1d9cd34cef..0a44015818 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.43-17-gdd9945c0ba40d2dbc9eb7c99291ba6b69bd66718
+GLIBC_VERSION = 2.43-22-g8362e8ce10b24068bacc19552c128dd10e082fd9
 GLIBC_SITE = https://sourceware.org/git/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -37,6 +37,9 @@ GLIBC_IGNORE_CVES += CVE-2026-4437
 # Fixed by glibc-2.43-17-gdd9945c0ba40d2dbc9eb7c99291ba6b69bd66718
 GLIBC_IGNORE_CVES += CVE-2026-4438
 
+# Fixed by glibc-2.43-22-g8362e8ce10b24068bacc19552c128dd10e082fd9
+GLIBC_IGNORE_CVES += CVE-2026-4046
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 28494364f4..ec906fad22 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.43-17-gdd9945c0ba40d2dbc9eb7c99291ba6b69bd66718
+LOCALEDEF_VERSION = 2.43-22-g8362e8ce10b24068bacc19552c128dd10e082fd9
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
 LOCALEDEF_SITE_METHOD = git
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
