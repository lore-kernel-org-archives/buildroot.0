Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34A2C369AB
	for <buildroot@archiver.kernel.org>; Tue, 15 Apr 2025 19:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B95678354D;
	Tue, 15 Apr 2025 19:59:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NYYh0DjlnLHA; Tue, 15 Apr 2025 19:59:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DABE28356C
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DABE28356C;
	Tue, 15 Apr 2025 19:59:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 6C574109
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:59:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5B97E40586
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:59:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MlQ-76VCZrSU for <buildroot@buildroot.org>;
 Tue, 15 Apr 2025 19:59:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E77CC40154
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E77CC40154
 for <buildroot@buildroot.org>; Tue, 15 Apr 2025 19:59:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DB6B7849D1; Tue, 15 Apr 2025 19:59:29 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 15 Apr 2025 21:57:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06c5a024f120335d0971be6520208369f0957a52
X-Git-Newrev: 7ffdf75311ab6eb0ed6018556bc0212966ea95eb
X-Patchwork-Hint: ignore
Message-Id: <20250415195929.DB6B7849D1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/double-conversion: bump to version
 3.3.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ffdf75311ab6eb0ed6018556bc0212966ea95eb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream changelog from
https://github.com/google/double-conversion/releases/tag/v3.3.1:

    Hash pin Github workflows by @joycebrum in #198
    Create dependabot.yml by @joycebrum in #199
    Add _ITERATOR_DEBUG_LEVEL=2 and _DEBUG defines by @ffa-csturdy in #202
    Add bzlmod MODULE.bazel file by @jsharpe in #205
    Add CIFuzz Github Action by @DavidKorczynski in #203
    Update MODULE.bazel and README.md. by @BYVoid in #234
    Remove the explicit dependency on rules_cc. by @BYVoid in #235
    Add missing headers by @BhavikaSharma in #239

Tested with the following configuration, which includes the only two
reverse dependencies of double-conversion.

 BR2_arm=y
 BR2_cortex_a9=y
 BR2_ARM_ENABLE_VFP=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
 BR2_INIT_NONE=y
 BR2_SYSTEM_BIN_SH_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 BR2_PACKAGE_QT6=y
 BR2_PACKAGE_PYTHON3=y
 BR2_PACKAGE_PYTHON_UJSON=y
 # BR2_TARGET_ROOTFS_TAR is not set

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/double-conversion/double-conversion.hash | 2 +-
 package/double-conversion/double-conversion.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/double-conversion/double-conversion.hash b/package/double-conversion/double-conversion.hash
index e3a5754933..a10da6d75d 100644
--- a/package/double-conversion/double-conversion.hash
+++ b/package/double-conversion/double-conversion.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  04ec44461850abbf33824da84978043b22554896b552c5fd11a9c5ae4b4d296e  double-conversion-3.3.0.tar.gz
+sha256  fe54901055c71302dcdc5c3ccbe265a6c191978f3761ce1414d0895d6b0ea90e  double-conversion-3.3.1.tar.gz
 sha256  4af93c12062c58058378de2397dc1c92bbff9ddfb1d583a01c84127557ce97ca  COPYING
diff --git a/package/double-conversion/double-conversion.mk b/package/double-conversion/double-conversion.mk
index 74e90d30d7..a4760236ca 100644
--- a/package/double-conversion/double-conversion.mk
+++ b/package/double-conversion/double-conversion.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOUBLE_CONVERSION_VERSION = 3.3.0
+DOUBLE_CONVERSION_VERSION = 3.3.1
 DOUBLE_CONVERSION_SITE = $(call github,google,double-conversion,v$(DOUBLE_CONVERSION_VERSION))
 DOUBLE_CONVERSION_LICENSE = BSD-3-Clause
 DOUBLE_CONVERSION_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
