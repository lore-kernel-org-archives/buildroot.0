Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15300C624D3
	for <buildroot@archiver.kernel.org>; Sat,  5 Sep 2026 13:55:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1CA180F27;
	Sat,  5 Sep 2026 13:55:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uQDCshwKcnPW; Sat,  5 Sep 2026 13:55:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org C61ED80F2B
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788616554;
	b=Gj7NnfeYYopk7Sp3BrlgJv1uDbMRbILxpG97Ptv+o7+qbVUX+ZqNO+aNnrcAX6vwqzUy
	 czxVr3YpCAgBlogIT8zXSiZQLbpGp4NgQYL5t5oJ8WslHXOu+g9ZFis0esKBqSUAiRr10
	 mssFABWtVwHemzUCIF9W7DjepVb7kT3Fnl5vS5fVPEWrDu59MPfPQJMa+d5Jfn0L+wfnt
	 EyWqgTC3WAuIbcxG92HSocHEv5GcNVUVYI7m0G8+sjKXL2Cwjm9E4ZCEXrxcMykY7MsJI
	 gbgMEXHOCxEON9k3ovVxxixfvw23yXmJFOSt+CPAamyX6Jn1MkMMAmh0SaDzeAeGFBg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788616554;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=/vCBpBUaEwlnmQxNMIh4FNBsjgw22xRKbyiGI4stbt0=;
	b=OX7OGjZzM8p9IRA8z4LJScqLc4JYOEk7zNuSDK2ndQ4gZNcpPasuZzImpSE4aKiDswPP
	 ygvtxkQNrLJvYUx9JeEhQeg3rCNBqBf1PZo9KoMyp+B7HGHJx4fsLwDTclHyh9g25o2Ge
	 robKMR3tz9JO0IiJEz/BqGBrVYa5NUULSu5rROhVauVGXcWKhiWPwxv/CT63uPFCwPiwr
	 COxhEpZF+GrTQKFl6qvmTpeqxUcQlKGVTA39/IjXFvDOWNuRdoBBEVnlArxmNBZm2HD/l
	 YwuhEzAoZ/w7FKRFLMvuBGB/39yzpfJkTKsx/LbqEXf02RG+BpTfGfM6tbTro+q06gg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788616554;
	bh=/vCBpBUaEwlnmQxNMIh4FNBsjgw22xRKbyiGI4stbt0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Z2agwA5CwRAZCfF0wnWVfu4ppT8yPV1ZiuFc1CQNTtHUmENrX5An7VviV1j1r/cOH
	 +Np0ukBAmBsI8X6amr9AL5XW4kZyJyO/cXiGlEHkO61Jr0gVo6hRwjlplAgpOO8Y3w
	 BusOzplplqVgW5i0rgMoMqOdGKAxKvrsGX5J/5O5lII0jFE6oxaaOANMJL0DmpyZiU
	 SggaY7ZbKJOjdqriSHB1BRDD+//OrottnUvCBZLh/7Dbt1SV74VpQCTbqJ4xKlMXBT
	 8PDJcf7FIdTUGSv1GDULMlzN4dMJ8Nef0MQaWvCrVSMVqXU20/Sc4ZPZg3LoyYW6ab
	 uuj/4C5PdcgEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C61ED80F2B;
	Sat,  5 Sep 2026 13:55:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7245D49D
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 13:55:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5877660604
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 13:55:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xGCJWVTQMtdM for <buildroot@buildroot.org>;
 Sat,  5 Sep 2026 13:55:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 79A59605F8
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788616552;
 b=Xo/Up/tDPm07oJefl8uEBfsOX1/pnxahqPvKwhMP4kyNF9luolRLG27Tr6+efRJkbcdR
 6vqlec8Oigv79avd+bocFIZJnRMoTUM5ni/ptxdcjiYlgnCm+KbizKkE4NTgMX2JAQCbZ
 i59M44C8cvlLp6dW5pP8EYG4EI4R+rmHxqXHZA+dbLzw8ctaqSwnf9Lo43mN4PYB5HsDN
 6jQ4wnZ1nuQpkbe5pjJ+WEF60si0ebTk8M6LxmZkUfE32pMRB1V76pDWSU7SAdRu1IO8d
 YzhtoLCgGMoBk2u6+BjHLL6SEzyOjJ+bkFNqTW5YXPCl+CZ514BGQCqll3S7qeeXb9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788616552;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LR0B1AT7Q0HxiYxudEXSjCvMrhy4GsX4LpmSlzD6j9k=;
 b=DufnXN4e4Al2GMYUt0jTeDsFz28MF7Mz65Zwtpa60teweOWvfIaE2wHFGJeWJQEyX0ov
 cxV9DtUWW8qNieHtw7LUdnNP260QL4El3yXezclLIsQzVaCJEUJSqHa0uqy4qu1hsi/XL
 ABvsgK7LmPP8aZ/iNbnBTvxGHoB9EyBlx5ZDYDApyMoIBsnKhPrnSpvv5eB8h8tX2fqgc
 buCmW5oBViWwN7hyFTLxGAhI9mz926U46iu0UI9xprThSnSzjCVshhGKBlR5ZCInuSpKX
 Gb5tZDQtqjVCBQZPDotMSt5G5ymve+0rB3qZUZdH7+2DzRKzuAU/griwJhvLr+CBueg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79A59605F8
 for <buildroot@buildroot.org>; Sat,  5 Sep 2026 13:55:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6E4258B847; Sat,  5 Sep 2026 13:54:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Sep 2026 15:52:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7209f55cd22286eb61c058062aa5f6eebeda8e40
X-Git-Newrev: 698535473f7340402d3c36bc1eb66237c63ef083
X-Patchwork-Hint: ignore
Message-Id: <20260905135451.6E4258B847@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rustc: add
 BR2_PACKAGE_HOST_RUSTC_TARGET_HAS_ATOMIC_U64
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/698535473f7340402d3c36bc1eb66237c63ef083
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Rust does not provide 64-bit atomics on every target Buildroot can
generate. rustc sets max_atomic_width = 32 for three of the 25 targets
listed in RUST_TARGETS in utils/update-rust, so
core::sync::atomic::AtomicU64 and AtomicI64 simply do not exist there:

  $ rustc --print cfg --target <target> | grep target_has_atomic
  armv5te-unknown-linux-gnueabi     "16" "32" "8" "ptr"
  armv5te-unknown-linux-musleabi    "16" "32" "8" "ptr"
  powerpc-unknown-linux-gnu         "16" "32" "8" "ptr"

Every other supported target, including armv6, armv7, aarch64, all the
x86 variants, riscv64, s390x, sparc64 and both 64-bit powerpcs, has
them, e.g.:

  arm-unknown-linux-gnueabi         "16" "32" "64" "8" "ptr"
  armv7-unknown-linux-gnueabihf     "16" "32" "64" "8" "ptr"

A crate that uses 64-bit atomics without a cfg(target_has_atomic = "64")
guard therefore fails to build on those three targets with:

  error[E0432]: unresolved import `std::sync::atomic::AtomicU64`
     |
     |         atomic::{AtomicU64, AtomicU8, AtomicUsize, Ordering},
     |                  ^^^^^^^^^ no `AtomicU64` in `sync::atomic`

This has been hit at least twice already: by package/dust, worked around
in commit 3abc3b97bad9 ("package/dust: bump to version 1.1.2") by moving
to a release in which upstream had added the guard and by package/dtui,
which has no such release available and had to open-code the affected
architectures instead.

It is likely to keep recurring: infra.basetest.BASIC_TOOLCHAIN_CONFIG
builds with BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV5_EABI_GLIBC_STABLE, so
every runtime test that does not override the toolchain compiles for
armv5te, one of the three affected targets. That is exactly how the two
failures above were found.

Add a hidden symbol so packages can express this constraint once, rather
than each open-coding BR2_ARM_CPU_ARMV5 and BR2_powerpc and needing to
update whenever rust gains or changes a target.

Note that armv5te and 32-bit powerpc are only supported by rust for
glibc and musl, so the uclibc variants of those architectures are
already excluded by BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS.

Signed-off-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
Reviewed-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rustc/Config.in.host | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index 9cd912fc74..6130b73921 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -112,6 +112,22 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 
+# Not all the targets above provide 64-bit atomics: rustc sets
+# max_atomic_width = 32 for armv5te-unknown-linux-{gnu,musl}eabi and for
+# powerpc-unknown-linux-gnu, so core::sync::atomic::{AtomicU64,AtomicI64}
+# do not exist there. This can be checked with:
+#   rustc --print cfg --target <target> | grep target_has_atomic
+# Target rust packages whose crates use 64-bit atomics unconditionally,
+# i.e. without a cfg(target_has_atomic = "64") guard, should depend on
+# this option.
+config BR2_PACKAGE_HOST_RUSTC_TARGET_HAS_ATOMIC_U64
+	bool
+	# Excludes armv5te-unknown-linux-{gnu,musl}eabi and
+	# powerpc-unknown-linux-gnu. BR2_powerpc is 32-bit only:
+	# BR2_powerpc64 and BR2_powerpc64le are separate symbols, both
+	# selecting BR2_ARCH_IS_64, and are not affected.
+	default y if !BR2_ARM_CPU_ARMV5 && !BR2_powerpc
+
 config BR2_PACKAGE_HOST_RUSTC_ARCH
 	string
 	default "armv5te" if BR2_ARM_CPU_ARMV5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
