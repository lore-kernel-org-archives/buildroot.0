Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EF46C43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 19:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B22AC60FB4;
	Sat, 23 Jul 2022 19:24:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B22AC60FB4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dmpQJL17-pS2; Sat, 23 Jul 2022 19:24:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92BF360FFC;
	Sat, 23 Jul 2022 19:24:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 92BF360FFC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 751671BF5A5
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:24:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4FFE2401B2
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 19:24:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FFE2401B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wjY9fIaM7YBh for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 19:24:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 127D640354
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 19:24:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 127D640354
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9207984CA4; Sat, 23 Jul 2022 19:10:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Jul 2022 21:23:59 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: da7b8726692ee8f0fede8118ad06a4aa938e67e1
X-Git-Newrev: 6ea42ff9cff1a5731dbf028ec0f1eaf9e23435ce
X-Patchwork-Hint: ignore
Message-Id: <20220723191033.9207984CA4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{rust,
 rust-bin}: bump to version 1.62.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=6ea42ff9cff1a5731dbf028ec0f1eaf9e23435ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Link to Rust 1.62.0 annoucement: https://blog.rust-lang.org/2022/06/30/Rust-1.62.0.html

Newest version of the source archives have been retrieved with their hash values,
and the signature of the .asc files have been verified as follows:
$ curl -fsSL https://static.rust-lang.org/rust-key.gpg.ascii | gpg --import
$ gpg --verify <filename.asc> <filename>

There is no typographical error in the packages according to the check-pakage utility:
$ ./utils/check-package package/rust-bin/*
$ ./utils/check-package package/rust/*

The testsuite tool were successfully run for rust and rust-bin packages to test
the Rust toolchain under 1.62.0:
$ ./support/testing/run-tests -k -d dl/ -o testsuite tests.package.test_rust.TestRustBin
$ ./support/testing/run-tests -k -d dl/ -o testsuite tests.package.test_rust.TestRust

In order to verify the compatibility of packages depending on Rust 1.62.0,
tests using `./utils/test-pkg` were run.
You may want to execute the test-pkg command after creating a `.config` file
enabling the corresponding BR2_PACKAGE, for example:
Create a file `buildroot/ripgrep.config` containing "BR2_PACKAGE_RIPGREP=y"
Then execute:
$ ./utils/test-pkg -d test-pkg -c ripgrep.config -p ripgrep

Results:
librsvg OK
ripgrep OK
suricata OK
bat OK

Signed-off-by: Nicolas Tran <nicolas.tran@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rust-bin/rust-bin.hash | 252 ++++++++++++++++++++---------------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   6 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 131 insertions(+), 131 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 5e1100c671..57ff4ee1a8 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,129 +1,129 @@
-# From https://static.rust-lang.org/dist/rust-1.60.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.60.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  5d18bc384273edbd8a4b6d18104685651fb42d5f07bdf518ef2ec3641269c95d  rust-1.60.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.60.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.60.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  94567ff691b46ef3dff64f3866445a278a17b20639e62cdc4b6fcd7aed86cec8  rust-1.60.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.60.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.60.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256  d7643bf1c46765600b7f12e95c68c7bf98c720c9483d79d5d54884ea9c7f97be  rust-1.60.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.60.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.60.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  7ff0a817d040688235b69c54e42266d5267481900a621012e7f3a4b9f58d0570  rust-1.60.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.60.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.60.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  9502d2ceff5d0f9963cdb5dea1e5f83f140132f84df1f588be588d5d151d6637  rust-1.60.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.60.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.60.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  3e2914c26a60297d3b08fc30eee4fe919bf0a1bc24abb28a4ceb67b9f580e063  rust-1.60.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.60.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.60.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  2fb5c3cba35f3c1815a24c4f0de1ae34ce6ccfb7fb63cb724070670e8bfceba2  rust-1.60.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.60.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.60.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  cc20c99079d69bd85e5ddb4990415bcc76293513e3b05e8a0ad1d2efa9b968a4  rust-1.60.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.60.0-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.60.0-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  1af141aa6ea084f8333cca4973488395414a87c2bdd77c1d58994869cf3cde5d  rust-1.60.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.60.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.60.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  83c3fb8645379ec308192fa713df87044892639495722077e07aa779b310239e  rust-1.60.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  fbc39c2ba2eee9bad7305d73d02a63ada651961be8fd9e0dae520bda5d715c6e  rust-std-1.60.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-aarch64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-aarch64-unknown-linux-musl.tar.xz.asc
-sha256  16e8f0e03e6a025ef1f96cb76890810d4212525de82340d8cbf2f627725f2ec7  rust-std-1.60.0-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-arm-unknown-linux-gnueabi.tar.xz.asc
-sha256  0260245f927a38efccf36c7c652e263b7dd69b80383e09426204bd9592990f9f  rust-std-1.60.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-arm-unknown-linux-gnueabihf.tar.xz.asc
-sha256  aa40798080243dcdb199a1b7ffd21c056cdc94a76b0a8a339d5a8ad7a64fdc5a  rust-std-1.60.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-arm-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-arm-unknown-linux-musleabihf.tar.xz.asc
-sha256  4c0722a9fa5cafa3c720bec8ab110147a0ccbe6947a4b98284e61fa01c006045  rust-std-1.60.0-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-arm-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-arm-unknown-linux-musleabi.tar.xz.asc
-sha256  1429378d662b3bd15b69f426b30678d032ad193d805d7931997943ce8ebe96df  rust-std-1.60.0-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
-sha256  48df1c532e23bda5476d287d9280da5cdbd0ed52f4f2e2af5dc088e816a52123  rust-std-1.60.0-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-armv5te-unknown-linux-musleabi.tar.xz.asc
-sha256  84aaa30d90acd0e633c80d54c368d3fcda2b78cbe547e97aeae944765ad93481  rust-std-1.60.0-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
-sha256  b913c45d85fcc1caf7de684127cf00a51430e0096e7c470e18ec76a8eec0b6d7  rust-std-1.60.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-armv7-unknown-linux-gnueabi.tar.xz.asc
-sha256  3b28be7ae8f669d40fcb01c36e83d9e0107164815c26e080d7cbcf4185b20be2  rust-std-1.60.0-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-armv7-unknown-linux-musleabihf.tar.xz.asc
-sha256  5499545cb0799a56f9d974e513234acfddac4aa7c40703b4780022069a6b1a69  rust-std-1.60.0-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-armv7-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-armv7-unknown-linux-musleabi.tar.xz.asc
-sha256  925db12e7103935e90264890afdafd93e8485893effbd3fcd526ee9404683db1  rust-std-1.60.0-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-i586-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-i586-unknown-linux-gnu.tar.xz.asc
-sha256  790288c7060c5dc4aaaf5cc4d2842feeb86a046ce4689023f7def3cf4a091126  rust-std-1.60.0-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-i586-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-i586-unknown-linux-musl.tar.xz.asc
-sha256  d583a74a61c8df3e1fdfc0ce86d0275c6922b584205385e94440b4b16278b74e  rust-std-1.60.0-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  04a7ed0ab0811e3d4dc86053af1d49a8654bfdd6a1a5c22419e8a2c42c33c382  rust-std-1.60.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-i686-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-i686-unknown-linux-musl.tar.xz.asc
-sha256  c7f7f87b0c66e68dc939d4fe906ee61d6bf8f4836b6e54eb02eccc07e805e806  rust-std-1.60.0-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256  0f5ad9aaf415314308b0c5400b4e8300abe0d31233708902dbed0c5ad5bb70cb  rust-std-1.60.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-mips-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-mips-unknown-linux-musl.tar.xz.asc
-sha256  7b8c08adf5c9c4eae38b8929c58916e15ab7ada2d4e3438c60d1d778ba1ba0d6  rust-std-1.60.0-mips-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
-sha256  8cfc02116e2c15d96696332b8260a217f30aa21e95fac0b241a6a1b4252787e4  rust-std-1.60.0-mips64-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-mips64-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-mips64-unknown-linux-muslabi64.tar.xz.asc
-sha256  ca6096a4a6366c1faed3b71052bff5a3722bf7a186218f05980c4291d48ef31b  rust-std-1.60.0-mips64-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
-sha256  636cff37d1fb5474b576d9772d9754aa2d936611363ce658f1b422f444aa1ad7  rust-std-1.60.0-mips64el-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-mips64el-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-mips64el-unknown-linux-muslabi64.tar.xz.asc
-sha256  a7b9428705e1267a22ad778d75f6e9c4ffab31e7f82180585c2bb187548c8ab6  rust-std-1.60.0-mips64el-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  ff963e0a04a5ae8511f75a5e11f42fce4e14942487ce7b6a4615a3b2ef412407  rust-std-1.60.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-mipsel-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-mipsel-unknown-linux-musl.tar.xz.asc
-sha256  75e0212990727dc31e11bc76ddee87c0a94628427c5f18e5c63a3365ca7bfb38  rust-std-1.60.0-mipsel-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  81138f4b9c8ec6f68fa81f10ec0da5962a7bb433a85009fe970ec3bb6596b1af  rust-std-1.60.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  b390bec6ce697a6347fb6c5dd70bb23f562cc9945ed215f10fd08dbc1a38293f  rust-std-1.60.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  3bfce36ef03027574f2f1e17d24b172bd086a0a3adbd8944955d18ad9919a78e  rust-std-1.60.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  9a1d788ed9d0b456ea6974b6468199455d82e437e56025de2a1d4031e9f67174  rust-std-1.60.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  3d44442c5dc02fbdc4f71dd4f76dac714fa69a8021a3350b3919439a7ac548ac  rust-std-1.60.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-sparc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-sparc64-unknown-linux-gnu.tar.xz.asc
-sha256  83039cd55d4ab7606d81f0e199f042e011cbe55b07b252913543c339c6c2f434  rust-std-1.60.0-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  6fb8ee3650beb10836ae48a9aaa535473e64eaca20695b88113267aea3c7557f  rust-std-1.60.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.60.0-x86_64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.60.0-x86_64-unknown-linux-musl.tar.xz.asc
-sha256  0801252694e49eca069003f311e23e124a6dee3557e613133dc2e3cab7bed64d  rust-std-1.60.0-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.62.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.62.0-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  596edf892fac02f3a3b9a8f018f64551e2d58f0a840a8bad13793eb7224783bd  rust-1.62.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.62.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.62.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256  8851657b282e0b76056b4179c5f2c77f0624da9e031a4dab1abb33be7c251238  rust-1.62.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.62.0-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.62.0-mips-unknown-linux-gnu.tar.xz.asc
+sha256  3d1baf0f8aa8615dff16870b86db1d52df5875005c08626aec81cb98b0de5ce6  rust-1.62.0-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.62.0-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.62.0-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  e053f1ff5e60c5c4c7db5e507a79b53230b8c78e71dcd47cffa5bc4ad946244a  rust-1.62.0-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.62.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.62.0-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  a82296609a6606764f074395454e7223a152c39f3506f481900fbeebd3de00b7  rust-1.62.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.62.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.62.0-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  abd61a8009369d40b646b7803cbd91f0dc1b62d09c9c48e8d5b0a2b3c570076e  rust-1.62.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.62.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.62.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  9aa91e10bbb6e31edb435d7f9da97e837f883ad6790d44b830db435b313e0598  rust-1.62.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.62.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.62.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  ffd184bcc19fce389d4d09805b6b2e5e4657055fc1e2c088cd0ccb9420a63e09  rust-1.62.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.62.0-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.62.0-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  b86406f051d95fc8b63a5699cf235313e4fcc4bb382aaf6fc9b8d4d19d5ccfd7  rust-1.62.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.62.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.62.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  29d0cb095bc006f82fb99bc4b9081aff813d803426ef01c9d1bd2b150e68d035  rust-1.62.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  dd5df8a92af3e5d49a1122b9561821ebd72a9317884a37ecddae041e652a7563  rust-std-1.62.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-aarch64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-aarch64-unknown-linux-musl.tar.xz.asc
+sha256  8098164090a4625f5d7caebce3475b50424689f5ca849cecfc341ce6b7f569e1  rust-std-1.62.0-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-arm-unknown-linux-gnueabi.tar.xz.asc
+sha256  e6a96d682b86b142ad2157c485db6d3cf0fb709766a7a42126c06b492b8f984f  rust-std-1.62.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-arm-unknown-linux-gnueabihf.tar.xz.asc
+sha256  dd41407aed1357a10eeaef7db87551e54d7b7249fd502c2e8bdefc506ec38773  rust-std-1.62.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-arm-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-arm-unknown-linux-musleabihf.tar.xz.asc
+sha256  5175ea9f4115e47868e458bcc11f0708ae0361e1d1555a763f3ee0d13ab137e1  rust-std-1.62.0-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-arm-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-arm-unknown-linux-musleabi.tar.xz.asc
+sha256  0dc65434e4cc42619d59064eaa996c098fe246b87e030a7f34baf4e5500ef374  rust-std-1.62.0-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
+sha256  74326d0823d0c1d06139ebe743926bf0afaf171bcd3c8be1c009164d0d3dc22f  rust-std-1.62.0-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-armv5te-unknown-linux-musleabi.tar.xz.asc
+sha256  ef0eec674a40192c4199d5a4d1a4c35d367941d01bb544eb2c0279d3be7c0b21  rust-std-1.62.0-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
+sha256  dadb345cf8b0bdf5bc6f4b34191230cae482e49c414e97096291ad34e7aee937  rust-std-1.62.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-armv7-unknown-linux-gnueabi.tar.xz.asc
+sha256  cbfecfaf88aa8b7ff83d7d26fc4be70e9faf33e58435559668bdaa49a6db749e  rust-std-1.62.0-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-armv7-unknown-linux-musleabihf.tar.xz.asc
+sha256  dda7e758957031394b2efc160ff95c4b67618ab92431db94f2235f8d3d676e60  rust-std-1.62.0-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-armv7-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-armv7-unknown-linux-musleabi.tar.xz.asc
+sha256  5ceb10f3b6a5cc4635b7bf9fcdd4ea52d473ef7a14a879c4e1d40a5478db434e  rust-std-1.62.0-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-i586-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-i586-unknown-linux-gnu.tar.xz.asc
+sha256  b02376bb781bb9e9e4baa36ab25f62a5bb0f39e11ab9fa3e07e716e1802c11db  rust-std-1.62.0-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-i586-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-i586-unknown-linux-musl.tar.xz.asc
+sha256  7b2289cd0a6eea72217db6fbdf3901aeff134c7df09273452f26e7234b01a4d8  rust-std-1.62.0-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256  e8bd12367b638db3146fd886e75957ba9f7ee9b15f81d32e7e2fa225d6e4678c  rust-std-1.62.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-i686-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-i686-unknown-linux-musl.tar.xz.asc
+sha256  c23526b15c1933651c1e9cb1c3ccaba3926084b8a579f3cf710e0204e4b8cdf2  rust-std-1.62.0-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-mips-unknown-linux-gnu.tar.xz.asc
+sha256  23cdca023a5786054a5c2c89f6cac446cad0de5f9fe24a448822880f7035fda9  rust-std-1.62.0-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-mips-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-mips-unknown-linux-musl.tar.xz.asc
+sha256  0da7f636d8cc3e18f3f57cb38f08213dfd26f2ef76c27b14b4b46dc301d55a81  rust-std-1.62.0-mips-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
+sha256  705b161f8f394274816e5ae0836cad511d40410254ef26c37316343061f52a5d  rust-std-1.62.0-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-mips64-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-mips64-unknown-linux-muslabi64.tar.xz.asc
+sha256  e7bc3eb22f5d2d51855a0fab9054d585705ce339bf99da49db8456d5c99c91b4  rust-std-1.62.0-mips64-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
+sha256  f191282613e91e574dfd82981b4262562ecad66fca4ec729a5f9d5769212a083  rust-std-1.62.0-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-mips64el-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-mips64el-unknown-linux-muslabi64.tar.xz.asc
+sha256  336a933f2b94ed335e87946b26338f8bc6cc490632f35cb7502303d8158f99ec  rust-std-1.62.0-mips64el-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  c2aa2024a0ac197f9dc1f26c773c451416e25dd0afae1a29a58f5aa88cc669ff  rust-std-1.62.0-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-mipsel-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-mipsel-unknown-linux-musl.tar.xz.asc
+sha256  7d469e5a0008e2711e63970dbc48019956da9cd6a5da64e205e7f8df92d2ea6f  rust-std-1.62.0-mipsel-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  0dfd8702568a2a698de0dac43f331a14f3f9d04d4377a9add6f51d416d4ca065  rust-std-1.62.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  f086527b059c86c157753e31f1fcdfb2a4ea27eb7d600789cf5f5c364aefab84  rust-std-1.62.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  d6678b7c971f3adbe7f820adae669d03a314468441e2907747c76eca98e0be92  rust-std-1.62.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  ed29711e2146de8b75f5988b46ee2fcf672b3a174e0b91b71d95e52b31df4acf  rust-std-1.62.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  4fb8a683db726012b443d5ce8737f758ca798aa0522f7acd0d78a5593bc5954f  rust-std-1.62.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-sparc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-sparc64-unknown-linux-gnu.tar.xz.asc
+sha256  8357490e7746b446eb53cd864d0322bfd4147578becbc8898daccd2155f7bd18  rust-std-1.62.0-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  addfae87b6b1b521d98a50fdc5120990888a51bb397100062e9c558267c67c77  rust-std-1.62.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.62.0-x86_64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-x86_64-unknown-linux-musl.tar.xz.asc
+sha256  1280847d3026276d0c511fb42d81bf8c39f01b87bb19bda4248386e35b86aed0  rust-std-1.62.0-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 7cfe5cd6df..6395143655 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_BIN_VERSION = 1.60.0
+RUST_BIN_VERSION = 1.62.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 81f366e564..fe065ff7d1 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,6 +1,6 @@
-# From https://static.rust-lang.org/dist/rustc-1.58.1-src.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rustc-1.58.1-src.tar.xz.asc
-sha256  a025876deccbcb3f288d8e02623ea321f94623f31305d3c5c6f17855bb9685db  rustc-1.60.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.62.0-src.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.62.0-src.tar.xz.asc
+sha256  6c00ef115c894c2645e60b5049a4f5dacf1dc0c993f3074f7ae4fdf4c755dd5e  rustc-1.62.0-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 445fde70a4..9d7335637c 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_VERSION = 1.60.0
+RUST_VERSION = 1.62.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
