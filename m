Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61604CD6E77
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:37:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 335CE60A8F;
	Fri,  5 Jun 2026 12:37:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id te5_n_xtbIjR; Fri,  5 Jun 2026 12:37:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 985FB60AA4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663073;
	bh=b4GFlrE6nVh/V/GrYBm8Tx+FWjNUMTKjoJ69jYQXzKo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GZor69EvvKWhcyYvpgOdKQZtxQcHRrISNmuQk9/mHUtJ8vOr/qe1aMuB5LxS9EELy
	 CUnuftTnWERX8AEA0vHzsZkGDFHe9IHYogUxjzU0tCTKe1YAo2V3TllqlpK77QD8i2
	 wmaNtePHiKg0ebx7nx+L0y9OdAwPC9CDB2XdsnnoLqsPoUYYZ9o6ksfKQYgQSjE5H8
	 kGMD+YXcr/keE6h1+Kzlk47hlW2BhNMBFBq59kg4Z9WQy1a0vOsQTfK682b+78y57a
	 edtEQMJ97AL5cUQttTQQBoFbw3EVLP5kqchamC3/9P46Mtuy3QkuaGcx73hRxk1eFp
	 s5FBBhJ/5Vnzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 985FB60AA4;
	Fri,  5 Jun 2026 12:37:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 01914388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8BDC081EC2
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0DmtK7zDZOk for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:37:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6051D81B71
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6051D81B71
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:37:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A6EE87B3F; Fri,  5 Jun 2026 12:37:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 11:41:11 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 38a793ab0f7517c50cdb992c5602b8f7e6ec9b94
X-Git-Newrev: 6152636d4a1397291ac5bf6676eb2285387322b9
X-Patchwork-Hint: ignore
Message-Id: <20260605123711.8A6EE87B3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/odhcp6c: needs
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
Content-Type: multipart/mixed; boundary="===============5178767498760255491=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5178767498760255491==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6152636d4a1397291ac5bf6676eb2285387322b9
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
 package/odhcp6c/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/odhcp6c/Config.in b/package/odhcp6c/Config.in
index ca3a2f6424..ae9012e017 100644
--- a/package/odhcp6c/Config.in
+++ b/package/odhcp6c/Config.in
@@ -1,8 +1,12 @@
 config BR2_PACKAGE_ODHCP6C
 	bool "odhcp6c"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	help
 	  odhcp6c is a minimal DHCPv6 and RA-client for use in
 	  embedded Linux systems, especially routers.
 
 	  https://git.openwrt.org/project/odhcp6c.git
+
+comment "odhcp6c needs a toolchain w/ gcc >= 10"
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_GCC_AT_LEAST_10

--===============5178767498760255491==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5178767498760255491==--
