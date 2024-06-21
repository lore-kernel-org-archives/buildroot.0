Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DFF1C2BB85
	for <buildroot@archiver.kernel.org>; Fri, 21 Jun 2024 19:11:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB84842AFD;
	Fri, 21 Jun 2024 19:11:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QhWuIEVVR1FI; Fri, 21 Jun 2024 19:11:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85DEF42ADB
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85DEF42ADB;
	Fri, 21 Jun 2024 19:11:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A44C31BF59A
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 19:11:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 919EF409C9
 for <buildroot@lists.busybox.net>; Fri, 21 Jun 2024 19:11:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xAmzXow7egjD for <buildroot@lists.busybox.net>;
 Fri, 21 Jun 2024 19:11:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51A90409C8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 51A90409C8
 for <buildroot@buildroot.org>; Fri, 21 Jun 2024 19:11:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4998E8058F; Fri, 21 Jun 2024 19:11:19 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 21 Jun 2024 21:10:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: df899041fb83cb114aaee150732a4dc130039076
X-Git-Newrev: 2ab21855bb067470763fe42fbb485b0f83029e76
X-Patchwork-Hint: ignore
Message-Id: <20240621191119.4998E8058F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rust: update to 1.79.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2ab21855bb067470763fe42fbb485b0f83029e76
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In rust 1.75.0, the follwong targets were dropped [0]:
    mips-unknown-linux-musl
    mips64-unknown-linux-muslabi64
    mips64el-unknown-linux-muslabi64
    mipsel-unknown-linux-musl

[0] https://github.com/rust-lang/rust/commit/03870154f4badc1939f718ac74c49438ce507241

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/rust-bin/rust-bin.hash | 136 +++++++++++++++++++----------------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   4 +-
 package/rust/rust.mk           |   2 +-
 package/rustc/Config.in.host   |   8 ---
 utils/update-rust              |   4 --
 6 files changed, 68 insertions(+), 88 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 9b82b4ca01..853a5305ec 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,78 +1,70 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rust-1.74.1-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  88d0cd0407ca5bb73b5d72956d85e31e057657c7ec09a58ca634cf36bd5cf626  rust-1.74.1-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.74.1-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  f58cdf15717e7f6506088e753ffef3ec655a4ccd932eae280d6cb68b0ee3feca  rust-1.74.1-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.74.1-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  d272cec30f3461647861d120af53946142fa2f969f43040c2685425cb67c7d79  rust-1.74.1-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.74.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  17df1fa64083fa508576062a651577e0741d02f4ae5771518a72fd4ea483b00f  rust-1.74.1-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.74.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  054a98e8e85e94c187ff8bc16bac8011747839c9ad73584fdd87b904f137eb23  rust-1.74.1-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.74.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  4abc1499e91cfadf7610a08271d1f5ff9284a54ba4a0ba60f105bb9b2413169e  rust-1.74.1-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.74.1-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  3196fd6e4453cd2191e5f8c4f63eaffd045cc1884cf4b64d94990aa81232f85f  rust-1.74.1-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.74.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  5483e32fe962e9123cf49c9cf169e60640d4c9d0aad1a054dd4bf232f0f012be  rust-1.74.1-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  a776e7b41991ef7a50706d1f9b7752a8d963e67297bfc22471d6e68d544349cc  rust-std-1.74.1-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-aarch64-unknown-linux-musl.tar.xz.sha256
-sha256  d712e44d57f3732c294affb26c07d8fb79f25c716b16a4bde910390f34cc9959  rust-std-1.74.1-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-arm-unknown-linux-gnueabi.tar.xz.sha256
-sha256  38ccd7eeb30e481a27533ec1450c1eb4f3c3fee284f702ee64676b3831bde425  rust-std-1.74.1-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  5f1b890faa083afd97ed53c67d859f4de89abe9a059b48c98217d8ee015bedeb  rust-std-1.74.1-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-arm-unknown-linux-musleabi.tar.xz.sha256
-sha256  9b57973a9d23e713799169c3b39282655b742c9182e21270f53a3bb46af516f3  rust-std-1.74.1-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-arm-unknown-linux-musleabihf.tar.xz.sha256
-sha256  26bad270c96de6ca0abbad4a2be63f994fede26b19cfab3362479668f3d1d5c5  rust-std-1.74.1-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-sha256  c567bf8e062daead8a256ee3097e724e1f70a4be5f69a74c3722719fb338af27  rust-std-1.74.1-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
-sha256  96c81d327c4cd5cd35541dae3db4ed6eef6a943c78b0595396e88264a692b5e2  rust-std-1.74.1-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
-sha256  339b4bf274ba569245a3e7bc1c9e238ce64c1942c5510fb19a4cacae37aa8aa9  rust-std-1.74.1-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  915c3648772d1b00b491a204239362aac33b213e95ac7e818b2001a40aae800a  rust-std-1.74.1-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-armv7-unknown-linux-musleabi.tar.xz.sha256
-sha256  e0a61bd2f33e5929a47654dccc5387c56aa847ab028ff2f1992b4dc82da677f0  rust-std-1.74.1-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
-sha256  7402c633f1a765053ca9bd4c03d65ece67651af9ce3698781a8d2a271e76cbaa  rust-std-1.74.1-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-i586-unknown-linux-gnu.tar.xz.sha256
-sha256  7c01117e7db5b77880d2ed5f3874ae10cdf9a3d2d042fc06011a8f5f8346b66c  rust-std-1.74.1-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-i586-unknown-linux-musl.tar.xz.sha256
-sha256  b2781008ab93083970d5bf18782f6611f80d5b2a0aa1eaf6e6a44e8b0c146d9b  rust-std-1.74.1-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  de7bfa755339d81d0f375c04a6b5432fba8452fdc72154fbe5cd5e1147902b90  rust-std-1.74.1-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-i686-unknown-linux-musl.tar.xz.sha256
-sha256  1d0a2aa7fc04896bb73d08ec6b7247d9f8e2db46532c31adff3d7944d66dfb4b  rust-std-1.74.1-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-mips-unknown-linux-musl.tar.xz.sha256
-sha256  c1721bb1f47941b1e6acc2f91b326d9172bf401dd88e92abacbb8084ecbc568f  rust-std-1.74.1-mips-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-mips64-unknown-linux-muslabi64.tar.xz.sha256
-sha256  d2680c31aabfa896301689a0a03206aad31a59111a3c041c357ba5508f56dcfc  rust-std-1.74.1-mips64-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-mips64el-unknown-linux-muslabi64.tar.xz.sha256
-sha256  7a8b6f7cc454efb57f575ba50956f2530e192ab50c622acf38b29a42a5bb31e0  rust-std-1.74.1-mips64el-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-mipsel-unknown-linux-musl.tar.xz.sha256
-sha256  733995dec75a90d4039bc3a6e11c44e256bfc4cb074e46a67e2aebfe1ec69a26  rust-std-1.74.1-mipsel-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  7fb458560bccae13f6558df43d5e17f177a084fdcb605d500eda63bc1ac3eb58  rust-std-1.74.1-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  931f975a4a4c8dc17552d965b276c7211e25f8c5deec1f41f5db5c181fa15320  rust-std-1.74.1-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  40781d07bb9a23d57c2440d70fee6385d8d40553b739d835c38fd0abe96d7ec5  rust-std-1.74.1-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  2c4de6689f5008289b791ad15b8cdc2d69947985b81b77d4dbe5d31632532e1d  rust-std-1.74.1-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  781403a12fef605250869aeb843be6b7f98ed6c0a62f0349fda53ee4d9d8e296  rust-std-1.74.1-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-sparc64-unknown-linux-gnu.tar.xz.sha256
-sha256  e19c0d79b385454a8e8c9f27c3ca9779ffac778d8b7cd8de701ce413f492d9f1  rust-std-1.74.1-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  df435e3254c03ccbfc9e733ae33b399f5f99bd488974bc07d8b1db91a12ee95b  rust-std-1.74.1-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.74.1-x86_64-unknown-linux-musl.tar.xz.sha256
-sha256  98f190039c7e7922838f9716443b7ddfec2aa3dc229f5b1813a26591c557997e  rust-std-1.74.1-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.79.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  8e7a2d514ee469325e5a7d0a2f0cad313aecb4c3da134f3bf84f7901a809d566  rust-1.79.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.79.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  74a4b17c7b80b87d2e1f4fa83c8c0c5e920eee6d72fe570df97aa96d85fc25ec  rust-1.79.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.79.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  a640336f90db45a00e35444afd5f38ec8a9035b4f1f7ae17fb5d9357d3483773  rust-1.79.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.79.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  dd5a1d8ec6c5810893388391f194b11876643d2add3918968ab1473bce9a2cc0  rust-1.79.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.79.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  40d7dd809c873f9462a35735c511d82ba0e46edb56c74e8da01ff3a002bef2aa  rust-1.79.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.79.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  acfb935d96986b05d6f8071a75ecc62f404d64faa65b81b1bb025821cfd3507b  rust-1.79.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.79.0-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  24aab3cef43b4d8319ad7976313cfcbd6942ebd7a1824d39707f5629dc615ba8  rust-1.79.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.79.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  ce552d6bf22a2544ea78647d98cb405d5089af58dbcaa4efea711bf8becd71c5  rust-1.79.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.79.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  519abf4757fbd8d7e3bb4e4cfdc362ded972c1d95f04675684df2d31e8c0899b  rust-std-1.79.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.79.0-aarch64-unknown-linux-musl.tar.xz.sha256
+sha256  428bf4fb5a66e93c2e13a8cddae71e903559d8666c727f0d45ececc7da7d2404  rust-std-1.79.0-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.79.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256  bae338708a07e26ac2f51c291478e33fb85fbff9632e2da2714f3d1a91c3773a  rust-std-1.79.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.79.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  fa6f5f03b68faf9b4449266e4836bcae24027fba7a3822a48822d772fc76c064  rust-std-1.79.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.79.0-arm-unknown-linux-musleabi.tar.xz.sha256
+sha256  1ba19c8e7dae60c7ae3f406545b65eef4fa6de31f3dd2fe83e0bbd06ade2c536  rust-std-1.79.0-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.79.0-arm-unknown-linux-musleabihf.tar.xz.sha256
+sha256  24fa88bf0aa867be686c7d26233949ae9dbadc10b1e9c6ed36930cabe48d69b3  rust-std-1.79.0-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.79.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+sha256  c2f906d1c9d130e06687eeea5ea50697485b321dd1a8e537200a52db508db361  rust-std-1.79.0-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.79.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
+sha256  73f3bc406ce4bcd4d64b7101a07a82bfff0f3cf793ba071b04c250c1feb08a03  rust-std-1.79.0-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.79.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
+sha256  af7707874d52823cce0323a4ae900ed34201eefab97f4781c8280bf33ecb68b7  rust-std-1.79.0-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.79.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  a17fde385e3f420f5f825e019b4739a469a4aece9071a7ff7b7ff3c8a0486245  rust-std-1.79.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.79.0-armv7-unknown-linux-musleabi.tar.xz.sha256
+sha256  74957092140452f41f39eceaeb0490054181a36c4d2eec53ab3a611bd3c8c38f  rust-std-1.79.0-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.79.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
+sha256  344e2190418912eb4415ac38a819202fd05c51e2b8f926d42cf43f5121e479d2  rust-std-1.79.0-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.79.0-i586-unknown-linux-gnu.tar.xz.sha256
+sha256  9c38f2cd4c19196fcf113166237ab03512bf19ce5a7f13c3bfe0e5cc3317eb44  rust-std-1.79.0-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.79.0-i586-unknown-linux-musl.tar.xz.sha256
+sha256  a9ba68598744117d10fa074535bb48585d4f6ad77170cbcb43841a56dc76f5c7  rust-std-1.79.0-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.79.0-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  158294f7c424ef75d84046b573f225c15d531745cc79d416a18c11aa8253830e  rust-std-1.79.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.79.0-i686-unknown-linux-musl.tar.xz.sha256
+sha256  a0087ba6e159550aab8ff93390faec42e2687ec13908ab3e45946c2769aea00c  rust-std-1.79.0-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.79.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  6aa2f351bc7dccb544781f4fecddb5ef67e05bb310c84e0106d968231384d9f4  rust-std-1.79.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.79.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  af95929af71494ee3e6988ead07204ea05b6f2b729cdb1ffcc26db75e47bf318  rust-std-1.79.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.79.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  3b5d53d70837d5ec942ec41a8da37ed932bbdc1e53f78dc54e218db458701588  rust-std-1.79.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.79.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  2b8af4060acb10f347c66a3477ae92151beba12192590ea40723dcf9b1f7f5b2  rust-std-1.79.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.79.0-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  d70e710a5138871e8d972f195ced9f7aa639ccef23a87fa03cc527d2b9c3cd36  rust-std-1.79.0-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.79.0-sparc64-unknown-linux-gnu.tar.xz.sha256
+sha256  f7c7a73a8e5640f9d5aca6b26866b4da08cf3d3509ed1c4184309fb868acbff2  rust-std-1.79.0-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.79.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  2c914483c0882d44af2e50a181cbd2c953d672d50b31aa669ee2346cade1f108  rust-std-1.79.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.79.0-x86_64-unknown-linux-musl.tar.xz.sha256
+sha256  30b9418561e6a7c18396a259304d3ddb4ad9d262f0ed6f227e08d232b8b32e8c  rust-std-1.79.0-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index ca35d27d1c..1c9b0466b3 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.74.1
+RUST_BIN_VERSION = 1.79.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 34349eef8b..1a0fb0dec2 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,8 +1,8 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rustc-1.74.1-src.tar.xz.sha256
-sha256  b98c09d968529212fb29eec7d6d3e9bdaa869810679b7fb86a1ca69469d75f5e  rustc-1.74.1-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.79.0-src.tar.xz.sha256
+sha256  ab826e84b8d48ec6eda3370065034dea8c006f6a946d78a9ba12bcb50e6d3c7a  rustc-1.79.0-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index c544582c99..9f644b71ab 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.74.1
+RUST_VERSION = 1.79.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
diff --git a/package/rustc/Config.in.host b/package/rustc/Config.in.host
index d15443e53f..c3e9a13f39 100644
--- a/package/rustc/Config.in.host
+++ b/package/rustc/Config.in.host
@@ -92,14 +92,6 @@ config BR2_PACKAGE_HOST_RUSTC_TARGET_TIER2_PLATFORMS
 	default y if BR2_x86_i586 && BR2_TOOLCHAIN_USES_MUSL
 	# i686-unknown-linux-musl
 	default y if (BR2_x86_i686 || BR2_x86_pentiumpro || BR2_X86_CPU_HAS_MMX) && BR2_TOOLCHAIN_USES_MUSL
-	# mips-unknown-linux-musl
-	default y if BR2_mips && BR2_TOOLCHAIN_USES_MUSL && !BR2_MIPS_CPU_MIPS32R6
-	# mips64-unknown-linux-muslabi64
-	default y if BR2_mips64 && BR2_TOOLCHAIN_USES_MUSL && BR2_MIPS_NABI64 && !BR2_MIPS_CPU_MIPS64R6
-	# mips64el-unknown-linux-muslabi64
-	default y if BR2_mips64el && BR2_TOOLCHAIN_USES_MUSL && BR2_MIPS_NABI64 && !BR2_MIPS_CPU_MIPS64R6
-	# mipsel-unknown-linux-musl
-	default y if BR2_mipsel && BR2_TOOLCHAIN_USES_MUSL && !BR2_MIPS_CPU_MIPS32R6
 	# sparc64-unknown-linux-gnu
 	default y if BR2_sparc64 && BR2_TOOLCHAIN_USES_GLIBC
 
diff --git a/utils/update-rust b/utils/update-rust
index 4d74e9e5e0..6799324fac 100755
--- a/utils/update-rust
+++ b/utils/update-rust
@@ -49,10 +49,6 @@ RUST_TARGETS = [
     "i586-unknown-linux-musl",
     "i686-unknown-linux-gnu",
     "i686-unknown-linux-musl",
-    "mips-unknown-linux-musl",
-    "mips64-unknown-linux-muslabi64",
-    "mips64el-unknown-linux-muslabi64",
-    "mipsel-unknown-linux-musl",
     "powerpc-unknown-linux-gnu",
     "powerpc64-unknown-linux-gnu",
     "powerpc64le-unknown-linux-gnu",
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
