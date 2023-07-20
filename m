Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAEBEB64DD
	for <buildroot@archiver.kernel.org>; Thu, 20 Jul 2023 20:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8DC89612B5;
	Thu, 20 Jul 2023 20:59:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8DC89612B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c703QKOu4aXk; Thu, 20 Jul 2023 20:59:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7690612BF;
	Thu, 20 Jul 2023 20:59:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7690612BF
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29DDB1BF59D
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 20:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03974612C6
 for <buildroot@lists.busybox.net>; Thu, 20 Jul 2023 20:59:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03974612C6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SyL7Wg0M-jtn for <buildroot@lists.busybox.net>;
 Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 243D4612A2
 for <buildroot@buildroot.org>; Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 243D4612A2
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 12C468749A; Thu, 20 Jul 2023 20:59:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Jul 2023 22:39:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2bef68f3b0c684d640dd64711ec5ea3fbcfd0334
X-Git-Newrev: e0caf0d0dc251cda9f3ba20c07b763eae0c05c06
X-Patchwork-Hint: ignore
Message-Id: <20230720205936.12C468749A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lld: move to llvm-project subfolder
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

commit: https://git.buildroot.net/buildroot/commit/?id=e0caf0d0dc251cda9f3ba20c07b763eae0c05c06
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To make version bumping easier, move lld to a new llvm-project subfolder
and specify site and version for the project.

Signed-off-by: Daniel Lang <d.lang@abatec.at>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Sebastian Weyer <sebastian.weyer@smile.fr>
Tested-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                    | 2 +-
 package/Config.in.host                        | 2 +-
 package/{ => llvm-project}/lld/Config.in.host | 0
 package/{ => llvm-project}/lld/lld.hash       | 0
 package/{ => llvm-project}/lld/lld.mk         | 5 ++---
 5 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 8ccecc248e..5526130847 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1633,7 +1633,7 @@ F:	package/clang/
 F:	package/earlyoom/
 F:	package/gconf/
 F:	package/libnss/
-F:	package/lld/
+F:	package/llvm-project/lld/
 F:	package/llvm-project/llvm/
 F:	package/python-cython/
 F:	package/python-pycups/
diff --git a/package/Config.in.host b/package/Config.in.host
index dcadbfdfc1..9addc88522 100644
--- a/package/Config.in.host
+++ b/package/Config.in.host
@@ -51,7 +51,7 @@ menu "Host utilities"
 	source "package/jsmin/Config.in.host"
 	source "package/kmod/Config.in.host"
 	source "package/libp11/Config.in.host"
-	source "package/lld/Config.in.host"
+	source "package/llvm-project/lld/Config.in.host"
 	source "package/lpc3250loader/Config.in.host"
 	source "package/lttng-babeltrace/Config.in.host"
 	source "package/lzma-alone/Config.in.host"
diff --git a/package/lld/Config.in.host b/package/llvm-project/lld/Config.in.host
similarity index 100%
rename from package/lld/Config.in.host
rename to package/llvm-project/lld/Config.in.host
diff --git a/package/lld/lld.hash b/package/llvm-project/lld/lld.hash
similarity index 100%
rename from package/lld/lld.hash
rename to package/llvm-project/lld/lld.hash
diff --git a/package/lld/lld.mk b/package/llvm-project/lld/lld.mk
similarity index 87%
rename from package/lld/lld.mk
rename to package/llvm-project/lld/lld.mk
index 4bf903cda0..46ec3b13ff 100644
--- a/package/lld/lld.mk
+++ b/package/llvm-project/lld/lld.mk
@@ -4,9 +4,8 @@
 #
 ################################################################################
 
-# LLVM, Clang and lld should be version bumped together
-LLD_VERSION = 11.1.0
-LLD_SITE = https://github.com/llvm/llvm-project/releases/download/llvmorg-$(LLD_VERSION)
+LLD_VERSION = $(LLVM_PROJECT_VERSION)
+LLD_SITE = $(LLVM_PROJECT_SITE)
 LLD_SOURCE = lld-$(LLD_VERSION).src.tar.xz
 LLD_LICENSE = Apache-2.0 with exceptions
 LLD_LICENSE_FILES = LICENSE.TXT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
