Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F8C3C4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 16:04:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EC6DA61078
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 16:04:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EC6DA61078
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD142401DA;
	Tue,  3 Aug 2021 16:04:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D5yEFQrQGAic; Tue,  3 Aug 2021 16:04:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4403140184;
	Tue,  3 Aug 2021 16:04:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B7E4A1BF304
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 16:04:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4D7A60658
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 16:04:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0BDNTfMDHCi6 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 16:04:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1AAF6605C3
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 16:04:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D9C6C8AEF2; Tue,  3 Aug 2021 16:04:04 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 3 Aug 2021 17:56:10 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c92351aa11e2acd545841e846b05a6f2e6614313
X-Git-Newrev: 14377e38871704554f1dc324b690de5d7ef3c029
X-Patchwork-Hint: ignore
Message-Id: <20210803160404.D9C6C8AEF2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{rust,
 rust-bin}: bump to version 1.54.0
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=14377e38871704554f1dc324b690de5d7ef3c029
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rust-bin/rust-bin.hash | 192 ++++++++++++++++++++---------------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   6 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 101 insertions(+), 101 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index f7fb983813..136ff79764 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,99 +1,99 @@
-# From https://static.rust-lang.org/dist/rust-1.52.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.52.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  b0f504d3dcd744988a1a69716bbf6e2dac872c55e546748ceab8ff1d4fd2da5c  rust-1.52.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.52.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-1.52.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  d440cb932bbaaf43b600bd47b2dd4a05bc669a74d88addeeb943d694638d8e6e  rust-1.52.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-aarch64-unknown-linux-gnu.tar.xz.asc
-sha256  3720d98988302bc1f676cef2ea3b2a641404cbbe2d47d0f28f8954658586aa12  rust-std-1.52.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-aarch64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-aarch64-unknown-linux-musl.tar.xz.asc
-sha256 153d4a56264b3c38187c566ebdc3dee2e7573cad87b7c68b7e5c52d0c5ad056a  rust-std-1.52.0-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-arm-unknown-linux-gnueabi.tar.xz.asc
-sha256  593ec073c273028f60cf49d6084ee1809e075682f3e65f9cc86067f84f71d5f7  rust-std-1.52.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-arm-unknown-linux-gnueabihf.tar.xz.asc
-sha256  c251bf48962ff8f96e3572cecee12b1b3286477e66cb9c42c1fbe0118d6bdaf5  rust-std-1.52.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-arm-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-arm-unknown-linux-musleabihf.tar.xz.asc
-sha256 236944c4ce5dfdc16471b2bc7dc45dfc04f97528a403851ef210fffa55d36434  rust-std-1.52.0-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-arm-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-arm-unknown-linux-musleabi.tar.xz.asc
-sha256 73d99f322c9a86219205aa6bb871a0f3e52c605c2d16a6821188ff90423073ec  rust-std-1.52.0-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
-sha256 fbe790020b1178aeb0be213ceabff9aa4542448685b3bc7a70f87edae200d1ae  rust-std-1.52.0-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-armv5te-unknown-linux-musleabi.tar.xz.asc
-sha256 7c3f989962ab7d0cf841f1d5c597db3cb14d9f09427ab9ff35a26248cd3b3e01  rust-std-1.52.0-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
-sha256  c28c6870b9717c6c2e2015a6a5581ccb130f9d393db8166da4513680fe03d4ea  rust-std-1.52.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-armv7-unknown-linux-musleabihf.tar.xz.asc
-sha256 d483aad358c480d1593ebf6d9605bf012125670823fa7d895f528a2b4e0f5092  rust-std-1.52.0-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-armv7-unknown-linux-musleabi.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-armv7-unknown-linux-musleabi.tar.xz.asc
-sha256 0a51992109c837a93d77a57edbbd3d25badca68b354a9fe4a77c354baff1559a  rust-std-1.52.0-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-i586-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-i586-unknown-linux-gnu.tar.xz.asc
-sha256  f4d094e1cd73372f1565473b072e22278afeb2b728a178e6e9f1c813a9b76c23  rust-std-1.52.0-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-i586-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-i586-unknown-linux-musl.tar.xz.asc
-sha256 f364545baba647ce8b5e50b362303885bf5df47a9a285360d8c10a5948a36617  rust-std-1.52.0-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-i686-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-i686-unknown-linux-gnu.tar.xz.asc
-sha256  54749b579a8426dd46afe67feb3c206b0b129e59873a443dcd93ed51232a37d6  rust-std-1.52.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-i686-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-i686-unknown-linux-musl.tar.xz.asc
-sha256 517a5a714b696313dc2713b41482ff17034bf1755df859a8c99943932e903079  rust-std-1.52.0-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-mips-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-mips-unknown-linux-gnu.tar.xz.asc
-sha256  51492598343e5490c620fd04a16c3f41e2fe9f52232dc67fc1bc937233a2e85d  rust-std-1.52.0-mips-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-mips-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-mips-unknown-linux-musl.tar.xz.asc
-sha256 bec4d58999205aae3224d01e29b8cf74c7899e034444684620d6e7613916de0d  rust-std-1.52.0-mips-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
-sha256  8db8fac92466389629055d590ca06b7ef1c82621f05cba709413f2ce2c3c5407  rust-std-1.52.0-mips64-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-mips64-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-mips64-unknown-linux-muslabi64.tar.xz.asc
-sha256 43daa71ac3f7b86f98d8e5a4ee81bf0f4979ad33fc5a8e3f9f8604cacaa0ae14  rust-std-1.52.0-mips64-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
-sha256  824391b79c9b28be7a18feab1adb0eed1a9459667e93572fc8b343985ca965ba  rust-std-1.52.0-mips64el-unknown-linux-gnuabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-mips64el-unknown-linux-muslabi64.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-mips64el-unknown-linux-muslabi64.tar.xz.asc
-sha256 84e9948c8d850dc1c76e146de0f577be7a4d2a8e9b42fee43b05d88237e37c82  rust-std-1.52.0-mips64el-unknown-linux-muslabi64.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-mipsel-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-mipsel-unknown-linux-gnu.tar.xz.asc
-sha256  a6de773dfcdc8cac832ac6c356e2c0ecfd94fd7f7242aac82f8922f5bd1639e9  rust-std-1.52.0-mipsel-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-mipsel-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-mipsel-unknown-linux-musl.tar.xz.asc
-sha256 724df483aaf0797e30844715c537be9257074355201e92c992d12b2376d1b0ce  rust-std-1.52.0-mipsel-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-powerpc-unknown-linux-gnu.tar.xz.asc
-sha256  2ad7e17bcb8f632eb4206294ab977bbe1b7562009a3ca84a8d753ff454b1ee07  rust-std-1.52.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-powerpc64-unknown-linux-gnu.tar.xz.asc
-sha256  a792384afe034322b4b430049f57ed5e5fe9efbcf74c13c3edaf04062392727a  rust-std-1.52.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
-sha256  af5256a5f1cb189415b0d6b3e349312bbe8a78331a817c8da79ccfe9a07c0aed  rust-std-1.52.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
-sha256 573d8681cfc0ce71e735254ac33bfca7644fd4251699781b16dd18633a8e92ad  rust-std-1.52.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-sparc64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-sparc64-unknown-linux-gnu.tar.xz.asc
-sha256 0320e71a4c010295968b7ba05e68550b97c6b42520e72f1a534b0135c966cc99  rust-std-1.52.0-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-x86_64-unknown-linux-gnu.tar.xz.asc
-sha256  dcdc0083facd6484527494ee5b8f72e040a095ab346bb658ce176be573d5c9b4  rust-std-1.52.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.52.0-x86_64-unknown-linux-musl.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rust-std-1.52.0-x86_64-unknown-linux-musl.tar.xz.asc
-sha256 d5809f3f1345a3c524f00cfa2ac1631b494a6de3143b1a3d081476f2c4f78905  rust-std-1.52.0-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.54.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.54.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256  9c3baf8ec849978b0206262fc402ac9d24fdb2a8ae7b5d785b09022dbdbc20e8  rust-1.54.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.54.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-1.54.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  9fb4a22b74120b81a4d896326b02d121d5f996b3288580c346ea55a52d8946a9  rust-1.54.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-aarch64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-aarch64-unknown-linux-gnu.tar.xz.asc
+sha256  a1a77737d218087eb7d3613adcde2c9e383d758cdf128646a0ee63396145270b  rust-std-1.54.0-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-aarch64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-aarch64-unknown-linux-musl.tar.xz.asc
+sha256 9a7ff8e4cd160f6a58c3b5c7e679b7acdc427c2440ecc70a31a5dc71bbecd0c8  rust-std-1.54.0-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-arm-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-arm-unknown-linux-gnueabi.tar.xz.asc
+sha256  c87dc1681756c9c275eba690c6a05bcdd2ac3bd04a70ae039869dc85fff18b69  rust-std-1.54.0-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-arm-unknown-linux-gnueabihf.tar.xz.asc
+sha256  74c9f120ad8a443798ebec74302b5166a0880b13b1d8c43dde0c8ba70d9e4b2d  rust-std-1.54.0-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-arm-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-arm-unknown-linux-musleabihf.tar.xz.asc
+sha256 2a19d96cf9e863448b21ff989550da54080312ce99272128cc0eb3b1fe5c73cc  rust-std-1.54.0-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-arm-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-arm-unknown-linux-musleabi.tar.xz.asc
+sha256 481192a6906c44501f910a35fc49ed9b1b271925c4569a52f45d9efbc2058ae2  rust-std-1.54.0-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-armv5te-unknown-linux-gnueabi.tar.xz.asc
+sha256 2716f587d0da1dd26fc64251303f5705230f5b86e47e9af35e11622d01ceb963  rust-std-1.54.0-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-armv5te-unknown-linux-musleabi.tar.xz.asc
+sha256 b1f25af230f3b6fd930452024bd0cc9f4599bfb15f09f802cdb756effa516bbf  rust-std-1.54.0-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-gnueabihf.tar.xz.asc
+sha256  86549aca1b65188cedf3f1c8fce5af3d7f817450418367049d4bbe8c69ba1da0  rust-std-1.54.0-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-musleabihf.tar.xz.asc
+sha256 f9a650a3970dbc321e8979dd87ed02fd8f9d03901c3fb1a87724f3c214eb6e57  rust-std-1.54.0-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-musleabi.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-armv7-unknown-linux-musleabi.tar.xz.asc
+sha256 19a80cfaf18c15eaa1c112312c0cb0ccfd14179407118b35735cdcfc1cc4c60f  rust-std-1.54.0-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-i586-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-i586-unknown-linux-gnu.tar.xz.asc
+sha256  7c747dea305f5d4b1c6a23d064fbb41e24bb56f2917867020bb57cb064878dc4  rust-std-1.54.0-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-i586-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-i586-unknown-linux-musl.tar.xz.asc
+sha256 b52dd3d4ae465037ed2987e23457d30e1a75fd16c2c421613ec52c250947a5f8  rust-std-1.54.0-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-i686-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-i686-unknown-linux-gnu.tar.xz.asc
+sha256  e88269a37ebfbff52fcd07746c53fc0bfa2570531f10f226800d5783ce735e3f  rust-std-1.54.0-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-i686-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-i686-unknown-linux-musl.tar.xz.asc
+sha256 947054afa4d6e37c64e484c704b5f09043783b83aafbf7a00e6959442b1fc14f  rust-std-1.54.0-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-mips-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-mips-unknown-linux-gnu.tar.xz.asc
+sha256  59c0bd07976f9e18e05e328e2f0acd9e99b736ea0330a03b313842e5c5816e13  rust-std-1.54.0-mips-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-mips-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-mips-unknown-linux-musl.tar.xz.asc
+sha256 02611ec7a6d510572803b4bd9948f0790e9f0ae8e3047ff7fa465300346e3b74  rust-std-1.54.0-mips-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-mips64-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-mips64-unknown-linux-gnuabi64.tar.xz.asc
+sha256  dba582de46b7f97ba85b2d75662482df67214e71e0b9cea3c9c153c9d371a00f  rust-std-1.54.0-mips64-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-mips64-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-mips64-unknown-linux-muslabi64.tar.xz.asc
+sha256 2e94aedf59369d81524dfe8027e6e4fb0fe338d2ee7869bd96e5cef24974cf0e  rust-std-1.54.0-mips64-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-mips64el-unknown-linux-gnuabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-mips64el-unknown-linux-gnuabi64.tar.xz.asc
+sha256  d1d32bc202b026470ec2c37826fef92bd91f46b08ed1e2620a50eadba03d7095  rust-std-1.54.0-mips64el-unknown-linux-gnuabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-mips64el-unknown-linux-muslabi64.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-mips64el-unknown-linux-muslabi64.tar.xz.asc
+sha256 25d0c06fb445e16d7aac3b5370b43e72600a2aee41fa06605f64a3b8a8ed0e4b  rust-std-1.54.0-mips64el-unknown-linux-muslabi64.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-mipsel-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-mipsel-unknown-linux-gnu.tar.xz.asc
+sha256  626b4255d31c35fa77669471c15ec63b0e88726115538e598a6ef6e814d83bae  rust-std-1.54.0-mipsel-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-mipsel-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-mipsel-unknown-linux-musl.tar.xz.asc
+sha256  0f4aaec3ef60ad3c017a39925a1627cc79cd5be00cc8ea7759a470c24b0b66e7  rust-std-1.54.0-mipsel-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-powerpc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-powerpc-unknown-linux-gnu.tar.xz.asc
+sha256  116b2cd682cc5902f91a1ffbe2eb649262d871cd3c47e539afeb723513ae15eb  rust-std-1.54.0-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-powerpc64-unknown-linux-gnu.tar.xz.asc
+sha256  f0329a9d6c96eeb1db5cb7969dbadbab58768b8bff48a1ffc89103031945126e  rust-std-1.54.0-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-powerpc64le-unknown-linux-gnu.tar.xz.asc
+sha256  c08b7df82a30acacb3afcdad34b3384e77a9f35ce6bef10d43f29f129fab35e1  rust-std-1.54.0-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-riscv64gc-unknown-linux-gnu.tar.xz.asc
+sha256 8b9ac3e1947036d6f2a3939edd279631fc1b0a260507343a8b3e9ecd448fe738  rust-std-1.54.0-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-sparc64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-sparc64-unknown-linux-gnu.tar.xz.asc
+sha256 6ce101e3c5b1bae6006c61a18dcb5685fe0ff57ea8c00a36e6bf95f748abe5f6  rust-std-1.54.0-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-x86_64-unknown-linux-gnu.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-x86_64-unknown-linux-gnu.tar.xz.asc
+sha256  a22e19859b3c5032daac1633637546a986c51bdfa3ad0db6e394e6cc461f466b  rust-std-1.54.0-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.54.0-x86_64-unknown-linux-musl.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rust-std-1.54.0-x86_64-unknown-linux-musl.tar.xz.asc
+sha256 c2de24eb3e524c0fdd1e8116f578c103035da1ece1e4c06efab67999180eefe8  rust-std-1.54.0-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 71cd8361b3..bc8a485ac5 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_BIN_VERSION = 1.52.0
+RUST_BIN_VERSION = 1.54.0
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index faf2db5cb6..30a348e982 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,6 +1,6 @@
-# From https://static.rust-lang.org/dist/rustc-1.52.0-src.tar.xz.sha256
-# Verified using https://static.rust-lang.org/dist/rustc-1.52.0-src.tar.xz.asc
-sha256  2393e923087f3f8f98190eb0743f1b4a8956a35274ae5d3c0fae6e43238c6af8  rustc-1.52.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.54.0-src.tar.xz.sha256
+# Verified using https://static.rust-lang.org/dist/rustc-1.54.0-src.tar.xz.asc
+sha256  a2934f85f76a35a3796c0fefd31e91f5b6dd8377cd8c3769c1c10e7ce7a495f4  rustc-1.54.0-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 66a0c0c8c2..26ee2a9362 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RUST_VERSION = 1.52.0
+RUST_VERSION = 1.54.0
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
