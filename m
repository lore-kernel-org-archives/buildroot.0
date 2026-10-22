Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B543606A32C
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=TIU3VhNC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70705811D7;
	Fri, 23 Oct 2026 12:24:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jwwDFUbxSRbP; Fri, 23 Oct 2026 12:24:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BDB8580F5E
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758262;
	b=MlxOZdhvOGGsbSNBT0cFp4IS1H/wul3FtNg/Ziw5Lxl8QqTC0uB6TytvBfIYSP2AAMDg
	 OwZ/iK2NhCWfV1u9kC0PwzJufwi8edgUYJ3kCOHZzLzM0elnLaTpywM+I5Mc2BbDkE5vD
	 GsYC5YO4McY5PjSPipWQvA9IVvzrZfqGMiAPM+dDuzdM3icLXcrwFWRb0X1ntQYdtBVE1
	 UcWakt5DLkNNNzpmoYOO/kY9VqDIl8tS1Jo+a07d9mHjAULVx5lmQd4RRO2684qtOVkOp
	 lQI5ikcZCinAmR6LmMXQUkOLMneQ7N5u/OxvN+TdMdLDL0DwJUnoTLedZmbieERS/7A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758262;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=UiItOrOJEbSfKqGg2ZcdMOHaV/F7LFhsKqkFGOdI0+M=;
	b=CQcLL9aWRtSGXGflt8I9RU5lgWDOFFhtCYp9Sr4Ru6tnqD57zml555D9Vonc8TO+DHCB
	 XRwewp0VRgGQUC9bPE6fyak6WZJix5yL2eJAa4Twn7VQwoUXB9GxpfmWCxGVdI2UaG+iW
	 mmEkR0kWSYzh+YpNo5+HZx3RJ9DuVL33rbnYcfTWPj1ZVMtrZScdUdtGmwADZpbHa0frv
	 UH4jVxeIZp6XemC1oDNO7g/9KUaQrkWo6jnEAjDfqzOVecxDhrjnFQevsFcFHLlO7XGHR
	 uFSAXm9tVn3w5ovfb9n7l/ajxW2uUfw1X+vD9p2hW8+UCodzYufrjjxn1GWLwD4k6jA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758262;
	bh=UiItOrOJEbSfKqGg2ZcdMOHaV/F7LFhsKqkFGOdI0+M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TIU3VhNCPXKrhmlM2ymVNVqt1PZpZXsBYVOIjrPvndG5JJFV278Qtl59Uf78jb971
	 z1K/Y/FwYooxYbNRE3sh7Gzfr1J4GS74sYhV3cVsPSd9iDpRU7GkwAJMoFrdzZrz2w
	 Cxt/eTDfDwC21cN1g4b9Y7gtQeM8kP1CyOMcJ66VCuNpEqmt6+g3VGtCEM+mSGCcGi
	 PTMG0qTSfavAIx46dta/o9HPSTLKUY/FM1IqY3fq2XqCOrso+hkdYCqTD2y7K90q5L
	 //0POTINnJ3nAqkCRKFSESAZ5/d5wozCV1oH0bD4EL9j5sNOHUjof0P4h3plmiWrAq
	 KoPny2B3a2lDg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BDB8580F5E;
	Fri, 23 Oct 2026 12:24:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 72F6623A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5856140119
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1ZmuzcINTQEC for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:24:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 2E7EB400DB
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758259;
 b=SvgCqZQzc1oVyVLJJstM+wXPxkUxHtXGCMhtgA7OT9M70u7c2CAHdvSJxYfHWSr3JSJP
 CXi1IUonlyCNe12ElXoCVyu58lX9IUiGkoBVJ40q7dR5iin5aQpKDu07p0HYrngUfqpsU
 S4dES4QJrzkFegQplbvFVuSGOHzXKfLxd1be7HEpg1Wnc1FFO8S47vndRtONjwq/KSMS0
 zbTSSfTze+jSnRhgPLHFjwKyRzf2CCFK6vT68KAEKMF7FY2qOApJSW48FCU8DZOunfDwc
 Jluz/LNAhxIf2Vj9YoZublfRByNq7dyDTpUtUpmwBr/gLxupeIiEGAysajo27s+vrrQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758259;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=57Rbk4355bJ/gJF7cAxxoH0Lt5x3Y37dF+uZ60BptZI=;
 b=Cja/xq5f79wxqohKMUUBR3jDASf2eONOyaTXI6BH4yLRz8WwDadwVzQxEVQbHmfiDiMP
 gh2sSznq1qD6AuhTx+tfbi1UO1GljoKm++Fz6MI004IWc/az2fS15uflZnSkwAkjw0AVz
 srURIrSolctXFsrjbsqRbkVeKvlP5O/ZRu8/4ULqV7GQfgnGCJutVZeLJG3WOM5sAojG6
 frBHKDjwPMYRiVWLyC7EU78TyMtcMlAliOJaknnrutPrvrZodwqJ6H7MzvIEdm8Tcxq0D
 OX+EWVXbXR4yJGydKunEv+RtG5KIbItCsrNuTseJ+52eA7p0VbT+lIKhIi42uiWwdFQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E7EB400DB
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A44019C66B; Fri, 23 Oct 2026 12:22:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:49:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 4f5b0a9d8df3ebc4dc1fd5055a1893f8c97f9bc7
X-Git-Newrev: 5d0ad5b077ce7b53b99e499e6f3db543b0fddd69
X-Patchwork-Hint: ignore
Message-Id: <20261023122254.A44019C66B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/uclibc: add
 missing sys/auxv.h for static builds
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============3613225011498945812=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3613225011498945812==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5d0ad5b077ce7b53b99e499e6f3db543b0fddd69
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

getauxval() works fine for static builds. This was already fixed
a while ago, see the commit message of the patch for more details.

Fixes:
 - https://autobuild.buildroot.net/results/f03/f03380ef48cea232e4958084eae419d5516f4ef4

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 471feacb2d9c13190d635721208b9d31e995d04e)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...nstall-sys-auxv.h-for-static-builds-again.patch | 57 ++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/package/uclibc/0006-buildsys-install-sys-auxv.h-for-static-builds-again.patch b/package/uclibc/0006-buildsys-install-sys-auxv.h-for-static-builds-again.patch
new file mode 100644
index 0000000000..74d14b5501
--- /dev/null
+++ b/package/uclibc/0006-buildsys-install-sys-auxv.h-for-static-builds-again.patch
@@ -0,0 +1,57 @@
+From 6dc9f06a0330f11171f76f4b831724c02642f11f Mon Sep 17 00:00:00 2001
+From: ramin <lordrasmus@gmail.com>
+Date: Mon, 12 Oct 2026 16:30:56 +0200
+Subject: [PATCH] buildsys: install sys/auxv.h for static builds again
+
+getauxval() has not needed ld.so since 227b7c825 and 737a0edf4 ("Make
+getauxval work with static linking", "Support non-cached entries in
+getauxval", v1.0.52): _dl_auxvt and _dl_auxv_start are defined in
+libc/misc/elf/dl-support.c for the static libc, and __uClibc_main calls
+_dl_aux_init() on that path too.  The static libc.a carries getauxval,
+__getauxval, _dl_aux_init, _dl_auxvt and _dl_auxv_start.
+
+Its header is still withheld, though.  df81bd1e2 ("getauxval: remove
+header for static builds") put sys/auxv.h next to dlfcn.h in the
+HEADERS_RM line that applies when HAVE_SHARED is unset, as a way around
+the link error of the day -- a package that probed for getauxval would
+not find a declaration and would take its fallback path.  That error is
+gone and the workaround outlived it: a static sysroot installs 70 of the
+71 headers in include/sys, and the one missing is auxv.h.
+
+So a static configuration of, say, openssl fails with "sys/auxv.h: No
+such file or directory", which reads like a missing feature rather than
+a withheld declaration.
+
+Measured on riscv64 with a static configuration and gcc 10.5.0: with the
+header installed, a
+statically linked program answers AT_PAGESZ as 4096, matching
+sysconf(_SC_PAGESIZE), returns every entry of /proc/self/auxv unchanged,
+and reports ENOENT for a type that was not passed -- both for a type
+inside the cached range and for one above it, which takes the search
+over the whole vector.
+
+dlfcn.h and bits/dlfcn.h stay removed.
+
+Upstream: https://gogs.waldemar-brodkorb.de/oss/uclibc-ng/commit/6dc9f06a0330f11171f76f4b831724c02642f11f
+Signed-off-by: Ramin Moussavi <lordrasmus@gmail.com>
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+---
+ Makefile.in | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makefile.in b/Makefile.in
+index 3b28fbf60..72865863d 100644
+--- a/Makefile.in
++++ b/Makefile.in
+@@ -257,7 +257,7 @@ HEADERS_RM- := \
+ ifeq ($(UCLIBC_STRICT_HEADERS),y)
+ HEADERS_RM- += sgtty.h
+ endif
+-HEADERS_RM-$(HAVE_SHARED)                    += dlfcn.h bits/dlfcn.h sys/auxv.h
++HEADERS_RM-$(HAVE_SHARED)                    += dlfcn.h bits/dlfcn.h
+ HEADERS_RM-$(PTHREADS_DEBUG_SUPPORT)         += thread_db.h
+ HEADERS_RM-$(UCLIBC_HAS_ARGP)                += argp.h
+ HEADERS_RM-$(UCLIBC_HAS_BSD_ERR)             += err.h
+-- 
+2.47.3
+

--===============3613225011498945812==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3613225011498945812==--
