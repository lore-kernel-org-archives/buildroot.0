Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09286E9D41A
	for <buildroot@archiver.kernel.org>; Wed,  4 Feb 2026 17:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2FCC612E9;
	Wed,  4 Feb 2026 17:09:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fx9wISDMl67Z; Wed,  4 Feb 2026 17:09:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD098612F5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770224977;
	bh=UMOox9imBpoRXT9u4vFELwFtp6tZUKGYjdnM0ry0cHs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=s15Uspnc67cPawUUL0brf96xnDQ5D1c9FOAihcoWwXKcCF77++6ivCeJq1Fp4Wtjo
	 PB07MbnjbNwoZjaeN7aB4YBJzSCJJWMR7s8IWmMbOAeOrJWPC3ADTI0xjcfmn0qmFG
	 ljh1SU9jlC1t3v62scsz2ZYQRaA5+SYZoKCgCxS8PYijt3Lz5UyWxKCnTelcqp631U
	 zOYWw6RU2n0VoEk4U/lYOtzC28rEhUsJKkiMOwQhaBKqy24rmZGoi+pt3FqLu8Orjb
	 WmTRYV0hBM7+RNdEOItHy0dyegaHAeFk8PFiVo80N+BbTLB9FUea1W8+aGShWJrEsm
	 EhmwbR/UU2e9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD098612F5;
	Wed,  4 Feb 2026 17:09:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C771F5
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:08:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D9114057B
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MPtTaKdwIfuf for <buildroot@buildroot.org>;
 Wed,  4 Feb 2026 17:07:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEEB3405C2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id BEEB3405C2
 for <buildroot@buildroot.org>; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B40E08697A; Wed,  4 Feb 2026 17:07:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Feb 2026 17:44:44 +0100
X-Git-Refname: refs/heads/2025.11.x
X-Git-Oldrev: 62d625b2ee2a2541afdf9c79b2bf91ff2eaec290
X-Git-Newrev: 8fc5886e1fa1440f02229444dd18987be7684348
X-Patchwork-Hint: ignore
Message-Id: <20260204170748.B40E08697A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.11.x] package/netdata: needs C++
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8fc5886e1fa1440f02229444dd18987be7684348
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.11.x

Buildroot commit 9cfcd906cff299ef83b48681e50bcef9df124ad4 bumped the
package from 1.33.1 to 1.37.1. Upstream changed the optional C++ support
into a mandatory dependency with commit
https://github.com/netdata/netdata/commit/b6d2a3662dfb683e9e95203ef3b21f8e31238b06
added to version 1.35.0 causing build errors with toolchains without
C++ support:

  GEN      netdatacli
/bin/sh: line 1: no: command not found
make[3]: *** [Makefile:5502: netdatacli] Error 127

Fixes:
https://autobuild.buildroot.org/results/7084a73d5727a86ca55eda3d1f01ea4d5b8ecf65/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Michael Cullen <michael@michaelcullen.name>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 33c09c71d57986dc58e20dd8487d07f052178cd7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/netdata/Config.in                     | 10 +++++-----
 support/testing/tests/package/test_netdata.py |  1 +
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/netdata/Config.in b/package/netdata/Config.in
index 3603eb071c..527d4d39af 100644
--- a/package/netdata/Config.in
+++ b/package/netdata/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_NETDATA
 	bool "netdata"
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # libuv
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
@@ -22,22 +23,21 @@ if BR2_PACKAGE_NETDATA
 config BR2_PACKAGE_NETDATA_PROMETHEUS
 	bool "prometheus remote write backend"
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
-	depends on BR2_INSTALL_LIBSTDCPP # protobuf, snappy
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # protobuf
 	select BR2_PACKAGE_PROTOBUF
 	select BR2_PACKAGE_SNAPPY
 	help
 	  Enable prometheus remote write backend
 
-comment "prometheus remote write backend needs a toolchain w/ C++, gcc >= 8"
-	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
+comment "prometheus remote write backend needs a toolchain w/ gcc >= 8"
+	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_8
 	depends on BR2_PACKAGE_PROTOBUF_ARCH_SUPPORTS
 
 endif
 
-comment "netdata needs a toolchain w/ NPTL, dynamic library, gcc >= 4.9"
+comment "netdata needs a toolchain w/ C++, NPTL, dynamic library, gcc >= 4.9"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS \
+		|| !BR2_INSTALL_LIBSTDCPP \
 		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
diff --git a/support/testing/tests/package/test_netdata.py b/support/testing/tests/package/test_netdata.py
index 6b616398d3..42bcbcdc6f 100644
--- a/support/testing/tests/package/test_netdata.py
+++ b/support/testing/tests/package/test_netdata.py
@@ -6,6 +6,7 @@ import infra.basetest
 class TestNetdata(infra.basetest.BRTest):
     config = infra.basetest.BASIC_TOOLCHAIN_CONFIG + \
         """
+        BR2_INSTALL_LIBSTDCPP=y
         BR2_PACKAGE_NETDATA=y
         BR2_TARGET_ROOTFS_CPIO=y
         # BR2_TARGET_ROOTFS_TAR is not set
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
