Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 217D1C46CD2
	for <buildroot@archiver.kernel.org>; Sun, 24 Dec 2023 16:45:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7460404A5;
	Sun, 24 Dec 2023 16:45:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B7460404A5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A4cHDIm065P2; Sun, 24 Dec 2023 16:45:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE026404AB;
	Sun, 24 Dec 2023 16:45:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE026404AB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3A92F1BF30F
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 16:45:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13C8960B44
 for <buildroot@lists.busybox.net>; Sun, 24 Dec 2023 16:45:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13C8960B44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YZ-iIKO9WK2t for <buildroot@lists.busybox.net>;
 Sun, 24 Dec 2023 16:45:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3729C60B8D
 for <buildroot@buildroot.org>; Sun, 24 Dec 2023 16:45:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3729C60B8D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21054826DF; Sun, 24 Dec 2023 16:45:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 24 Dec 2023 17:16:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 78e8f3831fbe115b0e6b0b2506852cfc887a083e
X-Git-Newrev: 120f961fc6d4a8902487f17a13646be60f6f7ce1
X-Patchwork-Hint: ignore
Message-Id: <20231224164528.21054826DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/onevpl-intel-gpu: add missing
 dependency on BR2_x86_64
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

commit: https://git.buildroot.net/buildroot/commit/?id=120f961fc6d4a8902487f17a13646be60f6f7ce1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

BR2_PACKAGE_ONEVPL_INTEL_GPU selects BR2_PACKAGE_INTEL_MEDIADRIVER,
but it forgets to replicate all its dependencies, in particular
BR2_x86_64, causing:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_INTEL_MEDIADRIVER
  Depends on [n]: BR2_x86_64 [=n] && !BR2_STATIC_LIBS [=n] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_8 [=y] && BR2_TOOLCHAIN_HAS_SYNC_1 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y]
  Selected by [y]:
  - BR2_PACKAGE_ONEVPL_INTEL_GPU [=y] && BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS [=y] && BR2_INSTALL_LIBSTDCPP [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_7 [=y] && BR2_TOOLCHAIN_HAS_SYNC_1 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y]

Fixes: ac65841defece904e91afe1fb51419084c993dba ("package/onevpl-intel-gpu: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/onevpl-intel-gpu/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/onevpl-intel-gpu/Config.in b/package/onevpl-intel-gpu/Config.in
index 11a1c60a0f..b1ab6624e5 100644
--- a/package/onevpl-intel-gpu/Config.in
+++ b/package/onevpl-intel-gpu/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ONEVPL_INTEL_GPU
 	bool "onevpl-intel-gpu"
+	depends on BR2_x86_64 # intel-mediadriver
 	depends on BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS # onevpl
 	depends on BR2_INSTALL_LIBSTDCPP # onevpl
 	depends on !BR2_STATIC_LIBS # onevpl
@@ -17,6 +18,7 @@ config BR2_PACKAGE_ONEVPL_INTEL_GPU
 	  https://github.com/oneapi-src/oneVPL-intel-gpu
 
 comment "onevpl-intel-gpu needs a toolchain w/ dynamic library, gcc >= 7, C++, NPTL"
+	depends on BR2_x86_64
 	depends on BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_SYNC_1
 	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
