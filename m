Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9E81CD6E79
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 96D5D8211A;
	Fri,  5 Jun 2026 12:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gUoxkbosT75A; Fri,  5 Jun 2026 12:39:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A577882133
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663199;
	bh=Q/SP5wWL/USgDc2Ib+dqT2GCsmQR/0TcD1q7eOGx1lM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gdXg1zMvT3mz5q3bjJ97iE68TTFGQuOy0BTuBStOpRs9J1DIZ4sOkY2VnSMD6hrKt
	 cUMl4JX6g6+aZgxqfCEx57N97aX7E1qGmRL0KxtkasBts9Sec/o6Q20tlVS/9NYUNc
	 m5mzPbbZPgKBOA+nI+kb2YsRgiElyYL5Tknmh38WSK0w4ziLeinSUXuavpVRCBzIBy
	 U7/vBap79AgWNaeB1Sa/Acop0NckobzSO7jfB/c0vZeE3AhNtCGZkwBv1skdnLds6s
	 tpYjCfmwwdaBwxKWY2wM4DfY8W7sn4F8A8FCLyPS+Y9Uot44LO/lROb3L2u2SFw1x/
	 DXKNBoXBsec9w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A577882133;
	Fri,  5 Jun 2026 12:39:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E17BF4
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 10F2341032
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id w8F47ZApV2dN for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E0934100F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E0934100F
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C7CE687B04; Fri,  5 Jun 2026 12:38:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:38:40 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 2afb974ea26474eb377d60ca569cdc8edb213d56
X-Git-Newrev: baf285e1ecf8d9eb8d01427d256fb45cb7dac1cb
X-Patchwork-Hint: ignore
Message-Id: <20260605123835.C7CE687B04@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/odhcp6c: needs
 gcc >= 10
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
Content-Type: multipart/mixed; boundary="===============8836360115851244810=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8836360115851244810==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/baf285e1ecf8d9eb8d01427d256fb45cb7dac1cb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Fixes build errors seen with Gitlab pipeline and this defconfig:
support/config-fragments/autobuild/bootlin-aarch64-glibc-old.config

https://gitlab.com/bkuhls/buildroot/-/jobs/14570080455

aarch64-linux-gcc.br_real: error: unrecognized command line option
 ‘-Wimplicit-fallthrough=5’; did you mean ‘-Wno-fallthrough’?
aarch64-linux-gcc.br_real: error: unrecognized command line option
 ‘-Wshadow=local’; did you mean ‘-Wshadow-ivar’?

Removing all the unrecognized command line options from CMakeLists.txt
showed more build errors during compile:

output/build/odhcp6c-24485bb4b35ab84c17c2e87bd561d026d4c15c00/src/odhcp6c.h:47:46:
 error: expected ‘)’ before ‘__VA_OPT__’
 #define error(fmt, ...) __iflog(LOG_ERR, fmt __VA_OPT__(, ) __VA_ARGS__)

Another pipeline with gcc 9 showed other errors:
https://gitlab.com/bkuhls/buildroot/-/jobs/14570080479

/builds/bkuhls/buildroot/br-test-pkg/br-arm-basic/build/odhcp6c-24485bb4b35ab84c17c2e87bd561d026d4c15c00/src/dhcpv6.c:1126:4:
 error: a label can only be part of a statement and a declaration is not a statement
 1126 |    struct dhcpv6_auth *r = (void*)&odata[-DHCPV6_OPT_HDR_SIZE];

so we raise the minimum gcc version to 10.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
(cherry picked from commit f8ea3ae2a51f06310f414d89aa382bbf90a7ef82)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/odhcp6c/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/odhcp6c/Config.in b/package/odhcp6c/Config.in
index 83b38755c3..0acaff7fed 100644
--- a/package/odhcp6c/Config.in
+++ b/package/odhcp6c/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_ODHCP6C
 	bool "odhcp6c"
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # libubox
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libubox -> json-c
 	select BR2_PACKAGE_LIBUBOX
 	help
@@ -10,7 +11,7 @@ config BR2_PACKAGE_ODHCP6C
 
 	  https://git.openwrt.org/project/odhcp6c.git
 
-comment "odhcp6c needs a toolchain w/ dynamic library"
+comment "odhcp6c needs a toolchain w/ dynamic library, gcc >= 10"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4

--===============8836360115851244810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8836360115851244810==--
