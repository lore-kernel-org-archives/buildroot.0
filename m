Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8B58C52D71
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 05:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E45BA40B38;
	Fri,  2 Aug 2024 05:11:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5QEOjeIKGtKK; Fri,  2 Aug 2024 05:11:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6851040C7F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6851040C7F;
	Fri,  2 Aug 2024 05:11:13 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2C9021BF3BA
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 05:11:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26FF1400AB
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 05:11:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id evYdOqoknKgp for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 05:11:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 63A7B400D2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63A7B400D2
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 63A7B400D2
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 05:11:09 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 3211E35361CD; Fri,  2 Aug 2024 07:11:07 +0200 (CEST)
Date: Fri, 2 Aug 2024 07:11:07 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <Zqxqax4t+Jm1W5IP@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-31-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1722575467; bh=0hYFNeAC1/wdDlZon0MzZA5U1fbhDSb1Vmvilp0SpyI=;
 h=Date:From:To:Subject:From;
 b=HTvU9+fJUzhNrCfssUTQEJ5ylMoJkRlES3JdR+cPf+2oj81dvNtate3HTlg2cn2Y7
 cpU2P+w2KvFfJT4zE4aPOu3Jqpn+dzjEk1sxW8e0x+Xb4gP1kt8uyPlVZzYeANWfXQ
 JAF0cBxptec9UoMqDa/w0+RQg+p0kCx10I9INMij2W3nYoZUPhMZd8Me9/umLjJ29N
 EEu/sfeDqV3eRHXlHMUKeACoq6mdRYbDCg3IwvYl5Ax5kRiu1JcRJ8XoyDKW1iVJU4
 kgHuWSTD8TJx6+Fn6nqyOGFngUnqq+pM2yOG7Ka7YRj5H3CAw5snkVlO1EnsrCs7sg
 AAK7z/q3liIeg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=HTvU9+fJ
Subject: [Buildroot] [PATCH] package/gcc: update to 14.2.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

List of bugs which were resolved in 14.2.0:
https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=14.2

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .checkpackageignore                                           | 2 +-
 .../0001-disable-split-stack-for-non-thread-builds.patch      | 0
 ...libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch | 0
 package/gcc/Config.in.host                                    | 2 +-
 package/gcc/gcc.hash                                          | 4 ++--
 5 files changed, 4 insertions(+), 4 deletions(-)
 rename package/gcc/{14.1.0 => 14.2.0}/0001-disable-split-stack-for-non-thread-builds.patch (100%)
 rename package/gcc/{14.1.0 => 14.2.0}/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch (100%)

diff --git a/.checkpackageignore b/.checkpackageignore
index 72bbcb5bde..fa0935c17d 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -541,7 +541,7 @@ package/fxdiv/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch li
 package/fxload/0001-fix-static-build.patch lib_patch.Upstream
 package/gcc/12.4.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/13.3.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
-package/gcc/14.1.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
+package/gcc/14.2.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch lib_patch.Upstream
 package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch lib_patch.Upstream
 package/gcc/8.4.0/0003-libsanitizer-Remove-cyclades-from-libsanitizer.patch lib_patch.Upstream
diff --git a/package/gcc/14.1.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/14.2.0/0001-disable-split-stack-for-non-thread-builds.patch
similarity index 100%
rename from package/gcc/14.1.0/0001-disable-split-stack-for-non-thread-builds.patch
rename to package/gcc/14.2.0/0001-disable-split-stack-for-non-thread-builds.patch
diff --git a/package/gcc/14.1.0/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch b/package/gcc/14.2.0/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
similarity index 100%
rename from package/gcc/14.1.0/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
rename to package/gcc/14.2.0/0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index e32f5fea35..6f4b371d28 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -77,7 +77,7 @@ config BR2_GCC_VERSION
 	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
 	default "12.4.0"    if BR2_GCC_VERSION_12_X
 	default "13.3.0"    if BR2_GCC_VERSION_13_X
-	default "14.1.0"    if BR2_GCC_VERSION_14_X
+	default "14.2.0"    if BR2_GCC_VERSION_14_X
 	default "arc-2023.09-release" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 4534655790..b7c53f8fbe 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -6,8 +6,8 @@ sha512  440c08ca746da450d9a1b35e8fd2305cb27e7e6987cd9d0f7d375f3b1fc9e4b0bd7acb3c
 sha512  5bd29402cad2deb5d9388d0236c7146414d77e5b8d5f1c6c941c7a1f47691c3389f08656d5f6e8e2d6717bf2c81f018d326f632fb468f42925b40bd217fc4853  gcc-12.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-13.3.0/sha512.sum
 sha512  ed5f2f4c6ed2c796fcf2c93707159e9dbd3ddb1ba063d549804dd68cdabbb6d550985ae1c8465ae9a336cfe29274a6eb0f42e21924360574ebd8e5d5c7c9a801  gcc-13.3.0.tar.xz
-# From https://gcc.gnu.org/pub/gcc/releases/gcc-14.1.0/sha512.sum
-sha512  e9e224f2b26646fcf038d28dfa08b94c623bc57941f99894a321d01c600f7c68aff6b8837fd25e73e540de1f8de5606e98694a62cdcdfb525ce768b3ef6879ea  gcc-14.1.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-14.2.0/sha512.sum
+sha512  932bdef0cda94bacedf452ab17f103c0cb511ff2cec55e9112fc0328cbf1d803b42595728ea7b200e0a057c03e85626f937012e49a7515bc5dd256b2bf4bc396  gcc-14.2.0.tar.xz
 
 # Locally calculated (fetched from Github)
 sha512  4dca20f517a42bb027fec605965b09fb917a535eebf3fe3e811d93476b02b1962df5ad4665f117bd44c2ec8e8015d51a44c00591761fe5f259c201ac5c7d920f  gcc-arc-2023.09-release.tar.gz
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
