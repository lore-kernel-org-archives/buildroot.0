Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D512606B2F1
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 21:24:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KXA0DJp3
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E20BA40967;
	Wed,  4 Nov 2026 21:24:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id amvpZzNqkrA0; Wed,  4 Nov 2026 21:23:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DE4664095A
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793827439;
	b=oGoH65S01LVQZoSt9wEYMD9ZYc1RMJ/NFDF7+QIe+t2ld46DhVPcyDFHHdU6sWDRcroS
	 Pb2tzMu0tvEgMSTC/dlZW+2SPGJ/Zt2rKJxyuz1Fkon6KFkwVK22D0NeyMHCVfQ6jq4zg
	 T8+uf+9rhq9rGunlFGZYRHKw5zE1sX3+j8sKfpLoJKe6Ai24Z6OToS8/d8z+n35qRyTSP
	 aHPNQoReCraWShgJk6Y78hzjdcF57VGc+zIrnO1BnpGrQJI7fPIt0IcVBk3mGLUD7SVgy
	 cRvMP29AWFMLtL2Jl3vgQGUwGwrY8BoWYQDssxZq4kuEbHa1uoCY+AABMlTmA+kEqhw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793827439;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=PgTdM5mPJ0PB8TI2dRvPFUCOZdU24BHJPNhhMPBJG1g=;
	b=te4b+m8EVCHxQG5hqHuOmX5f10qk3skmZJ2aO7y71Iw1PC8nYMlGOTs4Dpv+9aZn8zgw
	 S68BHKflUtBTEb0VUT65VK+2LnQ/U/9zpCZedaP6dV8yiI3inRnP1RgmZZUJb+n2jM5EU
	 kp7JDUJcnsgshr+8Xv52Ij4Fb4LINbenZ4npTY5VgDGD9DymBrqUR6sc/liviLvF7cUWp
	 YBYPYaXYGdvSAHaCc0uffLo2x6b8SLSqY0sP6lhUhtYwd3LpUtTdpngAXOGF0MP1hwCpL
	 5unSeUv2IoNZO6LzFNxH4BceEIE9psa6pkcltnLziJtWZlGgptYZ68um4Z8SJWlVykw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793827439;
	bh=PgTdM5mPJ0PB8TI2dRvPFUCOZdU24BHJPNhhMPBJG1g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=KXA0DJp3tPTGjKK7RbtqGC+UOYExjOuS2I7ccDGV/h7ciNLRl35LC5qwcLclkDKtu
	 rO/XB++NqWmmNTMP5yPrLd3+Vj6GasqJClm+NjeCNm8V85s2Ixiw7dgbZCksu5z2Y4
	 S3eR3UPBp2YigBngRZE6xjXGp9iQTwb9G4BZmHv/GeNRKDeG9NpJg26xgb5JLaaHoF
	 E6UBHVAUR2DH2aRBA9k90sPnlbwHhZNYiPqbNMrSODKdutbL2qot6y+MVrfn2PKIgY
	 EguvmKaNe1Hl6zlvPNqE/js8DEY2H10dplbJylx+kkmZ+S7PhTJjqS8AMUBmlhz7XC
	 84zHq0PLEQFIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE4664095A;
	Wed,  4 Nov 2026 21:23:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2979F177B
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:23:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 17E0E40217
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:23:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hkExzYAPVtwi for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 21:23:55 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 895EC4008E
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 895EC4008E
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 21:23:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95BFA9DCF0; Wed,  4 Nov 2026 21:22:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 22:22:28 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20bb0aff7db09d0f5286391cbc5be7aa8a08df46
X-Git-Newrev: 746840c419ed7ec473a1581132425edb4a8b8d3d
X-Patchwork-Hint: ignore
Message-Id: <20261104212224.95BFA9DCF0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/file: bump to version 5.48
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/746840c419ed7ec473a1581132425edb4a8b8d3d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...-undef-pread64-to-fix-the-build-with-musl.patch | 40 ++++++++++++++++++++
 ...-the-build-with-kernel-headers-older-than.patch | 44 ++++++++++++++++++++++
 package/file/file.hash                             |  4 +-
 package/file/file.mk                               |  2 +-
 4 files changed, 87 insertions(+), 3 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
