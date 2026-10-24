Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBFE606A31A
	for <buildroot@archiver.kernel.org>; Sat, 24 Oct 2026 14:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SoTvZvJ5;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=Xa2u71oR
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BBDFC605F8;
	Sat, 24 Oct 2026 14:21:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9TzmFCcj9iqx; Sat, 24 Oct 2026 14:21:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B150860619
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792851687;
	b=noxUWSHXWwU+nlRvDng4P3mcGksMegvIEYilPennJVpThFO+em9lKz63fz2nUj5810VK
	 xGqEBUD+pUPZ6d9QaQi+mYMr4Zmn2Vw2yMufqQMShAbBeT4zxgUyTXNnk1RFsYTDhEf4j
	 iwC0a/U70jeLKerCv1KiOPYiYz6SPgDs8Phore09nhkh0Qn2StL/3CIqJ7UIwNY2h/tqH
	 G6Jwc2hPgwzkrXzzHXWAqAfstuEJwbv6XK60z5locpIKaO99aYzi6hEE6DQ2Os7Ek5nJb
	 RXYW1hXi92ZCCNNtTI1teFi0BMrC0OFXnBo8zbAmnedZVFgcitExFO3PzJEPgYwYtuw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792851687;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=owuBvqpq1Ml9fqn7fKHI/4rA6Ncsc/Xtd9HQijacAz8=;
	b=JXNGnMjJcuQTzQJacRfchRVIttnQMp32C5Lr1l09BE7FFuHyJrYFi7fyUrzHg9oa9nw2
	 mphtFQVIl3bKc43GK/PEmeOVQoc/Ap60ycII1PVZb8gIpDb751a29h0Odum2O+gtywhu+
	 Rj2WUDdlULtNZ49tNPEsj2gVAUfW0QC/lLAR7zOtrCbb8jZ0YwWujEqRqlvMewf+LvSnH
	 5vDqB8V7zHIJ9RQ12HfghO7ZkDvWehiDmw/Y75p2rPFjGt6pPorqFqpley79dsQBmhD2W
	 iUbHfQrFQMBQzfTBUJveYrUqe0GNR4r4EYSCYhibrX/FMu+BxetoRUILVPaXvKUGebQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792851687;
	bh=owuBvqpq1Ml9fqn7fKHI/4rA6Ncsc/Xtd9HQijacAz8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=SoTvZvJ5PlgkBeqCaOpadc1hLc34UuvWCAs1XM5vlmIlEzsuUuylDI8zyhsb2gKLG
	 oRWfZmTdUjAfR6FSAZqo9wt+kTny+9/H+Vspk9+1awkaySxVNcs3wcGEBhn45KCTmt
	 sw0cVCEXfnFFg8M4KTT2DcLKss1uYR3tbcXZKmLGDJzXVrU8jiIP7nWSe9+ypW3iHo
	 3EUeGud1HD5t0rt6XKn3AfJv8B+ihYsNsaDUJK81hGxAJtfkmFQRr1zjd7oxIXhznx
	 F0NA7AlG16zxccqkBMS75eV59gr+8E4efFCRlYtbL6OPz+IB2TE6QT+1cgZbgnK53G
	 veSnv3uobvKyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B150860619;
	Sat, 24 Oct 2026 14:21:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05A80380
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 010B181359
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:21:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HS1d13U12aQP for <buildroot@buildroot.org>;
 Sat, 24 Oct 2026 14:21:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9585381358
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::536"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792851686;
 b=OHeIyGjaDuOSjw4p8vMX1W8YjANFIaUixXWQVdHmhyQk7c2XFXm+MUvCJW5qlia5ZZMw
 aSqpKjfcO5UU5s47KXBGwarkPpdT1sI3yY1TzqBZzVhkTcZjCjeSqBkfRJAY5BgZlcsKV
 Kh603YgtWU24Qa7hJBkH2MaKentJEsvkxdC4BWZJA+z5RfEO5eaVTs/AF+sIMrRn09o5y
 iRtk/Mx8vzcfvZF0CEVmPYhVZalM9BKRCAadV/etgszDicaWlwiGqtNof8sZh6Osj6cwL
 KjD5u/Dqfxb6QiwyIzdFs2ttVjAUv3aMdyqtUS8J8fX3lrW2SZKbrQXkZ8Poju7maeg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792851686;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=af1EYe4XemsyswS1SlDh7QvwkjTnH+EVfF4KSJIX1Bg=;
 b=DAwiUqyz6PFsmImVCQwMWqq1/GQdcRA8HCaqozbblXjNuxFxC5QZx7glUSP29bty087y
 ShlnqPAMf3q4DiRBlAMInK9QFNlvZZl4jRM9KGECgCvKTeI7UeFGpol0UqJIC0JBQmzRk
 XnodCL52SbW1Hc3yoqIwLkhnBiezjhZdEFSlHriWq1p4vBuI7Rg7wf4gw5EleWDyc9CPG
 unp7q1EcEPMEyiH85H1Vdss3VURO5li6XDuNZvX3G7xrST9cmFLzoWYdYkhGiwrk7GPHi
 EoXhrnVRMfzbreRe43Bl0zAuJRnbkYVDHYRvbatX9qpTg+ir3utJpo3GsDlhT825qHw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=Xa2u71oR; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::536"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=Xa2u71oR
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9585381358
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 14:21:24 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6ae305e3bd9so2959248a12.0
 for <buildroot@buildroot.org>; Sat, 24 Oct 2026 07:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1792851683; x=1793456483; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=af1EYe4XemsyswS1SlDh7QvwkjTnH+EVfF4KSJIX1Bg=;
 b=Xa2u71oRbowjFF3IdaEdX0Y7wOLbwOG8P/20TxToDhPt3aG0gfQ8xraggs/2sTLgOt
 FHUOlJN5FkoEXapYFc2aW33Ivs5DkD7abb3RuZA/f+b4LsVXAjSMBwdF6ha80VS2I5Yo
 TRfPQO1wKVvfokfHYc5v1kQlV5OE7qKjQTuaysHQDne/3Si0pnYH/yq4tJ+I8+oGWZAi
 T/uNytHjP0ATLXIK9mUqo/xCsmeMcOnnlE9DQPmVfHaotTVzKOJJS7qgsZw2ooKAa90m
 RotNJN2OrnIpUJGs6QPcNucqkyn5BqbcZDpsqnFjPBozeaJ68jKmXQ6Vj9vAFo303yAe
 MRqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792851683; x=1793456483;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=af1EYe4XemsyswS1SlDh7QvwkjTnH+EVfF4KSJIX1Bg=;
 b=O4m1vNIp5YJjxIhgFsUbeiM2bLEsSOdEhKY+kaJd5vGUoFveNjP53wOuPav6nXPSwB
 ptKJCJjjzpzfkNCmKgNf9dW1Wnh+VWns9NUxVsPuFGXLAffHdyjk5dL+xfFn8Y9pYW8t
 lDlSN0o7bNXPoJwt5L+HartFYeG9DyxpXeoMEiSRo/0Td9WyOqEhHyYFn23MmsO48O+U
 lGMFp7YoctnquSmJaWqnToaAlBoqnCzb+Cwr0rptDXBvJB8z0oJX+C30Yv8XEieyKlGh
 O5vDfgAHO8dkOdH2Fhb/gLc9woq06bQkSMOLJEAd6Gd9jfSAJht0WD319o4Lb4XY5LeT
 sudQ==
X-Gm-Message-State: AFq9FYL+lIyhEn9VsUFbgehh+PoTMYRPX/hjPX0GdthSfpY6lqqqFeuh
 YuaSaiujW6mpKTbsTKkRdHwYgw0IoaZGkWe3jqtjCDlTBB9x87GO1ziy1uWoNw==
X-Gm-Gg: AYBFou18P24DcTMufKk1kVnjJ8knotWCuVvIwGRCAz5oJ2mkWs2GqlOu7Wa87bYmRRY
 5tT/1LAwb/fxuhDP8iDpISCfCtmAIl5llzPiWD/E9bnyVRUdSHKvzHy6MFd+qkF9mMBItZcOuKv
 ZT5XzrVn87Cg1+ZuK/pUFgZc4MbRD+Gw46GGPiK737lqf5933afZPPQl54C9SF1DzX8FuZKddBI
 fYQQZKwAmbhKOMukIOn5FMTdwinDe3vb/ZABYNtOAbHTfNKJh50UsVCk1AL8H4wHGZ0/2xNVViO
 v8e03HK953lwq9j/LrYhRhJrghWNBRoAB8gQn9wysQ0U4ZjPsGtZcskwfyWIy5dAclhJIQPWNHC
 h8QGqOX144ompZvVrIvZjInFNeIIxL4mn0HUIpB593vPmVW1+cBPvFhxfI/dL1UHwI/FVQPY6FU
 6iLOU46i87W5TEtuAPTqhOOYH+9LFaEbcn9kErXKap6EUY6DBpsmSIWMXQs4gj6JaYL33+IHBQe
 +HUV4wtTPhRZYWOt1JepA+PRS222f6y86reqMQMLLVNlexRbXuhRCgfO1keBlx1dDpHsYZzHLyu
 t7S7YqshH604JNWGjaD5Tt7GCRwG4mzkiMc=
X-Received: by 2002:a17:907:9812:b0:c2e:856:2a08 with SMTP id
 a640c23a62f3a-c46bdacc0b4mr244070666b.1.1792851682576; 
 Sat, 24 Oct 2026 07:21:22 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46bd6276d8sm93049766b.41.2026.10.24.07.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Oct 2026 07:21:21 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Sat, 24 Oct 2026 16:21:21 +0200
Message-Id: <20261024142121.4102029-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/iptables: fix arm64 build with kernel
 headers >= 7.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

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
---
 ...e-linux-drop-bundled-copy-of-types.h.patch | 92 +++++++++++++++++++
 1 file changed, 92 insertions(+)
 create mode 100644 package/iptables/0001-include-linux-drop-bundled-copy-of-types.h.patch

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
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
