Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A1FCD5BD2
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9663F41F85;
	Fri, 29 May 2026 08:25:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZWfiNOp1aR0U; Fri, 29 May 2026 08:25:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64A1841F89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043125;
	bh=qbYWHYaLbzlIhThq8FoksdL51AG4jd0n8jKDOBxCezg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=jMyKfO3DCD0JQm11MP96dLCHAx4dkw30IOiNUpnhmt/d69s/V06KgQ58CzRlaTyVk
	 rYy4aqbpR5p9YZrV8+iie4b9a34F8NPNgMPyhrS7CaOreqjVUnRb9OG2J+VE83LAy+
	 anHpD3+4+dCu+di2zWQTgMJ3TONHZ5F+bdMWNY/qQpfbYaWSyWwf3a1i8CBJkI4oSj
	 kD25ubE4r+bWNRbXb6DsxHqvhfRMEI0GB3jqS4oC/IxPhoP3vS09fe51QtFMV+bSm0
	 pe2Rr1UfNFyqHcRKMUC77qsCu2+dubmk9M4HaB6c2VFFDB2OeyOGPY5Zi6F+4EHIrF
	 FmS4ZQjkrv83w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64A1841F89;
	Fri, 29 May 2026 08:25:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 763EB288
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6584641F99
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EDCNNVss23Lh for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6416241F58
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6416241F58
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E577687334; Fri, 29 May 2026 08:25:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 10:15:15 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 9113cd5acd12ee4ab9d4c38843c1e551a6d4566e
X-Git-Newrev: f85a7df189f0e3fc2060c8e8ebd89a6791e6bc1d
X-Patchwork-Hint: ignore
Message-Id: <20260529082505.E577687334@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/{glibc,
 localedef}: security bump to version glibc-2.41-137-gb676adadb
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f85a7df189f0e3fc2060c8e8ebd89a6791e6bc1d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Fixes the following vulnerabilities:

- CVE-2026-4046:
    The iconv() function in the GNU C Library versions 2.43 and earlier
    may crash due to an assertion failure when converting inputs from the
    IBM1390 or IBM1399 character sets, which may be used to remotely crash
    an application.    This vulnerability can be trivially mitigated by
    removing the IBM1390 and IBM1399 character sets from systems that do
    not need them.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-4046
  - glibc-2.41-135-g61737f43b1f0d9f64a6f16649625476b70f9f4d3

- CVE-2026-4437:
    Calling gethostbyaddr or gethostbyaddr_r with a configured
    nsswitch.conf that specifies the library's DNS backend in the GNU C
    Library version 2.34 to version 2.43 could, with a crafted response
    from the configured DNS server, result in a violation of the DNS
    specification that causes the application to treat a non-answer
    section of the DNS response as a valid answer.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-4437
  - glibc-2.41-131-gdbd8335c8ce8af11226ee1514d7a020b15c63345

- CVE-2026-4438:
    Calling gethostbyaddr or gethostbyaddr_r with a configured
    nsswitch.conf that specifies the library's DNS backend in the GNU C
    library version 2.34 to version 2.43 could result in an invalid DNS
    hostname being returned to the caller in violation of the DNS
    specification.

For more information, see:
  - https://www.cve.org/CVERecord?id=CVE-2026-4438
  - glibc-2.41-132-g502861645bb1baf650d58e2ddd6b230bc26676c9

> git shortlog 2.41-123-gfb4db64a0..glibc-2.41-137-gb676adadb

Carlos O'Donell (2):
      resolv: Count records correctly (CVE-2026-4437)
      resolv: Check hostname for validity (CVE-2026-4438)

DJ Delorie (1):
      include: isolate __O_CLOEXEC flag for sys/mount.h and fcntl.h

Florian Weimer (8):
      Switch currency symbol for the bg_BG locale to euro
      nss: Introduce dedicated struct nss_database_for_fork type
      Linux: In getlogin_r, use utmp fallback only for specific errors
      nss: Missing checks in __nss_configure_lookup, __nss_database_get (bug 28940)
      iconvdata: Fix invalid pointer arithmetic in ANSI_X3.110 module
      posix: Run tst-wordexp-reuse-mem test
      Use pending character state in IBM1390, IBM1399 character sets (CVE-2026-4046)
      Linux: Only define OPEN_TREE_* macros in <sys/mount.h> if undefined (bug 33921)

Michael Jeanson (1):
      tests: fix tst-rseq with Linux 7.0

Xi Ruoyao (1):
      elf: parse /proc/self/maps as the last resort to find the gap for tst-link-map-contiguous-ldso

Yury Khrustalev (1):
      posix: Fix invalid flags test for p{write,read}v2

Acked-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit e3c662eac9968dcfb598f837d639d51de7217627)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/glibc/glibc.hash       |  2 +-
 package/glibc/glibc.mk         | 11 ++++++++++-
 package/localedef/localedef.mk |  2 +-
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index e999129ccc..3f1df7058a 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  3789146d175834dc4873f41bd87932cd6ad7c83d0b7bf340768ee6a927aac784  glibc-2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2-git4.tar.gz
+sha256  c5856a16a8576d35adddd92f7e86c58faeedd849633582a7926f9a3e766ffe2d  glibc-2.41-137-gb676adadbc1f5fb2f31bc484a7628cca89ae6f22-git4.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 7c07dd5923..3ce6265a6d 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2
+GLIBC_VERSION = 2.41-137-gb676adadbc1f5fb2f31bc484a7628cca89ae6f22
 GLIBC_SITE = https://sourceware.org/git/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -51,6 +51,15 @@ GLIBC_IGNORE_CVES += CVE-2026-0915
 # Fixed by glibc-2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2
 GLIBC_IGNORE_CVES += CVE-2025-15281
 
+# Fixed by glibc-2.41-131-gdbd8335c8ce8af11226ee1514d7a020b15c63345
+GLIBC_IGNORE_CVES += CVE-2026-4437
+
+# Fixed by glibc-2.41-132-g502861645bb1baf650d58e2ddd6b230bc26676c9
+GLIBC_IGNORE_CVES += CVE-2026-4438
+
+# Fixed by glibc-2.41-135-g61737f43b1f0d9f64a6f16649625476b70f9f4d3
+GLIBC_IGNORE_CVES += CVE-2026-4046
+
 # glibc is part of the toolchain so disable the toolchain dependency
 GLIBC_ADD_TOOLCHAIN_DEPENDENCY = NO
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 441145c38f..c3a959c5f5 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.41-123-gfb4db64a04ad6c96cd1fbb7e02eb59323b1f2ac2
+LOCALEDEF_VERSION = 2.41-137-gb676adadbc1f5fb2f31bc484a7628cca89ae6f22
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
 LOCALEDEF_SITE_METHOD = git
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
