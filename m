Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B66BCD37B5
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 10:20:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E988284166;
	Mon, 11 May 2026 10:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dKaSD11w6sw2; Mon, 11 May 2026 10:20:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01E7384173
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778494831;
	bh=ZvpKcw72w8s/6oxtdA5Iqb4/KIQlV6tG8Ye7ae6fMLg=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=qKfhMhS32gbfmggANIbx6vH0uoxFni2F4befxRG/UtdqKFfGgGjpL2RBD42kIhoRv
	 cY6+bG0PjgRz2UTuC3J8U7Brgz9KmpzohNJb8X34WdZ7fOxbGT6hr0qn3sH5awi15t
	 bUwSEGt0fcwRZkc3AkiYpnrZXnxT/cpoq0oSND58KuAbHrRm3z+gyQFa4vVB0GzjC/
	 rZM/NY027KrcQiuqc6a7BkWJ/izI1yQLvx5xEAtpbC9rZz2JQX2AvGa/3dr4y3genX
	 AKg02Y5TA5Q3ms9tvMF1GNcP6uXr3BEUiYm9tqajdFGNQ2+DSnLPhojt75SJj8rdAA
	 vRZhysGDTwa9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 01E7384173;
	Mon, 11 May 2026 10:20:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id C8617173
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA26C60869
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:20:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8xTNZklF-tXG for <buildroot@buildroot.org>;
 Mon, 11 May 2026 10:20:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEFCF60860
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEFCF60860
 for <buildroot@buildroot.org>; Mon, 11 May 2026 10:20:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4925985DB5; Mon, 11 May 2026 10:20:25 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 May 2026 12:18:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ced8d46573c50443f0fc815050b3c69ce2857db5
X-Git-Newrev: e3c662eac9968dcfb598f837d639d51de7217627
X-Patchwork-Hint: ignore
Message-Id: <20260511102025.4925985DB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{glibc,
 localedef}: security bump to version 2.43-27-g4070d808b
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e3c662eac9968dcfb598f837d639d51de7217627
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following security issues:

CVE-2026-5450: scanf %mc off-by-one heap buffer overflow
https://sourceware.org/git/?p=glibc.git;a=blob;f=advisories/GLIBC-SA-2026-0009;h=3c297fdc8018d26dfa3b1b269b8fdc2d4ab07e81;hb=HEAD

CVE-2026-5928: Potential buffer under-read in ungetwc
https://sourceware.org/git/?p=glibc.git;a=blob;f=advisories/GLIBC-SA-2026-0010;h=ae9953fb717886b93ea55fdede14450a0d4835f4;hb=HEAD

git shortlog 2.43-22-g8362e8ce1..2.43-27-g4070d808b

DJ Delorie (1):
      include: isolate __O_CLOEXEC flag for sys/mount.h and fcntl.h

Florian Weimer (1):
      Linux: Only define OPEN_TREE_* macros in <sys/mount.h> if undefined (bug 33921)

H.J. Lu (1):
      abilist.awk: Handle weak unversioned defined symbols

Rocket Ma (2):
      libio: Fix ungetwc operating on byte stream [BZ #33998]
      stdio-common: Fix buffer overflow in scanf %mc [BZ #34008]

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Peter: use correct git hash in _IGNORE_CVES for CVE-2026-5928]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 8 +++++++-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index c9215dac6f..a6e6874e1f 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  c5d012c0417d1a8d72e72ea2cd917422fa04f9ab525f418c537cad5cd9042803  glibc-2.43-22-g8362e8ce10b24068bacc19552c128dd10e082fd9-git4.tar.gz
+sha256  668f890b45fd8d32bb73783ad3b75fe1f396c5c3aa3c3832e616b4c3f0c6066b  glibc-2.43-27-g4070d808bea1c077eb7e7d52b52b91cae98205d5-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 0a44015818..4a6bc94634 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.43-22-g8362e8ce10b24068bacc19552c128dd10e082fd9
+GLIBC_VERSION = 2.43-27-g4070d808bea1c077eb7e7d52b52b91cae98205d5
 GLIBC_SITE = https://sourceware.org/git/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -40,6 +40,12 @@ GLIBC_IGNORE_CVES += CVE-2026-4438
 # Fixed by glibc-2.43-22-g8362e8ce10b24068bacc19552c128dd10e082fd9
 GLIBC_IGNORE_CVES += CVE-2026-4046
 
+# Fixed by glibc-2.43-26-g2890b35cd361df2517525bf2c5f8c63f6f0d4a20
+GLIBC_IGNORE_CVES += CVE-2026-5928
+
+# Fixed by glibc-2.43-27-g4070d808bea1c077eb7e7d52b52b91cae98205d5
+GLIBC_IGNORE_CVES += CVE-2026-5450
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index ec906fad22..4890e095e3 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.43-22-g8362e8ce10b24068bacc19552c128dd10e082fd9
+LOCALEDEF_VERSION = 2.43-27-g4070d808bea1c077eb7e7d52b52b91cae98205d5
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://sourceware.org/git/glibc.git
 LOCALEDEF_SITE_METHOD = git
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
