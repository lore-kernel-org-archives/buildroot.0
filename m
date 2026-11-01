Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68BAE606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 22:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dWphczqD
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 45B3360623;
	Sun,  1 Nov 2026 22:43:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dziDOuzDtZ17; Sun,  1 Nov 2026 22:43:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 4AD4760616
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793572986;
	b=KEcUeRkREzjcdrWlWCxzj0R5GlGXzFzzxHQOcNayzwXoTI8wBCSgeZ1yyNQDRWJoL0GP
	 2gf90FNOhjPDGA7wEvQcB1CrANRDJBY4njDNn5kTm5s5tm8K5bnZKmsz4fdaaU/4HUmj2
	 +v2DisywhXXFQZSVz7lrIM3He7Q01g37g3u68brarYdj69ZqnQ3sjm3T2+hTRqAP7MVT4
	 3FDkpK24PAQBwEif6hOdlnTMUolE//4rHIEhzlzBFBcUQB1wl1eMBy6paPhmgT6Xl6Sbo
	 Z9MLtZZ7f9jq3BMLxpYf9GbOYZl6itQSRYtOAAr8Im5Uz7Jr0qXGHRwoSfuEAoildwg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793572986;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=DPm4kmhkODMfWh9r6eg7NfoBL7t3TWH0ybVY/a0mDjo=;
	b=nrLssNWDmhKfqIMqiMYCeVVRzGeClGQdYuLNNWQ6REAjIkwy0lw3EfxgN8uO6NM8U5ko
	 /dJ92aFeJ92E0MMvnQ0QYknqcFjTjSmyONUOUfrtt39Mjm1OD0DDA+jyrhHAPLLMsDxNU
	 MWcpM2Xs/qFw1DdjXQ8uWjtS9cVrvkSBJSkrKNURYcA+9XS5SvVfI7TsGKR/S5DNqc0+g
	 D7/wsz25vV4P6dgYgPMTzawmQGfUc4NOGZfnMGoYpD/4/Qv5JfkxWbCN+kDpA+sj78UEJ
	 T37XaGH4vzTpJcuiz6QagvlWQguBYzTQHx8kWUOgW0C6Jcojm0H8SchI9Bg1PWJERMQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793572986;
	bh=DPm4kmhkODMfWh9r6eg7NfoBL7t3TWH0ybVY/a0mDjo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dWphczqDGMnYXIP33NtOyxMd26q3U7FsBs8Wt1KnFWbTv0UvyaCQBnKPPmU+7b8os
	 2s2x2EGbMkd6lCGy3joQt4XPjEVZ+mmMFTsL/4+Msp5oFx9OSS+heSkjQBftuf/sCY
	 Mwrrhk20gzLvxQd1iIv0w/sx0TEIO7Kl8hKR31fdj5HfGTA3KxJcoVaPrReeP/2mlT
	 4e7DM1SKSqlZraqnFGr/XWANSkKjAj0qHhJPFz8b01fRo6s26vgHoJ0EuDCRXSZIz8
	 uEob9tfSjvDjGpE0z8lRru6CCG171C81mp7umn2iLf4A090vwpJ1Q3MnLH76YfG5l8
	 c+iDHNp4mTsEw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4AD4760616;
	Sun,  1 Nov 2026 22:43:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id DD361435
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:43:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2D0940086
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:43:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XRmEWCfehsea for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 22:43:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 23B3140042
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793572984;
 b=MWC3w4PXfeX4nDSd7+68V4OscOwDk0wHJccaQMzlkvZ6NdbuN6Utpsm5CIukPDOfKzy8
 nFvnGUcbLl3GytXeDd2APPwnXoQCunaS8ZGzBpoIm+IsstJzM3lUougjaRmG5WeDNYlvs
 v8n819AobgGINxww8fzm1Zu6uXIHuwpqmOsHA0UsrFl3UkXo4GIrOCo1jptDPw64fWyrH
 1PIiikJiOLwPi+CSrByCnvZd/eb4lWsgRnCc8ZYaGCqsi2x+j0DdrAfhucEm8hPF9599x
 3WFImST0vNaQtzs5i5Vk5JpcmsomcKO0gpoUVEXz61Gfwi/1duTxfgVuuc52LGBlTgA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793572984;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=2x6w8h8+8g4Cnbd0XJ+hj+MGZydQwLVJ4dm71r3Fg/w=;
 b=kmsBI2QEnOHBCppsbBNBbIhUF6FfGIBxuSbMUGZTyIOVae2ZnsOdMyZpWS0PxOMW8TtK
 uYl3L1VAQvi3geRMDTuEMNpdn0W3usmxZKMPuDmO1mgagE9DtST80tAN329vRxSaR/b5h
 tbvJcW378wm81C4S/EEEwpwPvG5aQeyTQU1ca7M3effAOa2jmSwhdWPyiy5wL4/zydfK7
 eqvNPvcA5fW/Fwo9GI0y9+xHPZzJS3ZIwMA15+4aI+Y6evv2nfsRq/jGJ01AchCrpO5yA
 J9aPSDGB24jk5zpYIhY/ubGIup53Hn/xs/jOinU+SqGarIUbYSYSWNb6LwYLQ/1p3kg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23B3140042
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 22:43:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B649B9D5C0; Sun,  1 Nov 2026 22:41:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 23:42:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9462bb4baf4b58bec107ee1c6952b1e17072c3c3
X-Git-Newrev: d2f3cd8cbe3316484d6953f73db4a31277adcf7d
X-Patchwork-Hint: ignore
Message-Id: <20261101224134.B649B9D5C0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools: perf: explicitly
 disable BPF skeletons
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d2f3cd8cbe3316484d6953f73db4a31277adcf7d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

perf builds its BPF skeletons by default whenever libelf, zlib, libbpf
and openssl support are enabled and a clang >= 12.0.1 is found in the
PATH. That clang is the host's one, and it compiles the BPF programs
against the host's system headers, so the build fails (here with
linux 7.2.6 on ARM and Ubuntu's clang 21.1.8):

/usr/include/linux/ioctl.h:5:10: fatal error: 'asm/ioctl.h' file not found
make[6]: *** [.../tools/perf/bpf_skel.mak:87: .../tools/perf/util/bpf_skel/.tmp/bpf_prog_profiler.bpf.o] Error 1

Without clang on the host, perf silently disables them, so whether the
build works depends on the build machine.

The perf tool does not depend on host-clang, so always pass
BUILD_BPF_SKEL=0 rather than let the host's clang be picked up.

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-tools/linux-tool-perf.mk.in | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linux-tools/linux-tool-perf.mk.in b/package/linux-tools/linux-tool-perf.mk.in
index 3271fd5683..45bb2bd7a3 100644
--- a/package/linux-tools/linux-tool-perf.mk.in
+++ b/package/linux-tools/linux-tool-perf.mk.in
@@ -30,7 +30,8 @@ PERF_MAKE_FLAGS = \
 	NO_LIBPYTHON=1 \
 	NO_LIBBIONIC=1 \
 	NO_RUST=1 \
-	NO_SHELLCHECK=1
+	NO_SHELLCHECK=1 \
+	BUILD_BPF_SKEL=0
 
 # We need to pass an argument to ld for setting the emulation when
 # building for MIPS architecture, otherwise the default one will always
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
