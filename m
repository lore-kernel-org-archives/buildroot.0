Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3875BCEFD0C
	for <buildroot@archiver.kernel.org>; Tue,  6 Jan 2026 22:16:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0808360D5E;
	Tue,  6 Jan 2026 22:16:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lRBqJzS592xH; Tue,  6 Jan 2026 22:16:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5847860C21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767737782;
	bh=RmpbWxzsmv3g2RjvB2hdRv0eA1Ugwy8Hb5mTacrcRtA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=if0nro2CY3AMGHVTLVveAFNdqMd1v7ov7Hkk1CbTvEld01hlPIP3x4/hj4SE17x/E
	 4gs3sH5NHu5rX4eqDI1Rd/QljsHD4uixCcnF7BxaUeEf60dlKZnYydUxoWnAzSzHZf
	 4mtil8bVAVOfso0763U6Q+rDRJ6rW4msrLlgqABNQOr47wKBbFVAsQNo1tK8AbO9Ws
	 Xqs79tPKiLQx2mUggawDp+7pQxdh8IzvgFicRBp/WJZEMHCA0Zy+4RX9Jir76T2zKd
	 S/SuY9jZ8CMw8SRpehuml2EYtBCfy33XACsY+kQqPyecrBwBm9hCtN7zh9nFHPTOK8
	 IDlcmYMK5hdjQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5847860C21;
	Tue,  6 Jan 2026 22:16:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 272B9A3E
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8E62C60BE6
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:16:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oknZobijkLiG for <buildroot@buildroot.org>;
 Tue,  6 Jan 2026 22:16:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DDEF960C19
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DDEF960C19
 for <buildroot@buildroot.org>; Tue,  6 Jan 2026 22:16:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD8E48834B; Tue,  6 Jan 2026 22:16:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 6 Jan 2026 23:15:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 417d2cd64a67c32a8a5be57b04d759da787a0a7d
X-Git-Newrev: b7106fb5e96dba007b9efe2e637be5ac0796d3dd
X-Patchwork-Hint: ignore
Message-Id: <20260106221613.CD8E48834B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/snort3: fix build failure due to
 missing BR2_PACKAGE_LIBTIRPC_RPCDB
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b7106fb5e96dba007b9efe2e637be5ac0796d3dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Package snort3 requires libtirpc rpcdb option enabled with non-glibc
toolchains since the bump of libtirpc to version 1.3.7 with buildroot
commit 3f3d6e43de9b4aac7df8545fd811171256f878d3 which includes upstream
commit:
https://git.linux-nfs.org/?p=steved/libtirpc.git;a=commit;h=7cea8ad66aecc21e6caae330b5d31075af399193

These build errors, caused by the forementioned upstream commit, only
occur with non-glibc toolchains:
https://patchwork.yoctoproject.org/comment/30091/
"but I believe it breaks the build with musl".

The build error during configure stage:

-- Looking for getrpcent - not found
CMake Error at cmake/sanity_checks.cmake:51 (message):
  Couldn't find an RPC program number database implementation!
Call Stack (most recent call first):
  CMakeLists.txt:31 (include)

was not yet found by the autobuilders but can be reproduced by this
defconfig:

 BR2_x86_64=y
 BR2_x86_corei7=y
 BR2_TOOLCHAIN_EXTERNAL=y
 BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_X86_64_MUSL_BLEEDING_EDGE=y
 BR2_PER_PACKAGE_DIRECTORIES=y
 BR2_INIT_NONE=y
 # BR2_PACKAGE_BUSYBOX is not set
 BR2_PACKAGE_SNORT3=y
 # BR2_TARGET_ROOTFS_TAR is not set

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/snort3/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/snort3/Config.in b/package/snort3/Config.in
index 9b96e7cb58..7171603aa3 100644
--- a/package/snort3/Config.in
+++ b/package/snort3/Config.in
@@ -17,6 +17,7 @@ config BR2_PACKAGE_SNORT3
 	select BR2_PACKAGE_LUAJIT
 	select BR2_PACKAGE_PCRE
 	select BR2_PACKAGE_LIBTIRPC if !BR2_TOOLCHAIN_HAS_NATIVE_RPC
+	select BR2_PACKAGE_LIBTIRPC_RPCDB if BR2_PACKAGE_LIBTIRPC
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
