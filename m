Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392C3606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 20:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GTAFwkJW
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 162EC60619;
	Sun, 25 Oct 2026 20:52:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D0eQY6xzoi-I; Sun, 25 Oct 2026 20:52:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E5A0B6060E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792961574;
	b=Oz88ocR1hZUTEXqAzk8oNKh7dzz1DvH8IEt0FdIj8W3cvcpBsLpH0yFI6Zh9UmycToYM
	 PHuAjFs8bnNwuKZfW5AJBb251d4X5EeDLov3QCBVr++FhSxzyyNdTC1UfQOepEg355yf2
	 N6ZR+gRBBXZ7jXutSMoEQlyOhBqzhdWWklB+Bakyt4suJS3mTGK+iYBkd0OzAy+/YicjE
	 9Pvksk5l1Cr92l3VMoe9b5OJ8OHnqZG8HwNQqEnHTUGaiLigyCSvPy6uv7PQJwLyWArNp
	 sbkN+acCLktciAH/P8Wi7NXx+QC2g7POEyS/J1ALN+oWMuLIXKNArP3Ez9LzeCaG82g==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792961574;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=D3qdVGpmvihKByr68nrtN8DNJCdxdvguy8vBUho13+o=;
	b=dR2iCWmJWW8Bj69Upe8EQkAcV6h7/YNTk6ku+loxihZwfdtCtIL/PHQjbqOrGLJ5VY6c
	 htkCoJPd0GFepQp0phsQObt50ljE5w9+jHgseZG25XdIHUMNFg/sa6WspitWOe2l3ACl+
	 itO/0Kef9k3ivz6m1Zu0EJu1+iupszEoReqFFQSzyRlxD67Sd3pgwLq0xvAvmAibKmAir
	 XDf1Xy7NU28t6MqWGHHGJww3K/qEvzgciBMQxerWgxsy/b4OZl7wa755jsl9IdvhLbaDw
	 3UlPpmG9gLF9ppKiTKMFPfwjpO6r4xSFUPKYEa5vO5fFEG7VevKe6qrgCdKpKk1ThhA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792961574;
	bh=D3qdVGpmvihKByr68nrtN8DNJCdxdvguy8vBUho13+o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GTAFwkJW0agem8nW1M+qeFXaX55Hz+5V9xsoakpolXX0R5WZCxTX1X+xNt6Jc+ahX
	 gaRvVWD6v1He3+zZ3RfQ3R79BIcuT0hlwRZvTckGwScO2ZfMnrRvksZvuVBx376Hgn
	 T5lMpeMD1YN9yZJx/Ryb0XYM9WNmMQkwW9bT1Wp0imcRRzJcy6MpfcgOoIpaxBpxqQ
	 Z91WG+pmg39pKUcbiC2qC2E6A5CJHZCH1o0+o7895esFanDxBrW+Dj3AvjroT1S9xS
	 5Z1lPV9qvbrDU96bBhLV5MYzxbsqIkQmuqgM1kjVVSIRM7NVbP6PG1L5+kAkBDpSJq
	 BJpy26m9ZTnTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E5A0B6060E;
	Sun, 25 Oct 2026 20:52:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4AE8A380
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:52:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 30F3E40098
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:52:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6d9zXqlKGUbg for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 20:52:51 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 643E240057
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792961571;
 b=jWEoUfHOdZKLSPKTWeGHtXKpuPdg22ll8Dwg0QnVgvp+cRW7S6v06ci3sBw5G55NG5cx
 EwvNbnSDXHCriWTJ7ijrdq0fK2gYXpxi7JyTl/xEyKQrCbLE8oE6QEgcefHZV9/Ovvp0P
 iMxLdBaMHNAmOTMG6lAbaHnqnYtrTOkxVGQRBcPyh+4MWf2Xee1sfF7VFTzSCyfcPUCLs
 cuA9awGRA+9J5UJhhKoq4hFzWuVejma7TyD0NoSqNFN3GfyfL9cAFh6G3ln6Z76xtU7K1
 0jBO4JhbkHWBgB7U+KrzirPX/NVb5IkAo7zcXoNb7YypPpf5xoEMEMLynkYjdaN1+UA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792961571;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=TRprSmUhxYaRdV77dibZBe8lI8uAa3chyRpp38nxTHM=;
 b=ERKcCVqWBZu78ANvLRsL9vcNQ5X9YHp9xY+qJiR1hFSOjRRllncjJ9aFBFuOo6iKe7cz
 3fQO7jY/3+FeRsWcQZN9OILbqF06C65bSuxADzxqvPROMi5h2StoJNCBRiFNjx60QyJa/
 6KXVorNO0nIsSZBOhXhpRfCoK7UElaqXODdoc1uyLHKpvy3B+9vDNZvk4JvgsMy4S3uCt
 3SpWGYbFNxs5zhqxVINAGXcYFhEkDJUXKNTIAUhUzjnxbQFHTPsjOsbzuLEwj8OB9N+q0
 QwzYYJ5lxByrYxi+yK0q2u6wc3+uW6sJFbO6DGD/gJWgTzYnTZpaE9gRW1MOuwdDjUQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 643E240057
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 20:52:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C058D9CEAE; Sun, 25 Oct 2026 20:51:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 25 Oct 2026 21:52:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 34c4d23dd1426b031df245a930f600f7888688df
X-Git-Newrev: e9c404540fc93d37cd7a9aa1eab70a5b1ada3065
X-Patchwork-Hint: ignore
Message-Id: <20261025205125.C058D9CEAE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iptables: fix arm64 build with
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e9c404540fc93d37cd7a9aa1eab70a5b1ada3065
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

With kernel headers 7.3, iptables fails to build on arm64:

  In file included from [...]/sysroot/usr/include/bits/sigcontext.h:30,
                   from [...]/sysroot/usr/include/signal.h:301,
                   from [...]/sysroot/usr/include/sys/wait.h:36,
                   from xtables.c:37:
  [...]/sysroot/usr/include/asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?

Linux 7.3 changed arm64's asm/sigcontext.h to use the __u128 type from
linux/types.h. iptables bundles an old copy of linux/types.h, lacking
__u128, which shadows the one from the kernel headers as the build uses
-I../include.

Add a patch, sent upstream, dropping the bundled copy, as was already
done in ebtables. iptables only needs __aligned_u64 and __sum16 from it,
which the kernel headers provide well before 3.12, the minimum required
by the iptables package.

This issue has been present since commit b216661a73f7
("{toolchain, linux-headers}: add support for 7.3 headers"), which made
7.3 the latest kernel headers version. It only affects master, no
release or maintenance branch has 7.3 headers.

Fixes:
https://autobuild.buildroot.org/results/3d3d40449ed637fc7cfe49872f35ed6667510058

Fixes: b216661a73f7b8e21290a1bc9033e7f9b5fb230e ("{toolchain, linux-headers}: add support for 7.3 headers")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...nclude-linux-drop-bundled-copy-of-types.h.patch | 92 ++++++++++++++++++++++
 1 file changed, 92 insertions(+)

diff --git a/package/iptables/0001-include-linux-drop-bundled-copy-of-types.h.patch b/package/iptables/0001-include-linux-drop-bundled-copy-of-types.h.patch
new file mode 100644
index 0000000000..96fcd29798
--- /dev/null
+++ b/package/iptables/0001-include-linux-drop-bundled-copy-of-types.h.patch
@@ -0,0 +1,92 @@
+From 7eedb693023c1218aa633aaaec266af1b9b01175 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Sat, 24 Oct 2026 15:29:30 +0200
+Subject: [PATCH] include: linux: drop bundled copy of types.h
+
+The bundled include/linux/types.h is a copy of the kernel UAPI header
+from v3.1-rc3. Since the build uses -I../include, it shadows the system
+<linux/types.h>.
+
+Kernel UAPI headers v7.3 changed arm64's asm/sigcontext.h, included via
+<signal.h>, to use the __u128 type from linux/types.h:
+
+  - __uint128_t vregs[32];
+  + __u128 vregs[32];
+
+The stale copy lacks __u128, so the build fails on arm64:
+
+  asm/sigcontext.h:81:9: error: unknown type name '__u128'; did you mean '__u32'?
+
+The system header provides everything the bundled copy did (the
+__aligned_u64 and __sum16 types used by iptables have been available
+since well before v3.10), so drop it, as was done for ebtables.
+
+Link: https://lore.kernel.org/netfilter-devel/CAD04=wrZafKknWixGGRZWtYD_ydfdL4Uk39s_RkwZ6WUEVATKg@mail.gmail.com/
+Assisted-by: Claude:claude-opus-5-5
+Upstream: https://lore.kernel.org/netfilter-devel/20261024135509.4097035-1-yegorslists@googlemail.com/
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ include/linux/types.h | 51 -------------------------------------------
+ 1 file changed, 51 deletions(-)
+ delete mode 100644 include/linux/types.h
+
+diff --git a/include/linux/types.h b/include/linux/types.h
+deleted file mode 100644
+index 630cd3bb..00000000
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
+- * architectures) and to 8-byte boundaries on 64-bit architetures.  The new
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
