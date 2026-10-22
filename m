Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D538E606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=g4BMMujF
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B4F0181449;
	Fri, 23 Oct 2026 12:32:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u2uTJkbcla_M; Fri, 23 Oct 2026 12:32:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 27ABC814C6
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758732;
	b=UTHa6Yj2pWxA/vQ45mrcIl0labU1Jsa6+LP0BeiNEEh0zDAcswbtZeXQ4D58I8BAyjLa
	 mBWFJJYWs3F4Vyts9P/R2DD8LBvh6GhGMTD2z6EA8Qu4U2RU2GvLT5fONbc4Ojl9nNE2C
	 d1PW0VOBun/d/uMvYdBw/XxGVofNRmM5HTJHc+9L7XVZy/vS5VV3rT1CrAeT9nzE4xKRc
	 Dg24Rx4DuNeNazokpATy8PvZ0ucK3xxQHjMN/dkU/bjICxFgt+nnvPCgLdqe0SqSk+b5j
	 TqxaY9KbTBx0XRASItB+NmIVKFWl1EQ/9IJdgXgbEyO5SRNis2myZiMqG7h4Cy3YN1w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758732;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=5gHQ4zvTzgX5VM70QXKN1wijHHuLFoAUJ0eAKgKdmIM=;
	b=XJWpHCkJZ+Lhs6C48jFb0zGIZMYeGMfC7EmfIqoULCC8gMKo3687kvTlgURQPBOLfgbc
	 ET2/erHS9LTLKuXxxGLEkvVyvy4FuSDUk7y+U/BAdd2tNeaEgT2m0wS4eBzYVYrrZtpGg
	 Sa1xZNE01gD4fjKwOacHVWAnUJN0XCeKb+2YuAOQiXwtOWdFFqJl61GJPWizvBrB7kkN+
	 Nyy7NKpf0lQDXTfLl06r2jfA/1JK9YCcC0AnU4KvxUGqEI5aSSdYNn8XaQGqDn/GdZamk
	 Nh+TNspVaqvMDt680Q/Q66gFc7wuuKXss3AQE0pM9gGA4TLh/1MlVD1d70Vrp0KgYGw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758732;
	bh=5gHQ4zvTzgX5VM70QXKN1wijHHuLFoAUJ0eAKgKdmIM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g4BMMujF5Rj8zP/357CxNGnVDopp7LcDDJ+9s3KFyt6w51PYNm7vTBx3oKaQzYeBU
	 piFzTC+hYKbPxuRbkRfP8VKcu70nxCtuHu3ktOZxFAuZ5dSpz7C+jTMxHEeR8hSJAT
	 CYUGSFSeI/lUcMTUIgMahbvuchlcs8ZS022xMJFROX/RbGsz0DJCJ/6ulPJdQjOOoi
	 +Qtde/F5WfdwS2x7gQkbhxndAZ3iBLVV7F0xAIpnjxXMU+Ci7Kmvt1q8Qza0O+ibun
	 Tx9UzDD3cyJc94GKojZEJEEaLsG/8NX3XR75LoSSdTYQAuQQSZJ8myv2V9zV9FO3vG
	 ZIpxZCChJ2kbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27ABC814C6;
	Fri, 23 Oct 2026 12:32:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B46CA12C
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A656E4094E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lshJRfvkL1SW for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8A60A40928
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758725;
 b=MuwrvSbEbOOSmyQvskmGK3HcD/z4VDvEkG2o+OkJ+h6B1niqajiOwF/RwQDWr43nstzS
 s2NiMwsJPcllGam1r44fg4bZ8jaDUugnBD4h+X0yV0tRnzyov+EGXnxP/7fRxvY+Xd77K
 g3c77yjTA69mbeBhGIsdAIezuYT4eM4gDS2Xb/D41pNIQamTaXbVl2nGnUVVbicoeqIah
 MPZMmxQClCEoDEz4DEipWqdWWywAg8qq+QzHpmMzluTVppyxvIPyPSIMrX8hxY0MLam6N
 8SGnQRz/tdkglUvOJ8gfjDmijN59MYRw3UWCs1Y7GTBhoeaTf6VrheFFTHORtbGr++w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758725;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=aURybFNxYNoUPzg7VMJ4sey5hmcb3Mhst/1asJMcn2E=;
 b=qMapBWNuB6bDMyWy3C4jan/cRDPblkUMYWiq8+SpsSeNfKA50OiOtUoq6wc7+yovelq4
 y8lqR24QcpkJ91fWhAFcjkUcMh0sszyCLvqiI9vmpeK20nKPjEwL71Aev4ujBSZqByQUA
 B/clshhrA12SYaZRUEHgLlBQSrkS37w/x6KmJTHuMa9to7GYwqpBS0qbSU2wDb+2eK6AT
 /jwT/QfGPOdyTldHK8dbsRxZHcA3GgkpUwdPbh3kwsbGu9JhSN/nghEkR1I5f0zyJ84vz
 UPukgBlFxtll3z69KFP+GvDZ7GZSycEjzhAAPNRgf7g8zBbhJjQkTBQyjBqQmyGcitA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A60A40928
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1CE7C9B9F8; Fri, 23 Oct 2026 12:30:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:50:23 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 501436823047caace88ae663101723a0c677165f
X-Git-Newrev: 6313c1cced0001bfc6475bea24126258f4e1609c
X-Patchwork-Hint: ignore
Message-Id: <20261023123041.1CE7C9B9F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/uclibc: add
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
Content-Type: multipart/mixed; boundary="===============8128675232045488243=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8128675232045488243==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6313c1cced0001bfc6475bea24126258f4e1609c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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

--===============8128675232045488243==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8128675232045488243==--
