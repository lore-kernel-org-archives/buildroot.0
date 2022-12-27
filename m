Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83D9C46467
	for <buildroot@archiver.kernel.org>; Tue, 27 Dec 2022 20:49:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C7F780B1B;
	Tue, 27 Dec 2022 20:49:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7C7F780B1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dP1hReiwwd-r; Tue, 27 Dec 2022 20:49:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C221B80B39;
	Tue, 27 Dec 2022 20:49:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C221B80B39
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C6F41BF37A
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:49:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EAC4140891
 for <buildroot@lists.busybox.net>; Tue, 27 Dec 2022 20:49:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAC4140891
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GF3x6eS_UtOH for <buildroot@lists.busybox.net>;
 Tue, 27 Dec 2022 20:49:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9E624408AC
 for <buildroot@buildroot.org>; Tue, 27 Dec 2022 20:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E624408AC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8BBA086EB7; Tue, 27 Dec 2022 20:49:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Dec 2022 21:49:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a41f246439c0387f7b028b3f7e40978a2e0f1a50
X-Git-Newrev: de4cf253752d2225b7d258cbaee0ddebf64901fa
X-Patchwork-Hint: ignore
Message-Id: <20221227204914.8BBA086EB7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{rust,
 rust-bin}: bump to version 1.66.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=de4cf253752d2225b7d258cbaee0ddebf64901fa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Link to Rust 1.66.0 annoucement: https://blog.rust-lang.org/2022/12/15/Rust-1.66.0.html

Newest version of the source archives have been retrieved with their hash values,
and the signature of the .asc files have been verified as follows:
$ curl -fsSL https://static.rust-lang.org/rust-key.gpg.ascii | gpg --import
$ gpg --verify <filename.asc> <filename>

There is no typographical error in the packages according to the check-pakage utility:
$ ./utils/check-package package/rust-bin/*
$ ./utils/check-package package/rust/*

The testsuite tool were successfully run for rust and rust-bin packages to test
the Rust toolchain under 1.66.0:
$ ./support/testing/run-tests -k -d dl/ -o testsuite tests.package.test_rust.TestRustBin
$ ./support/testing/run-tests -k -d dl/ -o testsuite tests.package.test_rust.TestRust

In order to verify the compatibility of packages depending on Rust 1.66.0,
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
index af9927a028..7cc1052dd9 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,129 +1,129 @@
-# From https://static.rust-lang.org/dist/rust-1.65.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.65.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  b3a83a9585b8c4ede4eab2a11b3f96895f676d8b46c9642140c4fefd5c309ed1  rust-1.65.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.65.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.65.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  50595b96f98e0940bbfe00209d6c233e9158e140ecd6088ad3bd53f89b123e9d  rust-1.65.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.65.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.65.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256  afa3af620b3a0bf8a1da33413eace1db681db5f99b2572ac016027b3d71a50b7  rust-1.65.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.65.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.65.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  c6b48026fb131a404bcdc7a691246c3de716e32805d58d1571e253b9a5b047b5  rust-1.65.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.65.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.65.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  5601b31290790a7077c342c8731bb1d5de1a89639476e14bc7840aeaa3ab6010  rust-1.65.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.65.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.65.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  8cf900ac125d6bebc97ebb777761923b2062e4fc36692c1f2d68faa0e70949b2  rust-1.65.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.65.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.65.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  e0654c20446aa5c66def122617f3ca4be9e9b86e75040327e3d35973b6b88980  rust-1.65.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.65.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.65.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  f02e1bac01415e101fac58608b070b0f37c7df1a142c8001ddbc489cfb85c232  rust-1.65.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.65.0-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.65.0-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  e7dc9bb42c0e738f68f8ad4b05cf4b7bef8fa490c379e5730c7e282507b305ee  rust-1.65.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.65.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.65.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  9455cab767f7b9f46259aac8d953f15f11b3d65513384e2b0a5e77d0432ae82f  rust-1.65.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  735b681c8a6e60925c76d6cc899e78b4cb4562ada24a1f265b2021c1faad78ad  rust-std-1.65.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-aarch64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-aarch64-unknown-linux-musl.tar.xz.asc
-sha256  9ea488da40c347826cce7e238847c745ee566254bb1d077412673f8243fb1cd2  rust-std-1.65.0-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-arm-unknown-linux-gnueabi.tar.xz.asc
-sha256  c8793e77ef43336bc372a7a5b4720d5449e92577c7875471c2bc40ddbfde4811  rust-std-1.65.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-arm-unknown-linux-gnueabihf.tar.xz.asc
-sha256  f7d5eb17dbe46ee9d3c4f9fcffc07b8e3311c747545402c8d3b5c43043f27288  rust-std-1.65.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-arm-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-arm-unknown-linux-musleabihf.tar.xz.asc
-sha256  32d7f301196d73027fb9a5ae595dbadacdc234307c36b4a175a132e75318e38c  rust-std-1.65.0-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-arm-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-arm-unknown-linux-musleabi.tar.xz.asc
-sha256  453a1443e4753611dc4e6969e50ad8d7984a31d1a457729a860599ed19b1de7a  rust-std-1.65.0-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
-sha256  d079e841be640b4ce26aa821f29bc813243a7c0af7b8aca8ca4acf5c2e5b722f  rust-std-1.65.0-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-armv5te-unknown-linux-musleabi.tar.xz.asc
-sha256  1d11ab1d60070ae30ff87b55dca077f4d532d814a9ab7bc77055b5b429a78c6e  rust-std-1.65.0-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
-sha256  fec73401941bffce3b6913d31955f1291119dea119c0051d94f271ae7c959d4c  rust-std-1.65.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-armv7-unknown-linux-gnueabi.tar.xz.asc
-sha256  c14268337c69650a2618909d8e691489385d748374d73ab8d6a2f9d6b030d70d  rust-std-1.65.0-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-armv7-unknown-linux-musleabihf.tar.xz.asc
-sha256  9368527053c4bab0fd320209b45f0278d0a1e54a37006a56a6e565404ab73fef  rust-std-1.65.0-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-armv7-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-armv7-unknown-linux-musleabi.tar.xz.asc
-sha256  0b5bc219333e3e983fb1e7e86a0c268c4a52ccbd6326a16785be9d9017d97e9f  rust-std-1.65.0-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-i586-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-i586-unknown-linux-gnu.tar.xz.asc
-sha256  533eda439eb5ffec258b8219445742d6d60570040b3ff167291e3d0d985b9d70  rust-std-1.65.0-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-i586-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-i586-unknown-linux-musl.tar.xz.asc
-sha256  7f5d9ae65827aef1a51676927a4c9533f942021d2fd45fd93b23dfaa738ee205  rust-std-1.65.0-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  99bd62d593a6ab3205cab7f06b5793a075b9d05d868e927a6948e46269d61e82  rust-std-1.65.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-i686-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-i686-unknown-linux-musl.tar.xz.asc
-sha256  644a4c57c1392f776c5ebb13f9832778b69464391b3766e6bbd18c3aa11787a6  rust-std-1.65.0-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256  50c65a8effc85aa89242ba0a2a2c89bfcc4d0a39dcb42396d10b0036b9a4e90c  rust-std-1.65.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-mips-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-mips-unknown-linux-musl.tar.xz.asc
-sha256  3bc5043f4eb7bb6418708792ee8e777197e562d03843a9adf62ce245ba07289a  rust-std-1.65.0-mips-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
-sha256  338c702b79dac33e32dde097084dd38852487d2976c5eb66b44ba8fc8319342b  rust-std-1.65.0-mips64-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-mips64-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-mips64-unknown-linux-muslabi64.tar.xz.asc
-sha256  9450745a5e678c9b7e65ecc7d6a016f92d8d22d8091c4a77431b1e58b99a435f  rust-std-1.65.0-mips64-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
-sha256  a0a0e60a0e850140194250fbbfb962c322d4f474f4ec22d03b7f537034257c09  rust-std-1.65.0-mips64el-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-mips64el-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-mips64el-unknown-linux-muslabi64.tar.xz.asc
-sha256  0862706d22dcfee39b0d2df874dd6065d8c3020c0b8974f6e7b694edd42413ae  rust-std-1.65.0-mips64el-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  79e078420f7c45fd1cf38b70620ced50d35ddb1621736b65be987c20481fe5bc  rust-std-1.65.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-mipsel-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-mipsel-unknown-linux-musl.tar.xz.asc
-sha256  482e9245873338a08f47ea2c29683134b8813deb3e3eafb78b786d34bbecce51  rust-std-1.65.0-mipsel-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  672b9ea8018dcdf7d5f79f5298bacc34e7600a082727b4f1a20c14251752aaa2  rust-std-1.65.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  8a26e08908156ae5a05c64c2732435ef4efb994a2ac6d0b2e9c93c0dae19d089  rust-std-1.65.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  ce18b44300f7d5d94856cef5b270ba010061fafa411beb9782207e26cbab88a6  rust-std-1.65.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  fa99f123ce14f1cda245857b50fd4709adee960e7d36ce663b87c13aee18b64b  rust-std-1.65.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  a3f6740be345364f4599ae837d2401e0f31e5d33a4f958852d12a384ee581a83  rust-std-1.65.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-sparc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-sparc64-unknown-linux-gnu.tar.xz.asc
-sha256  fc2a8816665f464d3085dcd379c44b9de0ee1f1084fae0a4c32c57754b27992b  rust-std-1.65.0-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  2b588cd2d49688c0c33b7466614123e8fe4c910f4d802fc0ff0662b1772816a9  rust-std-1.65.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.65.0-x86_64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.65.0-x86_64-unknown-linux-musl.tar.xz.asc
-sha256  55abeb1b55aeebc46a4af2f304271361397df58d12f7eb23fb262bc3132c6056  rust-std-1.65.0-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.66.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.66.0-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  e8d853383355aa17fd8d7efae740ac0f18b3a5f452c9ac62f5042fc96ebda3e9  rust-1.66.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.66.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.66.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256  c9551f9650fcaf74ea4fb6874b6853f9ffecb6925e7a087afb4f36840e5b7b8d  rust-1.66.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.66.0-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.66.0-mips-unknown-linux-gnu.tar.xz.asc
+sha256  ec49ef94889c88f8fd107e9c263003aa6dcd9fb4d17ba057ffab4e4dc28fefd4  rust-1.66.0-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.66.0-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.66.0-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  755bcca28ee9d4504b7bd87265dc492a8e39550211f8081740940ada9e48cc7e  rust-1.66.0-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.66.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.66.0-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  eaaca0295a75a180082456eb3606e6c3fbc16a4f2b54bd754caab5a69b192f88  rust-1.66.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.66.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.66.0-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  a194c1a8f1bd8c450872ad2220bfe74e590c5706d4ec939577c69a013a0bbcff  rust-1.66.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.66.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.66.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  9fa197239eb374e071ef4486939c4713a2d662c5e7ebca0505626a3a53a7ed75  rust-1.66.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.66.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.66.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  6331e676198af2e75734f6566ca62ae22bb61b1d55e749494c454e777a73f195  rust-1.66.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.66.0-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.66.0-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  8d7053db5ea68f4801c7a808a222473076b8a602af70379975e81eede8a7e0ea  rust-1.66.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.66.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.66.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  a656328e1cd36b253bf39807b5a3eacdf0ce7d982fc9fb51a026f273386de84a  rust-1.66.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  b5ac5985a8fefd2a0de67197f7c2549aacee502cc784a3c3c93921b005aa31fa  rust-std-1.66.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-aarch64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-aarch64-unknown-linux-musl.tar.xz.asc
+sha256  ca62347018d1ace5e13a4a2f898dd2b19d5cb96db41482119418538f6482e2db  rust-std-1.66.0-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-arm-unknown-linux-gnueabi.tar.xz.asc
+sha256  c8d10c558605673fe975b3b1c8ec8d2a9887f18cb97690bf900c19668b6d05ba  rust-std-1.66.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-arm-unknown-linux-gnueabihf.tar.xz.asc
+sha256  70650b3a8c04c183a83a2a4ebee7047d6546e69a81e227c24afa6d34ad54fe9b  rust-std-1.66.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-arm-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-arm-unknown-linux-musleabihf.tar.xz.asc
+sha256  262a2024250e4aa7865a33d52d9b6826b5f059f0562a73f6067a04020879d4f0  rust-std-1.66.0-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-arm-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-arm-unknown-linux-musleabi.tar.xz.asc
+sha256  e41c5f840d73ed1073ef3a8abb125e6f41a66008ad7817fb2a1e703cf93f0a8b  rust-std-1.66.0-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
+sha256  8b8ab8fe4af3ce9604e264fada7ddaed610d8e517d8425d5d85184ea4f111b52  rust-std-1.66.0-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-armv5te-unknown-linux-musleabi.tar.xz.asc
+sha256  ec0552562348852c487e401168a0ad5f9e90cfc4cf03f5200f80b6594aa47d6d  rust-std-1.66.0-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
+sha256  5d166402813621d8c426bdb7dc857f97c72c921c2f2b52a893639a4c73862838  rust-std-1.66.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-armv7-unknown-linux-gnueabi.tar.xz.asc
+sha256  a7170034ddb9218f4f78d6a1d8f8d7ce8c17419015393a96a24aa13f9c89da2d  rust-std-1.66.0-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-armv7-unknown-linux-musleabihf.tar.xz.asc
+sha256  fbc7e7565196fb7ec18b9b2ef0c8a1267fb4825bf68ff0559c0956841d5ade14  rust-std-1.66.0-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-armv7-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-armv7-unknown-linux-musleabi.tar.xz.asc
+sha256  7caecb4b926d78ec879e53eaaa4d8001ef575cd80e6340e0518545fd8500eb8f  rust-std-1.66.0-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-i586-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-i586-unknown-linux-gnu.tar.xz.asc
+sha256  b22aaa59dee87dfc504f7e37ec1f297bbbe3f9ca5a7e4177d40975f2b4b32570  rust-std-1.66.0-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-i586-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-i586-unknown-linux-musl.tar.xz.asc
+sha256  b538209ea82733f25d88e3a9dc7d7b00f23f61ede128142412404c37846bad69  rust-std-1.66.0-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256  5c7da9cc8d71e72021bfcc8040a6d2c248127d1fbed12d81e2e4bdf61c70b8d6  rust-std-1.66.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-i686-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-i686-unknown-linux-musl.tar.xz.asc
+sha256  3f14c6381c74b175e32ce0f2e6337811a5ea2cc048239fc55101b6319b0ce7f8  rust-std-1.66.0-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-mips-unknown-linux-gnu.tar.xz.asc
+sha256  8909dff6e3fd2c0a2f7c747d8c31003cf6d4fd2ea877ddb933b3fd7861c1cf87  rust-std-1.66.0-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-mips-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-mips-unknown-linux-musl.tar.xz.asc
+sha256  e76c5fea6da85b42a6f313cc326d064067314532d6a057cfc95f733c2f019de1  rust-std-1.66.0-mips-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
+sha256  26e5304dc5d592b2a34933794c4636220ad86d78e9c639e36c18f46d3a8c0235  rust-std-1.66.0-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-mips64-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-mips64-unknown-linux-muslabi64.tar.xz.asc
+sha256  a621c95eef9b548d59234beeea031cc369d5744312a5ebfe4ac2250cb1b900e8  rust-std-1.66.0-mips64-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
+sha256  41b2e528e2b123220b2dbc8b6bf93986c22d86091f7cd653ac55d1b169720e1f  rust-std-1.66.0-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-mips64el-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-mips64el-unknown-linux-muslabi64.tar.xz.asc
+sha256  28de7df8cead0a09a6c4dbb3be6898f7bb495c803e5d1f15945dd66a60ebb2c4  rust-std-1.66.0-mips64el-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  519403a99b0859f21d4cabd347bada629f24fff913dafc54af255e4776d18f1b  rust-std-1.66.0-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-mipsel-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-mipsel-unknown-linux-musl.tar.xz.asc
+sha256  d1a8d76bd7549b3845dad92cdab45876c987e7ba6a27ea67f39414d498a66761  rust-std-1.66.0-mipsel-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  b68691f94417033b612f0fdb510d385499558ea19dcf2caf02a5c1d7141816fd  rust-std-1.66.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  0be870ead23d432b83981a45b37bb173315965485ef9ad6dcee1418702a26a3a  rust-std-1.66.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  ed05f169784776c94c4880281fbabab66b49ed05a221d8e06c6926e1161b8bbe  rust-std-1.66.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  93a8b0514106c8039a8767b961090e8a0f8e4b62d1488e70e93e2e553860f70c  rust-std-1.66.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  304008a504385f91672ab6ddf86b50f05a588432f01537049f4fbe95f8d41402  rust-std-1.66.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-sparc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-sparc64-unknown-linux-gnu.tar.xz.asc
+sha256  107045313c7b6678579eba1fb0b96519585a2e282570635c64c02ef4544aacaa  rust-std-1.66.0-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  c59ca7959a019f3f660c1f46bea3c13e7769b67732731469c0c42d02f28d08e7  rust-std-1.66.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.0-x86_64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-x86_64-unknown-linux-musl.tar.xz.asc
+sha256  b4dbc07eb417f77d9b794546d647f014d1650e1e0c0e76ff3d878dc09479e320  rust-std-1.66.0-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 91ee5a5372..b341bc4b7c 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.65.0
+RUST_BIN_VERSION = 1.66.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 9776f3f84c..35028b304b 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,6 +1,6 @@
-# From https://static.rust-lang.org/dist/rustc-1.65.0-src.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rustc-1.65.0-src.tar.xz.asc
-sha256  2d6aa2ea3fedd55acbbd65f78349385f9daa9c14e25db7a8df5d015588eee1cf  rustc-1.65.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.66.0-src.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.66.0-src.tar.xz.asc
+sha256  0dc176e34fae9871f855a6ba4cb30fa19d69c5b4428d29281a07419c4950715c  rustc-1.66.0-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index d501391d77..55fa38df18 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.65.0
+RUST_VERSION = 1.66.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
