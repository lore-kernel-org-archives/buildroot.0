Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C574CCD6E4F
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:28:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8FA4361461;
	Fri, 29 May 2026 08:28:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sLmxo5YT1gwM; Fri, 29 May 2026 08:28:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7D86661462
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043286;
	bh=0dBpCMvtVv+xKmijwFFXRbasmLRmnr32xxYv4guJpkE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Vp1wcezKqAekSfJMt3ySOxa3n3xO1wjmOPlwhCLinc/d7hZDEt0BJc7vJFq8GLPxZ
	 gD1rKHQAXsrXeJT7SF+JdSFPqz2ntMegaTWzIMlHoMXlI+oPE3j+10/fh/xQLdYri1
	 AWQHD+LnnmZapsoH0mIJ/LO8g7Yvjxx+UHZpkh5rEpDhF9Rl3uY6mJHW8XBkJx/3FM
	 SVzJQNrMVDvj9OJxvg4nz42T6Ythu6IhsqFlVyRm/iXF+gSqut8fiv7igaYJ0zgKUD
	 xjmMEESs3z/3k6RG4ao7Rruw7vqRHZzSdAuYjAeTZ9dQmm7OSwsEkTTN7rTveIjSUd
	 sH01f7L3qbWtw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D86661462;
	Fri, 29 May 2026 08:28:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1011128E
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0D93961363
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H09HN2GagU7b for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0BBA26132B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0BBA26132B
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:28:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8F22C873A6; Fri, 29 May 2026 08:27:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 10:25:45 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 81211883ff029f8f9dfe0bbe92d4ba86aef9873b
X-Git-Newrev: 509daa69c08cd13d2de3ca9d4c4eebf198f178ee
X-Patchwork-Hint: ignore
Message-Id: <20260529082747.8F22C873A6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/{glibc,
 localedef}: security bump to version glibc-2.42-67-g4ebd33dd7
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/509daa69c08cd13d2de3ca9d4c4eebf198f178ee
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Fixes the following vulnerabilities:

- CVE-2026-4046:
    The iconv() function in the GNU C Library versions 2.43 and earlier
    may crash due to an assertion failure when converting inputs from the
    IBM1390 or IBM1399 character sets, which may be used to remotely crash
    an application.    This vulnerability can be trivially mitigated by
    removing the IBM1390 and IBM1399 character sets from systems that do
    not need them.

For more information, see:
  - glibc-2.42-62-gf13c1bb0f97fbc12a6ba1ab5669ce561ea32b80a
  - https://www.cve.org/CVERecord?id=CVE-2026-4046

- CVE-2026-4437:
    Calling gethostbyaddr or gethostbyaddr_r with a configured
    nsswitch.conf that specifies the library's DNS backend in the GNU C
    Library version 2.34 to version 2.43 could, with a crafted response
    from the configured DNS server, result in a violation of the DNS
    specification that causes the application to treat a non-answer
    section of the DNS response as a valid answer.

For more information, see:
  - glibc-2.42-58-g8e863fb1c92360520704a69dc948be6bb4a17cb3
  - https://www.cve.org/CVERecord?id=CVE-2026-4437

- CVE-2026-4438:
    Calling gethostbyaddr or gethostbyaddr_r with a configured
    nsswitch.conf that specifies the library's DNS backend in the GNU C
    library version 2.34 to version 2.43 could result in an invalid DNS
    hostname being returned to the caller in violation of the DNS
    specification.

For more information, see:
  - glibc-2.42-59-g426378547e6ddead92f28f5558a124eb0821d2f9
  - https://www.cve.org/CVERecord?id=CVE-2026-4438

- CVE-2026-5450:
    Calling the scanf family of functions with a %mc (malloc'd character
    match) in the GNU C Library version 2.7 to version 2.43 with a format
    width specifier with an explicit width greater than 1024 could result
    in a one byte heap buffer overflow.

For more information, see:
  - glibc-2.42-67-g4ebd33dd77eabe8d4c45232bed4b42a31d2f9edc
  - https://www.cve.org/CVERecord?id=CVE-2026-5450

- CVE-2026-5928:
    Calling the ungetwc function on a FILE stream with wide characters
    encoded in a character set that has overlaps between its single byte
    and multi-byte character encodings, in the GNU C Library version 2.43
    or earlier, may result in an attempt to read bytes before an allocated
    buffer, potentially resulting in unintentional disclosure of
    neighboring data in the heap, or a program crash.  A bug in the wide
    character pushback implementation (_IO_wdefault_pbackfail in
    libio/wgenops.c) causes ungetwc() to operate on the regular character
    buffer (fp->_IO_read_ptr) instead of the actual wide-stream read
    pointer (fp->_wide_data->_IO_read_ptr). The program crash may happen
    in cases where fp->_IO_read_ptr is not initialized and hence points to
    NULL. The buffer under-read requires a special situation where the
    input character encoding is such that there are overlaps between
    single byte representations and multibyte representations in that
    encoding, resulting in spurious matches. The spurious match case is
    not possible in the standard Unicode character sets.

For more information, see:
  - glibc-2.42-66-gb4bca35ab9e76890504c4dbdd5eaf15a93514580
  - https://www.cve.org/CVERecord?id=CVE-2026-5928

> git shortlog 2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125..2.42-67-g4ebd33dd77eabe8d4c45232bed4b42a31d2f9edc

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

H.J. Lu (1):
      abilist.awk: Handle weak unversioned defined symbols

Michael Jeanson (1):
      tests: fix tst-rseq with Linux 7.0

Rocket Ma (2):
      libio: Fix ungetwc operating on byte stream [BZ #33998]
      stdio-common: Fix buffer overflow in scanf %mc [BZ #34008]

Xi Ruoyao (1):
      elf: parse /proc/self/maps as the last resort to find the gap for tst-link-map-contiguous-ldso

(cherry picked from commit e3c662eac9968dcfb598f837d639d51de7217627)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/glibc/glibc.hash       |  2 +-
 package/glibc/glibc.mk         | 17 ++++++++++++++++-
 package/localedef/localedef.mk |  2 +-
 3 files changed, 18 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 0a11cfdb5e..b8738b3505 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  737e3b2bfee2e3e209e514133f4ff7d2bef0d0dc903fd46b4e2244f6c998f7b2  glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125-git4.tar.gz
+sha256  5c278e563779ed471a8ee8b607d29274d1c83ac91c88ea127a3c1ecdc22b14a1  glibc-2.42-67-g4ebd33dd77eabe8d4c45232bed4b42a31d2f9edc-git4.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 80d21b86ed..12a4034ce0 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
+GLIBC_VERSION = 2.42-67-g4ebd33dd77eabe8d4c45232bed4b42a31d2f9edc
 GLIBC_SITE = https://sourceware.org/git/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -31,6 +31,21 @@ GLIBC_IGNORE_CVES += CVE-2026-0915
 # Fixed by glibc-2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
 GLIBC_IGNORE_CVES += CVE-2025-15281
 
+# Fixed by glibc-2.42-58-g8e863fb1c92360520704a69dc948be6bb4a17cb3
+GLIBC_IGNORE_CVES += CVE-2026-4437
+
+# Fixed by glibc-2.42-59-g426378547e6ddead92f28f5558a124eb0821d2f9
+GLIBC_IGNORE_CVES += CVE-2026-4438
+
+# Fixed by glibc-2.42-62-gf13c1bb0f97fbc12a6ba1ab5669ce561ea32b80a
+GLIBC_IGNORE_CVES += CVE-2026-4046
+
+# Fixed by glibc-2.42-66-gb4bca35ab9e76890504c4dbdd5eaf15a93514580
+GLIBC_IGNORE_CVES += CVE-2026-5928
+
+# Fixed by glibc-2.42-67-g4ebd33dd77eabe8d4c45232bed4b42a31d2f9edc
+GLIBC_IGNORE_CVES += CVE-2026-5450
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 4da110417a..1f9533ba62 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.42-51-gcbf39c26b25801e9bc88499b4fd361ac172d4125
+LOCALEDEF_VERSION = 2.42-67-g4ebd33dd77eabe8d4c45232bed4b42a31d2f9edc
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
 LOCALEDEF_SITE_METHOD = git
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
