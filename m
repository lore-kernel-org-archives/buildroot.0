Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46055C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 13:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00CE441A32;
	Tue,  9 Jan 2024 13:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00CE441A32
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6zZaJ5y4GBEh; Tue,  9 Jan 2024 13:09:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 295F341912;
	Tue,  9 Jan 2024 13:09:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 295F341912
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 17CE11BF966
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 13:09:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E627560A6D
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 13:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E627560A6D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GE7vT5UIYht7 for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 13:09:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2B3126073F
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 13:09:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B3126073F
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 197A284F7B; Tue,  9 Jan 2024 13:09:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 9 Jan 2024 14:01:02 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 5f24ed88e0f707714c82938eb6e684b319dca2d3
X-Git-Newrev: 806bb4a0a40978a9f90bfae34705bed9d04df550
X-Patchwork-Hint: ignore
Message-Id: <20240109130918.197A284F7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/onevpl-intel-gpu:
 add missing dependency on BR2_x86_64
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=806bb4a0a40978a9f90bfae34705bed9d04df550
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

BR2_PACKAGE_ONEVPL_INTEL_GPU selects BR2_PACKAGE_INTEL_MEDIADRIVER,
but it forgets to replicate all its dependencies, in particular
BR2_x86_64, causing:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_INTEL_MEDIADRIVER
  Depends on [n]: BR2_x86_64 [=n] && !BR2_STATIC_LIBS [=n] && BR2_INSTALL_LIBSTDCPP [=y] && BR2_TOOLCHAIN_GCC_AT_LEAST_8 [=y] && BR2_TOOLCHAIN_HAS_SYNC_1 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y]
  Selected by [y]:
  - BR2_PACKAGE_ONEVPL_INTEL_GPU [=y] && BR2_PACKAGE_ONEVPL_ARCH_SUPPORTS [=y] && BR2_INSTALL_LIBSTDCPP [=y] && !BR2_STATIC_LIBS [=n] && BR2_TOOLCHAIN_GCC_AT_LEAST_7 [=y] && BR2_TOOLCHAIN_HAS_SYNC_1 [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y]

Fixes: ac65841defece904e91afe1fb51419084c993dba ("package/onevpl-intel-gpu: new package")
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 120f961fc6d4a8902487f17a13646be60f6f7ce1)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
