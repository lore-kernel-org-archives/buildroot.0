Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50F0EB64DC
	for <buildroot@archiver.kernel.org>; Fri, 14 Jul 2023 10:16:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9E1A661429;
	Fri, 14 Jul 2023 10:16:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9E1A661429
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fKbAPHKZmAu5; Fri, 14 Jul 2023 10:16:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94AB861427;
	Fri, 14 Jul 2023 10:16:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94AB861427
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 41AA51BF313
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:14:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8E9014208C
 for <buildroot@lists.busybox.net>; Fri, 14 Jul 2023 10:14:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E9014208C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x_HZoHjT0Qvq for <buildroot@lists.busybox.net>;
 Fri, 14 Jul 2023 10:14:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F05614211B
 for <buildroot@buildroot.org>; Fri, 14 Jul 2023 10:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F05614211B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D2E668706D; Fri, 14 Jul 2023 10:14:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 14 Jul 2023 12:00:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 167e8479f483ac5b76d2c5da32216a3c09863281
X-Git-Newrev: bfb370286c8ad998db6723ed4ab013e70656bd2b
X-Patchwork-Hint: ignore
Message-Id: <20230714101440.D2E668706D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{rust,
 rust-bin}: bump to version 1.71.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=bfb370286c8ad998db6723ed4ab013e70656bd2b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Link to Rust 1.70.0 announcement: https://blog.rust-lang.org/2023/07/13/Rust-1.71.0.html

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rust-bin/rust-bin.hash | 252 ++++++++++++++++++++---------------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   6 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 131 insertions(+), 131 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index f6c72f7555..211ac424ed 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,129 +1,129 @@
-# From https://static.rust-lang.org/dist/rust-1.70.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.70.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  a36e20a55e39c857f9ec69b146ae04572d5e666e76ff2dd6422cc8f575aed1c7  rust-1.70.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.70.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.70.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  e3fb7f9d825e1bd1720765a358361ba4517584f6d0c1a1d80b2230e2f97c9b88  rust-1.70.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.70.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.70.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256  c77505fd6ef54e9ff2819e876a67acb8fe5aa1628e9ebe7c1931ce7d0b41b247  rust-1.70.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.70.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.70.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  7771203dfd675fc7425508a106973725d976fb7334b35facb96f164934044bd0  rust-1.70.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.70.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.70.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  a98a6606a23622d608159f71cc870748c0b406e89d5ff5bf58fb5365ef0e4d40  rust-1.70.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.70.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.70.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  2ca5701b4ea5555afd6cc4d1063097e52828583f2c205c7b23717074d91a4096  rust-1.70.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.70.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.70.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  41093804c33ea79f8643566ad6cfff5c4f0755418d73abcdf774c870dd8a2e0e  rust-1.70.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.70.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.70.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  2da9c69e6ce28da52a2b5ec78db090f41a393bf4b290012058be4f09559662a3  rust-1.70.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.70.0-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.70.0-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  34bfb5bb95b3f107e82b260a108df796bcf57a5eecda0efac5fd997ed4d3ae88  rust-1.70.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.70.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.70.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  991b59d1d0cd0dfcb2463bd79d2df1a235380f725557cdee831ee3c1d87a3122  rust-1.70.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  966e85187b6b76dc520b23aadc886c5fe54b209a21c68f959ff00ef8542b7f9f  rust-std-1.70.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-aarch64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-aarch64-unknown-linux-musl.tar.xz.asc
-sha256  277c2313f0ee420851c4009f15ba4d474000e0495deef38b0b636d6837e4f15f  rust-std-1.70.0-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-arm-unknown-linux-gnueabi.tar.xz.asc
-sha256  a6bf20e4eb5b88cd193ea2a126efe1a33651dc0be47080488be2cfff41c29272  rust-std-1.70.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-arm-unknown-linux-gnueabihf.tar.xz.asc
-sha256  6ad1231aeb34fef9c9db267859b0db3c6846bbade8227e6c9f456b6264c1278c  rust-std-1.70.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-arm-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-arm-unknown-linux-musleabihf.tar.xz.asc
-sha256  0b021ad310e638e90ae64b60c5a898f2f30ec77fcc1622e3775abb5476200de4  rust-std-1.70.0-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-arm-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-arm-unknown-linux-musleabi.tar.xz.asc
-sha256  f72c1983fcd90c338c62747b15964103518ec377530df2e71e35f7ea16eeede8  rust-std-1.70.0-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
-sha256  93929160b961ea6feb0dd0c64aa0571e1e2dc3024a4e2d7ae9ab5f75b1950fd9  rust-std-1.70.0-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-armv5te-unknown-linux-musleabi.tar.xz.asc
-sha256  4c4614c95bbd62665258248cc59d03d0d36e2034971892bd8f01659cdb953740  rust-std-1.70.0-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
-sha256  9baaca8ed2a71040480654a1ff3c9917e017ddfe78030b054ad82aed9b94c11e  rust-std-1.70.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-armv7-unknown-linux-gnueabi.tar.xz.asc
-sha256  3edd71ce8102783c99b9b6661577ac1acf6a633156234ee220a20aa3d7190ebb  rust-std-1.70.0-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-armv7-unknown-linux-musleabihf.tar.xz.asc
-sha256  aaceb71de5268510cbfb59c356ef2f7fb539f89b57116a2d3a513d06c411bb35  rust-std-1.70.0-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-armv7-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-armv7-unknown-linux-musleabi.tar.xz.asc
-sha256  f9d5ce6b4bff635151579726ebf264b905679f42917283fa1268d86f7c82a55f  rust-std-1.70.0-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-i586-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-i586-unknown-linux-gnu.tar.xz.asc
-sha256  f52e3ac35157e90f86e5ca6c177a43774425c24a51b15655ed61f6209c7db6f0  rust-std-1.70.0-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-i586-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-i586-unknown-linux-musl.tar.xz.asc
-sha256  1a42665bb54eeff908f833dca12e917d6ce87140139ec56702b9d88cda61be79  rust-std-1.70.0-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  0e5543c35196ca5b08f1b7e49fa3f3b671444d75648504cdbcfd854e2e7efd2d  rust-std-1.70.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-i686-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-i686-unknown-linux-musl.tar.xz.asc
-sha256  19ef3b0f6e52f81cd17f0d98a692c48fe02e85570d1e36b6369a7294ae875e2a  rust-std-1.70.0-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256  0cd85a53e328b1c445a8ec13af87f74280c1d344744076b102227f626456caec  rust-std-1.70.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-mips-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-mips-unknown-linux-musl.tar.xz.asc
-sha256  5e1abc99236050e0371ffdce8f4924e7fe46957daa7509cabc21355f62ee05e7  rust-std-1.70.0-mips-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
-sha256  9624b99d806b64e11916b78afac1fac7561578c23b1321486f73f22f5e7d8710  rust-std-1.70.0-mips64-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-mips64-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-mips64-unknown-linux-muslabi64.tar.xz.asc
-sha256  de3adfd43245dadff1fdb172250189f85dbcbc848badf29d5512d5bd10ff8e53  rust-std-1.70.0-mips64-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
-sha256  55153a84e1a00d8426b08bb745de7eae8bd34dc65ece529a46c2b76448404338  rust-std-1.70.0-mips64el-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-mips64el-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-mips64el-unknown-linux-muslabi64.tar.xz.asc
-sha256  39edcc0d4cc184ec320c710b41cc7401ab6f2408da3d8a6bc9c1a836429d429f  rust-std-1.70.0-mips64el-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  58bf8a6407d92cd4786991f1cbdec7380001e07c057c3a8946c2e54593bb7f8c  rust-std-1.70.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-mipsel-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-mipsel-unknown-linux-musl.tar.xz.asc
-sha256  4dd7f934ab4d21f933e5287b7ea194d34e36b6d5a17a5a7ef3bf0b705c59f8ca  rust-std-1.70.0-mipsel-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  101f358b08381b9c37c2f061bac1ff3e60c6036be20059c451f322a55f72376b  rust-std-1.70.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  468672f84e5b140269e188b836ec82494d65c18bda8b7cf1f9bf6fce19f222ab  rust-std-1.70.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  bbd882f9ec7f01a732ecc60cf50b7d8a10cd52c3de41c205f62938b6dc2b4dbc  rust-std-1.70.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256  cdecf32e245898306a27a0b164451b2ee9a2122176ce3a65f2ec73c200986dc3  rust-std-1.70.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-s390x-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-s390x-unknown-linux-gnu.tar.xz.asc
-sha256  7084afbe9fb1a0e8a0c3e760f45475ebba400b72030ae8359bdccef67cb48992  rust-std-1.70.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-sparc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-sparc64-unknown-linux-gnu.tar.xz.asc
-sha256  b06933f6f94cd30e1c2415b37db97a94533a727aa5d32a34ee80c6742ee418d2  rust-std-1.70.0-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  0c0129717da1e27ccf2c56da950d2fe56973f71beec9e80ae6904b282d2f0ee9  rust-std-1.70.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.70.0-x86_64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.70.0-x86_64-unknown-linux-musl.tar.xz.asc
-sha256  7ebaba08385d1ec87d0a27ca8b4e1eb454374da18ffa12621bd1578973754101  rust-std-1.70.0-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.71.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.71.0-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  9712efaa9c7977b6f03aeb3ef086d0050273f498790bf242e96b9a8117de901f  rust-1.71.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.71.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.71.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256  afd7148aaacdd38acb2f02ded9dd31c833d6f20d99f3f4b5617282295d2092d7  rust-1.71.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.71.0-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.71.0-mips-unknown-linux-gnu.tar.xz.asc
+sha256  bd0bcdb5fc5c4a9561de7b10361267a25e623de02c65734e76ee904b816f6a56  rust-1.71.0-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.71.0-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.71.0-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  f76bc0fdd382d5064d69e5888bcf81312e5ee2b0a700a7a54f240e7c5090bf5f  rust-1.71.0-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.71.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.71.0-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  c0a31776d8d1ea351cf40c02e1cfa0ed05f3bcdcdd8b203a87447b31fd2bae30  rust-1.71.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.71.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.71.0-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  90a4483ba3aa1e3eea4660fbdddad31b3b43fe89458c1d9805b22dac6136abe7  rust-1.71.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.71.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.71.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  1cdfccb28bed3ad6b0204e3773e3aa43a8687d1740dcb3dd21b4b37ae5308ac1  rust-1.71.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.71.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.71.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  afa670835f244adf06486fa5966e106366b39817d7bbae18504cb6767208ebe9  rust-1.71.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.71.0-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.71.0-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  a632cfda657b105c0355ebd575d54ef2e931827befb3e098098b7c3fba085f47  rust-1.71.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.71.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.71.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  7ae6cf3686f7638c8263d6d7aba68e275edee4e4d832723c603ddab96e330fa4  rust-1.71.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  58542a0ab1162ce05a45eb751793782dc24c5bf8eb9a7467317f254260305ea6  rust-std-1.71.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-aarch64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-aarch64-unknown-linux-musl.tar.xz.asc
+sha256  759567c0e070a686a593e163c72aeda9e17eb85e783d00d0d5f5642471c65ccc  rust-std-1.71.0-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-arm-unknown-linux-gnueabi.tar.xz.asc
+sha256  fdf359b745d750aeb292a59676ed31acd5ddcc74fb6e987b9bb51dfbf466f3b6  rust-std-1.71.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-arm-unknown-linux-gnueabihf.tar.xz.asc
+sha256  452fda324514d5c2431a6c66f376a1369b7199cfa0464f8e669af3b196dabccc  rust-std-1.71.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-arm-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-arm-unknown-linux-musleabihf.tar.xz.asc
+sha256  43a64dc0a6711802bd9de917a17b17e12099d4d7ed9478c5d86b9170ff104ed3  rust-std-1.71.0-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-arm-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-arm-unknown-linux-musleabi.tar.xz.asc
+sha256  774b5f95730179ed561cb4937b6e7813d0424a6ada69ebba45f240fed61c3165  rust-std-1.71.0-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
+sha256  9a3aeefbf7dc6eea4e7f437878f0e1af161963ed45b7979581014a0d8bd6602e  rust-std-1.71.0-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-armv5te-unknown-linux-musleabi.tar.xz.asc
+sha256  33533c29f7435837bc3c274e11eb5f538a9c56eae3bac0ae6c682aeab56bb53b  rust-std-1.71.0-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
+sha256  7f03a6caa03353da24851da5cd7ed8d07394d7134de680174ee7877302aa6f79  rust-std-1.71.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-armv7-unknown-linux-gnueabi.tar.xz.asc
+sha256  fda8b435939f48364b879981d913df16b10c2951d143da4bbc60e49e013c7ddc  rust-std-1.71.0-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-armv7-unknown-linux-musleabihf.tar.xz.asc
+sha256  f4ce3c4436ab691e979e012bab626062c3f14b3fc798dc26b5dcbd1344a85e2e  rust-std-1.71.0-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-armv7-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-armv7-unknown-linux-musleabi.tar.xz.asc
+sha256  1db88e655caa1e4af31c7104de50339d9e8a53fb92f23cd302263cea934d6f79  rust-std-1.71.0-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-i586-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-i586-unknown-linux-gnu.tar.xz.asc
+sha256  5878f641f4e5a12ced79d2f0d5d9a9d5b0b97b56967684cf09357162c3e6a7b7  rust-std-1.71.0-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-i586-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-i586-unknown-linux-musl.tar.xz.asc
+sha256  2f62eb58d29a24a8a0d1c8f8b314e676b419cd6d324c02ed63af14954c57467d  rust-std-1.71.0-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256  46976bf8297efc65556ccddfec395d5327fbe303f9dabffd104628a37cb1de6d  rust-std-1.71.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-i686-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-i686-unknown-linux-musl.tar.xz.asc
+sha256  fa84fb37715f10075060cb4c9acf39dcc568b58b155ae1cbc913334b93423dac  rust-std-1.71.0-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-mips-unknown-linux-gnu.tar.xz.asc
+sha256  a259bddfc3ee36279b016ebd2682fc5b4d1b93c63bed6e4f57b5a2963d661dc9  rust-std-1.71.0-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-mips-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-mips-unknown-linux-musl.tar.xz.asc
+sha256  25f020e04a18e67bf98751c9f80ac07abfd298264d45d1228d66d2fc21c6c681  rust-std-1.71.0-mips-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
+sha256  1af97099a18357a0c36d6c4e6ace4973cd60186d76ff115ea14f6b031f86d7da  rust-std-1.71.0-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-mips64-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-mips64-unknown-linux-muslabi64.tar.xz.asc
+sha256  5d469176aae820868d4f86889621a371670d7ca2c860708f625da36b612ae4ab  rust-std-1.71.0-mips64-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
+sha256  d95d52c63989d80c9284d33c6db438763426c18fc814357de3e2c0ffc0f202dd  rust-std-1.71.0-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-mips64el-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-mips64el-unknown-linux-muslabi64.tar.xz.asc
+sha256  103e5ac47a362f6db324eb08673f2b54ab041428585d5f3b9e991846f709b840  rust-std-1.71.0-mips64el-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  ad91d662c93e5092367048c8e717f64a5096b876623e5fbc3c791b2d1f868dfb  rust-std-1.71.0-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-mipsel-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-mipsel-unknown-linux-musl.tar.xz.asc
+sha256  9dc87b5807730e6a69c2bfc167d93599c6dd481fe5189ce1e395787c432d4353  rust-std-1.71.0-mipsel-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  fac6cc57d8a922423db2f0239b8484df3b029d0b58a63676868de682680bbf87  rust-std-1.71.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  628957fbe1f8665578167c6814486941f7b04417dce8a499cababa3284a2260a  rust-std-1.71.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  3ce73e032232522cd7c37e64b1e8895f16ddcef02b1646d078f67bb36b6c1494  rust-std-1.71.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256  bf692cee46d6c04c3993795633fdc5d4c1dffa7e4d4924227fa3e044872440a4  rust-std-1.71.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-s390x-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-s390x-unknown-linux-gnu.tar.xz.asc
+sha256  4ceab97a7c15e1235aa099306798e1eb8620aad5477b7123dc9e343bb9a6fcfe  rust-std-1.71.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-sparc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-sparc64-unknown-linux-gnu.tar.xz.asc
+sha256  679ef3ee4a3876f071e08539734de2fabfcc3410977e8c20ba685bc9f40a693b  rust-std-1.71.0-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  98ae6530c3a41167e9d93d11ea078be98a02f6d809a06d0d51af3ce0f73150d7  rust-std-1.71.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.71.0-x86_64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.71.0-x86_64-unknown-linux-musl.tar.xz.asc
+sha256  c91408683fe0918732525ec1e70263d3fc871ec8d15ae98768a1c6d7b9e3bff1  rust-std-1.71.0-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 78e3631761..2336887ae6 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.70.0
+RUST_BIN_VERSION = 1.71.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 1ceed7683c..7940ce09a5 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,6 +1,6 @@
-# From https://static.rust-lang.org/dist/rustc-1.70.0-src.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rustc-1.70.0-src.tar.xz.asc
-sha256  bb8e9c564566b2d3228d95de9063a9254182446a161353f1d843bfbaf5c34639  rustc-1.70.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.71.0-src.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.71.0-src.tar.xz.asc
+sha256  5814699031aafdcc2e2f71fc9b389678cd7042350d1583da061463d8e88681c7  rustc-1.71.0-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index d4566b3142..d2625318fd 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.70.0
+RUST_VERSION = 1.71.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
