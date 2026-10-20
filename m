Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAAF3606A31B
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 09:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=nfqUOnQQ
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 89573409EE;
	Thu, 22 Oct 2026 09:34:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pWF_g4nSfdW1; Thu, 22 Oct 2026 09:34:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CDA9B4077B
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792661685;
	b=WmuvraLzQftCtQAAn9I2el7Ju/Sn+XKvaU5N7SMvnA6UauALYES4SP5eLJ3QVE1U9OGA
	 E91AesKSLOtJB1hzZNO4Ks4ogp5uQG8evLX88W2jGqDt98Cjg+s/QGsJLLEWysMScl4eZ
	 1MUCfRSkZ5GuFvrI08usvUOtKXPX8EiIKK19kpy5kj0az5mxK25XgTpLPGS9C39YlcA4b
	 J+rRxDrtcBXWfprxtY9Ch6M/Xl1tIjhI+Zaou7Ki4l02aI18HYKIcPlFKXhXUFb+dllqA
	 zDcFl0iYRDuq/vAKplmmisTJRYG+SuhYKWO17GexmZCQx+YV7Z+tw1LGFDKDNJRVE7w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792661685;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=6D6cWr9pElYCvzqHHi+xB9CEJruJEI0gfHrlYiT34B4=;
	b=bZ1gifClPSULKuUPzx9U7Swh2B0AAmJMif/OStMGGP6nX3k4OGn7Bzxp9bRkZqlioisc
	 34tgo8Z+0V2Y4aTHE5c8cpp8k0Ir4WUH5106rsa4uCJ4FfqfPQ1iOFjfpvoyn1tROSY2/
	 AyvfCfTBVQg63DCCngjH+D8zUiGBXWCnsn2KjqWv6RUfZmKKzLmjwVSHi0bIXyM2dJ3+H
	 TvHWsmw4zW67Zo87nJ/PD+PM6zNvlENslPImm+j7p5t0LXcbnefX3kSwY2Pi4UJ5jNUU3
	 QWhiJdk7tTBYhwzzUpVPRwzidoB6Zw0I4EeZLdp81ZGtquKR1N0z+wKDw8S+2Gt5RyA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792661685;
	bh=6D6cWr9pElYCvzqHHi+xB9CEJruJEI0gfHrlYiT34B4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=nfqUOnQQanfspPWgYYa5yK4nDtR3fac6JjhpgKEkYp2UfUW24iim4eFpJd9iYwGMB
	 X+l+h3CIskLvJI8CMM80GZ8qyYaunBlBwLhF+9+40HOa4D+0yGoY7RP1BdAU8CqPFX
	 cYSvD3L/xXwQeTIoAbmTQ5f6xGMdclXHfyfGLoMBkM+fwCBX4d22gLszWG1yNq7UXr
	 u1MlVe1pgxQWNzNBcaDyJKLOj/SJ0+PDWOxVrkESg3YpTlDatC1xyomb89ECstvtba
	 bGxq+u8WAKT3IWT7XJbC/3v/ftHzKbG+pAn6YhuCJ2bKTCEcWyy0srFIvve2eC3oR8
	 aMhp09zCd3pWg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CDA9B4077B;
	Thu, 22 Oct 2026 09:34:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 49FF095C
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3C12C60823
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A1R3hIWFpWEh for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 09:34:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 82E0260846
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792661673;
 b=oG+7SRZYHDTt2Kr3+xzt2Ql60EsiOz2uoskwq1MmcCcZMls/KxFjw/YC7+UAWMnvnKtQ
 GAcFo78brmoAyUB53JEc9bNitqaUVumkaQL95eq16+KFqUx/E6JPqGW4nsWEPsfcvK0IL
 IcQ8i2W6NOFfIavdPVe/BUzbtSWdgm/vwh8yVR43umTu71CiUWvuJkM76ou/q71RiR6fd
 so9qMaNZxL8KfN5r5BNW0QvPWNQlVOIgMXxgQvyIiQrnwLrFqkuOg9u9yRC2kIDB6r6D1
 cr4HoaK4P2vGGkZ3d4vK7/OB/ZYbYXIr1Oh3HNaILsP04hCeg7TdtiryDc6QWQsfs6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792661673;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=IkQwsMd41Kl1vAoOmE5in0oqA/PRkhqWtyYFrbiZbKY=;
 b=h2iFhHxmMXi53dtu82CI1FsIjqC3AXYeErBV8i/BlnNhi6wqoVjtLPcB60JSRvCEAkpW
 fXH3ScLm4trqOrpjB/Oi5AEsbeNliA2QzA6YsZiGbxZniHKnKowDYJYthRBRIlED7Eqb5
 yLnvXQ3sjxoBiURpVkBZM/ZiLXu7K2uRnwlmDu8q7BAzGtDI/1LmSB/q/nUFkh4R2nxep
 pMGwJ2QU6Locjw10jklhYx9XzwU0vJuHpJJi3uxswUXdV/Qihs4z8MUztbdeoqtlZGL3+
 FtVjegDwlJlV3Idax0evyul0+zea5htk0SX2774/AAhTQx8ss990O7V9h9NBwfAl18Q==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 82E0260846
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 09:34:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7EED29B986; Thu, 22 Oct 2026 09:33:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 20 Oct 2026 08:45:40 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 24b11a34d4323e6d795540f43ba7e394ea2b8719
X-Git-Newrev: cffa4cbb83b2679a83cae3afe3bf1aef099b14be
X-Patchwork-Hint: ignore
Message-Id: <20261022093309.7EED29B986@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-numpy: fix
 meson configuration with LAPACK
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-20.1 required=3.0 tests=BAYES_00,DATE_IN_PAST_48_96,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/cffa4cbb83b2679a83cae3afe3bf1aef099b14be
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Building numpy with the LAPACK package enabled (like when building
python-scipy) would result in the following error during configuration:

```
numpy/meson.build:203:49: ERROR: Could not get pkg-config variable
and no default provided for <PkgConfigDependency lapack: True None>
```

This is reproducible with the following defconfig:

cat >.config <<EOF
BR2_arm=y
BR2_cortex_a7=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_BOOTLIN=y
BR2_PACKAGE_PYTHON3=y
BR2_PACKAGE_PYTHON_NUMPY=y
BR2_PACKAGE_LAPACK=y
EOF
make oldefconfig
make python-numpy

The variable that triggered that error got assigned a default value in
upstream commit [1] which is available in python-numpy v2.0.0, which fix
this error.

This commit backport the part of the upstream commit that assign the
value by default.

[1] https://github.com/numpy/numpy/commit/34afbb97cc9915ad5976ddc869a539e897545722

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/17125191093
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...eson-implement-BLAS-LAPACK-auto-detection.patch | 77 ++++++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/package/python-numpy/0002-meson-implement-BLAS-LAPACK-auto-detection.patch b/package/python-numpy/0002-meson-implement-BLAS-LAPACK-auto-detection.patch
new file mode 100644
index 0000000000..f7822ef852
--- /dev/null
+++ b/package/python-numpy/0002-meson-implement-BLAS-LAPACK-auto-detection.patch
@@ -0,0 +1,77 @@
+From 34afbb97cc9915ad5976ddc869a539e897545722 Mon Sep 17 00:00:00 2001
+From: Ralf Gommers <ralf.gommers@gmail.com>
+Date: Tue, 10 Oct 2023 00:27:02 +0200
+Subject: [PATCH] ENH: meson: implement BLAS/LAPACK auto-detection and many CI jobs [wheel build]
+
+This reimplements the auto-detection and many of the switches that
+`numpy.distutils` offered. Beyond that, it implements several new
+features:
+
+- Auto-detect the symbol suffix for ILP64 OpenBLAS (can be none or
+  `64_`)
+- MKL ILP64 support, threading control, and use of the layered library
+  model for MKL >=2023.0
+- FlexiBLAS support (LP64 and ILP64)
+- Support for the upcoming standard in Reference LAPACK for `_64` ILP64
+  symbol suffix convention.
+- A test suite for BLAS/LAPACK libraries, covering:
+
+    - OpenBLAS: LP64, ILP64 detected via pkg-config and with a "system
+                dependency" (i.e., custom code inside Meson)
+    - MKL: LP64, ILP64 (layered) and LP64 (SDL)
+    - Accelerate: LP64, ILP64 on macOS >=13.3
+    - FlexiBLAS: LP64, ILP64 on Fedora
+    - ATLAS (LP64, via pkg-config only)
+    - BLIS (LP64, via pkg-config only)
+    - plain libblas/liblapack (Netlib, LP64 only)
+
+The list of libraries that is tried with the default 'auto' setting
+excludes a couple of libraries, because they're either no longer
+developed (ATLAS), not mature (libflame), or can't be tested and
+may be re-added later (ArmPL, ssl2). Those libraries can still be
+quite easily used via pkg-config.
+
+The new CI jobs are running by default right now. Once things settle
+down, the plan is to disable them by default and allow triggering
+them via a `[blas ci]` command in the commit message (just like for
+wheel builds).
+
+Docs will be included in a separate PR with the pending rewrite of
+all the build/install docs. For now, the CI jobs and the
+`meson_options.txt` file serve as guidance for how to use this.
+
+Note that the test suite contains a few hacks, because of packaging
+bugs for MKL on PyPI (broken .pc files) and BLIS (missing .pc file in
+Debian).
+
+Upstream: https://github.com/numpy/numpy/commit/34afbb97cc9915ad5976ddc869a539e897545722
+[thomas: backport subset of upstream commit.
+  Only the part that fix the 2025.02.x scipy version LAPACK detection.
+
+ Fixes:
+    numpy/meson.build:203:49: ERROR: Could not get pkg-config variable
+    and no default provided for <PkgConfigDependency lapack: True None>
+]
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ numpy/meson.build | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/numpy/meson.build b/numpy/meson.build
+--- a/numpy/meson.build
++++ b/numpy/meson.build
+@@ -198,10 +198,10 @@
+   if dep.found()
+     conf_data.set(name + '_VERSION', dep.version())
+     conf_data.set(name + '_TYPE_NAME', dep.type_name())
+-    conf_data.set(name + '_INCLUDEDIR', dep.get_variable('includedir'))
+-    conf_data.set(name + '_LIBDIR', dep.get_variable('libdir'))
+-    conf_data.set(name + '_OPENBLAS_CONFIG', dep.get_variable('openblas_config'))
+-    conf_data.set(name + '_PCFILEDIR', dep.get_variable('pcfiledir'))
++    conf_data.set(name + '_INCLUDEDIR', dep.get_variable('includedir', default_value: 'unknown'))
++    conf_data.set(name + '_LIBDIR', dep.get_variable('libdir', default_value: 'unknown'))
++    conf_data.set(name + '_OPENBLAS_CONFIG', dep.get_variable('openblas_config', default_value: 'unknown'))
++    conf_data.set(name + '_PCFILEDIR', dep.get_variable('pcfiledir', default_value: 'unknown'))
+   endif
+ endforeach
+ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
