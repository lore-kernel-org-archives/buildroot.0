Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F03C001B0
	for <buildroot@archiver.kernel.org>; Sat, 22 Jul 2023 21:54:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9BEC81CE9;
	Sat, 22 Jul 2023 21:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9BEC81CE9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9qst2o0sATW7; Sat, 22 Jul 2023 21:54:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC0B28225A;
	Sat, 22 Jul 2023 21:54:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC0B28225A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CBEA1BF59F
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03A8960E8A
 for <buildroot@lists.busybox.net>; Sat, 22 Jul 2023 21:54:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03A8960E8A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vPq4gRAj_saw for <buildroot@lists.busybox.net>;
 Sat, 22 Jul 2023 21:54:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 991EC605AE
 for <buildroot@buildroot.org>; Sat, 22 Jul 2023 21:54:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 991EC605AE
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 84189822CD; Sat, 22 Jul 2023 21:54:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Jul 2023 23:53:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b22627f7598acfad07032e9bfefca9283baaf7d
X-Git-Newrev: 0cfb890a040574e13f1f09b6e2b619cd8cd81f18
X-Patchwork-Hint: ignore
Message-Id: <20230722215427.84189822CD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/resiprocate: fix Upstream: tags in
 patches
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

commit: https://git.buildroot.net/buildroot/commit/?id=0cfb890a040574e13f1f09b6e2b619cd8cd81f18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

package/resiprocate/0002-rutil-OpenSSLInit-disable-use-of-legacy-OpenSSL-memo.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)
package/resiprocate/0003-rutil-fix-typo-in-preprocessor-condition.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)
package/resiprocate/0004-resip-stack-ssl-Security-cxx-remove-deprecated-OpenS.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)
make: *** [Makefile:1253: check-package] Error 1

In:

https://gitlab.com/buildroot.org/buildroot/-/jobs/4718833134

and while at it, we also address the same issue in patch 0001, which
was currently ignored through .checkpackageignore.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                                   | 1 -
 .../0001-Fix-some-issue-compiling-with-Visual-Studio.patch            | 4 ++--
 .../0002-rutil-OpenSSLInit-disable-use-of-legacy-OpenSSL-memo.patch   | 3 +--
 .../resiprocate/0003-rutil-fix-typo-in-preprocessor-condition.patch   | 3 +--
 .../0004-resip-stack-ssl-Security-cxx-remove-deprecated-OpenS.patch   | 3 +--
 5 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index dce0c2bf64..5fcb292629 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -1314,7 +1314,6 @@ package/redis/0001-uclibc.patch Upstream
 package/redis/0002-largefile-conditional-define.patch Upstream
 package/redis/0003-redis.conf-adjust-defauts-for-buildroot.patch Upstream
 package/redis/S50redis Shellcheck Variables
-package/resiprocate/0001-Fix-some-issue-compiling-with-Visual-Studio.patch Upstream
 package/restorecond/S02restorecond Shellcheck
 package/ripgrep/0001-puts-jemalloc-allocator-behind-a-cargo-feature-flag.patch Upstream
 package/riscv-isa-sim/0001-riscv-disable-precompiled-headers.patch Upstream
diff --git a/package/resiprocate/0001-Fix-some-issue-compiling-with-Visual-Studio.patch b/package/resiprocate/0001-Fix-some-issue-compiling-with-Visual-Studio.patch
index 0efe0d9cfb..2157ea0450 100644
--- a/package/resiprocate/0001-Fix-some-issue-compiling-with-Visual-Studio.patch
+++ b/package/resiprocate/0001-Fix-some-issue-compiling-with-Visual-Studio.patch
@@ -4,8 +4,8 @@ Date: Sat, 22 Aug 2020 23:14:11 +0100
 Subject: [PATCH] Fix some issue compiling with Visual Studio 16.7.0 and tidy
  up Visual Studio 16 project files
 
-[Retrieved (and updated to keep only RendKa.cxx update) from:
-https://github.com/resiprocate/resiprocate/commit/be76b10a50749e2e11dce8dcc38b414a7f9d8747]
+Upstream: https://github.com/resiprocate/resiprocate/commit/be76b10a50749e2e11dce8dcc38b414a7f9d8747
+[Retrieved (and updated to keep only RendKa.cxx update)]
 Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 ---
  VisualStudioReadme.htm                        |   65 +
diff --git a/package/resiprocate/0002-rutil-OpenSSLInit-disable-use-of-legacy-OpenSSL-memo.patch b/package/resiprocate/0002-rutil-OpenSSLInit-disable-use-of-legacy-OpenSSL-memo.patch
index fad1c2ef29..c333df849d 100644
--- a/package/resiprocate/0002-rutil-OpenSSLInit-disable-use-of-legacy-OpenSSL-memo.patch
+++ b/package/resiprocate/0002-rutil-OpenSSLInit-disable-use-of-legacy-OpenSSL-memo.patch
@@ -4,8 +4,7 @@ Date: Thu, 4 Aug 2022 10:55:30 +0200
 Subject: [PATCH] rutil: OpenSSLInit: disable use of legacy OpenSSL memory leak
  checking with OpenSSL 3.0 and later
 
-Upstream:
-https://github.com/resiprocate/resiprocate/commit/e7c33f4e078e6e5dfa7dea796fa4ffb88f48a37a
+Upstream: https://github.com/resiprocate/resiprocate/commit/e7c33f4e078e6e5dfa7dea796fa4ffb88f48a37a
 
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
diff --git a/package/resiprocate/0003-rutil-fix-typo-in-preprocessor-condition.patch b/package/resiprocate/0003-rutil-fix-typo-in-preprocessor-condition.patch
index f7ff4d2a57..5cbe5871d0 100644
--- a/package/resiprocate/0003-rutil-fix-typo-in-preprocessor-condition.patch
+++ b/package/resiprocate/0003-rutil-fix-typo-in-preprocessor-condition.patch
@@ -3,8 +3,7 @@ From: Andrey Semashev <andrey.semashev@gmail.com>
 Date: Sat, 10 Sep 2022 12:15:06 +0200
 Subject: [PATCH] rutil: fix typo in preprocessor condition
 
-Upstream:
-https://github.com/resiprocate/resiprocate/commit/53302195c339dfaa104788a50aa900a48dbff777
+Upstream: https://github.com/resiprocate/resiprocate/commit/53302195c339dfaa104788a50aa900a48dbff777
 
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
diff --git a/package/resiprocate/0004-resip-stack-ssl-Security-cxx-remove-deprecated-OpenS.patch b/package/resiprocate/0004-resip-stack-ssl-Security-cxx-remove-deprecated-OpenS.patch
index eaa5ae87cf..2b595d64c1 100644
--- a/package/resiprocate/0004-resip-stack-ssl-Security-cxx-remove-deprecated-OpenS.patch
+++ b/package/resiprocate/0004-resip-stack-ssl-Security-cxx-remove-deprecated-OpenS.patch
@@ -4,8 +4,7 @@ Date: Thu, 4 Aug 2022 11:09:43 +0200
 Subject: [PATCH] resip/stack: ssl/Security.cxx: remove deprecated OpenSSL
  ERR_GET_FUNC, not required
 
-Upstream:
-https://github.com/resiprocate/resiprocate/commit/88f98702d908549d888aa7f0ee1b0763e09662b1
+Upstream: https://github.com/resiprocate/resiprocate/commit/88f98702d908549d888aa7f0ee1b0763e09662b1
 
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
 ---
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
