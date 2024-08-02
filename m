Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4007EC3DA4A
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 06:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C65D9820D7;
	Fri,  2 Aug 2024 06:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xQ5ywM_1Qa8S; Fri,  2 Aug 2024 06:36:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A00AC84513
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A00AC84513;
	Fri,  2 Aug 2024 06:36:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CCF4E1BF995
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 06:36:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB15B606A2
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 06:36:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hsgH-27bBcyw for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 06:36:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 700C96066C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 700C96066C
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 06:36:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5502E83B0B; Fri,  2 Aug 2024 06:36:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Aug 2024 08:33:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f3148385f89bf052a420933c05dcd4e40f114c77
X-Git-Newrev: 84ae3b04fe6cd70a4abccc5d9e19218583410c16
X-Patchwork-Hint: ignore
Message-Id: <20240802063627.5502E83B0B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/odb: properly format Upstream:
 tags in patches
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=84ae3b04fe6cd70a4abccc5d9e19218583410c16
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All patches of the odb package already contained relevant Upstream
information, just not formatted according to how we expect it. Let's
fix that, and drop the .checkpackageignore entries that are no longer
needed.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                         | 13 -------------
 ....h-include-in-gcc.hxx-appears-to-be-no-longer-nece.patch |  2 +-
 package/odb/0002-Remove-gratuitous-classes.patch            |  2 +-
 ...003-Initial-work-to-make-ODB-compatible-with-GCC-6.patch |  2 +-
 .../odb/0004-Make-compilable-with-GCC-6-in-C-14-mode.patch  |  2 +-
 .../0005-Fix-bug-in-GCC-6-input_location-translation.patch  |  2 +-
 package/odb/0006-Adapt-to-changes-in-GCC-8.patch            |  2 +-
 .../odb/0007-Switch-to-C-11-get-rid-of-auto_ptr-use.patch   |  2 +-
 ...x-GCC-8-adaptation-to-be-compatible-with-previous-.patch |  2 +-
 ...009-Handle-namespace-aliases-when-parsing-GCC-tree.patch |  2 +-
 package/odb/0010-Add-initial-support-for-GCC-9.patch        |  2 +-
 package/odb/0011-Adjust-to-changes-in-GCC-10.patch          |  2 +-
 package/odb/0012-Adjust-to-changes-in-GCC-11.patch          |  2 +-
 ...solve-name-lookup-ambiguity-causing-error-with-GCC.patch |  2 +-
 14 files changed, 13 insertions(+), 26 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index fa0935c17d..9d2da90aa1 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -984,19 +984,6 @@ package/numactl/0001-link-with-latomic-if-needed-again.patch lib_patch.Upstream
 package/nuttcp/0001-susv3-legacy.patch lib_patch.Upstream
 package/nvidia-driver/0001-use-LDFLAGS.patch lib_patch.Upstream
 package/octave/0001-Fix-BLAS-library-integer-size-detection.patch lib_patch.Upstream
-package/odb/0001-tm.h-include-in-gcc.hxx-appears-to-be-no-longer-nece.patch lib_patch.Upstream
-package/odb/0002-Remove-gratuitous-classes.patch lib_patch.Upstream
-package/odb/0003-Initial-work-to-make-ODB-compatible-with-GCC-6.patch lib_patch.Upstream
-package/odb/0004-Make-compilable-with-GCC-6-in-C-14-mode.patch lib_patch.Upstream
-package/odb/0005-Fix-bug-in-GCC-6-input_location-translation.patch lib_patch.Upstream
-package/odb/0006-Adapt-to-changes-in-GCC-8.patch lib_patch.Upstream
-package/odb/0007-Switch-to-C-11-get-rid-of-auto_ptr-use.patch lib_patch.Upstream
-package/odb/0008-Fix-GCC-8-adaptation-to-be-compatible-with-previous-.patch lib_patch.Upstream
-package/odb/0009-Handle-namespace-aliases-when-parsing-GCC-tree.patch lib_patch.Upstream
-package/odb/0010-Add-initial-support-for-GCC-9.patch lib_patch.Upstream
-package/odb/0011-Adjust-to-changes-in-GCC-10.patch lib_patch.Upstream
-package/odb/0012-Adjust-to-changes-in-GCC-11.patch lib_patch.Upstream
-package/odb/0013-Resolve-name-lookup-ambiguity-causing-error-with-GCC.patch lib_patch.Upstream
 package/ofono/0001-uclibc-backtrace.patch lib_patch.Upstream
 package/ofono/S46ofono lib_sysv.Variables
 package/ola/0001-ola-fix-compilation-with-musl-1-2-3.patch lib_patch.Upstream
diff --git a/package/odb/0001-tm.h-include-in-gcc.hxx-appears-to-be-no-longer-nece.patch b/package/odb/0001-tm.h-include-in-gcc.hxx-appears-to-be-no-longer-nece.patch
index 0216038f2c..a9366d6fb8 100644
--- a/package/odb/0001-tm.h-include-in-gcc.hxx-appears-to-be-no-longer-nece.patch
+++ b/package/odb/0001-tm.h-include-in-gcc.hxx-appears-to-be-no-longer-nece.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] <tm.h> include in gcc.hxx appears to be no longer necessary
 On MIPS this file pulls in enum processor which conflicts with
 our class processor.
 
-[Upstream: f0bbc17aeed1b636782a4b92e8191d90f310d0a2]
+Upstream: https://git.codesynthesis.com/cgit/odb/odb/commit/?id=f0bbc17aeed1b636782a4b92e8191d90f310d0a2
 Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
 ---
  odb/gcc.hxx | 2 --
diff --git a/package/odb/0002-Remove-gratuitous-classes.patch b/package/odb/0002-Remove-gratuitous-classes.patch
index f2d9303e09..7fd70e8a21 100644
--- a/package/odb/0002-Remove-gratuitous-classes.patch
+++ b/package/odb/0002-Remove-gratuitous-classes.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] Remove gratuitous classes
 In the process also get rid of global class processor which conflicts
 with enum processor on MIPS.
 
-[Upstream: bbc39ffe31c67506b4c03fc56fa3adcb925b6325]
+Upstream: https://git.codesynthesis.com/cgit/odb/odb/commit/?id=bbc39ffe31c67506b4c03fc56fa3adcb925b6325
 Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
 ---
  odb/context.hxx              |  3 ++-
diff --git a/package/odb/0003-Initial-work-to-make-ODB-compatible-with-GCC-6.patch b/package/odb/0003-Initial-work-to-make-ODB-compatible-with-GCC-6.patch
index e2b97cca6c..4c936f4453 100644
--- a/package/odb/0003-Initial-work-to-make-ODB-compatible-with-GCC-6.patch
+++ b/package/odb/0003-Initial-work-to-make-ODB-compatible-with-GCC-6.patch
@@ -3,7 +3,7 @@ From: Boris Kolpackov <boris@codesynthesis.com>
 Date: Fri, 5 Feb 2016 16:01:42 +0200
 Subject: [PATCH] Initial work to make ODB compatible with GCC 6
 
-[Upstream: 511dcf67322ad87fb32f97d1cf7725c129e83898]
+Upstream: https://git.codesynthesis.com/cgit/odb/odb/commit/?id=511dcf67322ad87fb32f97d1cf7725c129e83898
 Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
 ---
  odb/cxx-lexer.cxx          |  4 ++++
diff --git a/package/odb/0004-Make-compilable-with-GCC-6-in-C-14-mode.patch b/package/odb/0004-Make-compilable-with-GCC-6-in-C-14-mode.patch
index 57288af044..8911590ec1 100644
--- a/package/odb/0004-Make-compilable-with-GCC-6-in-C-14-mode.patch
+++ b/package/odb/0004-Make-compilable-with-GCC-6-in-C-14-mode.patch
@@ -3,7 +3,7 @@ From: Boris Kolpackov <boris@codesynthesis.com>
 Date: Mon, 8 Feb 2016 18:39:21 +0200
 Subject: [PATCH] Make compilable with GCC 6 in C++14 mode
 
-[Upstream: 61d13eb53ade9f30a64892a901401bda5e42c335]
+Upstream: https://git.codesynthesis.com/cgit/odb/odb/commit/?id=61d13eb53ade9f30a64892a901401bda5e42c335
 Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
 ---
  odb/gcc.hxx    | 9 ++++++---
diff --git a/package/odb/0005-Fix-bug-in-GCC-6-input_location-translation.patch b/package/odb/0005-Fix-bug-in-GCC-6-input_location-translation.patch
index 4e8c8f4fc3..af682502c9 100644
--- a/package/odb/0005-Fix-bug-in-GCC-6-input_location-translation.patch
+++ b/package/odb/0005-Fix-bug-in-GCC-6-input_location-translation.patch
@@ -3,7 +3,7 @@ From: Boris Kolpackov <boris@codesynthesis.com>
 Date: Fri, 23 Dec 2016 10:18:01 +0200
 Subject: [PATCH] Fix bug in GCC 6 input_location translation
 
-[Upstream: ec777147024fde72e4411cc6b1e1e49f4a1d1804]
+Upstream: https://git.codesynthesis.com/cgit/odb/odb/commit/?id=ec777147024fde72e4411cc6b1e1e49f4a1d1804
 Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
 ---
  odb/cxx-lexer.cxx | 8 ++++++++
diff --git a/package/odb/0006-Adapt-to-changes-in-GCC-8.patch b/package/odb/0006-Adapt-to-changes-in-GCC-8.patch
index c0ef4e8bfa..2f907de663 100644
--- a/package/odb/0006-Adapt-to-changes-in-GCC-8.patch
+++ b/package/odb/0006-Adapt-to-changes-in-GCC-8.patch
@@ -3,7 +3,7 @@ From: Boris Kolpackov <boris@codesynthesis.com>
 Date: Tue, 7 Nov 2017 14:58:43 +0200
 Subject: [PATCH] Adapt to changes in GCC 8
 
-[Upstream: 356630ced28f3101e8e2d88e3c52f8d3008515c7]
+Upstream: https://git.codesynthesis.com/cgit/odb/odb/commit/?id=356630ced28f3101e8e2d88e3c52f8d3008515c7
 Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
 ---
  odb/cxx-lexer.cxx          | 16 ++++++++++++++--
diff --git a/package/odb/0007-Switch-to-C-11-get-rid-of-auto_ptr-use.patch b/package/odb/0007-Switch-to-C-11-get-rid-of-auto_ptr-use.patch
index bf856eb487..e3fbc21ae6 100644
--- a/package/odb/0007-Switch-to-C-11-get-rid-of-auto_ptr-use.patch
+++ b/package/odb/0007-Switch-to-C-11-get-rid-of-auto_ptr-use.patch
@@ -3,7 +3,7 @@ From: Boris Kolpackov <boris@codesynthesis.com>
 Date: Tue, 7 Nov 2017 10:37:53 +0200
 Subject: [PATCH] Switch to C++11, get rid of auto_ptr use
 
-[Upstream: 6e374de9ae2f2978f2fca3390aba4ea3f72bfade]
+Upstream: https://git.codesynthesis.com/cgit/odb/odb/commit/?id=6e374de9ae2f2978f2fca3390aba4ea3f72bfade
 Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
 ---
  odb/Makefile.am   |  5 +++++
diff --git a/package/odb/0008-Fix-GCC-8-adaptation-to-be-compatible-with-previous-.patch b/package/odb/0008-Fix-GCC-8-adaptation-to-be-compatible-with-previous-.patch
index b89c35fb8f..818a95db73 100644
--- a/package/odb/0008-Fix-GCC-8-adaptation-to-be-compatible-with-previous-.patch
+++ b/package/odb/0008-Fix-GCC-8-adaptation-to-be-compatible-with-previous-.patch
@@ -4,7 +4,7 @@ Date: Tue, 7 Nov 2017 16:57:35 +0200
 Subject: [PATCH] Fix GCC 8 adaptation to be compatible with previous
  versions
 
-[Upstream: 006bbc5748a8197d7874550cc9186545f1c55ad8]
+Upstream: https://git.codesynthesis.com/cgit/odb/odb/commit/?id=006bbc5748a8197d7874550cc9186545f1c55ad8
 Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
 ---
  odb/validator.cxx | 6 ++++++
diff --git a/package/odb/0009-Handle-namespace-aliases-when-parsing-GCC-tree.patch b/package/odb/0009-Handle-namespace-aliases-when-parsing-GCC-tree.patch
index bac7abea1f..dbe2d533bd 100644
--- a/package/odb/0009-Handle-namespace-aliases-when-parsing-GCC-tree.patch
+++ b/package/odb/0009-Handle-namespace-aliases-when-parsing-GCC-tree.patch
@@ -3,7 +3,7 @@ From: Boris Kolpackov <boris@codesynthesis.com>
 Date: Fri, 5 Oct 2018 07:20:18 +0200
 Subject: [PATCH] Handle namespace aliases when parsing GCC tree
 
-[Upstream: 3a1788234bfaa96ee093b68e9ba02cf7d5bdffe6]
+Upstream: https://git.codesynthesis.com/cgit/odb/odb/commit/?id=3a1788234bfaa96ee093b68e9ba02cf7d5bdffe6
 Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
 ---
  odb/parser.cxx | 5 +++++
diff --git a/package/odb/0010-Add-initial-support-for-GCC-9.patch b/package/odb/0010-Add-initial-support-for-GCC-9.patch
index dd36882bc5..c6c4c0a52d 100644
--- a/package/odb/0010-Add-initial-support-for-GCC-9.patch
+++ b/package/odb/0010-Add-initial-support-for-GCC-9.patch
@@ -3,7 +3,7 @@ From: Boris Kolpackov <boris@codesynthesis.com>
 Date: Fri, 15 Mar 2019 17:37:28 +0200
 Subject: [PATCH] Add initial support for GCC 9
 
-[Upstream: 841140bbf13ae2bfaa5978a181718cda0a8edae7]
+Upstream: https://git.codesynthesis.com/cgit/odb/odb/commit/?id=841140bbf13ae2bfaa5978a181718cda0a8edae7
 Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
 ---
  odb/cxx-lexer.cxx | 33 +++++++++++++++++++++++++++------
diff --git a/package/odb/0011-Adjust-to-changes-in-GCC-10.patch b/package/odb/0011-Adjust-to-changes-in-GCC-10.patch
index 33d46d792e..0da8b09bf1 100644
--- a/package/odb/0011-Adjust-to-changes-in-GCC-10.patch
+++ b/package/odb/0011-Adjust-to-changes-in-GCC-10.patch
@@ -3,7 +3,7 @@ From: Boris Kolpackov <boris@codesynthesis.com>
 Date: Wed, 17 Jun 2020 11:22:11 +0200
 Subject: [PATCH] Adjust to changes in GCC 10
 
-[Upstream: 060bb7eb4d008fbd4a9fa8ef7c5e33c9e483eb52]
+Upstream: https://git.codesynthesis.com/cgit/odb/odb/commit/?id=060bb7eb4d008fbd4a9fa8ef7c5e33c9e483eb52
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 ---
  odb/gcc.hxx                | 7 +++++--
diff --git a/package/odb/0012-Adjust-to-changes-in-GCC-11.patch b/package/odb/0012-Adjust-to-changes-in-GCC-11.patch
index 2959a71dea..e5601b048e 100644
--- a/package/odb/0012-Adjust-to-changes-in-GCC-11.patch
+++ b/package/odb/0012-Adjust-to-changes-in-GCC-11.patch
@@ -3,7 +3,7 @@ From: Boris Kolpackov <boris@codesynthesis.com>
 Date: Wed, 31 Mar 2021 10:45:21 +0200
 Subject: [PATCH] Adjust to changes in GCC 11
 
-[Upstream: 61d80f051293a7449a09081f60f48b8377bfbbad]
+Upstream: https://git.codesynthesis.com/cgit/odb/odb/commit/?id=61d80f051293a7449a09081f60f48b8377bfbbad
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 ---
  odb/gcc.hxx | 20 ++++++++++++++++++++
diff --git a/package/odb/0013-Resolve-name-lookup-ambiguity-causing-error-with-GCC.patch b/package/odb/0013-Resolve-name-lookup-ambiguity-causing-error-with-GCC.patch
index 79c3d982fa..fed8b6319b 100644
--- a/package/odb/0013-Resolve-name-lookup-ambiguity-causing-error-with-GCC.patch
+++ b/package/odb/0013-Resolve-name-lookup-ambiguity-causing-error-with-GCC.patch
@@ -3,7 +3,7 @@ From: Boris Kolpackov <boris@codesynthesis.com>
 Date: Wed, 7 Jul 2021 09:26:57 +0200
 Subject: [PATCH] Resolve name lookup ambiguity causing error with GCC 11
 
-[Upstream: 47035c0f72efd99a2210cd45db6e42423fb74533]
+Upstream: https://git.codesynthesis.com/cgit/odb/odb/commit/?id=47035c0f72efd99a2210cd45db6e42423fb74533
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 ---
  odb/relational/header.hxx | 2 ++
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
