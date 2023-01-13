Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4FADC54EBE
	for <buildroot@archiver.kernel.org>; Fri, 13 Jan 2023 15:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 46AA74011D;
	Fri, 13 Jan 2023 15:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46AA74011D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SsDrYKkHcOMT; Fri, 13 Jan 2023 15:15:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 407DE40439;
	Fri, 13 Jan 2023 15:15:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 407DE40439
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 507D41BF5AA
 for <buildroot@lists.busybox.net>; Fri, 13 Jan 2023 15:15:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38BB8415A6
 for <buildroot@lists.busybox.net>; Fri, 13 Jan 2023 15:15:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 38BB8415A6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6cMhQgVB3Hd1 for <buildroot@lists.busybox.net>;
 Fri, 13 Jan 2023 15:15:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E84C641599
 for <buildroot@buildroot.org>; Fri, 13 Jan 2023 15:15:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E84C641599
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D419687B1A; Fri, 13 Jan 2023 15:15:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Jan 2023 16:10:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d6469c513d5ee9b46c1a7484b93f1c50162aa359
X-Git-Newrev: 0da2742abbe2123d8bafe30e307b94c2b72f94cd
X-Patchwork-Hint: ignore
Message-Id: <20230113151531.D419687B1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{rust,
 rust-bin}: security bump to version 1.66.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=0da2742abbe2123d8bafe30e307b94c2b72f94cd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2022-46176: Cargo did not perform SSH host key verification when
cloning indexes and dependencies via SSH

https://blog.rust-lang.org/2023/01/10/cve-2022-46176.html

Link to Rust 1.66.1 announcement: https://blog.rust-lang.org/2023/01/10/Rust-1.66.1.html

Newest version of the source archives have been retrieved with their hash values,
and the signature of the .asc files have been verified as follows:
$ curl -fsSL https://static.rust-lang.org/rust-key.gpg.ascii | gpg --import
$ gpg --verify <filename.asc> <filename>

There is no typographical error in the packages according to the check-pakage utility:
$ ./utils/check-package package/rust-bin/*
$ ./utils/check-package package/rust/*

The testsuite tool were successfully run for rust and rust-bin packages to test
the Rust toolchain under 1.66.1:
$ ./support/testing/run-tests -k -d dl/ -o testsuite tests.package.test_rust.TestRustBin
$ ./support/testing/run-tests -k -d dl/ -o testsuite tests.package.test_rust.TestRust

In order to verify the compatibility of packages depending on Rust 1.66.1,
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
[Peter: mark as security bump]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rust-bin/rust-bin.hash | 252 ++++++++++++++++++++---------------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   6 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 131 insertions(+), 131 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 7cc1052dd9..adf1799ad7 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,129 +1,129 @@
-# From https://static.rust-lang.org/dist/rust-1.66.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.66.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  e8d853383355aa17fd8d7efae740ac0f18b3a5f452c9ac62f5042fc96ebda3e9  rust-1.66.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.66.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.66.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  c9551f9650fcaf74ea4fb6874b6853f9ffecb6925e7a087afb4f36840e5b7b8d  rust-1.66.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.66.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.66.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256  ec49ef94889c88f8fd107e9c263003aa6dcd9fb4d17ba057ffab4e4dc28fefd4  rust-1.66.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.66.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.66.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  755bcca28ee9d4504b7bd87265dc492a8e39550211f8081740940ada9e48cc7e  rust-1.66.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.66.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.66.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  eaaca0295a75a180082456eb3606e6c3fbc16a4f2b54bd754caab5a69b192f88  rust-1.66.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.66.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.66.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  a194c1a8f1bd8c450872ad2220bfe74e590c5706d4ec939577c69a013a0bbcff  rust-1.66.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.66.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.66.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  9fa197239eb374e071ef4486939c4713a2d662c5e7ebca0505626a3a53a7ed75  rust-1.66.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.66.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.66.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  6331e676198af2e75734f6566ca62ae22bb61b1d55e749494c454e777a73f195  rust-1.66.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.66.0-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.66.0-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  8d7053db5ea68f4801c7a808a222473076b8a602af70379975e81eede8a7e0ea  rust-1.66.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.66.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.66.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  a656328e1cd36b253bf39807b5a3eacdf0ce7d982fc9fb51a026f273386de84a  rust-1.66.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  b5ac5985a8fefd2a0de67197f7c2549aacee502cc784a3c3c93921b005aa31fa  rust-std-1.66.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-aarch64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-aarch64-unknown-linux-musl.tar.xz.asc
-sha256  ca62347018d1ace5e13a4a2f898dd2b19d5cb96db41482119418538f6482e2db  rust-std-1.66.0-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-arm-unknown-linux-gnueabi.tar.xz.asc
-sha256  c8d10c558605673fe975b3b1c8ec8d2a9887f18cb97690bf900c19668b6d05ba  rust-std-1.66.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-arm-unknown-linux-gnueabihf.tar.xz.asc
-sha256  70650b3a8c04c183a83a2a4ebee7047d6546e69a81e227c24afa6d34ad54fe9b  rust-std-1.66.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-arm-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-arm-unknown-linux-musleabihf.tar.xz.asc
-sha256  262a2024250e4aa7865a33d52d9b6826b5f059f0562a73f6067a04020879d4f0  rust-std-1.66.0-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-arm-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-arm-unknown-linux-musleabi.tar.xz.asc
-sha256  e41c5f840d73ed1073ef3a8abb125e6f41a66008ad7817fb2a1e703cf93f0a8b  rust-std-1.66.0-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
-sha256  8b8ab8fe4af3ce9604e264fada7ddaed610d8e517d8425d5d85184ea4f111b52  rust-std-1.66.0-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-armv5te-unknown-linux-musleabi.tar.xz.asc
-sha256  ec0552562348852c487e401168a0ad5f9e90cfc4cf03f5200f80b6594aa47d6d  rust-std-1.66.0-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
-sha256  5d166402813621d8c426bdb7dc857f97c72c921c2f2b52a893639a4c73862838  rust-std-1.66.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-armv7-unknown-linux-gnueabi.tar.xz.asc
-sha256  a7170034ddb9218f4f78d6a1d8f8d7ce8c17419015393a96a24aa13f9c89da2d  rust-std-1.66.0-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-armv7-unknown-linux-musleabihf.tar.xz.asc
-sha256  fbc7e7565196fb7ec18b9b2ef0c8a1267fb4825bf68ff0559c0956841d5ade14  rust-std-1.66.0-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-armv7-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-armv7-unknown-linux-musleabi.tar.xz.asc
-sha256  7caecb4b926d78ec879e53eaaa4d8001ef575cd80e6340e0518545fd8500eb8f  rust-std-1.66.0-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-i586-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-i586-unknown-linux-gnu.tar.xz.asc
-sha256  b22aaa59dee87dfc504f7e37ec1f297bbbe3f9ca5a7e4177d40975f2b4b32570  rust-std-1.66.0-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-i586-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-i586-unknown-linux-musl.tar.xz.asc
-sha256  b538209ea82733f25d88e3a9dc7d7b00f23f61ede128142412404c37846bad69  rust-std-1.66.0-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  5c7da9cc8d71e72021bfcc8040a6d2c248127d1fbed12d81e2e4bdf61c70b8d6  rust-std-1.66.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-i686-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-i686-unknown-linux-musl.tar.xz.asc
-sha256  3f14c6381c74b175e32ce0f2e6337811a5ea2cc048239fc55101b6319b0ce7f8  rust-std-1.66.0-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256  8909dff6e3fd2c0a2f7c747d8c31003cf6d4fd2ea877ddb933b3fd7861c1cf87  rust-std-1.66.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-mips-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-mips-unknown-linux-musl.tar.xz.asc
-sha256  e76c5fea6da85b42a6f313cc326d064067314532d6a057cfc95f733c2f019de1  rust-std-1.66.0-mips-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
-sha256  26e5304dc5d592b2a34933794c4636220ad86d78e9c639e36c18f46d3a8c0235  rust-std-1.66.0-mips64-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-mips64-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-mips64-unknown-linux-muslabi64.tar.xz.asc
-sha256  a621c95eef9b548d59234beeea031cc369d5744312a5ebfe4ac2250cb1b900e8  rust-std-1.66.0-mips64-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
-sha256  41b2e528e2b123220b2dbc8b6bf93986c22d86091f7cd653ac55d1b169720e1f  rust-std-1.66.0-mips64el-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-mips64el-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-mips64el-unknown-linux-muslabi64.tar.xz.asc
-sha256  28de7df8cead0a09a6c4dbb3be6898f7bb495c803e5d1f15945dd66a60ebb2c4  rust-std-1.66.0-mips64el-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  519403a99b0859f21d4cabd347bada629f24fff913dafc54af255e4776d18f1b  rust-std-1.66.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-mipsel-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-mipsel-unknown-linux-musl.tar.xz.asc
-sha256  d1a8d76bd7549b3845dad92cdab45876c987e7ba6a27ea67f39414d498a66761  rust-std-1.66.0-mipsel-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  b68691f94417033b612f0fdb510d385499558ea19dcf2caf02a5c1d7141816fd  rust-std-1.66.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  0be870ead23d432b83981a45b37bb173315965485ef9ad6dcee1418702a26a3a  rust-std-1.66.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  ed05f169784776c94c4880281fbabab66b49ed05a221d8e06c6926e1161b8bbe  rust-std-1.66.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  93a8b0514106c8039a8767b961090e8a0f8e4b62d1488e70e93e2e553860f70c  rust-std-1.66.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  304008a504385f91672ab6ddf86b50f05a588432f01537049f4fbe95f8d41402  rust-std-1.66.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-sparc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-sparc64-unknown-linux-gnu.tar.xz.asc
-sha256  107045313c7b6678579eba1fb0b96519585a2e282570635c64c02ef4544aacaa  rust-std-1.66.0-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  c59ca7959a019f3f660c1f46bea3c13e7769b67732731469c0c42d02f28d08e7  rust-std-1.66.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.66.0-x86_64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.66.0-x86_64-unknown-linux-musl.tar.xz.asc
-sha256  b4dbc07eb417f77d9b794546d647f014d1650e1e0c0e76ff3d878dc09479e320  rust-std-1.66.0-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.66.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.66.1-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  a1279760f91b3571733e0b0268128d143be2734916753900b5fe7b8ecc3c0900  rust-1.66.1-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.66.1-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.66.1-i686-unknown-linux-gnu.tar.xz.asc
+sha256  835b4e1b4d396674f7866a83b9a4f44db16fd12f01a7eaed527282b3700a9b92  rust-1.66.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.66.1-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.66.1-mips-unknown-linux-gnu.tar.xz.asc
+sha256  c7349617c42274bf50f6e3662dfb4f6832a93780099c3bb510be1a5b93d04c37  rust-1.66.1-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.66.1-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.66.1-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  fc38663870f0af47a27241d980ca886c3f7d432267920deb412ac8576bef68f0  rust-1.66.1-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.66.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.66.1-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  2b1a6c54db49a9e62d60cc96c1768f405e0f4c59d698186bf3a28a1bb017b6b5  rust-1.66.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.66.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.66.1-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  777d3a650448c15048710282388e90d10740540f570f5d17ed4a2dbdabb89552  rust-1.66.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.66.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.66.1-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  875bb310bae7c8c1d2d228a49aa4b547608b6c807ddc9ec44bc87272c77d869b  rust-1.66.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.66.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.66.1-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  89164ccf75909b3d02bdcb787e33876cad87e55ab0e6239b030b4b6631ed356a  rust-1.66.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.66.1-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.66.1-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  e83f9fc473072db23376783595a008cdd9b2f2e9b3be109e55939392864840eb  rust-1.66.1-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.66.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.66.1-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  a201aa4595ec8015662b7103b1409a4787c6d1f1d540bb68746633527d855858  rust-1.66.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  9d96ba6a5a255339cd04af079d906753d56c85503c727279c227d24bd4987e24  rust-std-1.66.1-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-aarch64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-aarch64-unknown-linux-musl.tar.xz.asc
+sha256  520ac446f20490685cc4d73192cfbb4c9b9e55c884aa4ae2b098e3a54d891de8  rust-std-1.66.1-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-arm-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-arm-unknown-linux-gnueabi.tar.xz.asc
+sha256  42afd189ef64988f64976f767a734734bccd7c71e578780e902148c98226fa29  rust-std-1.66.1-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-arm-unknown-linux-gnueabihf.tar.xz.asc
+sha256  506126773af9c3dacc506776a0b2e12fe6fa0c95eaf4f4ebb5cdbd335feb83fa  rust-std-1.66.1-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-arm-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-arm-unknown-linux-musleabihf.tar.xz.asc
+sha256  3d21b478fbf07bd27902bdd189e6988341f0c2c0108b538f926cea3031bc8ea6  rust-std-1.66.1-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-arm-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-arm-unknown-linux-musleabi.tar.xz.asc
+sha256  5282fc97111a7eafbead3463ed7bc0f3065332f21aec6a39a740157fe42f943a  rust-std-1.66.1-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-armv5te-unknown-linux-gnueabi.tar.xz.asc
+sha256  0ebf0178bbe9c5572d1db89e190dee23aef0e2f667995abedbd66e33d0bd73ab  rust-std-1.66.1-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-armv5te-unknown-linux-musleabi.tar.xz.asc
+sha256  938e7442c21ea0895c44ec78fa718ea1d3abe32ed0425ed328c905e188af250e  rust-std-1.66.1-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-armv7-unknown-linux-gnueabihf.tar.xz.asc
+sha256  bdc491f4c05669e7a3382b6bfdaeaa20e2cfa5ef553305df0e0d73729a45e6e4  rust-std-1.66.1-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-armv7-unknown-linux-gnueabi.tar.xz.asc
+sha256  d75c6dc3c00d662b0d3f6ce7fde0f76057542edfbc97a20b29247842c8a711d2  rust-std-1.66.1-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-armv7-unknown-linux-musleabihf.tar.xz.asc
+sha256  830285e5388081c68fac9dc955aa824a4d919b0e24eadc6e0b95b30103d79db9  rust-std-1.66.1-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-armv7-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-armv7-unknown-linux-musleabi.tar.xz.asc
+sha256  d720bd1e493f53797f90d83dbe6d52ecbe1ff3cae282f4b2e18c37fe92c9adf6  rust-std-1.66.1-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-i586-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-i586-unknown-linux-gnu.tar.xz.asc
+sha256  90eb8e2490283930e682b79842d664d4867414563353d53dafc47eccf44aea17  rust-std-1.66.1-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-i586-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-i586-unknown-linux-musl.tar.xz.asc
+sha256  c4bab2d63223d0c6e63806082e30d8c38b37eefc10ee2e7380971e3012c00bca  rust-std-1.66.1-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-i686-unknown-linux-gnu.tar.xz.asc
+sha256  b32cbbb9002f8a20b302823a2ff122a91f077b5e1a7bc1340de690ded86bf10b  rust-std-1.66.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-i686-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-i686-unknown-linux-musl.tar.xz.asc
+sha256  52013329eb6697d94f5dce01dd509b4b93b473c18a3a2c05d0230b9dfeab14d1  rust-std-1.66.1-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-mips-unknown-linux-gnu.tar.xz.asc
+sha256  e6029b4cec5d6c06c34a0dbec614fa252fdc8cf31013d6e561112cf90f742568  rust-std-1.66.1-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-mips-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-mips-unknown-linux-musl.tar.xz.asc
+sha256  23f917eccaca59d4c911eb96d8ffefe86834dbcdf902c9ab6dad8558c31c4575  rust-std-1.66.1-mips-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-mips64-unknown-linux-gnuabi64.tar.xz.asc
+sha256  70d1406e0981d5d31c1d3f85c848bba0476e0ff6203e7706f66b4d2212f01b66  rust-std-1.66.1-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-mips64-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-mips64-unknown-linux-muslabi64.tar.xz.asc
+sha256  0fd221d4b4205ce548e83f0e7416c8332eb12b64d5a43c0b3ed61e9f7d6edf13  rust-std-1.66.1-mips64-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-mips64el-unknown-linux-gnuabi64.tar.xz.asc
+sha256  132d6d5750a877972ebc6f23e831f2ef3077465b2ab24ca645d32ea83c496fe3  rust-std-1.66.1-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-mips64el-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-mips64el-unknown-linux-muslabi64.tar.xz.asc
+sha256  533f370368ac8b6192e1450289c64544ebf9cacc38c3a52ef6c0ecded7ee6fa5  rust-std-1.66.1-mips64el-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  8bfa3d6079c6df049978fe61b1ccaf992aecd006e23df2439ecfc883bd8bc31b  rust-std-1.66.1-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-mipsel-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-mipsel-unknown-linux-musl.tar.xz.asc
+sha256  d7028820888d0decde047a6e77b866e690532aa09522c9a23a3fbf8780a72257  rust-std-1.66.1-mipsel-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  417b12a9bf090d694514937cd8c321ed625f155248f63c0de8207b17fa4b35b1  rust-std-1.66.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  7074c4ea9fcc683ceb0adcca6ba07544a1d91f0e5d2a4cf14c81eb14316ebf35  rust-std-1.66.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  4c64a09be872b5832b50d681fbe29691b6a5d3e23ee5535020fa22b8b453c770  rust-std-1.66.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  776eff6f451845e88224714ee6da7819e34f01b7625bf927394c2b91e5c8243c  rust-std-1.66.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  51d1567e1d28e43c2165886f5a4955dcdaa41aa5ddcec5fb08200491fd1f6062  rust-std-1.66.1-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-sparc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-sparc64-unknown-linux-gnu.tar.xz.asc
+sha256  3aee03fa61c28bb242023efb09a22e38a76b075cc72bcad9894560be8b28a927  rust-std-1.66.1-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  c5e2c9b160bd8d99514f13cfbc0e42a722fd9ca14e6aaca4b9b77731a7a48377  rust-std-1.66.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.66.1-x86_64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.66.1-x86_64-unknown-linux-musl.tar.xz.asc
+sha256  a9710727ba28955deb7fbec799faed19486c9af3c7e3088ec6659a257515ffca  rust-std-1.66.1-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index b341bc4b7c..89009288f4 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.66.0
+RUST_BIN_VERSION = 1.66.1
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 35028b304b..545a452bf0 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,6 +1,6 @@
-# From https://static.rust-lang.org/dist/rustc-1.66.0-src.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rustc-1.66.0-src.tar.xz.asc
-sha256  0dc176e34fae9871f855a6ba4cb30fa19d69c5b4428d29281a07419c4950715c  rustc-1.66.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.66.1-src.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.66.1-src.tar.xz.asc
+sha256  07ac4e6c93e0d8ecfaf3b86c4c78bbbde3f5be675f0334e7fb343cb4a0b81ebe  rustc-1.66.1-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 55fa38df18..691683b492 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.66.0
+RUST_VERSION = 1.66.1
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
