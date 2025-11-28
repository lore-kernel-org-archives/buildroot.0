Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4120CFD376
	for <buildroot@archiver.kernel.org>; Fri, 28 Nov 2025 10:03:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8619140DE6;
	Fri, 28 Nov 2025 10:03:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BFQUjXLdszVA; Fri, 28 Nov 2025 10:03:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC81540E14
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC81540E14;
	Fri, 28 Nov 2025 10:03:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BEBD71A9
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 10:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A8A7140145
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 10:03:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id THkjsCjUQyRe for <buildroot@buildroot.org>;
 Fri, 28 Nov 2025 10:03:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.117;
 helo=smtpdh17-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 7E78240063
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E78240063
Received: from smtpdh17-2.aruba.it (smtpdh17-2.aruba.it [62.149.155.117])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E78240063
 for <buildroot@buildroot.org>; Fri, 28 Nov 2025 10:03:10 +0000 (UTC)
Received: from localhost.localdomain ([212.103.203.10])
 by Aruba SMTP with ESMTPSA
 id OvJivv8kBBhI9OvJjvGyby; Fri, 28 Nov 2025 11:03:07 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Fri, 28 Nov 2025 11:03:05 +0100
Message-ID: <20251128100305.952494-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGvsNgnmyKUhPqiBh8StMplwMdrIqvcAByeYWVQM+MzafwXa/jtyudrkb5KcJh41Vp6f3eHCyUVN2mQ6S8oOW/MwfpfaiaJA18qHJb3hs1a0a0foj4JM
 4Aoio3axzz3X8Ji7vZvdJtQH+rJWyEF5eddXmfJV9A2iBkYjTXRfK890WB5H7uuNGMchiVEkIYPcLdYizc0gZAq9DExF7Cd0wnbUkKZomQixKohbeBEweaK4
 1/9guINqXfYTYNG86tjaJk2YjNbJsugMukWQQIa70uYqiH+uejLDY0IwUqzV0MvA
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1764324187; bh=E8+vqsSnWvwoScBj3YCs2yavMwEPgL6b+doCHaPkeZI=;
 h=From:To:Subject:Date:MIME-Version;
 b=DUziqTiZ92vNnaMSXJIxdmRY+1L9HVWaVCBhBYg5UG9G9RzGWJ5lk9Z2tMd7fiznQ
 Stl1OK4Ah+DBoKuyRm+XoKPHz4BFrVXSGjyYRq1eCnJi7wBGm4znsHHDhmRmEfhBk5
 VRvz56lY8lV4S/6U/SlIN9HBugF7GpGloErVdi3AzlcolheKkfTM9OjW0LDxK9qgK9
 bQtI5pJQX3DvObI4DN8HRem1wpEbH8t7vau4Swbr0SPHhem7of4diBoNhFUuoOycbR
 L1qvtxrz+yx95QDX/OF2bcOGQ5pFDfhNPkJIiaCku2Xn0lvsV1nKdVngERIbHyKwTz
 DGzxqGG7JHPcQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=DUziqTiZ
Subject: [Buildroot] [PATCH] package/sdl: fix build failure due to type
 mismatch
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add local patch to fix:
./src/stdlib/SDL_iconv.c: In function 'SDL_iconv':
./src/stdlib/SDL_iconv.c:50:29: error: passing argument 2 of 'iconv' from incompatible pointer type [-Wincompatible-pointer-types]
   50 |         retCode = iconv(cd, inbuf, inbytesleft, outbuf, outbytesleft);
      |                             ^~~~~
      |                             |
      |                             const char **

Fixes:
https://autobuild.buildroot.net/results/cfb/cfb1f9a0137332cf080ce862722e4fe8ad275031/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...tdlib-SDL_iconv.c-fix-types-mismatch.patch | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 package/sdl/0004-src-stdlib-SDL_iconv.c-fix-types-mismatch.patch

diff --git a/package/sdl/0004-src-stdlib-SDL_iconv.c-fix-types-mismatch.patch b/package/sdl/0004-src-stdlib-SDL_iconv.c-fix-types-mismatch.patch
new file mode 100644
index 0000000000..da666d5996
--- /dev/null
+++ b/package/sdl/0004-src-stdlib-SDL_iconv.c-fix-types-mismatch.patch
@@ -0,0 +1,48 @@
+From 390974b8a9d5e513d48d794818dbe180e0f80b16 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Fri, 28 Nov 2025 10:57:41 +0100
+Subject: [PATCH] src/stdlib/SDL_iconv.c: fix types mismatch
+
+When building sdl this error shows up:
+./src/stdlib/SDL_iconv.c: In function 'SDL_iconv':
+./src/stdlib/SDL_iconv.c:50:29: error: passing argument 2 of 'iconv' from incompatible pointer type [-Wincompatible-pointer-types]
+   50 |         retCode = iconv(cd, inbuf, inbytesleft, outbuf, outbytesleft);
+      |                             ^~~~~
+      |                             |
+      |                             const char **
+
+Let's pick only this code from upstream commit[1] and left the rest
+untouched.
+
+[1]:
+https://github.com/libsdl-org/SDL-1.2/commit/8a8135d91f9361448521765c9da00401fab866a1
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ src/stdlib/SDL_iconv.c | 10 ++++------
+ 1 file changed, 4 insertions(+), 6 deletions(-)
+
+diff --git a/src/stdlib/SDL_iconv.c b/src/stdlib/SDL_iconv.c
+index fa56a99e..369f6881 100644
+--- a/src/stdlib/SDL_iconv.c
++++ b/src/stdlib/SDL_iconv.c
+@@ -43,12 +43,10 @@ size_t SDL_iconv(SDL_iconv_t cd,
+                  const char **inbuf, size_t *inbytesleft,
+                  char **outbuf, size_t *outbytesleft)
+ {
+-	size_t retCode;
+-#ifdef ICONV_INBUF_NONCONST
+-	retCode = iconv(cd, (char **)inbuf, inbytesleft, outbuf, outbytesleft);
+-#else
+-	retCode = iconv(cd, inbuf, inbytesleft, outbuf, outbytesleft);
+-#endif
++	/* iconv's second parameter may or may not be `const char const *` depending on the
++	   C runtime's whims. Casting to void * seems to make everyone happy, though. */
++	const size_t retCode = iconv((iconv_t) ((uintptr_t) cd), (void *)inbuf, inbytesleft, outbuf, outbytesleft);
++
+ 	if ( retCode == (size_t)-1 ) {
+ 		switch(errno) {
+ 		    case E2BIG:
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
