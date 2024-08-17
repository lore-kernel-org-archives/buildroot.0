Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07C8EC52D7D
	for <buildroot@archiver.kernel.org>; Sat, 17 Aug 2024 10:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE9394049A;
	Sat, 17 Aug 2024 10:07:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wk9ww0VvBO67; Sat, 17 Aug 2024 10:07:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EE8C404CC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9EE8C404CC;
	Sat, 17 Aug 2024 10:07:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id F3D421BF57C
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 10:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ECD1160641
 for <buildroot@lists.busybox.net>; Sat, 17 Aug 2024 10:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cfPdw6QYH0nP for <buildroot@lists.busybox.net>;
 Sat, 17 Aug 2024 10:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6EB7860634
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6EB7860634
 for <buildroot@buildroot.org>; Sat, 17 Aug 2024 10:07:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 56BFA85EC6; Sat, 17 Aug 2024 10:07:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 17 Aug 2024 12:01:34 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: d8335bee355309408f95714ebdb10dd0656cb441
X-Git-Newrev: 0f41a11c66e0eabf9832148e2f23b75f15ef4a7b
X-Patchwork-Hint: ignore
Message-Id: <20240817100753.56BFA85EC6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/rust: update to 1.80.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f41a11c66e0eabf9832148e2f23b75f15ef4a7b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Sebastien Laveze <slaveze@smartandconnective.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/rust-bin/rust-bin.hash | 128 ++++++++++++++++++++---------------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   4 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 68 insertions(+), 68 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index 853a5305ec..143bcd6de0 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,70 +1,70 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rust-1.79.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  8e7a2d514ee469325e5a7d0a2f0cad313aecb4c3da134f3bf84f7901a809d566  rust-1.79.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.79.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  74a4b17c7b80b87d2e1f4fa83c8c0c5e920eee6d72fe570df97aa96d85fc25ec  rust-1.79.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.79.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  a640336f90db45a00e35444afd5f38ec8a9035b4f1f7ae17fb5d9357d3483773  rust-1.79.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.79.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  dd5a1d8ec6c5810893388391f194b11876643d2add3918968ab1473bce9a2cc0  rust-1.79.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.79.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  40d7dd809c873f9462a35735c511d82ba0e46edb56c74e8da01ff3a002bef2aa  rust-1.79.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.79.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  acfb935d96986b05d6f8071a75ecc62f404d64faa65b81b1bb025821cfd3507b  rust-1.79.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.79.0-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  24aab3cef43b4d8319ad7976313cfcbd6942ebd7a1824d39707f5629dc615ba8  rust-1.79.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.79.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  ce552d6bf22a2544ea78647d98cb405d5089af58dbcaa4efea711bf8becd71c5  rust-1.79.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.79.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  519abf4757fbd8d7e3bb4e4cfdc362ded972c1d95f04675684df2d31e8c0899b  rust-std-1.79.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.79.0-aarch64-unknown-linux-musl.tar.xz.sha256
-sha256  428bf4fb5a66e93c2e13a8cddae71e903559d8666c727f0d45ececc7da7d2404  rust-std-1.79.0-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.79.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-sha256  bae338708a07e26ac2f51c291478e33fb85fbff9632e2da2714f3d1a91c3773a  rust-std-1.79.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.79.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  fa6f5f03b68faf9b4449266e4836bcae24027fba7a3822a48822d772fc76c064  rust-std-1.79.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.79.0-arm-unknown-linux-musleabi.tar.xz.sha256
-sha256  1ba19c8e7dae60c7ae3f406545b65eef4fa6de31f3dd2fe83e0bbd06ade2c536  rust-std-1.79.0-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.79.0-arm-unknown-linux-musleabihf.tar.xz.sha256
-sha256  24fa88bf0aa867be686c7d26233949ae9dbadc10b1e9c6ed36930cabe48d69b3  rust-std-1.79.0-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.79.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-sha256  c2f906d1c9d130e06687eeea5ea50697485b321dd1a8e537200a52db508db361  rust-std-1.79.0-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.79.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
-sha256  73f3bc406ce4bcd4d64b7101a07a82bfff0f3cf793ba071b04c250c1feb08a03  rust-std-1.79.0-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.79.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
-sha256  af7707874d52823cce0323a4ae900ed34201eefab97f4781c8280bf33ecb68b7  rust-std-1.79.0-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.79.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  a17fde385e3f420f5f825e019b4739a469a4aece9071a7ff7b7ff3c8a0486245  rust-std-1.79.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.79.0-armv7-unknown-linux-musleabi.tar.xz.sha256
-sha256  74957092140452f41f39eceaeb0490054181a36c4d2eec53ab3a611bd3c8c38f  rust-std-1.79.0-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.79.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
-sha256  344e2190418912eb4415ac38a819202fd05c51e2b8f926d42cf43f5121e479d2  rust-std-1.79.0-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.79.0-i586-unknown-linux-gnu.tar.xz.sha256
-sha256  9c38f2cd4c19196fcf113166237ab03512bf19ce5a7f13c3bfe0e5cc3317eb44  rust-std-1.79.0-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.79.0-i586-unknown-linux-musl.tar.xz.sha256
-sha256  a9ba68598744117d10fa074535bb48585d4f6ad77170cbcb43841a56dc76f5c7  rust-std-1.79.0-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.79.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  158294f7c424ef75d84046b573f225c15d531745cc79d416a18c11aa8253830e  rust-std-1.79.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.79.0-i686-unknown-linux-musl.tar.xz.sha256
-sha256  a0087ba6e159550aab8ff93390faec42e2687ec13908ab3e45946c2769aea00c  rust-std-1.79.0-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.79.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  6aa2f351bc7dccb544781f4fecddb5ef67e05bb310c84e0106d968231384d9f4  rust-std-1.79.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.79.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  af95929af71494ee3e6988ead07204ea05b6f2b729cdb1ffcc26db75e47bf318  rust-std-1.79.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.79.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  3b5d53d70837d5ec942ec41a8da37ed932bbdc1e53f78dc54e218db458701588  rust-std-1.79.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.79.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  2b8af4060acb10f347c66a3477ae92151beba12192590ea40723dcf9b1f7f5b2  rust-std-1.79.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.79.0-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  d70e710a5138871e8d972f195ced9f7aa639ccef23a87fa03cc527d2b9c3cd36  rust-std-1.79.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.79.0-sparc64-unknown-linux-gnu.tar.xz.sha256
-sha256  f7c7a73a8e5640f9d5aca6b26866b4da08cf3d3509ed1c4184309fb868acbff2  rust-std-1.79.0-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.79.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  2c914483c0882d44af2e50a181cbd2c953d672d50b31aa669ee2346cade1f108  rust-std-1.79.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.79.0-x86_64-unknown-linux-musl.tar.xz.sha256
-sha256  30b9418561e6a7c18396a259304d3ddb4ad9d262f0ed6f227e08d232b8b32e8c  rust-std-1.79.0-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.80.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  2e89bad7857711a1c11d017ea28fbfeec54076317763901194f8f5decbac1850  rust-1.80.1-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.80.1-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  9af695dd4eacb397c2169abdfae35c6342f210d04632571d5faf924fa2cc6d39  rust-1.80.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.80.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  52706cabf6b9fc504d5b1f8f1605787bb7950d79f157f913b7cf38a59e138b22  rust-1.80.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.80.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  9a67bbade030cdf2ffbd3765d1c937586837b4265a90a97e2378e9f5687a4ed0  rust-1.80.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.80.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  97d5bfcd8a4f2787030bfbdccb4866c993b681dd9964651f080e91ba71e9f26b  rust-1.80.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.80.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  a6845a414b0fc199f3193a202ed5e00bc8244bcbdfc5dec5e02f7d7ebf5ce5a8  rust-1.80.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.80.1-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  a51fed0090f31fba0998bb0f2822cbf9e1ee513f6a1e58a936afc9e758d6ed8b  rust-1.80.1-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.80.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  85e936d5d36970afb80756fa122edcc99bd72a88155f6bdd514f5d27e778e00a  rust-1.80.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.80.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  8fc4bfc3a5fe64f8530964a5ea3bda95e39357eff14d6a8bb24f010ecc912923  rust-std-1.80.1-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.80.1-aarch64-unknown-linux-musl.tar.xz.sha256
+sha256  1ac3c0ba6d3afec73bfeeac8ed8d812eb3c00c5202f2c24e57951a510d183882  rust-std-1.80.1-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.80.1-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256  106567c06b8b240fe20071f8b0184b404e629c43ee54511b4f81f7fdbb5e7247  rust-std-1.80.1-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.80.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  f0dd131f05e0801fcff35a23015fe83027865b936bccd402c8a9164400d27769  rust-std-1.80.1-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.80.1-arm-unknown-linux-musleabi.tar.xz.sha256
+sha256  1460617746d7e1792005f5378450d47d13db2d08cbc6c1102750ac7f49fc148f  rust-std-1.80.1-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.80.1-arm-unknown-linux-musleabihf.tar.xz.sha256
+sha256  a144f885daeacb67df4adb524cc0ca43dfb1f18725407dde598064ab5bf9325d  rust-std-1.80.1-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.80.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+sha256  f45cdd02b0f45e7350e5eef929e55393134f11cbba32ab9eff1f3ae0891d7660  rust-std-1.80.1-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.80.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
+sha256  89b9a9e0ccd4b1540ea7664acd4269f54314dc6b3df748f78bcd2736b6c3b793  rust-std-1.80.1-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.80.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
+sha256  36f5d0e3a3036c48d9199e836ee3ed3161a8127b930cce7ec5e997e219c71f45  rust-std-1.80.1-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.80.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  a69873dedf9e1d156aa105f5f85aa3b47816bd52bf233573d2f04721014eec68  rust-std-1.80.1-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.80.1-armv7-unknown-linux-musleabi.tar.xz.sha256
+sha256  99fa7e5ef4098735d09bd9a08987e4c74efe04081b09aa209568946e2fe21a8e  rust-std-1.80.1-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.80.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
+sha256  40aa0b576216284d5f9aa74e45ea99e44ae207e817a76ff4ade8b64b21d391e1  rust-std-1.80.1-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.80.1-i586-unknown-linux-gnu.tar.xz.sha256
+sha256  94927cdfa7cad391700b1a77730bb17aa364831ff6a6c40ce6500a14c1314647  rust-std-1.80.1-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.80.1-i586-unknown-linux-musl.tar.xz.sha256
+sha256  abefa57c02dbc1c04d1f5130714d64370245b251636d34b54bf9ee0875bca835  rust-std-1.80.1-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.80.1-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  6547876dcf243aeeeadaa38dbdce02c316b6f83305a5337520e02eaffc90834b  rust-std-1.80.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.80.1-i686-unknown-linux-musl.tar.xz.sha256
+sha256  329f1bd3a0543822038d55219c74b1168eaab2c5fbcf6baa8a8768cfa133c625  rust-std-1.80.1-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.80.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  88e8144c25ef8347471dd53eea7af62e5b31eadf0788f4a82be7560f5a0be255  rust-std-1.80.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.80.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  cb5ad871a0a7efe7c270cbf319d006a84e8f8526acb22ce941f2840fd0e368c2  rust-std-1.80.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.80.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  06633b26384cba594424ec02acf0d64d4724033a856a2e039a18a518cacf1d3e  rust-std-1.80.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.80.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  1fbbe8df7596682466ae2fca534d5f6bae8b3f32577450e2632955268a786a06  rust-std-1.80.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.80.1-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  e732ce690fd63e3c2576bfe83a556031c4805c17b35b8a1c1a0ddde5cee31d46  rust-std-1.80.1-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.80.1-sparc64-unknown-linux-gnu.tar.xz.sha256
+sha256  ee7fa0104b019eec22750ac635e699d21dbb5430fc6982c495533900ec568d5b  rust-std-1.80.1-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.80.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  b793405538d8b6ec1632779efa8835b07b8987db2008c5c9c809bc4b17dcb121  rust-std-1.80.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.80.1-x86_64-unknown-linux-musl.tar.xz.sha256
+sha256  c5b9d3914a129cfc7618a3e9c5d282821da2fb402a6305833d43674c41d303b2  rust-std-1.80.1-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index 1c9b0466b3..84a696f747 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.79.0
+RUST_BIN_VERSION = 1.80.1
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 1a0fb0dec2..121676ea24 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,8 +1,8 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rustc-1.79.0-src.tar.xz.sha256
-sha256  ab826e84b8d48ec6eda3370065034dea8c006f6a946d78a9ba12bcb50e6d3c7a  rustc-1.79.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.80.1-src.tar.xz.sha256
+sha256  6ab79b70dc57737a1de378f212fcf8852d67fe6cf272d122a15b3ea13be77947  rustc-1.80.1-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  23f18e03dc49df91622fe2a76176497404e46ced8a715d9d2b67a7446571cca3  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 9f644b71ab..3159916623 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.79.0
+RUST_VERSION = 1.80.1
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
