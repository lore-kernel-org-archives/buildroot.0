Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9343C53209
	for <buildroot@archiver.kernel.org>; Sat, 25 Jul 2026 11:08:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0752D60AA4;
	Sat, 25 Jul 2026 11:08:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id opQf-DnQ3WoG; Sat, 25 Jul 2026 11:08:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B71260AFB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784977716;
	bh=eNAxydEfmcAxRnb10aHfnZYTxpfj+/MB+q/vKjbY9XQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mJ7/JRrcbV6wc3zRpKr5tTcYoh/Ivgc2PfR0F18Jvlpal6yJ38xEwkjRvYbKbIhZw
	 zlRdT9HQ6xDDsJWF8h/sgGng6RHFBPZwEr2nznw6w2WCXmQuN9SVVcmGKDmTnfmqdg
	 i7yy0B2jMN3fo2fO4J2MgRVo9fs4DzwIPcz290CD2LmbIAkgJYPyDFq/QCLXBn/TV2
	 UMpz9pKq3BzzUd8+a4bX+xG6ZwG5Z9NKJlts6Re2FoN6E7lMJhRIJPS06g7oNUrLfB
	 MpCDzDEv43aHghMnEO+UzdPvjK2/x8R9lf2NmkjNirFwkT2XSMEbny3eUEJH8uC0Aa
	 QMO4SuP9oMi6Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B71260AFB;
	Sat, 25 Jul 2026 11:08:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0924B36E
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:08:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 06AC560656
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:08:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A1GOOdihfxQ5 for <buildroot@buildroot.org>;
 Sat, 25 Jul 2026 11:08:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BABF760638
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BABF760638
 for <buildroot@buildroot.org>; Sat, 25 Jul 2026 11:08:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 96C7D8A585; Sat, 25 Jul 2026 11:07:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 25 Jul 2026 11:43:31 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bcb48623faecb73e7b14469b31f4cec73c979cb9
X-Git-Newrev: 34d7758626db287c5c144a810444b1ec2ff61ed3
X-Patchwork-Hint: ignore
Message-Id: <20260725110749.96C7D8A585@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{rust,
 rust-bin}: bump version to 1.97.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/34d7758626db287c5c144a810444b1ec2ff61ed3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://blog.rust-lang.org/2026/07/16/Rust-1.97.1/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/rust-bin/rust-bin.hash | 132 ++++++++++++++++++++---------------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   4 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 70 insertions(+), 70 deletions(-)

diff --git a/package/rust-bin/rust-bin.hash b/package/rust-bin/rust-bin.hash
index dc8a824916..7a8ad8323e 100644
--- a/package/rust-bin/rust-bin.hash
+++ b/package/rust-bin/rust-bin.hash
@@ -1,72 +1,72 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rust-1.97.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  4c88fe30a748a8853c19f4e8876a64b32005bc4cbcde48e93732d06a430e808a  rust-1.97.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.97.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  350e11f486d12e53849e267106a372d7f4e2da9e8996d05fc0a198b60260c723  rust-1.97.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.97.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  f5b3a24a8286e25dc89dd5fc2b7ddaa475fca213fafe914ca986a8254c091bb0  rust-1.97.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.97.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  ca3b47cd902b78920bc104cf77629c689031858843b71982bb7575a1e727ac53  rust-1.97.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.97.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  875963c3080f6c4ae005e8451d418e50f384452bded8cf22d80dc7a862f9d51f  rust-1.97.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.97.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  cad4079134783f9f429446733bdd0b3ea461a4445c633139cd7d5b57a4f5815e  rust-1.97.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.97.0-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  0ad9d9139f21daac91f0291e7b4bb0b764fc9b54e825a250167fdec39a4f4c35  rust-1.97.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-1.97.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  1cf17e4905b841d4c8e3f76467ac148d55fb3f54bf213c86f0d287a36471d904  rust-1.97.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.0-aarch64-unknown-linux-gnu.tar.xz.sha256
-sha256  b6a90dab26527f17e7e395e24b2d79976e30432c41feb073fe920d3b26b709a0  rust-std-1.97.0-aarch64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.0-aarch64-unknown-linux-musl.tar.xz.sha256
-sha256  91b55028112e6a978386de46013820d921330f0a182d11900f117e9f0f4ef338  rust-std-1.97.0-aarch64-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.0-arm-unknown-linux-gnueabi.tar.xz.sha256
-sha256  beed3d3aee1d3e6ff33cd80f354ac16c7e910a48701f6698e8e1e6491865ebf6  rust-std-1.97.0-arm-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.0-arm-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  45cb88efb2c437b99a0cd8d984f4c8b74fec71fded4085c707d2104120a2d6ef  rust-std-1.97.0-arm-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.0-arm-unknown-linux-musleabi.tar.xz.sha256
-sha256  625646781404fe867b072b3ff85b40afa5416597ce36751d61a9e08b31f12a11  rust-std-1.97.0-arm-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.0-arm-unknown-linux-musleabihf.tar.xz.sha256
-sha256  1a574e984ff99494c97c3c09ceec3f626648b5dd0a26a24d55b8ccd59f011e7d  rust-std-1.97.0-arm-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.0-armv5te-unknown-linux-gnueabi.tar.xz.sha256
-sha256  62a3080de4099cf82df182fd1a68cd2ea565a62b5c9318a77c6fbff513e71005  rust-std-1.97.0-armv5te-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.0-armv5te-unknown-linux-musleabi.tar.xz.sha256
-sha256  eb74ec8d7ab2a5a945eb5fb880d4f97b1a9b2ba4d26249c548c31e0f0cc194fd  rust-std-1.97.0-armv5te-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.0-armv7-unknown-linux-gnueabi.tar.xz.sha256
-sha256  ac88e7a716aefdeffab8b6a60d6209a966f7912ff842600b8db4aed1e54173fa  rust-std-1.97.0-armv7-unknown-linux-gnueabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.0-armv7-unknown-linux-gnueabihf.tar.xz.sha256
-sha256  b756f6494060af5be0aa6ef63cd6fe3136945a4bf56526ea266ac5558558f7c1  rust-std-1.97.0-armv7-unknown-linux-gnueabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.0-armv7-unknown-linux-musleabi.tar.xz.sha256
-sha256  3621d41c793a6c9ae7af618f3487bf437b649b82d51e7a27dca9d54fd0ab2a38  rust-std-1.97.0-armv7-unknown-linux-musleabi.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.0-armv7-unknown-linux-musleabihf.tar.xz.sha256
-sha256  c72fa99cb47e375005721965f52cdae0aec39469b47fc7b371f61062abdcccaf  rust-std-1.97.0-armv7-unknown-linux-musleabihf.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.0-i586-unknown-linux-gnu.tar.xz.sha256
-sha256  06ace8aed18f342fe401321ca388e56f53074f2a314173c6e52a010fcb924e10  rust-std-1.97.0-i586-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.0-i586-unknown-linux-musl.tar.xz.sha256
-sha256  438a6ecca6d070f7477cd1be1ff30d3bda4f0aee710c6e7959db44ea597f7391  rust-std-1.97.0-i586-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.0-i686-unknown-linux-gnu.tar.xz.sha256
-sha256  d2f3b3dea7d37e39b2d4d765d95d9a41d8dc189c78fe93aadce6bb2b7a790e5b  rust-std-1.97.0-i686-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.0-i686-unknown-linux-musl.tar.xz.sha256
-sha256  14db5d9d53d2d489583b9cabe0d03a8c360c70c72c8a69ff55d7f8df632d92db  rust-std-1.97.0-i686-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.0-powerpc-unknown-linux-gnu.tar.xz.sha256
-sha256  8639b66e2645296c60bd5984b96dbd11397bdede0866008bc70e77926395c827  rust-std-1.97.0-powerpc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.0-powerpc64-unknown-linux-gnu.tar.xz.sha256
-sha256  8d405b238bd4a0c5449853c7ec2aca6d7b7b3a3c72a4990a6b38672814d53ee5  rust-std-1.97.0-powerpc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.0-powerpc64le-unknown-linux-gnu.tar.xz.sha256
-sha256  5243a1a6cd056a6ff573cdf2e025add2b5a0e302a8aaa078448c9015cd76ca38  rust-std-1.97.0-powerpc64le-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.0-riscv64gc-unknown-linux-gnu.tar.xz.sha256
-sha256  3f85d376cf088d69dd5c507cf10b4180d7e2cd9a23a175c6e8514302a08e94a2  rust-std-1.97.0-riscv64gc-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.0-riscv64gc-unknown-linux-musl.tar.xz.sha256
-sha256  255b4b4b4cd4757081e945d1d5e1adc1040285f791af21a9b0614a573464e8e1  rust-std-1.97.0-riscv64gc-unknown-linux-musl.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.0-s390x-unknown-linux-gnu.tar.xz.sha256
-sha256  2e90dfd2ddda36357dbc29c77e82d5dba27c4bb03eff7a345574ea9d59f69339  rust-std-1.97.0-s390x-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.0-sparc64-unknown-linux-gnu.tar.xz.sha256
-sha256  8a1832cda997f3937b10d44e76aed3f47cc10b3ac91425d02c9c102c35e98b09  rust-std-1.97.0-sparc64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.0-x86_64-unknown-linux-gnu.tar.xz.sha256
-sha256  0c43618128a7a6b96b0b04c04cf7b28dd52fb0991a74c9615fbd1a684ff88712  rust-std-1.97.0-x86_64-unknown-linux-gnu.tar.xz
-# From https://static.rust-lang.org/dist/rust-std-1.97.0-x86_64-unknown-linux-musl.tar.xz.sha256
-sha256  9744b43bed4a89db05e83dc8054d3e92e23ddb70a6c08c54ccde9a58d7b28627  rust-std-1.97.0-x86_64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.97.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  9a7a2c336b4787f1b72f6bab7c35d5b7af2fd03cbd39b4fc721466a70d402a7d  rust-1.97.1-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.97.1-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  1687b56e6e7585dea809ab7b82d93f35417f3760a76c3d0d7f6dec252ff1751b  rust-1.97.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.97.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  20ab44739bfab46765ca81b34450e5330bf28b0ae57ac8936eb27f40ec9edb7a  rust-1.97.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.97.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  fd6351ec454acceaf240710db5ba79e5613621597cb204273cc8364ab61c65c9  rust-1.97.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.97.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  d27b74ae1e480f006847240816198854cac3f9d5c87162aa7f36743049ea90dd  rust-1.97.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.97.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  2982687edabf8582b21a5497fed8dd5287a24afdb836a64b206959cea81ab947  rust-1.97.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.97.1-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  681058956b17bec84f97636e28ebc740252bfa92e0856c9289efedf5d475ad84  rust-1.97.1-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-1.97.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  88f28fa9af20594179f85d6df67078dfd6fa93e2f6da5e1e9b0ac4997988ca4f  rust-1.97.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.1-aarch64-unknown-linux-gnu.tar.xz.sha256
+sha256  46aed8e63186350004d8ec6afca798811e6530b514352e5a8a26f3dc4939b3be  rust-std-1.97.1-aarch64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.1-aarch64-unknown-linux-musl.tar.xz.sha256
+sha256  49ff0879d94e2e8e86d5e85eb15a9215943e8c78b51363d6553443598cab5d31  rust-std-1.97.1-aarch64-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.1-arm-unknown-linux-gnueabi.tar.xz.sha256
+sha256  848e297b012f317024ec4fd29da09f19a5a5b218b0c82b1fd4d6e01d41887d7f  rust-std-1.97.1-arm-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.1-arm-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  5b1a03e3f6b021b2bc288a98011e1174a527922dbf4ece64d299472cf87b9cac  rust-std-1.97.1-arm-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.1-arm-unknown-linux-musleabi.tar.xz.sha256
+sha256  b34c41e16da76fedd643bbd85a97e0f98f09bc84da06c981822499e0fa47565b  rust-std-1.97.1-arm-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.1-arm-unknown-linux-musleabihf.tar.xz.sha256
+sha256  5ed275942f32c7b0250e2a6949a2e57ac99ce2b8ca53f616792f52b7b9345663  rust-std-1.97.1-arm-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.1-armv5te-unknown-linux-gnueabi.tar.xz.sha256
+sha256  e97e1be61ce41ccba61cc9cfa7366772f5ef8ebefa3cc2e62ee4affcd1eaa7f8  rust-std-1.97.1-armv5te-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.1-armv5te-unknown-linux-musleabi.tar.xz.sha256
+sha256  7b1691c9c29a04a97a287354cc077261b3cbc8a28e2f5d4e26cdbfc27bafbb67  rust-std-1.97.1-armv5te-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.1-armv7-unknown-linux-gnueabi.tar.xz.sha256
+sha256  0913df53a3dcd90aa86c58bd9cbea91cce98c5d5db4c06e18ff1fdc55b957f12  rust-std-1.97.1-armv7-unknown-linux-gnueabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.1-armv7-unknown-linux-gnueabihf.tar.xz.sha256
+sha256  3823992fb0b7cb172b4a9eb8f03662013911ff00e1adb94e4c5fa00e4bd15686  rust-std-1.97.1-armv7-unknown-linux-gnueabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.1-armv7-unknown-linux-musleabi.tar.xz.sha256
+sha256  ad50b2c455548ca7a7660251a6b8ea09156182583204053da9ea000b50723ab6  rust-std-1.97.1-armv7-unknown-linux-musleabi.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.1-armv7-unknown-linux-musleabihf.tar.xz.sha256
+sha256  7410ad19adb666624ffde8240353e3960b2c6cdbe2d3203f4615220db4b4ef1c  rust-std-1.97.1-armv7-unknown-linux-musleabihf.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.1-i586-unknown-linux-gnu.tar.xz.sha256
+sha256  a3090f555a9c3fd91d3c8b73152eee007fa348d20a8d026ea577a467acf5e7c7  rust-std-1.97.1-i586-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.1-i586-unknown-linux-musl.tar.xz.sha256
+sha256  31c8d12d96574b82d10254e45bae9eb8784c95b72820217465247aa100cb1029  rust-std-1.97.1-i586-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.1-i686-unknown-linux-gnu.tar.xz.sha256
+sha256  7f4be0697e96dd81f75f66f0e25a51d595223e7c58af6675810f066cab6ef584  rust-std-1.97.1-i686-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.1-i686-unknown-linux-musl.tar.xz.sha256
+sha256  124b0afba7413ba39e3051e2d4d819a74a5ffe91f40371e09c8fb8ec05e9c6f8  rust-std-1.97.1-i686-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.1-powerpc-unknown-linux-gnu.tar.xz.sha256
+sha256  9c3286cc2aab1868f693cd458d5d7bf8c307aaf8809e9a2dddbfc31ece94629f  rust-std-1.97.1-powerpc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.1-powerpc64-unknown-linux-gnu.tar.xz.sha256
+sha256  58675598a59db1524e934a27f279b6669d65e91f53675d022fd5e32046c2742c  rust-std-1.97.1-powerpc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.1-powerpc64le-unknown-linux-gnu.tar.xz.sha256
+sha256  ab2fb5c9dd7d3a0987c97c9f56732d013a11796fcd1510651570ae2fcc512bb2  rust-std-1.97.1-powerpc64le-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.1-riscv64gc-unknown-linux-gnu.tar.xz.sha256
+sha256  5cec88477a70fe83c10a12efd6bdad1b0f8dd4c1ebba1e427f00c69666c5b6f9  rust-std-1.97.1-riscv64gc-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.1-riscv64gc-unknown-linux-musl.tar.xz.sha256
+sha256  3d4b7ca701a24e092f9256c9d68e117d9a7563dbb49013946763077f4f49d66b  rust-std-1.97.1-riscv64gc-unknown-linux-musl.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.1-s390x-unknown-linux-gnu.tar.xz.sha256
+sha256  6c6b2b285225f3551250bd4c5e05293a0839fc18d1625c545b81fbea9f82c31b  rust-std-1.97.1-s390x-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.1-sparc64-unknown-linux-gnu.tar.xz.sha256
+sha256  be689309aae0247e0a58a87b6ed69c28573ec5ec3f56766cb8b0b3066a3a0a70  rust-std-1.97.1-sparc64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.1-x86_64-unknown-linux-gnu.tar.xz.sha256
+sha256  1c1e704ae80126b7de34f72ea2825f7fd01736dec20732faed47374b95282fba  rust-std-1.97.1-x86_64-unknown-linux-gnu.tar.xz
+# From https://static.rust-lang.org/dist/rust-std-1.97.1-x86_64-unknown-linux-musl.tar.xz.sha256
+sha256  51d83178680556f73a5fa8ad865b76a1ff541867445c00fc65dc67246bc2de66  rust-std-1.97.1-x86_64-unknown-linux-musl.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1  LICENSE-MIT
diff --git a/package/rust-bin/rust-bin.mk b/package/rust-bin/rust-bin.mk
index cdcf731561..80f912d43d 100644
--- a/package/rust-bin/rust-bin.mk
+++ b/package/rust-bin/rust-bin.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_BIN_VERSION = 1.97.0
+RUST_BIN_VERSION = 1.97.1
 RUST_BIN_SITE = https://static.rust-lang.org/dist
 RUST_BIN_LICENSE = Apache-2.0 or MIT
 RUST_BIN_LICENSE_FILES = LICENSE-APACHE LICENSE-MIT
diff --git a/package/rust/rust.hash b/package/rust/rust.hash
index 67fb0863f2..d3cad8bfab 100644
--- a/package/rust/rust.hash
+++ b/package/rust/rust.hash
@@ -1,8 +1,8 @@
 # Generated with utils/update-rust
 # Do not edit manually
 
-# From https://static.rust-lang.org/dist/rustc-1.97.0-src.tar.xz.sha256
-sha256  de002ee301c1b7422b0a7b09d7c4cb4924cd3224e6cfb24f065dad786dd3ed12  rustc-1.97.0-src.tar.xz
+# From https://static.rust-lang.org/dist/rustc-1.97.1-src.tar.xz.sha256
+sha256  0ed06fdaffd4722a7702e0b4eebfafc897ab8f513e8e1b247cdd7e5c6df6ded2  rustc-1.97.1-src.tar.xz
 # Locally generated
 sha256  62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a  LICENSE-APACHE
 sha256  b71bd43a069ca0641a9ecfe585ca7b3c53b5cc1608f8b68321168698e28b5ea1  LICENSE-MIT
diff --git a/package/rust/rust.mk b/package/rust/rust.mk
index 08758884c6..448ee47fd2 100644
--- a/package/rust/rust.mk
+++ b/package/rust/rust.mk
@@ -6,7 +6,7 @@
 
 # When updating this version, check whether support/download/cargo-post-process
 # still generates the same archives.
-RUST_VERSION = 1.97.0
+RUST_VERSION = 1.97.1
 RUST_SOURCE = rustc-$(RUST_VERSION)-src.tar.xz
 RUST_SITE = https://static.rust-lang.org/dist
 RUST_LICENSE = Apache-2.0 or MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
