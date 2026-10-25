Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458CF606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=r+GJ5s81
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1A30E60618;
	Sun, 25 Oct 2026 20:52:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mZAfWN-R39HQ; Sun, 25 Oct 2026 20:52:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 503BA6061B
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961575;
	b=cbaCMRrXBqjsAJUONtXxznFrSQnvyeBCJNWwSVgMwUkzq5QgSem24eGO1Bg1naRKoy3f
	 XCKrNoGmZdtkEzuirSIIkVmNQNY5/6dEZ1JTibPjB7ACBp+SxqUEHqg45wHyltyYU0Tfl
	 FOS+njB5z83md+nmuhlLsDyhV8DKeIkT1govfE1/xrW03EpoAcyh21fu8FgRczJRfDl++
	 XrjjvroJKb59w9B4UBk1WPAJtIq0Jhm2gr6+fyMiEKE7sQdHfOMVyuLMProunMk+Qxk8A
	 2gSiZykx/yIXjCiUlX4roWk4cqvZvA6n5OBk/Xs2ShN8JAaHZmAFlOeAucKt55elgPA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961575;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=jsx1pwZk4uIzbSTR2qfoKW/2NP7B+LO5tx8WI0Jy22c=;
	b=PjZ4oxWH2XDSUIx32p6XIpDyFYlVYMukOY5aekCZzprohHWmcguun4Xc3+wO6w3I210v
	 sHZdfgFt7p5PKVpQBPaT+4qr9DTRL3cffZGAgqV8qm/Su7Xg5f24QHM4di+DVxwTQ9D3X
	 7ZGaS6/QMcViURdpb/uo/Mla3T4JMPygTY7zrSPzG9eEjrphSADoDUHLsEeS+GanU5RTB
	 cxdynY9e+VJ/AZQ2ToBAJeTWnu0br3Jzgyc0dcmrDiLkED5QUqPrz3hKhUqDAzrWjtbTJ
	 P6FFkjniFqxvw04JwxKhVhU7tD77GJvLZnYTri0WCswKnHbWYPL2yX9z35ztZjfvYuA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961575;
	bh=jsx1pwZk4uIzbSTR2qfoKW/2NP7B+LO5tx8WI0Jy22c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r+GJ5s815zUiwMzYTLQRJvAJWdVSBgpMkATXk43GgFPuydCnkLSxvmdtE1GHW6Vin
	 fdPgPlanrEpyZo6HPdTFU2Xi4oEEri6TzthQgYhiIxCc2PKojvS3tiebPVg17S30BF
	 Zk3zpE6lVEUyulTZrUawVK6k4fSUHZoMrDdXLRT1LxdBTjgbEk1H8+jijNz4hQtQOO
	 lmZfIJ4Z9YldqKce+obazp0mo3mkuxWQ92cfCPnUEOaDsyA7xH0CrEGAGAcKoqHPgl
	 0DY0p65/WHyCOX3Fd0vKryiYHhuh6l8yyrpLpCmPpaUTCo1Zte3frvepE7unDlhC9H
	 A8ouwWldUJ1Cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 503BA6061B;
	Sun, 25 Oct 2026 20:52:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7007D380
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6221240057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bCnwA5om13MA for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:52:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 8C6E240070
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961571;
 b=EnuLn+SCyBvV82sQbIwqRlQCcm9jUrZOtPP8VFkeKpCKt3J51K5+iap/ogkbbQQYvAbK
 jCeWx+Nz/VIYQBVKoNXLI9aFLgG6MJeTXbe3ohh6YGDJBTsOQfRX+nAGDTDPWYtcKOz2a
 ikFH8yTYsBLriKJr62aaReaU0EFZrGNNjEJ4lrdXOUhOCa0aekIxbq1Ynvk2RwXxxUoMs
 DRy3hwjge0Z/lgYSeH3BBrYY8iqekHIs0gjFKZOhQUKawy/ZNNkW+BW6oNYffshbVVOrQ
 WbrjXFWoaKqN98lMNQ/cnGq+hihr0x0t2ZvtxFQ6uKKmjXTjzx7j20Qwb4BcVIoQgEQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961571;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=fj98FnitHt/u1oIWMIhXE9H9R6FGA13HDABR97DwcRo=;
 b=Ei0H6uxjOTH8L1kFlSiuFOcCY54GM++BCOYBlc2ozvVtylYsbomNTe7nAQpV0AVAdxj7
 AH2GJdn/J8jkwPgf3+ukhjhKOgUT5MkQYnNCc8Ru96QttBe21gsbl5RtxTd7gscha8VoK
 VCnbcWtTz6mjYGTorL8+OVG0D9gS7FTqTaERrVcvSHJhfkw/sQu1p3LexXadadR88seEN
 rCzviDXYcDUwBKAbeYK56kITurdvgDJqsm4GzRXWNWa6d5H1yYJwlj8f5EGEHrTm4Pvkj
 e2lVttJTKM3TZ3mBEagIbXKHJwSQrVlY2xhLaH5ytBSoxZ9QOZ4P4S1a1VbaMkN8qvQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8C6E240070
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:52:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CABA99CEAF; Sun, 25 Oct 2026 20:51:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 21:52:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e9c404540fc93d37cd7a9aa1eab70a5b1ada3065
X-Git-Newrev: f1c8d3132e42a7156b27c77f39f11502975caf02
X-Patchwork-Hint: ignore
Message-Id: <20261025205125.CABA99CEAF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ebtables: fix arm64 build with
 kernel headers >= 7.3
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f1c8d3132e42a7156b27c77f39f11502975caf02
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

With kernel headers 7.3, ebtables fails to build on arm64:

  [...]/sysroot/usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?

Linux 7.3 changed arm64's asm/sigcontext.h to use the __u128 type from
linux/types.h. ebtables bundles an old copy of linux/types.h, lacking
__u128, which shadows the one from the kernel headers.

Backport the upstream commit dropping the bundled copy. ebtables only
needs __be16 and __be32 from it, which all supported kernel headers
provide.

This issue has been present since commit b216661a73f7
("{toolchain, linux-headers}: add support for 7.3 headers"), which made
7.3 the latest kernel headers version. It only affects master, no
release or maintenance branch has 7.3 headers.

Fixes: b216661a73f7b8e21290a1bc9033e7f9b5fb230e ("{toolchain, linux-headers}: add support for 7.3 headers")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...nclude-drop-bundled-copy-of-linux-types.h.patch | 91 ++++++++++++++++++++++
 1 file changed, 91 insertions(+)

diff --git a/package/ebtables/0002-include-drop-bundled-copy-of-linux-types.h.patch b/package/ebtables/0002-include-drop-bundled-copy-of-linux-types.h.patch
new file mode 100644
index 0000000000..7249f7b5dc
--- /dev/null
+++ b/package/ebtables/0002-include-drop-bundled-copy-of-linux-types.h.patch
@@ -0,0 +1,91 @@
+From 7ecae356e508b11e9239a0fd3a234ff5af560a40 Mon Sep 17 00:00:00 2001
+From: Sebastien Bacher <seb128@ubuntu.com>
+Date: Wed, 7 Oct 2026 12:39:13 +0200
+Subject: [PATCH] include: drop bundled copy of linux/types.h
+
+The bundled include/linux/types.h is a copy of the kernel UAPI header
+from v3.16. Since the build uses -I./include, it shadows the system
+<linux/types.h>.
+
+Recent kernel UAPI headers (v7.3) changed arm64's asm/sigcontext.h,
+included via <signal.h>, to use the __u128 type from linux/types.h:
+
+  -	__uint128_t vregs[32];
+  +	__u128 vregs[32];
+
+The stale copy lacks __u128, so the build fails on arm64:
+
+  /usr/include/aarch64-linux-gnu/asm/sigcontext.h:81:9: error: unknown
+  type name '__u128'; did you mean '__u32'?
+
+The system header provides everything the bundled copy did, so drop it.
+
+Link: https://bugs.launchpad.net/ubuntu/+source/ebtables/+bug/2169809
+Upstream: https://git.netfilter.org/ebtables/commit/?id=7ecae356e508b11e9239a0fd3a234ff5af560a40
+Signed-off-by: Sebastien Bacher <seb128@ubuntu.com>
+Signed-off-by: Florian Westphal <fw@strlen.de>
+---
+ include/linux/types.h | 51 -------------------------------------------
+ 1 file changed, 51 deletions(-)
+ delete mode 100644 include/linux/types.h
+
+diff --git a/include/linux/types.h b/include/linux/types.h
+deleted file mode 100644
+index 23ea78f..0000000
+--- a/include/linux/types.h
++++ /dev/null
+@@ -1,51 +0,0 @@
+-#ifndef _LINUX_TYPES_H
+-#define _LINUX_TYPES_H
+-
+-#include <asm/types.h>
+-
+-#ifndef __ASSEMBLY__
+-
+-#include <linux/posix_types.h>
+-
+-
+-/*
+- * Below are truly Linux-specific types that should never collide with
+- * any application/library that wants linux/types.h.
+- */
+-
+-#ifdef __CHECKER__
+-#define __bitwise__ __attribute__((bitwise))
+-#else
+-#define __bitwise__
+-#endif
+-#ifdef __CHECK_ENDIAN__
+-#define __bitwise __bitwise__
+-#else
+-#define __bitwise
+-#endif
+-
+-typedef __u16 __bitwise __le16;
+-typedef __u16 __bitwise __be16;
+-typedef __u32 __bitwise __le32;
+-typedef __u32 __bitwise __be32;
+-typedef __u64 __bitwise __le64;
+-typedef __u64 __bitwise __be64;
+-
+-typedef __u16 __bitwise __sum16;
+-typedef __u32 __bitwise __wsum;
+-
+-/*
+- * aligned_u64 should be used in defining kernel<->userspace ABIs to avoid
+- * common 32/64-bit compat problems.
+- * 64-bit values align to 4-byte boundaries on x86_32 (and possibly other
+- * architectures) and to 8-byte boundaries on 64-bit architectures.  The new
+- * aligned_64 type enforces 8-byte alignment so that structs containing
+- * aligned_64 values have the same alignment on 32-bit and 64-bit architectures.
+- * No conversions are necessary between 32-bit user-space and a 64-bit kernel.
+- */
+-#define __aligned_u64 __u64 __attribute__((aligned(8)))
+-#define __aligned_be64 __be64 __attribute__((aligned(8)))
+-#define __aligned_le64 __le64 __attribute__((aligned(8)))
+-
+-#endif /*  __ASSEMBLY__ */
+-#endif /* _LINUX_TYPES_H */
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
