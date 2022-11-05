Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B30FC4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 12:12:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCA35400A4;
	Mon,  5 Dec 2022 12:12:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCA35400A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pazOkZmAFcub; Mon,  5 Dec 2022 12:12:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C5DEB4051B;
	Mon,  5 Dec 2022 12:12:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5DEB4051B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 116D81BF352
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:27:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5A97D408C8
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 11:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5A97D408C8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3tKMuHTxlSO9 for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 11:26:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DCCAF405E0
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCCAF405E0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CC25585B9B; Mon,  5 Dec 2022 11:26:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 23:40:50 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f39db2c84cd0e3dc428d265f62db1f4edc54b3a8
X-Git-Newrev: 0954717eeeabac8c3273f78139c6f754ee04c9bf
X-Patchwork-Hint: ignore
Message-Id: <20221205112607.CC25585B9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{rust,
 rust-bin}: bump to version 1.65.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=0954717eeeabac8c3273f78139c6f754ee04c9bf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Link to Rust 1.65.0 annoucement: https://blog.rust-lang.org/2022/11/03/Rust-1.65.0.html

Newest version of the source archives have been retrieved with their hash values,
and the signature of the .asc files have been verified as follows:
$ curl -fsSL https://static.rust-lang.org/rust-key.gpg.ascii | gpg --import
$ gpg --verify <filename.asc> <filename>

There is no typographical error in the packages according to the check-pakage utility:
$ ./utils/check-package package/rust-bin/*
$ ./utils/check-package package/rust/*

The testsuite tool were successfully run for rust and rust-bin packages to test
the Rust toolchain under 1.65.0:
$ ./support/testing/run-tests -k -d dl/ -o testsuite tests.package.test_rust.TestRustBin
$ ./support/testing/run-tests -k -d dl/ -o testsuite tests.package.test_rust.TestRust

In order to verify the compatibility of packages depending on Rust 1.65.0,
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rust-bin/rust-bin.hash | 252 ++++++++++++++++++++---------------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   6 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 131 insertions(+), 131 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 595402f1b8..af9927a028 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,129 +1,129 @@
-# From https://static.rust-lang.org/dist/rust-1.64.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.64.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  9081928cced6fc650eaccb88f2ea154dc95c066957b234fa9c0cbe1770479f54  rust-1.64.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.64.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.64.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  b22e0efcdff9bcb27aef82148f26a5d3d67da618da3e6e8c9402fe7fcdd8ca69  rust-1.64.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.64.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.64.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256  e40f1a1ad1404e87511e86964e03636de9e45b68bc745f1814e6e0b1f8fb8523  rust-1.64.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.64.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.64.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  27926d9f16018c3e8ac57012cd7062f12783e5eca34dcc57da2b7bf1bea80d32  rust-1.64.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.64.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.64.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  2e046d4aad27d98e5d15a2c74272169995740981acb006aeb4109e1bdf5ff0d4  rust-1.64.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.64.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.64.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  9f0c8a041fe1351bc3d615a74a4c9d5b1cbe194903f2b9a77dc6b42ca374ead9  rust-1.64.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.64.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.64.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  913e8286a3bc709ee0916fabec31dd9b6703c40b065b1ac59fd2125011a7fb34  rust-1.64.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.64.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.64.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  822cfc0abb4a30f37bf53b6703acac69f56edb2700a62502caca5ae09ede4e10  rust-1.64.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.64.0-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.64.0-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  283e8fb39770a9dc939ba750c44a9c40cac799e77a0556354de448c166b792c0  rust-1.64.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.64.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.64.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  bd69e42f6cfe3ba96d781ad0b4095ddac4f0fc31c1af445018edf6f0aba543e4  rust-1.64.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  40abc9ec4f86ff0e37ba176e4c68dfa708e9857bb0372169c865367593127566  rust-std-1.64.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-aarch64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-aarch64-unknown-linux-musl.tar.xz.asc
-sha256  2438f7116711b2c65b60d59662ad333cc5f66868ec34498777ed764103f4d4a3  rust-std-1.64.0-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-arm-unknown-linux-gnueabi.tar.xz.asc
-sha256  9e7dc879ce647d0b5c7423dcfea1438d64ea2e0764895b5cb9b3258ab0ecf8dd  rust-std-1.64.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-arm-unknown-linux-gnueabihf.tar.xz.asc
-sha256  07fbe4ef51f33e7954e25c433522da224b10c6f7353f612713669a4fc58704e8  rust-std-1.64.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-arm-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-arm-unknown-linux-musleabihf.tar.xz.asc
-sha256  9955ac8be9828e0400c16a1c0388a769401dc8e732d099ffada156867cab08fb  rust-std-1.64.0-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-arm-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-arm-unknown-linux-musleabi.tar.xz.asc
-sha256  f0d24e63e2687af229ea1472650bf5dd5a50d7706062b47a73413e28101fccf1  rust-std-1.64.0-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
-sha256  af9b36ce5ad613112f83f085840e1f2c5f58ec7b72d8dbf9e833883105699a37  rust-std-1.64.0-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-armv5te-unknown-linux-musleabi.tar.xz.asc
-sha256  5246edd6be26f10d11a3100d3e74f460c2cfbdabb417e4cc8225ce2b82c485ce  rust-std-1.64.0-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
-sha256  ef1820f55b341ed1a78cadbd3564f9f8800f99bbfb7533821ef5f90ba2c21e87  rust-std-1.64.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-armv7-unknown-linux-gnueabi.tar.xz.asc
-sha256  eca7608caa6b8fb31467b4524292e86f854ebd06fcff29f58f5fc860b664c711  rust-std-1.64.0-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-armv7-unknown-linux-musleabihf.tar.xz.asc
-sha256  a31b9284ca3e864343fdad900fc877cc14e00de32dcde7326023372720cd4b09  rust-std-1.64.0-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-armv7-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-armv7-unknown-linux-musleabi.tar.xz.asc
-sha256  742fac589f1bc1a0ddd857e32b317e2b673c40adb8ef6dfc3516563ba9bc839f  rust-std-1.64.0-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-i586-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-i586-unknown-linux-gnu.tar.xz.asc
-sha256  791aafcfb41c342783bc3c8cdb57ac61453fc02eee185f15c275716f419556f3  rust-std-1.64.0-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-i586-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-i586-unknown-linux-musl.tar.xz.asc
-sha256  0cb3b0848cd31bd68ac82cd138c6345e5348f5af3dcc1f13275ee019a0895c59  rust-std-1.64.0-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  c80c57df63517d6171c061e6c095b794593172a3abefa9b4202992706bda12e5  rust-std-1.64.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-i686-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-i686-unknown-linux-musl.tar.xz.asc
-sha256  b193faf2e37951bf1ac6c3f2d4bd4fe84971a2f56f22e66323cccd142df54156  rust-std-1.64.0-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256  45baef38fbfadf21d4e603554c49d62525d1dff887e4ea7045b1fc88feb81663  rust-std-1.64.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-mips-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-mips-unknown-linux-musl.tar.xz.asc
-sha256  993b3e003feaa966466509ea9161106978ef7c874877461b4ca1a9936032b25b  rust-std-1.64.0-mips-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
-sha256  a2d2e2d274105054303adfd9ecb75ea2fba36a228ab23a669c609062f4db0035  rust-std-1.64.0-mips64-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-mips64-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-mips64-unknown-linux-muslabi64.tar.xz.asc
-sha256  83981de8b57719d714d59b55f3749d8c6ff10588d8d6c7d7ae371bfb668a7b5b  rust-std-1.64.0-mips64-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
-sha256  8ec026244400bac48d918230a0c99aa2c31ff33d6cc4d18552228509ca58c074  rust-std-1.64.0-mips64el-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-mips64el-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-mips64el-unknown-linux-muslabi64.tar.xz.asc
-sha256  97f40ad383014955448f7917abba7a547d1ddd205746641d3e9c3f730cbd129e  rust-std-1.64.0-mips64el-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  7dbcf969fc6717215796079437cf073a8ef7df95b77ded4654009c8379c91e0a  rust-std-1.64.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-mipsel-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-mipsel-unknown-linux-musl.tar.xz.asc
-sha256  288dd07746b0ece185753e784c7e97f2f01984e9302ef46a4ff71db665002637  rust-std-1.64.0-mipsel-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  6b29ebec4cd705760db634717cf6df68a9a377d52c25def30f5a2e2641a83279  rust-std-1.64.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  dc0352fdcf7f8b4fcb551d63001738ee120ea2a0fcc7d55db11f1f87eba90b3e  rust-std-1.64.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  ef697469b2a3ea8897f49b70e3be0c7aaca3f26fd3234812113e2e85cafac738  rust-std-1.64.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  284b09a96d4cdbb96827914a318f9c41e2b207c0afeae76b9f0e3830d2ef2d4d  rust-std-1.64.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  939db2384f543325cc8a2423ab53e28623b9e9762dacea1e2010cf894d3e6ab1  rust-std-1.64.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-sparc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-sparc64-unknown-linux-gnu.tar.xz.asc
-sha256  3551f014fe1839e68e7b06eeb1b3f67869bef9c4849da9c9c01a7b8c3e32ebf2  rust-std-1.64.0-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  6ace34bcbba9557aa2fc3a0515c3da4a83ca24d7d45506c5e1b32f589fa38a8b  rust-std-1.64.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.64.0-x86_64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-x86_64-unknown-linux-musl.tar.xz.asc
-sha256  29af13a882abbe797fadd43afcb75bce2e2304438db9e21a3e64a2e9100501fb  rust-std-1.64.0-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.65.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.65.0-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  b3a83a9585b8c4ede4eab2a11b3f96895f676d8b46c9642140c4fefd5c309ed1  rust-1.65.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.65.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.65.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256  50595b96f98e0940bbfe00209d6c233e9158e140ecd6088ad3bd53f89b123e9d  rust-1.65.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.65.0-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.65.0-mips-unknown-linux-gnu.tar.xz.asc
+sha256  afa3af620b3a0bf8a1da33413eace1db681db5f99b2572ac016027b3d71a50b7  rust-1.65.0-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.65.0-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.65.0-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  c6b48026fb131a404bcdc7a691246c3de716e32805d58d1571e253b9a5b047b5  rust-1.65.0-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.65.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.65.0-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  5601b31290790a7077c342c8731bb1d5de1a89639476e14bc7840aeaa3ab6010  rust-1.65.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.65.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.65.0-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  8cf900ac125d6bebc97ebb777761923b2062e4fc36692c1f2d68faa0e70949b2  rust-1.65.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.65.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.65.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  e0654c20446aa5c66def122617f3ca4be9e9b86e75040327e3d35973b6b88980  rust-1.65.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.65.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.65.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  f02e1bac01415e101fac58608b070b0f37c7df1a142c8001ddbc489cfb85c232  rust-1.65.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.65.0-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.65.0-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  e7dc9bb42c0e738f68f8ad4b05cf4b7bef8fa490c379e5730c7e282507b305ee  rust-1.65.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.65.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.65.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  9455cab767f7b9f46259aac8d953f15f11b3d65513384e2b0a5e77d0432ae82f  rust-1.65.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  735b681c8a6e60925c76d6cc899e78b4cb4562ada24a1f265b2021c1faad78ad  rust-std-1.65.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-aarch64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-aarch64-unknown-linux-musl.tar.xz.asc
+sha256  9ea488da40c347826cce7e238847c745ee566254bb1d077412673f8243fb1cd2  rust-std-1.65.0-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-arm-unknown-linux-gnueabi.tar.xz.asc
+sha256  c8793e77ef43336bc372a7a5b4720d5449e92577c7875471c2bc40ddbfde4811  rust-std-1.65.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-arm-unknown-linux-gnueabihf.tar.xz.asc
+sha256  f7d5eb17dbe46ee9d3c4f9fcffc07b8e3311c747545402c8d3b5c43043f27288  rust-std-1.65.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-arm-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-arm-unknown-linux-musleabihf.tar.xz.asc
+sha256  32d7f301196d73027fb9a5ae595dbadacdc234307c36b4a175a132e75318e38c  rust-std-1.65.0-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-arm-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-arm-unknown-linux-musleabi.tar.xz.asc
+sha256  453a1443e4753611dc4e6969e50ad8d7984a31d1a457729a860599ed19b1de7a  rust-std-1.65.0-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
+sha256  d079e841be640b4ce26aa821f29bc813243a7c0af7b8aca8ca4acf5c2e5b722f  rust-std-1.65.0-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-armv5te-unknown-linux-musleabi.tar.xz.asc
+sha256  1d11ab1d60070ae30ff87b55dca077f4d532d814a9ab7bc77055b5b429a78c6e  rust-std-1.65.0-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
+sha256  fec73401941bffce3b6913d31955f1291119dea119c0051d94f271ae7c959d4c  rust-std-1.65.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-armv7-unknown-linux-gnueabi.tar.xz.asc
+sha256  c14268337c69650a2618909d8e691489385d748374d73ab8d6a2f9d6b030d70d  rust-std-1.65.0-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-armv7-unknown-linux-musleabihf.tar.xz.asc
+sha256  9368527053c4bab0fd320209b45f0278d0a1e54a37006a56a6e565404ab73fef  rust-std-1.65.0-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-armv7-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-armv7-unknown-linux-musleabi.tar.xz.asc
+sha256  0b5bc219333e3e983fb1e7e86a0c268c4a52ccbd6326a16785be9d9017d97e9f  rust-std-1.65.0-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-i586-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-i586-unknown-linux-gnu.tar.xz.asc
+sha256  533eda439eb5ffec258b8219445742d6d60570040b3ff167291e3d0d985b9d70  rust-std-1.65.0-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-i586-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-i586-unknown-linux-musl.tar.xz.asc
+sha256  7f5d9ae65827aef1a51676927a4c9533f942021d2fd45fd93b23dfaa738ee205  rust-std-1.65.0-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256  99bd62d593a6ab3205cab7f06b5793a075b9d05d868e927a6948e46269d61e82  rust-std-1.65.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-i686-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-i686-unknown-linux-musl.tar.xz.asc
+sha256  644a4c57c1392f776c5ebb13f9832778b69464391b3766e6bbd18c3aa11787a6  rust-std-1.65.0-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-mips-unknown-linux-gnu.tar.xz.asc
+sha256  50c65a8effc85aa89242ba0a2a2c89bfcc4d0a39dcb42396d10b0036b9a4e90c  rust-std-1.65.0-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-mips-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-mips-unknown-linux-musl.tar.xz.asc
+sha256  3bc5043f4eb7bb6418708792ee8e777197e562d03843a9adf62ce245ba07289a  rust-std-1.65.0-mips-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
+sha256  338c702b79dac33e32dde097084dd38852487d2976c5eb66b44ba8fc8319342b  rust-std-1.65.0-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-mips64-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-mips64-unknown-linux-muslabi64.tar.xz.asc
+sha256  9450745a5e678c9b7e65ecc7d6a016f92d8d22d8091c4a77431b1e58b99a435f  rust-std-1.65.0-mips64-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
+sha256  a0a0e60a0e850140194250fbbfb962c322d4f474f4ec22d03b7f537034257c09  rust-std-1.65.0-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-mips64el-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-mips64el-unknown-linux-muslabi64.tar.xz.asc
+sha256  0862706d22dcfee39b0d2df874dd6065d8c3020c0b8974f6e7b694edd42413ae  rust-std-1.65.0-mips64el-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  79e078420f7c45fd1cf38b70620ced50d35ddb1621736b65be987c20481fe5bc  rust-std-1.65.0-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-mipsel-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-mipsel-unknown-linux-musl.tar.xz.asc
+sha256  482e9245873338a08f47ea2c29683134b8813deb3e3eafb78b786d34bbecce51  rust-std-1.65.0-mipsel-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  672b9ea8018dcdf7d5f79f5298bacc34e7600a082727b4f1a20c14251752aaa2  rust-std-1.65.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  8a26e08908156ae5a05c64c2732435ef4efb994a2ac6d0b2e9c93c0dae19d089  rust-std-1.65.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  ce18b44300f7d5d94856cef5b270ba010061fafa411beb9782207e26cbab88a6  rust-std-1.65.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  fa99f123ce14f1cda245857b50fd4709adee960e7d36ce663b87c13aee18b64b  rust-std-1.65.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  a3f6740be345364f4599ae837d2401e0f31e5d33a4f958852d12a384ee581a83  rust-std-1.65.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-sparc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-sparc64-unknown-linux-gnu.tar.xz.asc
+sha256  fc2a8816665f464d3085dcd379c44b9de0ee1f1084fae0a4c32c57754b27992b  rust-std-1.65.0-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  2b588cd2d49688c0c33b7466614123e8fe4c910f4d802fc0ff0662b1772816a9  rust-std-1.65.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.65.0-x86_64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-x86_64-unknown-linux-musl.tar.xz.asc
+sha256  55abeb1b55aeebc46a4af2f304271361397df58d12f7eb23fb262bc3132c6056  rust-std-1.65.0-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index a356acd3dc..91ee5a5372 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.64.0
+RUST_BIN_VERSION = 1.65.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index fbef37683a..9776f3f84c 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,6 +1,6 @@
-# From https://static.rust-lang.org/dist/rustc-1.64.0-src.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rustc-1.64.0-src.tar.xz.asc
-sha256  e8170d318fac9d2fc17d5c3e648e7068f56e8db8d233d864aeffbef7c6542eac  rustc-1.64.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.65.0-src.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.65.0-src.tar.xz.asc
+sha256  2d6aa2ea3fedd55acbbd65f78349385f9daa9c14e25db7a8df5d015588eee1cf  rustc-1.65.0-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 4b5e5fac48..d501391d77 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.64.0
+RUST_VERSION = 1.65.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
