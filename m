Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D97CC25B76
	for <buildroot@archiver.kernel.org>; Sat,  1 Jun 2024 12:39:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C8F8960849;
	Sat,  1 Jun 2024 12:39:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iO_R7ftu7gf1; Sat,  1 Jun 2024 12:39:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B3ECB60863
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3ECB60863;
	Sat,  1 Jun 2024 12:39:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 66D211BF2CD
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 12:39:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 52C72811F8
 for <buildroot@lists.busybox.net>; Sat,  1 Jun 2024 12:39:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OCNi47bDGiY3 for <buildroot@lists.busybox.net>;
 Sat,  1 Jun 2024 12:39:18 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=89.238.66.15;
 helo=helium.openadk.org; envelope-from=wbx@openadk.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C10B281242
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C10B281242
Received: from helium.openadk.org (helium.openadk.org [89.238.66.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C10B281242
 for <buildroot@buildroot.org>; Sat,  1 Jun 2024 12:39:16 +0000 (UTC)
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 9FBF7353656C; Sat,  1 Jun 2024 14:39:08 +0200 (CEST)
Date: Sat, 1 Jun 2024 14:39:08 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZlsWbN4ndrbor49a@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-27-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1717245549; bh=aw4bW/SxvxIsN9yebyqKfEFprGKG6+GU0i9m6HsmP2Y=;
 h=Date:From:To:Subject:From;
 b=ew8RpIDlEuR4+364v1dmEeDYMKjWv7NbJ4Xvl2hX2eIC1vzi+obePwd6P3pLZfO7B
 UMo80Unmzde1s9uiUOG5su5IVGIQYw2GDTNpZBsfxSraseHM3vdwwGslbO4MWx1cFz
 RZ285Fvti/A3322XQ1puT6KzKpGZkK5+rN0+Z5LmWxDeyhOMlMGhbm1Pm+7O1sjaOo
 +NuOLn+wC6TYq5qVf/3+rLqtAmo9gpkEnS18Kp/HOZdbOGtusBmEQ68V8HlhVincjM
 a/Jow9UxkA6xidZvX5z8+thZ91d6ftDe/zSbjTpBwEj3tVyFJqGa+1ZGqx8ouxHnp+
 8iGB8xfNdxrqQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=openadk.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=openadk.org header.i=@openadk.org header.a=rsa-sha256
 header.s=2022 header.b=ew8RpIDl
Subject: [Buildroot] [PATCH] package/gcc: update to 13.3.0
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

See here for changes made to this release:
https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=13.3

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 .checkpackageignore                                           | 2 +-
 .../0001-disable-split-stack-for-non-thread-builds.patch      | 0
 .../0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch          | 0
 .../0003-Remove-crypt-and-crypt_r-interceptors.patch          | 0
 package/gcc/Config.in.host                                    | 2 +-
 package/gcc/gcc.hash                                          | 4 ++--
 6 files changed, 4 insertions(+), 4 deletions(-)
 rename package/gcc/{13.2.0 => 13.3.0}/0001-disable-split-stack-for-non-thread-builds.patch (100%)
 rename package/gcc/{13.2.0 => 13.3.0}/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch (100%)
 rename package/gcc/{13.2.0 => 13.3.0}/0003-Remove-crypt-and-crypt_r-interceptors.patch (100%)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8f5fc0a476..102b3cfcbc 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -670,7 +670,7 @@ package/gamin/0001-no-abstract-sockets.patch lib_patch.Upstream
 package/gamin/0002-no-const-return.patch lib_patch.Sob lib_patch.Upstream
 package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch lib_patch.Upstream
 package/gcc/12.3.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
-package/gcc/13.2.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
+package/gcc/13.3.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/14.1.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch lib_patch.Upstream
 package/gcc/8.4.0/0002-Revert-re-PR-target-92095-internal-error-with-O1-mcp.patch lib_patch.Upstream
diff --git a/package/gcc/13.2.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/13.3.0/0001-disable-split-stack-for-non-thread-builds.patch
similarity index 100%
rename from package/gcc/13.2.0/0001-disable-split-stack-for-non-thread-builds.patch
rename to package/gcc/13.3.0/0001-disable-split-stack-for-non-thread-builds.patch
diff --git a/package/gcc/13.2.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch b/package/gcc/13.3.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
similarity index 100%
rename from package/gcc/13.2.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
rename to package/gcc/13.3.0/0002-RISC-V-fix-build-issue-with-gcc-4.9.x.patch
diff --git a/package/gcc/13.2.0/0003-Remove-crypt-and-crypt_r-interceptors.patch b/package/gcc/13.3.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
similarity index 100%
rename from package/gcc/13.2.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
rename to package/gcc/13.3.0/0003-Remove-crypt-and-crypt_r-interceptors.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index a0377cc0a3..ac20591e5c 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -76,7 +76,7 @@ config BR2_GCC_VERSION
 	string
 	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
 	default "12.3.0"    if BR2_GCC_VERSION_12_X
-	default "13.2.0"    if BR2_GCC_VERSION_13_X
+	default "13.3.0"    if BR2_GCC_VERSION_13_X
 	default "14.1.0"    if BR2_GCC_VERSION_14_X
 	default "arc-2023.09-release" if BR2_GCC_VERSION_ARC
 
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 08d4fca6e7..0b48a1acdd 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -4,8 +4,8 @@ sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b
 sha512  440c08ca746da450d9a1b35e8fd2305cb27e7e6987cd9d0f7d375f3b1fc9e4b0bd7acb3cd7bf795e72fcbead59cdef5b6c152862f5d35cd9fbfe6902101ce648  gcc-10.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-12.3.0/sha512.sum
 sha512  8fb799dfa2e5de5284edf8f821e3d40c2781e4c570f5adfdb1ca0671fcae3fb7f794ea783e80f01ec7bfbf912ca508e478bd749b2755c2c14e4055648146c204  gcc-12.3.0.tar.xz
-# From https://gcc.gnu.org/pub/gcc/releases/gcc-13.2.0/sha512.sum
-sha512  d99e4826a70db04504467e349e9fbaedaa5870766cda7c5cab50cdebedc4be755ebca5b789e1232a34a20be1a0b60097de9280efe47bdb71c73251e30b0862a2  gcc-13.2.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-13.3.0/sha512.sum
+sha512  ed5f2f4c6ed2c796fcf2c93707159e9dbd3ddb1ba063d549804dd68cdabbb6d550985ae1c8465ae9a336cfe29274a6eb0f42e21924360574ebd8e5d5c7c9a801  gcc-13.3.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-14.1.0/sha512.sum
 sha512  e9e224f2b26646fcf038d28dfa08b94c623bc57941f99894a321d01c600f7c68aff6b8837fd25e73e540de1f8de5606e98694a62cdcdfb525ce768b3ef6879ea  gcc-14.1.0.tar.xz
 
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
