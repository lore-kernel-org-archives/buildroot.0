Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFC1606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 21:29:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=RWoiGsGY
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAD1640513;
	Sun,  1 Nov 2026 21:29:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3g-jZ4CQ3kqD; Sun,  1 Nov 2026 21:29:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 9E7FF40448
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793568541;
	b=RGIcHn6aRCLvQo2VKJBSpWT/aa5fuzGJDpGGbjIa6c3yGTs276/mWEqjsO1wpszYBEsk
	 Tr35+m7AMp2qxnVSNCOR+jIazqkaRYMd01ScxlV8AreFIRIqsFtqFATMnVBF1BAMis8xC
	 wCD7xEBwkRLuV6dUQNrbFIM/Shv++Hli1In2AFaAY5IsytgvvOew1ltam7TAF25ptlEPD
	 QmeZWqSBmWQsL4bIUqAYrGNQ105GHQAPOXEp39lUCqfa9N8Sezg8e9lUM8KJLE5N2HFp2
	 wsNfHEyjxdkLmF8XXNhNkfIAaVDDmeeE9PbHi0j7iegEGjQa/fJ1TUTIGnELh5TmZ7Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793568541;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Wa/KHH5wyCduRCuta/GGih8CRFJ5WS5YhcLhTof/BiY=;
	b=gxwD/i2NmTNiJbleeok133WwGVoPfI9jq/WjWPcWtpz9dhwcNaOeS6k//Aqi66TUF0Wg
	 klRs2ElFuIEIpsRIqKJ+CbjVYlrim4ErWchVio6ohSHj9yO3ZJaj3IS0Z5tgnTsemPAi2
	 Q3hu8taE42NHR+7nI/L4iY99/6OFlS5LX9K/plQBB4bGxOSs+gLZnsgyjMeXRfeJRSl7P
	 oEgafinS60UhexlrFjg4rHUni9RpBgLcsidXIc2uXNvclKdzyRk0UFcY8B9tmIRuxylFt
	 KohlT8OsGdkQYAgtyuR+4Cha2EVAmMX3ei4W3X/ma/+iX/RZV4nylThJ5zJHomCV2Bg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793568541;
	bh=Wa/KHH5wyCduRCuta/GGih8CRFJ5WS5YhcLhTof/BiY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RWoiGsGYE14NzzBE7+kjeqCprJNE1iTXU1J9VdoANBAfvx3bSqJqwgxzHMY3OiNPT
	 F2oVClXOeIEFOdtexp5VgSqhlGuO3hwkn0z3R7TLJLzefVcBgpVIkZ4M8BcopYXwsO
	 qbgYGUolCBZv8V4tsp/Iofi9J8bmJRNEsSi7AVUisMIUHPWVBN+8PTcWNu0vLxHXvz
	 k1ZajrZPSNDQz83pL0AIRr2N+SVI4RE04XJFQdvx1hVila6PJg18Scis3CyyLdobb0
	 m3gp3BzI6HLpRh/8GtdjJLgqXzYz4uim2oiFEQziRC5WQAgliw3My6ZaAQX2dXFnUJ
	 U4zo4+3mnp8TQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E7FF40448;
	Sun,  1 Nov 2026 21:29:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 730B9435
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:28:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 64A196060D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:28:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hP595oK648MW for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 21:28:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B67786060C
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793568537;
 b=pL8qdMrag22/javSONzO5kkILHSpSzQimSIrbKi6zA2395lK+QnM95w/hBj/llZn1sP0
 /lsfVWnJ9nb+ShBWGwz2kcNtmICxrX9frgvM7pQmIXRL+BZZF2Mo9tBOPhPVrxuVP6dez
 LjaVV7rNApzmTc31AsYg91K3YnIvANHVNv6ZuOoEznmoB4HxzNZGzOI3AkGcPyd2ybe3K
 adkdQ1jrrPHtnxj8K7xkoRaPU70lQMwgFDQ09ebtS9InKzMvSs5NdpF1WQxNbeQUVQC0o
 xHkBjKeXKBVeqoI5Shy4sX/rZJ6bOS5W2uYJ+xBA7gdCggvIuYqkCSm6a3tiXCryjyQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793568537;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=kh84OU9+5ALSKdFQsU6R7tBP2uzs5V0eGLaYcB7DY3Y=;
 b=fK07Pd1n/nrWzZwE95fE5fzdGHeVl8MgyIgHeFk/VkhbO+sUdshXotids20AClBVAjpl
 GsA6D9vqFY/bZ5lo+pI2ohFj6R1PolR+XdXpYtkpcc4Rfp7zL2UoYuTeqWrkU1OYUTPtw
 No6BLjkaUdBlsC6zG9QFoXu5nEUGS3fOwjOAtlizAFR9Wne73BFgcuHO1D03+0xv97KKs
 zhhlDs/QMaIaOHRxXJFKDGmYdPhb9la1F+Hzt7Pg8h8qLyMXfKYR3YnJDiLnbB0qMXnku
 nQHnpAHDyQGyg5p4vaUOletZXn8UpA8y+0FKzoEHy4glUepgobbkNY1y7hrmoKGoBYQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B67786060C
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 21:28:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5EC4C9D599; Sun,  1 Nov 2026 21:27:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 22:28:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8bace47b057ee8bbd165b69c876af02c2d894dc0
X-Git-Newrev: e3095fe471f6aebd218a669eebc8b717d71f7f13
X-Patchwork-Hint: ignore
Message-Id: <20261101212728.5EC4C9D599@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libabseil-cpp: allow building with
 musl
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e3095fe471f6aebd218a669eebc8b717d71f7f13
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

libabseil-cpp depends on BR2_TOOLCHAIN_HAS_UCONTEXT, which is not set
for musl, as it doesn't provide the {get,make,set}context functions.

However, absl/debugging/internal/examine_stack.cc only uses the ucontext
data structures, to get the program counter from the signal context,
and never calls those functions. musl provides those data structures,
so allow building with musl.

On 32-bit powerpc, examine_stack.cc assumes the glibc layout of
mcontext_t (uc_mcontext.uc_regs), which is different with musl, so keep
it disabled there.

examine_stack.cc was build-tested with the Bootlin musl toolchains for
aarch64, armv7, i686, x86-64, m68k, mips32el, powerpc64, powerpc64le,
riscv32, riscv64, s390x and sh4, and libabseil-cpp, re2, protobuf, grpc
and webrtc-audio-processing with the aarch64 and armv7 musl toolchains.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libabseil-cpp/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/libabseil-cpp/Config.in b/package/libabseil-cpp/Config.in
index aba065fca7..ea037f5de2 100644
--- a/package/libabseil-cpp/Config.in
+++ b/package/libabseil-cpp/Config.in
@@ -13,7 +13,11 @@ config BR2_PACKAGE_LIBABSEIL_CPP_ARCH_SUPPORTS
 	default y if BR2_sh
 	default y if BR2_sparc || BR2_sparc64
 	default y if BR2_x86_64
-	depends on BR2_TOOLCHAIN_HAS_UCONTEXT
+	# Only the ucontext data structures are used, not the
+	# {get,make,set}context functions, so musl is supported, except
+	# on 32-bit powerpc, where the glibc mcontext_t layout is assumed.
+	depends on BR2_TOOLCHAIN_HAS_UCONTEXT || BR2_TOOLCHAIN_USES_MUSL
+	depends on !(BR2_powerpc && BR2_TOOLCHAIN_USES_MUSL)
 	# absl/base/internal/direct_mmap.h only implements DirectMmap()
 	# with mmap2 for the o32 ABI on MIPS, and its 64-bit fallback
 	# fails to build with the n32 ABI, where long is 32-bit
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
