Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90F31606A326
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 10:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=G2uO/VDG
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 54B53812BA;
	Thu, 19 Nov 2026 10:31:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id inD07djovMzt; Thu, 19 Nov 2026 10:31:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 4CEEB812D3
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795084269;
	b=MbVPOZ/1U2+1lbx3PnLGRGFqBYtAeuW+Rqv4en/yEoP+FmENIbPd1ZR/7+4pWPbD+gZa
	 KiWeDbsP7cXcH+sNCkIz4lqVAqOEHJkSEDnEAdfGWTolR7HggttobuXLxq1xTKgsbpu9y
	 e9lGcxuaXug07AGMRJbn/ZCq86i/qe3R1ZpkdXknwFzm+g1ttbJ8UZnHBymZXfpcQsJW1
	 YliFimyEsQVC/19qMRAOXeZoZfJCkjVk9VTIxXfbZyvKVc/lfHdbMbqvdSHG/m9tHAf7O
	 ETXjIq5y7r6Egbz/arA/2B53uCIwuLZ6tbCIhnnMJebGlJPBkMeBKjjuN3889TJKkIQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795084269;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=UprdCklm1t/fkEnnsoISQU0oIaZmdO11UOxTzGzEdk8=;
	b=g6Uh3jUAQBjPzG8OTUwQFdwfSfmwPZ2u9ae3OaMRaG7qWCBVNhhW2+YeGT0HAFSLyO4W
	 PI0la5XLS1wyBkyCLuWgDjtCaq9+HqNbyYnnCXINbDXqrgvoWk9gzzzgURtcWGtnlwtxO
	 Ctu1f7kpSsxoWc+y+FMIsIiLxuBxtRPvelEmNPVqo9XMK0649Fxq+x3evgvheidwHS/cP
	 uP5xrTSpuSdm8bO37jyZIiv+SgOSz4snKGPxJMnKbakfv5Rn9hgRWBShIqGSSxZsEqeXj
	 fCgmQvI+bvvH3bOjufO8y4B/wznJ3+hTFLxCpgdNPztAVWWueiiRswkqfVxEY94J8TQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795084269;
	bh=UprdCklm1t/fkEnnsoISQU0oIaZmdO11UOxTzGzEdk8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=G2uO/VDG1SwKEQV00BP+oYvGI5CXkb6iR0QbGb1BPeL2A6ENCzSS0kGPUQcjU58e6
	 911uVMNS4ovVNXf60DC8C2PzVfRzNz+G51J1p32XUak63tZYVzDCo79xk+z2NGyqzH
	 tJge+esyrok6g6D+J9DInA6TdrUZuxaiSUjOTvw1Mr8YEW7Nk/FJAkdlp87wgSo2FN
	 ifX2w6pmvUfSZCguib/XjJIfknYLKUjdPNE4ODZ5EPl5bGNwvz1RCKBPULNx+fQzpy
	 x1skThbs+VFqkU8rMJ+GIid+B/JkFYmIDUZAPROfPIcL6ljRLgJH94rZ2YZ8VIQhaZ
	 GfNsG740ztqNw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CEEB812D3;
	Thu, 19 Nov 2026 10:31:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 89AB070B
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 10:31:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B8DC40520
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 10:31:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6m-qxEG5UV0u for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 10:31:07 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 4A6A24051E
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52f; helo=mail-ed1-x52f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4A6A24051E
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 10:31:06 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-6b6f42095bcso3191490a12.3
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 02:31:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795084265; x=1795689065;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=PyRwgyzF8M+y+X75TYSWRamEOZZMrGFDV1P0RBJA1Cc=;
 b=RfkfiV+M8TD1zvEJefWXoS0ECJtw/QjSpJxM1NUKvLeKfot0VIgY+phecQ1pOsnQQk
 4J57SKejuQCw3Iyp17i/ywl0qqel05PnO88VK2nEAuTrK3jxBdBoA5jhVP8zJX0tM5JG
 bBHSaaYLoxlv587A/HGfMsINE2/H2JJXTvACFmRJFtBrDqfu5c22ucDICS4QnvG6bAAF
 +YgcVfzLDS+mtl4/sCbzwJ9UzAwRvgkpHS3xyfDi9j+Bq+SSwW28R5mNZ6fcETeIKVaD
 fFnbmA0kY9PzI/lQSMFj0CUmjOXk5HVObv8P9F/DTaX5ZAPgNXSueNjR6XH/UNeN5JAn
 g+UA==
X-Gm-Message-State: APuU4Z/Nbwx2PmWks6oiYrMjsUh/KLm0tEN3/5fvmvkxCI4MLI60budV
 nfriuphZ9h+IvFoUqRY+rMTEBN8ezErTDADcp9GVmuHbr+5Td0NJIeGxavtsQg==
X-Gm-Gg: AYBFou3Lxps7Tchy9i6VMAOqyF8JBB7CICC7DYnMr24ldbCcRnY9qOm5KAPRMQ3zGpZ
 oW3mgJBvTY6hugBKcEz7vtF+x9Yv2gqVH3UJr90UhCxY+0ZKCcUIVx55c+OR9dkvoJW4LgfwS0H
 GJ6XrkmdyjEBRWyxdsdZ9YDwQeKs4mVGxjXqdO2VKianoD8XM1akGoRWAm3jZq7uOkTWRfirnlC
 6wblM7ioyS3eHxWAzUJagHSqunlvB+eh8fNNpO5r0EUsJINO+culkAQ6Bb3TH1sjDqQT94nOxMO
 tDKH+M4y2yopZwTIAjwMr7xTsUg3DtKW8ThOpm/q8ROLUt5zB9k8PoufkBZuacYVqnHtXUt6fU9
 JCz13KHzMAHCqKm32DSHVZPQ6nrDrtCIYPInNKcht7Gyjyijt74jqEj+nOKRl68GvQEO7dbGnsm
 4wtL45s53nA9LcIyWYwWT2zIergzmUsKjIHXj29MMfpe2IPOfh5QRH1GI3QLvsN84sqa8gs/oBW
 TWrlevo4+VT7UdnX4BDxrIGVRXMt8mPaFd1M9PAuf0JWmp8zKLtMkZuDwSNREv9U1H5J7CxwRDQ
 wYgqKe83cTNGPMwT5RX+EOrNz7yT5vy8L7jBKwRU8MtNQz/wDXw20jto1s3OY5LZOFGevHS0llp
 5Xyb6osBp
X-Received: by 2002:a17:907:c8c8:b0:c49:cf3a:a324 with SMTP id
 a640c23a62f3a-c510e148c36mr504168366b.22.1795084264664; 
 Thu, 19 Nov 2026 02:31:04 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c512346fabesm94299266b.62.2026.11.19.02.31.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2026 02:31:04 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 19 Nov 2026 11:31:03 +0100
Message-Id: <20261119103103.2602430-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/shellinabox: fix build with musl and
 GCC >= 14
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
Cc: Olivier Singla <olivier.singla@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

With musl, shellinabox is configured with --disable-utmp, as required
upstream. Its configure then no longer checks for utmp.h, so the
header is not included by launcher.c, although login_tty() is still
found and used. musl, like glibc, declares login_tty() in utmp.h, and
since GCC 14 made implicit function declarations an error, the build
fails:

  shellinabox/launcher.c:899:5: error: implicit declaration of function 'login_tty' [-Wimplicit-function-declaration]

Add a patch to check for utmp.h even when utmp support is disabled.
HAVE_UTMP_H only controls the inclusion of the header, while the login
records depend on HAVE_UTMPX_H, which stays undefined.

Upstream has been dead since 2019, so the patch is not sent there.

This issue has been present since commit 5eb0203cb05c ("package/gcc:
add version 14.x"), as GCC 14 turned the implicit declaration into an
error. It therefore affects 2024.05 and later, and has occurred more
often since GCC 14 became the default in 2025.08.

Fixes:
https://autobuild.buildroot.org/results/5cba7080214ec7af98417db0fb61879d57e313a8

Fixes: 5eb0203cb05c0a65bdb7f89a2644eef7cff2dd27 ("package/gcc: add version 14.x")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 ...ck-for-utmp.h-even-with-disable-utmp.patch | 49 +++++++++++++++++++
 1 file changed, 49 insertions(+)
 create mode 100644 package/shellinabox/0003-configure.ac-check-for-utmp.h-even-with-disable-utmp.patch

diff --git a/package/shellinabox/0003-configure.ac-check-for-utmp.h-even-with-disable-utmp.patch b/package/shellinabox/0003-configure.ac-check-for-utmp.h-even-with-disable-utmp.patch
new file mode 100644
index 0000000000..49012817e9
--- /dev/null
+++ b/package/shellinabox/0003-configure.ac-check-for-utmp.h-even-with-disable-utmp.patch
@@ -0,0 +1,49 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Thu, 19 Nov 2026 10:43:49 +0100
+Subject: [PATCH] configure.ac: check for utmp.h even with --disable-utmp
+
+On Linux, login_tty() is declared in utmp.h. With --disable-utmp,
+which is required with musl, utmp.h is not checked for and thus not
+included, while login_tty() is still found and used by launcher.c. With
+GCC 14 and later, this breaks the build:
+
+  shellinabox/launcher.c:899:5: error: implicit declaration of function 'login_tty' [-Wimplicit-function-declaration]
+
+HAVE_UTMP_H only controls the inclusion of utmp.h, the login records
+depend on HAVE_UTMPX_H. So check for utmp.h unconditionally.
+
+Upstream: dead (last commit in 2019)
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ configure.ac | 7 ++++++-
+ 1 file changed, 6 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 05ab1bb..234ce32 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -34,6 +34,11 @@ dnl Check for header files that do not exist on all platforms
+ AC_CHECK_HEADERS([libutil.h pthread.h pty.h strings.h syslog.h sys/prctl.h \
+                   sys/uio.h util.h])
+ 
++dnl On Linux, login_tty() is declared in utmp.h, so check for it even when
++dnl utmp support is disabled. HAVE_UTMP_H only controls the inclusion of the
++dnl header, the login records themselves depend on HAVE_UTMPX_H.
++AC_CHECK_HEADERS([utmp.h])
++
+ dnl Most systems require linking against libutil.so in order to get login_tty()
+ AC_CHECK_FUNCS(login_tty, [],
+                [AC_CHECK_LIB(util, login_tty,
+@@ -147,7 +152,7 @@ AC_ARG_ENABLE(utmp,
+                                            be disabled.])
+ 
+ if test "x$enable_utmp" != xno; then
+-  AC_CHECK_HEADERS([utmp.h utmpx.h])
++  AC_CHECK_HEADERS([utmpx.h])
+ 
+   dnl Even if utmpx.h exists, not all systems have support for updwtmpx()
+   AC_TRY_LINK([#include <utmp.h>],
+-- 
+2.34.1
+
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
