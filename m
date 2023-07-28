Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4557EB64DD
	for <buildroot@archiver.kernel.org>; Fri, 28 Jul 2023 20:56:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C0C2611FB;
	Fri, 28 Jul 2023 20:56:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4C0C2611FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LoxkZUtvrqOj; Fri, 28 Jul 2023 20:56:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89E9B60D88;
	Fri, 28 Jul 2023 20:56:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 89E9B60D88
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5EC2C1BF38A
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 38B678457C
 for <buildroot@lists.busybox.net>; Fri, 28 Jul 2023 20:56:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38B678457C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZrVHQNp6O0yI for <buildroot@lists.busybox.net>;
 Fri, 28 Jul 2023 20:56:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 501CA84558
 for <buildroot@buildroot.org>; Fri, 28 Jul 2023 20:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 501CA84558
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3CEA0839FF; Fri, 28 Jul 2023 20:56:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 22:50:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7453b605009668f56b28d61d9531aeaa7dcb675a
X-Git-Newrev: 931d5bd7970835399e111210ed13e4874e8a6185
X-Patchwork-Hint: ignore
Message-Id: <20230728205604.3CEA0839FF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc,
 .checkpackageignore: fix warnings about gcc 13.2.0 patches
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

commit: https://git.buildroot.net/buildroot/commit/?id=931d5bd7970835399e111210ed13e4874e8a6185
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patch 0001 is an old patch we have been carrying forever, and it has
no upstream status.

Patch 0002 is upstream, add proper upstream tag.

Fixes:

package/gcc/13.2.0/0001-disable-split-stack-for-non-thread-builds.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)
package/gcc/13.2.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch:0: missing Upstream in the header (http://nightly.buildroot.org/#_additional_patch_documentation)

In:

https://gitlab.com/buildroot.org/buildroot/-/jobs/4763535592

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                                 | 1 +
 package/gcc/13.2.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index f3e04b4f49..7930f3fdcd 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -490,6 +490,7 @@ package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch Upstream
 package/gcc/11.4.0/0001-or1k-Add-mcmodel-option-to-handle-large-GOTs.patch Upstream
 package/gcc/11.4.0/0004-disable-split-stack-for-non-thread-builds.patch Upstream
 package/gcc/12.3.0/0001-disable-split-stack-for-non-thread-builds.patch Upstream
+package/gcc/13.2.0/0001-disable-split-stack-for-non-thread-builds.patch Upstream
 package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch Upstream
 package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch Upstream
 package/gcc/8.4.0/0003-libsanitizer-Remove-cyclades-from-libsanitizer.patch Upstream
diff --git a/package/gcc/13.2.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch b/package/gcc/13.2.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
index 55fb40e358..4368f08404 100644
--- a/package/gcc/13.2.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
+++ b/package/gcc/13.2.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
@@ -21,7 +21,7 @@ gcc/ChangeLog:
 	the namespace.
 
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
-(cherry picked from commit 87c347c2897537a6aa391efbfc5ed00c625434fe)
+Upstream: https://gcc.gnu.org/git/gitweb.cgi?p=gcc.git;h=87c347c2897537a6aa391efbfc5ed00c625434fe
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
 ---
  gcc/config/riscv/genrvv-type-indexer.cc | 4 ++--
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
