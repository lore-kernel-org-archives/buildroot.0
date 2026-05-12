Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5968ACD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:28:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D62261576;
	Fri, 15 May 2026 13:28:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id f9NyNXC0-Aso; Fri, 15 May 2026 13:28:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92F5C61577
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851709;
	bh=DcR4kIWPKQ79WJqxshfha1fjIyHLLPKPZM1Zm7J3RVU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MGfGrT1VJsUeucs2J0VHb7M+16cbYD3OC/tU/S0FAhuW3yHYd9iq0OxVK78bzNLz+
	 oEKk3MGI0ZSMUG4jdMuF3aNHQsS6ENjg92MlSs/i0is/+uYAqteMm0E6vegVOx7al8
	 gOBe71mBKg9RuN9slziZHIjUdg4IJVkPUiqA/rxYULQ4LN+t99viyLCQcplf9r64Hw
	 wNmJV2WPPYFmOqmFYcT/lOzAxCk86iIBWpG513Wf13GtgVLG+HjzUeVW8k/i4TgOSv
	 SILY+M7jVp1rBLqtpbI22LhhtVMDiFALkjsuQKHiq0ZM5iQJeRn4eTXZmd9DCLUUxT
	 ar2+NIWHxTT4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92F5C61577;
	Fri, 15 May 2026 13:28:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D73836F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4393261571
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b1v3VtW_FYOD for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:28:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B17E61545
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B17E61545
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 87EE68634F; Fri, 15 May 2026 13:28:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 15:01:23 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: dd20ff11b84a9d2cd75170b7636f8019dd701db2
X-Git-Newrev: 5645c8c8853998ac1063b299464f2066628b154e
X-Patchwork-Hint: ignore
Message-Id: <20260515132815.87EE68634F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/gcc: bump 12.x
 series to 12.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5645c8c8853998ac1063b299464f2066628b154e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Changes (linked from https://gcc.gnu.org/gcc-12/changes.html):
https://gcc.gnu.org/bugzilla/buglist.cgi?bug_status=RESOLVED&resolution=FIXED&target_milestone=12.5

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
[thomas: bump version in .checkpackageignore]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .checkpackageignore                                                   | 2 +-
 .../0001-disable-split-stack-for-non-thread-builds.patch              | 0
 .../0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch      | 0
 .../0003-xtensa-add-.note.GNU-stack-section-on-linux.patch            | 0
 .../0004-Remove-crypt-and-crypt_r-interceptors.patch                  | 0
 .../0005-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch   | 0
 .../0006-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch   | 0
 package/gcc/Config.in.host                                            | 2 +-
 package/gcc/gcc.hash                                                  | 4 ++--
 9 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index d94db4febf..6dbced55f0 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -418,7 +418,7 @@ package/ftop/0001-overflow.patch lib_patch.Upstream
 package/fwts/0001-build-do-not-use-Werror.patch lib_patch.Upstream
 package/fxdiv/0001-CMake-don-t-enable-CXX-unless-building-tests-benchma.patch lib_patch.Upstream
 package/fxload/0001-fix-static-build.patch lib_patch.Upstream
-package/gcc/12.4.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
+package/gcc/12.5.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/13.4.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/14.3.0/0001-disable-split-stack-for-non-thread-builds.patch lib_patch.Upstream
 package/gcc/8.4.0/0001-xtensa-fix-PR-target-91880.patch lib_patch.Upstream
diff --git a/package/gcc/12.4.0/0001-disable-split-stack-for-non-thread-builds.patch b/package/gcc/12.5.0/0001-disable-split-stack-for-non-thread-builds.patch
similarity index 100%
rename from package/gcc/12.4.0/0001-disable-split-stack-for-non-thread-builds.patch
rename to package/gcc/12.5.0/0001-disable-split-stack-for-non-thread-builds.patch
diff --git a/package/gcc/12.4.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch b/package/gcc/12.5.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
similarity index 100%
rename from package/gcc/12.4.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
rename to package/gcc/12.5.0/0002-or1k-Only-define-TARGET_HAVE_TLS-when-HAVE_AS_TLS.patch
diff --git a/package/gcc/12.4.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch b/package/gcc/12.5.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch
similarity index 100%
rename from package/gcc/12.4.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch
rename to package/gcc/12.5.0/0003-xtensa-add-.note.GNU-stack-section-on-linux.patch
diff --git a/package/gcc/12.4.0/0004-Remove-crypt-and-crypt_r-interceptors.patch b/package/gcc/12.5.0/0004-Remove-crypt-and-crypt_r-interceptors.patch
similarity index 100%
rename from package/gcc/12.4.0/0004-Remove-crypt-and-crypt_r-interceptors.patch
rename to package/gcc/12.5.0/0004-Remove-crypt-and-crypt_r-interceptors.patch
diff --git a/package/gcc/12.4.0/0005-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch b/package/gcc/12.5.0/0005-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
similarity index 100%
rename from package/gcc/12.4.0/0005-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
rename to package/gcc/12.5.0/0005-Undef-_TIME_BITS-along-with-_FILE_OFFSET_BITS-on-Lin.patch
diff --git a/package/gcc/12.4.0/0006-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch b/package/gcc/12.5.0/0006-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
similarity index 100%
rename from package/gcc/12.4.0/0006-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
rename to package/gcc/12.5.0/0006-libsanitizer-also-undef-_TIME_BITS-in-sanitizer_proc.patch
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index bdf644f527..e6dc4a04ba 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -70,7 +70,7 @@ config BR2_GCC_SUPPORTS_DLANG
 config BR2_GCC_VERSION
 	string
 	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
-	default "12.4.0"    if BR2_GCC_VERSION_12_X
+	default "12.5.0"    if BR2_GCC_VERSION_12_X
 	default "13.4.0"    if BR2_GCC_VERSION_13_X
 	default "14.3.0"    if BR2_GCC_VERSION_14_X
 	default "arc-2023.09-release" if BR2_GCC_VERSION_ARC
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 168c6643ce..720bf6595f 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -1,7 +1,7 @@
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-8.4.0/sha512.sum
 sha512  6de904f552a02de33b11ef52312bb664396efd7e1ce3bbe37bfad5ef617f133095b3767b4804bc7fe78df335cb53bc83f1ac055baed40979ce4c2c3e46b70280  gcc-8.4.0.tar.xz
-# From https://gcc.gnu.org/pub/gcc/releases/gcc-12.4.0/sha512.sum
-sha512  5bd29402cad2deb5d9388d0236c7146414d77e5b8d5f1c6c941c7a1f47691c3389f08656d5f6e8e2d6717bf2c81f018d326f632fb468f42925b40bd217fc4853  gcc-12.4.0.tar.xz
+# From https://gcc.gnu.org/pub/gcc/releases/gcc-12.5.0/sha512.sum
+sha512  c76020e4c844b53485502cb8a4e295221c9d37487d66c9f4559031fb14c85de20602e6387310005386cb0ef25e55067d2cfef141423bb445f3b77e7456a23533  gcc-12.5.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-13.4.0/sha512.sum
 sha512  9b4b83ecf51ef355b868608b8d257b2fa435c06d2719cb86657a7c2c2a0828ff4ce04e9bac1055bbcad8ed5b4da524cafaef654785e23a50233d95d89201e35f  gcc-13.4.0.tar.xz
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-14.3.0/sha512.sum
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
