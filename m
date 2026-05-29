Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D95ECD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 18:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 307716160B;
	Fri, 29 May 2026 18:10:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XX1JlQ79D7aw; Fri, 29 May 2026 18:10:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D86461617
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780078237;
	bh=irww+6akkTEbMx5aynRdUrIE52at7IXSEe2g7e2LwgI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iVIn4Qd5YVhonF7KCLnnjXV0RN3Lv4JQgcre5eZjnStHJYnw1P7PmCkdGVTn4zJdH
	 je9oZxDOQ/Tj5tCbyzI1gQ8B6fVaxh3v/szIwZ8vpkGWtfwALZV0ujB7wuH+LHMEAr
	 9MeGDPAyUoRc5MMa8EgLF7aeF9MBkFer+QBv+BuG3hyh41Tht6W6kINGYPObe9UJPe
	 pGz7xcOBGBp073IUaZyWCT5AMWzzWIQiSoCqE+sWbvZTHfOPRY86DE9hasVlWofMTW
	 5QMwX+O+zsRkRy95J8v9t9G4RtNPf1GINcfwtCp4LFjWCtC5ld8TPeM/pI/W85erEM
	 cVkCZNP97hqaA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D86461617;
	Fri, 29 May 2026 18:10:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id D132BD3
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:10:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AEF55420E4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:10:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r-eAjjKHjZ6v for <buildroot@buildroot.org>;
 Fri, 29 May 2026 18:10:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A8B34210D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A8B34210D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 18:10:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BA6DB87412; Fri, 29 May 2026 18:10:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 20:05:38 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8aff626d5c0d62ebc6cc0184c806109c494c320c
X-Git-Newrev: f8ea3ae2a51f06310f414d89aa382bbf90a7ef82
X-Patchwork-Hint: ignore
Message-Id: <20260529181018.BA6DB87412@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/odhcp6c: needs gcc >= 10
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============4832567460135206730=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4832567460135206730==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f8ea3ae2a51f06310f414d89aa382bbf90a7ef82
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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

--===============4832567460135206730==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4832567460135206730==--
