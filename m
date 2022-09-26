Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 451F1C07E9D
	for <buildroot@archiver.kernel.org>; Mon, 26 Sep 2022 12:04:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0009E40C40;
	Mon, 26 Sep 2022 12:04:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0009E40C40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NmRfpoHcNe_t; Mon, 26 Sep 2022 12:04:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 94C6740C4A;
	Mon, 26 Sep 2022 12:04:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 94C6740C4A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38DCC1BF3F7
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:04:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19A3F81902
 for <buildroot@lists.busybox.net>; Mon, 26 Sep 2022 12:04:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19A3F81902
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bJ6Op6AvNP_U for <buildroot@lists.busybox.net>;
 Mon, 26 Sep 2022 12:04:09 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D2C2D827CA
 for <buildroot@buildroot.org>; Mon, 26 Sep 2022 12:04:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D2C2D827CA
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2D14860A5; Mon, 26 Sep 2022 12:04:09 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 26 Sep 2022 14:03:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7ccb318d80f0d09e22f944ac9fc618f9abedbe43
X-Git-Newrev: 7ad5e5720459fda76d4035fe624d761db0a98f1b
X-Patchwork-Hint: ignore
Message-Id: <20220926120409.C2D14860A5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{rust,
 rust-bin}: bump to version 1.64.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ad5e5720459fda76d4035fe624d761db0a98f1b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Link to Rust 1.64.0 annoucement: https://blog.rust-lang.org/2022/09/22/Rust-1.64.0.html

Newest version of the source archives have been retrieved with their hash values,
and the signature of the .asc files have been verified as follows:
$ curl -fsSL https://static.rust-lang.org/rust-key.gpg.ascii | gpg --import
$ gpg --verify <filename.asc> <filename>

There is no typographical error in the packages according to the check-pakage utility:
$ ./utils/check-package package/rust-bin/*
$ ./utils/check-package package/rust/*

The testsuite tool were successfully run for rust and rust-bin packages to test
the Rust toolchain under 1.64.0:
$ ./support/testing/run-tests -k -d dl/ -o testsuite tests.package.test_rust.TestRustBin
$ ./support/testing/run-tests -k -d dl/ -o testsuite tests.package.test_rust.TestRust

In order to verify the compatibility of packages depending on Rust 1.64.0,
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
index 57ff4ee1a8..595402f1b8 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,129 +1,129 @@
-# From https://static.rust-lang.org/dist/rust-1.62.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.62.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  596edf892fac02f3a3b9a8f018f64551e2d58f0a840a8bad13793eb7224783bd  rust-1.62.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.62.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.62.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  8851657b282e0b76056b4179c5f2c77f0624da9e031a4dab1abb33be7c251238  rust-1.62.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.62.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.62.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256  3d1baf0f8aa8615dff16870b86db1d52df5875005c08626aec81cb98b0de5ce6  rust-1.62.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.62.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.62.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  e053f1ff5e60c5c4c7db5e507a79b53230b8c78e71dcd47cffa5bc4ad946244a  rust-1.62.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.62.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.62.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  a82296609a6606764f074395454e7223a152c39f3506f481900fbeebd3de00b7  rust-1.62.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.62.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.62.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  abd61a8009369d40b646b7803cbd91f0dc1b62d09c9c48e8d5b0a2b3c570076e  rust-1.62.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.62.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.62.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  9aa91e10bbb6e31edb435d7f9da97e837f883ad6790d44b830db435b313e0598  rust-1.62.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.62.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.62.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  ffd184bcc19fce389d4d09805b6b2e5e4657055fc1e2c088cd0ccb9420a63e09  rust-1.62.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.62.0-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.62.0-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  b86406f051d95fc8b63a5699cf235313e4fcc4bb382aaf6fc9b8d4d19d5ccfd7  rust-1.62.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.62.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.62.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  29d0cb095bc006f82fb99bc4b9081aff813d803426ef01c9d1bd2b150e68d035  rust-1.62.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  dd5df8a92af3e5d49a1122b9561821ebd72a9317884a37ecddae041e652a7563  rust-std-1.62.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-aarch64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-aarch64-unknown-linux-musl.tar.xz.asc
-sha256  8098164090a4625f5d7caebce3475b50424689f5ca849cecfc341ce6b7f569e1  rust-std-1.62.0-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-arm-unknown-linux-gnueabi.tar.xz.asc
-sha256  e6a96d682b86b142ad2157c485db6d3cf0fb709766a7a42126c06b492b8f984f  rust-std-1.62.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-arm-unknown-linux-gnueabihf.tar.xz.asc
-sha256  dd41407aed1357a10eeaef7db87551e54d7b7249fd502c2e8bdefc506ec38773  rust-std-1.62.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-arm-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-arm-unknown-linux-musleabihf.tar.xz.asc
-sha256  5175ea9f4115e47868e458bcc11f0708ae0361e1d1555a763f3ee0d13ab137e1  rust-std-1.62.0-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-arm-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-arm-unknown-linux-musleabi.tar.xz.asc
-sha256  0dc65434e4cc42619d59064eaa996c098fe246b87e030a7f34baf4e5500ef374  rust-std-1.62.0-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
-sha256  74326d0823d0c1d06139ebe743926bf0afaf171bcd3c8be1c009164d0d3dc22f  rust-std-1.62.0-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-armv5te-unknown-linux-musleabi.tar.xz.asc
-sha256  ef0eec674a40192c4199d5a4d1a4c35d367941d01bb544eb2c0279d3be7c0b21  rust-std-1.62.0-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
-sha256  dadb345cf8b0bdf5bc6f4b34191230cae482e49c414e97096291ad34e7aee937  rust-std-1.62.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-armv7-unknown-linux-gnueabi.tar.xz.asc
-sha256  cbfecfaf88aa8b7ff83d7d26fc4be70e9faf33e58435559668bdaa49a6db749e  rust-std-1.62.0-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-armv7-unknown-linux-musleabihf.tar.xz.asc
-sha256  dda7e758957031394b2efc160ff95c4b67618ab92431db94f2235f8d3d676e60  rust-std-1.62.0-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-armv7-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-armv7-unknown-linux-musleabi.tar.xz.asc
-sha256  5ceb10f3b6a5cc4635b7bf9fcdd4ea52d473ef7a14a879c4e1d40a5478db434e  rust-std-1.62.0-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-i586-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-i586-unknown-linux-gnu.tar.xz.asc
-sha256  b02376bb781bb9e9e4baa36ab25f62a5bb0f39e11ab9fa3e07e716e1802c11db  rust-std-1.62.0-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-i586-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-i586-unknown-linux-musl.tar.xz.asc
-sha256  7b2289cd0a6eea72217db6fbdf3901aeff134c7df09273452f26e7234b01a4d8  rust-std-1.62.0-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  e8bd12367b638db3146fd886e75957ba9f7ee9b15f81d32e7e2fa225d6e4678c  rust-std-1.62.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-i686-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-i686-unknown-linux-musl.tar.xz.asc
-sha256  c23526b15c1933651c1e9cb1c3ccaba3926084b8a579f3cf710e0204e4b8cdf2  rust-std-1.62.0-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256  23cdca023a5786054a5c2c89f6cac446cad0de5f9fe24a448822880f7035fda9  rust-std-1.62.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-mips-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-mips-unknown-linux-musl.tar.xz.asc
-sha256  0da7f636d8cc3e18f3f57cb38f08213dfd26f2ef76c27b14b4b46dc301d55a81  rust-std-1.62.0-mips-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
-sha256  705b161f8f394274816e5ae0836cad511d40410254ef26c37316343061f52a5d  rust-std-1.62.0-mips64-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-mips64-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-mips64-unknown-linux-muslabi64.tar.xz.asc
-sha256  e7bc3eb22f5d2d51855a0fab9054d585705ce339bf99da49db8456d5c99c91b4  rust-std-1.62.0-mips64-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
-sha256  f191282613e91e574dfd82981b4262562ecad66fca4ec729a5f9d5769212a083  rust-std-1.62.0-mips64el-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-mips64el-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-mips64el-unknown-linux-muslabi64.tar.xz.asc
-sha256  336a933f2b94ed335e87946b26338f8bc6cc490632f35cb7502303d8158f99ec  rust-std-1.62.0-mips64el-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  c2aa2024a0ac197f9dc1f26c773c451416e25dd0afae1a29a58f5aa88cc669ff  rust-std-1.62.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-mipsel-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-mipsel-unknown-linux-musl.tar.xz.asc
-sha256  7d469e5a0008e2711e63970dbc48019956da9cd6a5da64e205e7f8df92d2ea6f  rust-std-1.62.0-mipsel-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  0dfd8702568a2a698de0dac43f331a14f3f9d04d4377a9add6f51d416d4ca065  rust-std-1.62.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  f086527b059c86c157753e31f1fcdfb2a4ea27eb7d600789cf5f5c364aefab84  rust-std-1.62.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  d6678b7c971f3adbe7f820adae669d03a314468441e2907747c76eca98e0be92  rust-std-1.62.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  ed29711e2146de8b75f5988b46ee2fcf672b3a174e0b91b71d95e52b31df4acf  rust-std-1.62.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  4fb8a683db726012b443d5ce8737f758ca798aa0522f7acd0d78a5593bc5954f  rust-std-1.62.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-sparc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-sparc64-unknown-linux-gnu.tar.xz.asc
-sha256  8357490e7746b446eb53cd864d0322bfd4147578becbc8898daccd2155f7bd18  rust-std-1.62.0-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  addfae87b6b1b521d98a50fdc5120990888a51bb397100062e9c558267c67c77  rust-std-1.62.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.62.0-x86_64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.62.0-x86_64-unknown-linux-musl.tar.xz.asc
-sha256  1280847d3026276d0c511fb42d81bf8c39f01b87bb19bda4248386e35b86aed0  rust-std-1.62.0-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.64.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.64.0-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  9081928cced6fc650eaccb88f2ea154dc95c066957b234fa9c0cbe1770479f54  rust-1.64.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.64.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.64.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256  b22e0efcdff9bcb27aef82148f26a5d3d67da618da3e6e8c9402fe7fcdd8ca69  rust-1.64.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.64.0-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.64.0-mips-unknown-linux-gnu.tar.xz.asc
+sha256  e40f1a1ad1404e87511e86964e03636de9e45b68bc745f1814e6e0b1f8fb8523  rust-1.64.0-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.64.0-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.64.0-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  27926d9f16018c3e8ac57012cd7062f12783e5eca34dcc57da2b7bf1bea80d32  rust-1.64.0-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.64.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.64.0-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  2e046d4aad27d98e5d15a2c74272169995740981acb006aeb4109e1bdf5ff0d4  rust-1.64.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.64.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.64.0-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  9f0c8a041fe1351bc3d615a74a4c9d5b1cbe194903f2b9a77dc6b42ca374ead9  rust-1.64.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.64.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.64.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  913e8286a3bc709ee0916fabec31dd9b6703c40b065b1ac59fd2125011a7fb34  rust-1.64.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.64.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.64.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  822cfc0abb4a30f37bf53b6703acac69f56edb2700a62502caca5ae09ede4e10  rust-1.64.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.64.0-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.64.0-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  283e8fb39770a9dc939ba750c44a9c40cac799e77a0556354de448c166b792c0  rust-1.64.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.64.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.64.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  bd69e42f6cfe3ba96d781ad0b4095ddac4f0fc31c1af445018edf6f0aba543e4  rust-1.64.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  40abc9ec4f86ff0e37ba176e4c68dfa708e9857bb0372169c865367593127566  rust-std-1.64.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-aarch64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-aarch64-unknown-linux-musl.tar.xz.asc
+sha256  2438f7116711b2c65b60d59662ad333cc5f66868ec34498777ed764103f4d4a3  rust-std-1.64.0-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-arm-unknown-linux-gnueabi.tar.xz.asc
+sha256  9e7dc879ce647d0b5c7423dcfea1438d64ea2e0764895b5cb9b3258ab0ecf8dd  rust-std-1.64.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-arm-unknown-linux-gnueabihf.tar.xz.asc
+sha256  07fbe4ef51f33e7954e25c433522da224b10c6f7353f612713669a4fc58704e8  rust-std-1.64.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-arm-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-arm-unknown-linux-musleabihf.tar.xz.asc
+sha256  9955ac8be9828e0400c16a1c0388a769401dc8e732d099ffada156867cab08fb  rust-std-1.64.0-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-arm-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-arm-unknown-linux-musleabi.tar.xz.asc
+sha256  f0d24e63e2687af229ea1472650bf5dd5a50d7706062b47a73413e28101fccf1  rust-std-1.64.0-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
+sha256  af9b36ce5ad613112f83f085840e1f2c5f58ec7b72d8dbf9e833883105699a37  rust-std-1.64.0-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-armv5te-unknown-linux-musleabi.tar.xz.asc
+sha256  5246edd6be26f10d11a3100d3e74f460c2cfbdabb417e4cc8225ce2b82c485ce  rust-std-1.64.0-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
+sha256  ef1820f55b341ed1a78cadbd3564f9f8800f99bbfb7533821ef5f90ba2c21e87  rust-std-1.64.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-armv7-unknown-linux-gnueabi.tar.xz.asc
+sha256  eca7608caa6b8fb31467b4524292e86f854ebd06fcff29f58f5fc860b664c711  rust-std-1.64.0-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-armv7-unknown-linux-musleabihf.tar.xz.asc
+sha256  a31b9284ca3e864343fdad900fc877cc14e00de32dcde7326023372720cd4b09  rust-std-1.64.0-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-armv7-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-armv7-unknown-linux-musleabi.tar.xz.asc
+sha256  742fac589f1bc1a0ddd857e32b317e2b673c40adb8ef6dfc3516563ba9bc839f  rust-std-1.64.0-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-i586-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-i586-unknown-linux-gnu.tar.xz.asc
+sha256  791aafcfb41c342783bc3c8cdb57ac61453fc02eee185f15c275716f419556f3  rust-std-1.64.0-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-i586-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-i586-unknown-linux-musl.tar.xz.asc
+sha256  0cb3b0848cd31bd68ac82cd138c6345e5348f5af3dcc1f13275ee019a0895c59  rust-std-1.64.0-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256  c80c57df63517d6171c061e6c095b794593172a3abefa9b4202992706bda12e5  rust-std-1.64.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-i686-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-i686-unknown-linux-musl.tar.xz.asc
+sha256  b193faf2e37951bf1ac6c3f2d4bd4fe84971a2f56f22e66323cccd142df54156  rust-std-1.64.0-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-mips-unknown-linux-gnu.tar.xz.asc
+sha256  45baef38fbfadf21d4e603554c49d62525d1dff887e4ea7045b1fc88feb81663  rust-std-1.64.0-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-mips-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-mips-unknown-linux-musl.tar.xz.asc
+sha256  993b3e003feaa966466509ea9161106978ef7c874877461b4ca1a9936032b25b  rust-std-1.64.0-mips-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
+sha256  a2d2e2d274105054303adfd9ecb75ea2fba36a228ab23a669c609062f4db0035  rust-std-1.64.0-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-mips64-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-mips64-unknown-linux-muslabi64.tar.xz.asc
+sha256  83981de8b57719d714d59b55f3749d8c6ff10588d8d6c7d7ae371bfb668a7b5b  rust-std-1.64.0-mips64-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
+sha256  8ec026244400bac48d918230a0c99aa2c31ff33d6cc4d18552228509ca58c074  rust-std-1.64.0-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-mips64el-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-mips64el-unknown-linux-muslabi64.tar.xz.asc
+sha256  97f40ad383014955448f7917abba7a547d1ddd205746641d3e9c3f730cbd129e  rust-std-1.64.0-mips64el-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  7dbcf969fc6717215796079437cf073a8ef7df95b77ded4654009c8379c91e0a  rust-std-1.64.0-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-mipsel-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-mipsel-unknown-linux-musl.tar.xz.asc
+sha256  288dd07746b0ece185753e784c7e97f2f01984e9302ef46a4ff71db665002637  rust-std-1.64.0-mipsel-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  6b29ebec4cd705760db634717cf6df68a9a377d52c25def30f5a2e2641a83279  rust-std-1.64.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  dc0352fdcf7f8b4fcb551d63001738ee120ea2a0fcc7d55db11f1f87eba90b3e  rust-std-1.64.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  ef697469b2a3ea8897f49b70e3be0c7aaca3f26fd3234812113e2e85cafac738  rust-std-1.64.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  284b09a96d4cdbb96827914a318f9c41e2b207c0afeae76b9f0e3830d2ef2d4d  rust-std-1.64.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  939db2384f543325cc8a2423ab53e28623b9e9762dacea1e2010cf894d3e6ab1  rust-std-1.64.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-sparc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-sparc64-unknown-linux-gnu.tar.xz.asc
+sha256  3551f014fe1839e68e7b06eeb1b3f67869bef9c4849da9c9c01a7b8c3e32ebf2  rust-std-1.64.0-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  6ace34bcbba9557aa2fc3a0515c3da4a83ca24d7d45506c5e1b32f589fa38a8b  rust-std-1.64.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.64.0-x86_64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.64.0-x86_64-unknown-linux-musl.tar.xz.asc
+sha256  29af13a882abbe797fadd43afcb75bce2e2304438db9e21a3e64a2e9100501fb  rust-std-1.64.0-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 6395143655..6560151d99 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_BIN_VERSION = 1.62.0
+RUST_BIN_VERSION = 1.64.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index fe065ff7d1..fbef37683a 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,6 +1,6 @@
-# From https://static.rust-lang.org/dist/rustc-1.62.0-src.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rustc-1.62.0-src.tar.xz.asc
-sha256  6c00ef115c894c2645e60b5049a4f5dacf1dc0c993f3074f7ae4fdf4c755dd5e  rustc-1.62.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.64.0-src.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.64.0-src.tar.xz.asc
+sha256  e8170d318fac9d2fc17d5c3e648e7068f56e8db8d233d864aeffbef7c6542eac  rustc-1.64.0-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 9d7335637c..411dda21c4 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_VERSION = 1.62.0
+RUST_VERSION = 1.64.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
