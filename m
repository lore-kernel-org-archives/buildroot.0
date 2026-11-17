Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 627B9606A331
	for <buildroot@archiver.kernel.org>; Tue, 17 Nov 2026 14:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HpbNUZso;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20260707 header.b=TOIq7kGg
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 310B540501;
	Tue, 17 Nov 2026 14:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id syPThsoTk_yc; Tue, 17 Nov 2026 14:09:41 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 31C1A40528
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794924581;
	b=WOXvV2Q0IQLuPSIaTqFQkojbscwO50+qWwqAWWhPJBY9MxHGlTwTaQiU42vY6zO0yQ9X
	 4B1Y3u8pnRRelTTKDmj1XZp2PDJI2o+DoHgQ2sNl78foKRmK/2mJquv5k/HmWZva9z/Mk
	 IQ90Oyn6hWwNa5btQ66Rn4gbOGupeN2t5QkSqc4LxgnO/saPIdF4eI19HmMpakQE3wnag
	 QommkkPWB3Srv5L58YUEkzfepPfx+/i+hdvAt3YoRT4a//YV7l3EmeTE5BEze5rF9DTIE
	 3GN8mourV9FnEmLf1XnpGiS3ibjRMzK8ftThg36XAr3DYWJCkEUPy8mBUplqJTp/1bQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794924581;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=H0YCAwzQTfgY46FzOxWfgsBVBnfw4QQ3s3SN5SuR8Z4=;
	b=Wg4YRBCnj+rePcCgdrKFx+8+G5U5+WnuhnY5PVpWJ5QZFbnANkyCg+nP3ted+VE31UYq
	 8c1M4tFwl4fDLz/pyP7SlXL75R0DuSI3KKFFX78AbdUnUViLaynhIfKY/ycmuR0yPnvxK
	 Vwi1Wbsbkt8Rh6rv3vlNpIw9xC1TtQ7gk7jDEvi6kp9W1o2r7EeoJyDYOt5y8mk1a/kHA
	 nu5aA0Pzyk2RMu8h4F81enpTpGHvpG/Yx9HA4BSSjGhpJaZ1EL8bRbEUR5/6fYf8a9s9N
	 f1Y44bp6nn1T02UfEivKm3At/54cirquefrMFHdTOs2v6oLEyXa27V44zpkMB7ewaPQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794924581;
	bh=H0YCAwzQTfgY46FzOxWfgsBVBnfw4QQ3s3SN5SuR8Z4=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=HpbNUZso153jrGY94JiXNVkN/IODoedHASL0KuANuzgxSi0d24cpEP9X8XoqrjmZ8
	 zxAu2JXHR9DiA5BmWhd0BMalCDzqN2Oj2CvQmz7LL3J2DWKjDFll6jg2GqMGPcwiwh
	 QDTML3BZB7Acajf/OvEWz1b7CSey2xozWmohZlXFTOPFOT5W2iSp8He1aWqU2qyN8s
	 n7+XZsMfpWqpvptYiUxOo92ySnKgbXeUFXjUdcTBJsK41dsBujF4I3QqjEPCwHQVqD
	 e/WA1WsJ8jVD+MuvQrrTL2bQ1KyfMsj1oi65Nt5crHVro722Re6wQt8qEcGUAwPCxk
	 5B2DxtpWJ+HfQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 31C1A40528;
	Tue, 17 Nov 2026 14:09:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 12E47105
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 14:09:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 02E7E81129
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 14:09:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8LADWd3P10Uv for <buildroot@buildroot.org>;
 Tue, 17 Nov 2026 14:09:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D26B080D85
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::52b"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20260707 header.b=TOIq7kGg
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D26B080D85
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 14:09:38 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-6b785ca42ebso7169881a12.2
 for <buildroot@buildroot.org>; Tue, 17 Nov 2026 06:09:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20260707; t=1794924576; x=1795529376; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=5MnbPkWNutAxXy3YZh5aCORR2/SmuI2sf19mnhzsKXA=;
 b=TOIq7kGgVHDNchIVrJ7IBhjEaueTqqvWQ2poAwUF9hj6kxvv/VvrbFaw/TigHFHnCc
 WjkTFa+SuPGSe1KjFmenfZtyCM6ze5Qf2tuBehqI+TBsQ/KGPDE3pcuCH2gNINixzCV5
 dKkCnabzDarDZjTXZLtouYjNUR/hq4CYic/j10/VI0wWYUNUNwnJzv8MgNG5tJWdr9Rx
 1+MeUCt3WM8I5IoAXKdILMPXnzFkHjcZLRLgSZoLhhhFgMzrO9nQ7FoK/7eS/3KOxT8N
 XUFDoLpzBCEbwLsokNR3rg0geyVL5NBFKSnjPyyoj0Gl76yvH3AQ3g5RTZduUH4F384f
 eu/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794924576; x=1795529376;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=5MnbPkWNutAxXy3YZh5aCORR2/SmuI2sf19mnhzsKXA=;
 b=a/KWhfOBmaGNIPZ5pddBrp+WdHK3zBDh1i+Yc19frRs5ryi9djkx6KGBQrEIn6QOls
 Hbf8Yae2WhEONiQZa7MvIl9RavwDU6OYTRpuVAbjMzw/6aD2sxjk0/Sf9mFVQGRyj+bj
 5FuQeKzgmEXSfHOpgSM8PFv/vJsJqUNlCoB0wiHHttrfRme60owA2CEoCXcJfyv9Eg7o
 TfucLpixd7bIcJ38GNWVeNoGa3KZjK33G0RRaVtAa7Z6w69/OouZh7J1TcmIvL/TW2h/
 +tz8quozyTBlZRvzKkx2ussgB5Uwg8rJGE9OrSuCmTGI4mVr9nPtsd08lGBsJ72khCQR
 bDIQ==
X-Gm-Message-State: APuU4Z+YH1Yw4KD3UKOT/m1a9XaVftA1Rwi61cN8Ao/2QeYWcFgDAPHP
 A2ADe1ouMNNb3Cg2RUcaDVLb0TUKstqaAqNAAMKUmdPsiD2+VuxKyfsdRxcnBw==
X-Gm-Gg: AYBFou28wAD4r5acWJkZJi3CyDKh/kBgGQTrlFxYA+aXetumq7LMWMavuBjhvS04tua
 DBpQxd8P3FfUhTYdbqCHEyPAPU2UhWXC+zIBizfLZdJJqqg6UJ7vFw/yxVrRjU5sU4G6AMqc1DT
 QYdspJfLBjSTFB3BNlcsNzdqcyqdW0WzSrSJY2UsrfwNDJ+VoSrLYVOpc4RpycGLW3OlMnRjc6i
 Fo4xnyFgZ7O3ROBcQdS8SwmEL+Lj0hosEmZgW2VGvvyfdFmujMreoTw2MDyZa4LF/VW6i2/VvPE
 WLbpKUhYLX7PzCugDPea/T45HZX5ppj42kUP3IZJnXriPE/VW6aHQtfZhBj0l8bRSvzsJ7Nu+b3
 CkRS6d/PAMZNacRky5V8pJOmJuWmOC1kxav1YHtV3C2EscX6cNcY/HpMOsJrC8odCiBS6wy27fn
 ByryBwgVBskoD0Jr1o1yKDOi5n+YBRzWC/6OAEKDV6axYgSSHslnEDkolyRbZYwZRFHpv0BHY25
 fDAY5LoQjQcdIARBj4qu4mOBc464okH73ATiWRFMd5Tgxpe66s+d5isw5vdp8f75n6bevcumqpI
 2YAHupxvmrxzYID+2KjQoRbfJh4R0bLFpZEO98fcFRbyHOe6jba6w451/EXIlyBN8RU+JC+n5KR
 rBfXKYj7WJg==
X-Received: by 2002:a17:907:96a3:b0:c1c:4a80:30c4 with SMTP id
 a640c23a62f3a-c50962eeff0mr1129516366b.11.1794924576141; 
 Tue, 17 Nov 2026 06:09:36 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c50efe61044sm136825966b.49.2026.11.17.06.09.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Nov 2026 06:09:34 -0800 (PST)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Nov 2026 15:09:34 +0100
Message-Id: <20261117140934.2701307-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/ncurses: fix shared library build on
 FDPIC toolchains
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Building ncurses with shared libraries for an ARM FDPIC target fails
at configure time:

  checking which .../arm-buildroot-uclinuxfdpiceabi-gcc option to use... -fPIC
  configure: error: Shared libraries are not supported in this version

The CF_SHARED_OPTS macro only knows how to build shared libraries for
linux*, and the host_os of the FDPIC toolchain, uclinuxfdpiceabi, does
not match it. As Buildroot passes --with-shared unless
BR2_STATIC_LIBS=y, ncurses fails in every FDPIC configuration that
doesn't build only static libraries.

Add a patch handling uclinux* like linux* in CF_SHARED_OPTS. Both
configure and aclocal.m4 are patched, as the package is not
autoreconfigured. The issue has been reported upstream.

This issue has been present since commit d75e29c9b23d ("arch/arm: add
support for FDPIC"), which made FDPIC toolchains available for ARMv7-M
cores. It therefore affects 2024.11 and later, and 2025.02.x.

Fixes:
https://autobuild.buildroot.org/results/f42285d1bc8d32b7b86185820eed306b596fe7ea

Fixes: d75e29c9b23d0edf47dadba365f592e5f7f957a7 ("arch/arm: add support for FDPIC")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...rt-shared-libraries-on-uclinux-hosts.patch | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 package/ncurses/0001-configure-support-shared-libraries-on-uclinux-hosts.patch

diff --git a/package/ncurses/0001-configure-support-shared-libraries-on-uclinux-hosts.patch b/package/ncurses/0001-configure-support-shared-libraries-on-uclinux-hosts.patch
new file mode 100644
index 0000000000..ca6f9f1291
--- /dev/null
+++ b/package/ncurses/0001-configure-support-shared-libraries-on-uclinux-hosts.patch
@@ -0,0 +1,52 @@
+From 50f34bf14f3fb58f11f9e43457008f5a0af8766f Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Tue, 17 Nov 2026 11:14:15 +0100
+Subject: [PATCH] configure: support shared libraries on uclinux hosts
+
+FDPIC toolchains for no-MMU Linux systems use triplets such as
+arm-buildroot-uclinuxfdpiceabi, whose host_os (uclinuxfdpiceabi) does
+not match the linux* pattern in CF_SHARED_OPTS. CC_SHARED_OPTS then
+stays "unknown" and configure aborts with:
+
+  configure: error: Shared libraries are not supported in this version
+
+Handle uclinux* like linux*, as these systems use the same ELF shared
+library conventions.
+
+Assisted-by: Claude:claude-opus-5-5
+Upstream: https://lists.gnu.org/archive/html/bug-ncurses/2026-11/msg00025.html
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ aclocal.m4 | 2 +-
+ configure  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/aclocal.m4 b/aclocal.m4
+index 1463b24..d6a0a0f 100644
+--- a/aclocal.m4
++++ b/aclocal.m4
+@@ -7843,7 +7843,7 @@ CF_EOF
+ 		fi
+ 		cf_cv_rm_so_locs=yes
+ 		;;
+-	(linux*|gnu*|k*bsd*-gnu)
++	(linux*|uclinux*|gnu*|k*bsd*-gnu)
+ 		if test "$DFT_LWR_MODEL" = "shared" && test -n "$LD_RPATH_OPT" ; then
+ 			LOCAL_LDFLAGS="${LD_RPATH_OPT}\$(LOCAL_LIBDIR)"
+ 			LOCAL_LDFLAGS2="$LOCAL_LDFLAGS"
+diff --git a/configure b/configure
+index 48ad381..fe76667 100755
+--- a/configure
++++ b/configure
+@@ -7123,7 +7123,7 @@ echo "${ECHO_T}$cf_cv_ldflags_search_paths_first" >&6
+ 		fi
+ 		cf_cv_rm_so_locs=yes
+ 		;;
+-	(linux*|gnu*|k*bsd*-gnu)
++	(linux*|uclinux*|gnu*|k*bsd*-gnu)
+ 		if test "$DFT_LWR_MODEL" = "shared" && test -n "$LD_RPATH_OPT" ; then
+ 			LOCAL_LDFLAGS="${LD_RPATH_OPT}\$(LOCAL_LIBDIR)"
+ 			LOCAL_LDFLAGS2="$LOCAL_LDFLAGS"
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
