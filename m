Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2828B606A324
	for <buildroot@archiver.kernel.org>; Tue,  3 Nov 2026 06:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mF7AzVxO
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E01FC80DC2;
	Tue,  3 Nov 2026 06:40:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YFJhZmyYz4GL; Tue,  3 Nov 2026 06:40:44 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 91DAB80D81
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793688044;
	b=k1swp4xCZi0X2cLNT58dJfct1zApUI6G14v89QW4Oh1MLmq1udUXM6LD9QUSwa/8wt33
	 /xSzVXVvD/3u0ATGQTtBNVc7e4C0EZ/Mc8bQRm7DmZUM8VhEVkPFk3XmVoWmZ6u+SGQ9T
	 LwjoPZGhIFtFP/QE9rkVF58d50EIpsvNhj4aNbVxr+CJGNSa8xqExQJYTc8gmpVWAFKHD
	 UQ/HLBQRiEsqbHSVB3pO2ameUNbPbD4fb/x8sFYJO4Kq0Vm0igA5vkK5KmDVqIOf/SHLU
	 14svlY5/HUkjr5VKW7GfvBhhnTAdKMlfBCXXEYnUcK5qF+Hq2FVAlOujsMnKzE4H6tw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793688044;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=81SvU9/M5fDOgT8Kh5f5LZ09+4D3Oan48do0vNIhcEY=;
	b=gbaiNkBBf9We4zNWyoNMKrJVZi5R8i/CXsCWWdMICoIW+Fezl6MoMdnybHZiaWhXTS/l
	 hgR4au4eN0+jzYPrV+HQQ56iCfFOExLGszDSmPzaMZeLI5/VlC1w0jWwwLvoyJJDWawe3
	 zBwMPI6EbjY81I5C98J993s/UigrYxXe4wpkrCQfQkomvtgMLlrKIa63ZNqhVNe3tTMqD
	 tjePIgSVW64DEpEbowga+Hp+Ulzco02pmQDJk4FS9/WLoA81UOMjqmVsEFKI5UcOEWZ8z
	 RoqRns8jhgWgmw91oo7bmjH32T0URfBqRiN7u1vGXN22aJpNfq2m5cQOwGcE8XUyNgg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793688044;
	bh=81SvU9/M5fDOgT8Kh5f5LZ09+4D3Oan48do0vNIhcEY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mF7AzVxOtbfVxoW+3le9VGZDlT/hL9+1zjk1n3o3oF/B6AusYcpe7EBCq9v8rEiU6
	 QRmx3xZ5G94fKC0o6qLAeQznynkWgG2OODLUm18CLarDi2Kmyf5rWi17/Nekqypv5d
	 0+uGX/15icKGdr1bNv6AFnleSbytaZP++vU9MUV3C5gj1t0xL/R//FpzX4WUVeFZ8p
	 FltW1zOuJ7B3b5LYaDGLf/lzkIWJ9TZTxFCbatrcHUU5Nfoa3DmF86RtY1noriGAlf
	 8CI5Z5DP7xnbEfpkVSSMvXw2uWzxgQ57GZHjHKoVNV2iwWztrZfadtUI21kyfWXfk5
	 JRrEOlECgpLdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91DAB80D81;
	Tue,  3 Nov 2026 06:40:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id ECC7B4BC
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 06:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA4FC606D0
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 06:40:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mJ7b4HaA5ZQN for <buildroot@buildroot.org>;
 Tue,  3 Nov 2026 06:40:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org E54BE6060A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793688038;
 b=VqHcJvsujE62YlmBtNCf8gYuZIA1hUQZiSpGR+V9I6Gu/ATR/1Whc+XSB06T4jvTv/mm
 H7hW5Yz+RvgFWe4WkJFCnfFI/1SpZFypfc4G+oNZY8JZCRCTKTDskMxf1ts9V47I1xRrN
 0ftSzTtTyC4pA/6NAPt09bjUMw2QC1PxGZc+g00Ac5MvfsdLb4GImqe5pOsRVTobObWff
 y4hqD3BianRKHFjUFA0CUV2E+6Ik7/Y10NRWGxKegB32XNYCiVEp+haX6q9Ll0iHRu1Yf
 3Zx4gd1a1pX7dalMcFKgmpJSgNYfGL77KgGI1GLCekAP7UjKznsPKbbjmM8dOHZGY6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793688038;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Subject:Date:
 Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=MUJCSL0jGHM9p8aeNuBmIvKZhdKfJiyLsgsxOaye4NU=;
 b=MtiaKwdviWFaWN8O3X5SOaXiYhYw3dew2wnCCoY4ScAS0ASGkn73vgMG/J7LdXz6RTuk
 enu3o47oF+Q56mwTCqJhwVrcHtwAScB0AhDBBwQqMyQJy9h7pw+BTLynljfiCjDRwGTtb
 0WcfPmQijETr6OUJgZGjnSPTMxpKadd6Pgcs4WzawBnJdvESx5lOt8IFDhDG1eJ7gCbWI
 k48mGNtv8Ug2N9Qx1jokDxrWAAof2yXqKaf5ac7xP8atazvqN01yKOhom6YdfFLwz7Nal
 uwgO94PpK8/hdBs1j70UABfFkaiZOFOelFOWIEt91RQrPPzolcs0WypYR0+Dn9dgXow==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20260707 header.b=KLDGCeWz; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::536"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::536; helo=mail-ed1-x536.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E54BE6060A
 for <buildroot@buildroot.org>; Tue,  3 Nov 2026 06:40:37 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id
 4fb4d7f45d1cf-6b486e1d02eso4884712a12.2
 for <buildroot@buildroot.org>; Mon, 02 Nov 2026 22:40:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793688035; x=1794292835;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to:content-type;
 bh=MUJCSL0jGHM9p8aeNuBmIvKZhdKfJiyLsgsxOaye4NU=;
 b=g6bhRBEMKp8i4WnZIFL2UCP3LDSR1wPykBXjUd616AhT7OkNjDJwjQEULWsHIy2VPX
 HIw2AEhAjXcr/u+EAqtLlWHpUS97s7HzlwpmVeByJqX45mtc3EYKMO2tDlRiOSyVV2n7
 ocmM0R2sAHkxk1cpBaEms77HDSAQIbTHU50LqfcxfkSvayiH17HOoQotk1x8frV20/nY
 +EVCAkHjbYDobDDpDo/WkfrF5CJOXQgqyh0YFoZbiT+QPW6Qk//Ue/voRFoWNhQFO/mH
 PEIzQt3/NBxiHw4Jlmon6KJWZV46ej9g34HL2FUI/TN+wFMtGSDdJIpFxOVhMMfnTOJh
 3zHA==
X-Gm-Message-State: APuU4Z//vVw4aa2zR+4G0FrNwmW6b7PID0Gd4LE7iz+84HxrXtCVKKzh
 QmhF/csIRNHkZ7x4lEXhlzwwbyRN3lkHY5N9ccNJQI2UU9Q7GELan7cr3WZP5g==
X-Gm-Gg: AYBFou3SQesmO/rQOyTycJL2c3aXKDDpibHRacqRl5QicflbsU6dBaXFbPEqZrbAHI4
 1RJ63tghyhXsV4mWiqo+5uM1TW4CPQLjzCjKeTPncT0CIjPm9soCKlfuq/oVcQ2XvwRKfHaRL44
 inw1L+2bhmWZjeVVS2ocWZomLdHP76JVBHSjc8kYRU4ywiYG5WLaTffjRCQUPKIzh9KcG7/+/q4
 6gJK8KbIdBUmkqB+y1o+NWlr+yuCXjb9DODFp0ycvsNBgi60WDOqwmKguMAUEP7BWBqKP3f4QVO
 nmlSq1NeKQKCTtPJC9fxhb12nqm/qQotqqUfxOiDg+94GUD/5pfm+HyuVNlxGxoL0o/+XP6BpMt
 np+dDFmJwEgXN4h/3CYgvNgv14YaoMxkhgFBBONkSiMtomenQHs4W8Qalm3K8fazB54Q3H5MJVK
 T7TI5cFtr4bhhui6nbv3u/IZe424ZPKFCfX26KAJ/fXfXFMqo+6jKKBgiOU9CPADqtGd7hKQyYs
 CSBZGrxnmh5O/TVpLeL+NUf78LJxLFp5bhkk9jm6O2forQdaE38gdTxtbcfdIzNgoResDjrACSq
 R3XMV/2CKbepXDJQiqjFLmHzDLOC/dQucb0TMbQYNRoNyo2QPp7cdKwYc8DImuBx+jrAcPQDa3o
 Dnz/SjJfn
X-Received: by 2002:a05:6402:745:b0:6b1:bcb9:15a with SMTP id
 4fb4d7f45d1cf-6b4d4d7ae90mr5573770a12.20.1793688035247; 
 Mon, 02 Nov 2026 22:40:35 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-6b4ec9fb9a3sm3897833a12.14.2026.11.02.22.40.34
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2026 22:40:34 -0800 (PST)
To: buildroot@buildroot.org
Date: Tue,  3 Nov 2026 07:40:34 +0100
Message-Id: <20261103064034.3913314-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/file: bump to version 5.48
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/file/file/blob/FILE5_48/ChangeLog

5.48 adds Landlock sandboxing, which is enabled when the toolchain
provides linux/landlock.h and skipped at runtime on kernels without
Landlock support.

Add two patches fixing the seccomp build, broken by the new syscall
rules in 5.48:

- with musl, where pread64 is a macro once seccomp.c includes
  <unistd.h>;
- with kernel headers older than 5.9, which lack openat2, faccessat2
  or close_range.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...f-pread64-to-fix-the-build-with-musl.patch | 40 +++++++++++++++++
 ...build-with-kernel-headers-older-than.patch | 44 +++++++++++++++++++
 package/file/file.hash                        |  4 +-
 package/file/file.mk                          |  2 +-
 4 files changed, 87 insertions(+), 3 deletions(-)
 create mode 100644 package/file/0002-seccomp-undef-pread64-to-fix-the-build-with-musl.patch
 create mode 100644 package/file/0003-seccomp-fix-the-build-with-kernel-headers-older-than.patch

diff --git a/package/file/0002-seccomp-undef-pread64-to-fix-the-build-with-musl.patch b/package/file/0002-seccomp-undef-pread64-to-fix-the-build-with-musl.patch
new file mode 100644
index 0000000000..ebb4637c54
--- /dev/null
+++ b/package/file/0002-seccomp-undef-pread64-to-fix-the-build-with-musl.patch
@@ -0,0 +1,40 @@
+From dd8fc9dd375d7db78d09ea8b669e576eb617d472 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Mon, 2 Nov 2026 22:42:54 +0100
+Subject: [PATCH] seccomp: undef pread64 to fix the build with musl
+
+Since 5.48, seccomp.c includes <unistd.h>. With _LARGEFILE64_SOURCE,
+musl's unistd.h does
+
+  #define pread64 pread
+
+which turns ALLOW_RULE(pread64) into SCMP_SYS(pread), which does not
+exist:
+
+  seccomp.c:53:52: error: '__SNR_pread' undeclared (first use in this function)
+
+Undefine the macro before using it. The same musl issue affects
+fstatat64 (bug 473).
+
+Assisted-by: Claude:claude-opus-5-5
+Upstream: sent to file@astron.com on 2026-11-03, Message-Id <20261103050039.3844049-1-yegorslists@googlemail.com>
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ src/seccomp.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/src/seccomp.c b/src/seccomp.c
+index f867abcf..ea27a3a8 100644
+--- a/src/seccomp.c
++++ b/src/seccomp.c
+@@ -178,6 +178,7 @@ enable_sandbox(int flags, int action)
+ 		    SCMP_CMP(2, SCMP_CMP_MASKED_EQ, O_RDWR, O_RDWR)) == -1)
+ 			goto out;
+ 	}
++#undef pread64
+ 	ALLOW_RULE(pread64);
+ 	ALLOW_RULE(read);
+ 	ALLOW_RULE(readlink);
+-- 
+2.34.1
+
diff --git a/package/file/0003-seccomp-fix-the-build-with-kernel-headers-older-than.patch b/package/file/0003-seccomp-fix-the-build-with-kernel-headers-older-than.patch
new file mode 100644
index 0000000000..e302c8d844
--- /dev/null
+++ b/package/file/0003-seccomp-fix-the-build-with-kernel-headers-older-than.patch
@@ -0,0 +1,44 @@
+From 5962ca083112c45eb3d903a21fc9fcf2e42fead4 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Mon, 2 Nov 2026 22:42:54 +0100
+Subject: [PATCH] seccomp: fix the build with kernel headers older than 5.9
+
+openat2, faccessat2 and close_range were added in Linux 5.6, 5.8 and
+5.9. With older kernel headers, libseccomp maps them to undefined
+__NR_* macros:
+
+  seccomp.c:59:52: error: '__NR_openat2' undeclared (first use in this function)
+
+Only add the ENOSYS rules when the syscall numbers are defined, like
+it is already done for other syscalls.
+
+Assisted-by: Claude:claude-opus-5-5
+Upstream: sent to file@astron.com on 2026-11-03, Message-Id <20261103050039.3844049-2-yegorslists@googlemail.com>
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ src/seccomp.c | 6 ++++++
+ 1 file changed, 6 insertions(+)
+
+diff --git a/src/seccomp.c b/src/seccomp.c
+index ea27a3a8..376e09b0 100644
+--- a/src/seccomp.c
++++ b/src/seccomp.c
+@@ -214,9 +214,15 @@ enable_sandbox(int flags, int action)
+ 	ALLOW_RULE(writev);
+ 
+ 	/* Newer variants we don't use. ENOSYS lets glibc fall back. */
++#ifdef __NR_openat2
+ 	ERRNO_RULE(openat2);
++#endif
++#ifdef __NR_faccessat2
+ 	ERRNO_RULE(faccessat2);
++#endif
++#ifdef __NR_close_range
+ 	ERRNO_RULE(close_range);
++#endif
+ 
+ 
+ #if 0
+-- 
+2.34.1
+
diff --git a/package/file/file.hash b/package/file/file.hash
index bb367893a9..a58684f6ad 100644
--- a/package/file/file.hash
+++ b/package/file/file.hash
@@ -1,6 +1,6 @@
 # Locally calculated after verifying signature
-# https://astron.com/pub/file/file-5.47.tar.gz.asc
+# https://astron.com/pub/file/file-5.48.tar.gz.asc
 # using key BE04995BA8F90ED0C0C176C471112AB16CB33B3A
-sha256  45672fec165cb4cc1358a2d76b5d57d22876dcb97ab169427ac385cbe1d5597a  file-5.47.tar.gz
+sha256  ed14656883b23a364b4057c05595d93252da9bc473d30106519519d0da141283  file-5.48.tar.gz
 sha256  0bfa856a9930bddadbef95d1be1cf4e163c0be618e76ea3275caaf255283e274  COPYING
 sha256  2e14b6fa9a74f952ebfde3c96527158df281c953cfaf35609eb854d4da30131c  src/vasprintf.c
diff --git a/package/file/file.mk b/package/file/file.mk
index b70b3c521c..ceebbe3fde 100644
--- a/package/file/file.mk
+++ b/package/file/file.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FILE_VERSION = 5.47
+FILE_VERSION = 5.48
 FILE_SITE = https://astron.com/pub/file
 FILE_LICENSE = BSD-2-Clause, BSD-3-Clause (vasprintf.c)
 FILE_LICENSE_FILES = COPYING src/vasprintf.c
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
