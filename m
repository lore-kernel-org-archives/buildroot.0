Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B496CD3448
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 16:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 37E9E60741;
	Tue,  3 Sep 2024 16:28:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xVBjrxngfk6i; Tue,  3 Sep 2024 16:28:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F17E60842
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F17E60842;
	Tue,  3 Sep 2024 16:28:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 164421BF373
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 16:28:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BD944022A
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 16:28:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F87HrdiMVnb5 for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 16:28:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D9D1540210
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D9D1540210
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 16:28:07 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C3CD486A1E; Tue,  3 Sep 2024 16:28:07 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 18:06:43 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: f10881b5b08784c4b31f1f2a49af99173e5b6a00
X-Git-Newrev: 9194f49cf4f8e07df9ddc48f0c5b4a13df855805
X-Patchwork-Hint: ignore
Message-Id: <20240903162807.C3CD486A1E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/gcc: update to
 14.2.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9194f49cf4f8e07df9ddc48f0c5b4a13df855805
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

List of bugs which were resolved in 14.2.0:
https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=14.2

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit f3148385f89bf052a420933c05dcd4e40f114c77)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .checkpackageignore                                                   | 2 +-
 .../0001-disable-split-stack-for-non-thread-builds.patch              | 0
 .../0002-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch   | 0
 package/gcc/Config.in.host                                            | 2 +-
 package/gcc/gcc.hash                                                  | 4 ++--
 5 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 47da52c4eb..05e97ebccc 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -638,7 +638,7 @@ package/gamin/0002-no-const-return.patch lib_patch.Sob lib_patch.Upstream
 package/gamin/0003-fix-missing-PTHREAD_MUTEX_RECURSIVE_NP.patch lib_patch.Upstream
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
index 5d3b803c78..911bc2f4de 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -75,7 +75,7 @@ config BR2_GCC_VERSION
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
