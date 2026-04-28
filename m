Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C407FF886D
	for <buildroot@archiver.kernel.org>; Tue, 28 Apr 2026 18:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B001740FE6;
	Tue, 28 Apr 2026 18:42:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YPm_P39dz2hB; Tue, 28 Apr 2026 18:42:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7666B40F9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777401742;
	bh=s08ZWMRhQDhbdl/BNmx6vsQCwOn1tugeNjF4ezJOB9o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lCHRWhW4H6ceTOLZegMemIl1W/X7povL4zSQ99SNS29cJnCcx0IA8dSIozpmP4fyE
	 t+Z8AZ8xS51FKjbvriHB7E8vGGaBbw6GN0ZrB1OppWLjVyPdl6FbVnJGwcvMLk8mVX
	 9xvllEm+bYFL3fOgdt+S1/9KxpPGKKxSgltA1iJ0Dvu6YCpYPaYQT7DXoSvPYBbs1M
	 2GmDIOoSMr5lcVnDPBafNcM72CvGBwfQaqqlLYOb16cSiCE6VNv6IptVt6fpja6/iw
	 +2PmkuwHRGRCGUeXwdqvv7NOApFHio0sgEoOWqFIzKml/WDBqrtMPCVsuq/yCrh2Kq
	 xn9Gv5JYr5C7g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7666B40F9E;
	Tue, 28 Apr 2026 18:42:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 04E6C231
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEE45407CF
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:42:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sUrfVX80nBpY for <buildroot@buildroot.org>;
 Tue, 28 Apr 2026 18:42:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 08092407C5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 08092407C5
 for <buildroot@buildroot.org>; Tue, 28 Apr 2026 18:42:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B509C83925; Tue, 28 Apr 2026 18:42:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Apr 2026 20:40:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 573f34323207227ebdc660b5a87f404027bb5ea1
X-Git-Newrev: 09f18c31adc5438f0aae99a56791979d5fb48337
X-Patchwork-Hint: ignore
Message-Id: <20260428184219.B509C83925@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vboot-utils: bump version to git
 7dfa482d6a
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/09f18c31adc5438f0aae99a56791979d5fb48337
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Removed patch 0001 due to upstream removal of the patched file:
https://chromium.googlesource.com/chromiumos/platform/vboot_reference/+/1accb279b195241cdd6ea47f95747bb8664442a2%5E%21/

Renumbered remaining patch.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .checkpackageignore                                |  1 -
 ...-Add-missing-definition-of-MTD_CHAR_MAJOR.patch | 30 ----------------------
 ...tform_csme-add-missing-USE_FLASHROM-guar.patch} |  0
 package/vboot-utils/vboot-utils.hash               |  2 +-
 package/vboot-utils/vboot-utils.mk                 |  2 +-
 5 files changed, 2 insertions(+), 33 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f4a428d4cf..11f9e2384a 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -937,7 +937,6 @@ package/vala/0001-dont-add-dirty-to-valac-version.patch lib_patch.Upstream
 package/vala/vala-wrapper Shellcheck
 package/valgrind/0001-workaround-SIGSEGV-on-PPC.patch lib_patch.Upstream
 package/valgrind/0002-Define-PTRACE_GETSIGINFO-on-PowerPC-when-not-availab.patch lib_patch.Upstream
-package/vboot-utils/0001-Add-missing-definition-of-MTD_CHAR_MAJOR.patch lib_patch.Upstream
 package/vdr/0001-getloadavg.patch lib_patch.Upstream
 package/vlc/0001-Disable-building-of-statically-linked-vlc-binary.patch lib_patch.Upstream
 package/vlc/0002-automake-add-subdir-objects-option.patch lib_patch.Upstream
diff --git a/package/vboot-utils/0001-Add-missing-definition-of-MTD_CHAR_MAJOR.patch b/package/vboot-utils/0001-Add-missing-definition-of-MTD_CHAR_MAJOR.patch
deleted file mode 100644
index c988c79529..0000000000
--- a/package/vboot-utils/0001-Add-missing-definition-of-MTD_CHAR_MAJOR.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From 90ed7f5cbe088912fbe0f3f45606de75602c1404 Mon Sep 17 00:00:00 2001
-From: Alex Suykov <alex.suykov@gmail.com>
-Date: Thu, 21 Jan 2016 21:59:46 +0100
-Subject: [PATCH] Add missing definition of MTD_CHAR_MAJOR
-
-This definition missing from <linux/major.h> for kernels <= 3.13
-
-Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
----
- cgpt/cgpt_wrapper.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/cgpt/cgpt_wrapper.c b/cgpt/cgpt_wrapper.c
-index afa4940e..38504aa6 100644
---- a/cgpt/cgpt_wrapper.c
-+++ b/cgpt/cgpt_wrapper.c
-@@ -33,6 +33,10 @@
- #include "cgpt_nor.h"
- #include "file_keys.h"
- 
-+#ifndef MTD_CHAR_MAJOR
-+#define MTD_CHAR_MAJOR 90
-+#endif
-+
- // Check if cmdline |argv| has "-D". "-D" signifies that GPT structs are stored
- // off device, and hence we should not wrap around cgpt.
- static bool has_dash_D(int argc, const char *const argv[]) {
--- 
-2.34.1
-
diff --git a/package/vboot-utils/0002-futility-platform_csme-add-missing-USE_FLASHROM-guar.patch b/package/vboot-utils/0001-futility-platform_csme-add-missing-USE_FLASHROM-guar.patch
similarity index 100%
rename from package/vboot-utils/0002-futility-platform_csme-add-missing-USE_FLASHROM-guar.patch
rename to package/vboot-utils/0001-futility-platform_csme-add-missing-USE_FLASHROM-guar.patch
diff --git a/package/vboot-utils/vboot-utils.hash b/package/vboot-utils/vboot-utils.hash
index 13752f3a33..6f1de06d3f 100644
--- a/package/vboot-utils/vboot-utils.hash
+++ b/package/vboot-utils/vboot-utils.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  d65c447d5b4624ffb87815071d2734c3802a73fdca56a06c910fd0ea8e82602d  vboot-utils-4b12d392e5b12de29c582df4e717b1228e9f1594-git4.tar.gz
+sha256  b8bfffa49f9f4f82c68ad56de977eb2601d96dbff319a16945efb169d3c17278  vboot-utils-7dfa482d6a843e1e25b615d6b0200028cedce29f-git4.tar.gz
 sha256  cb9dc8e96aedf9120b6757a60387db10f3c1a8e3fd97bb9d0f11327be5a7ed4d  LICENSE
diff --git a/package/vboot-utils/vboot-utils.mk b/package/vboot-utils/vboot-utils.mk
index 3058d61ad8..72742266d7 100644
--- a/package/vboot-utils/vboot-utils.mk
+++ b/package/vboot-utils/vboot-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VBOOT_UTILS_VERSION = 4b12d392e5b12de29c582df4e717b1228e9f1594
+VBOOT_UTILS_VERSION = 7dfa482d6a843e1e25b615d6b0200028cedce29f
 VBOOT_UTILS_SITE = https://chromium.googlesource.com/chromiumos/platform/vboot_reference
 VBOOT_UTILS_SITE_METHOD = git
 VBOOT_UTILS_LICENSE = BSD-3-Clause
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
