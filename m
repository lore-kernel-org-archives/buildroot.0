Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54D67606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 21:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rnywfd/A
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F24840538;
	Mon, 26 Oct 2026 21:50:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EgqCZ8ApehvT; Mon, 26 Oct 2026 21:50:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 131C740604
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793051420;
	b=Bx5Iv/id+9OTChpHEoI8AJSIedZHyu3D++CId8F+/dwe4+nesxir9tUfQrchEnSjIiQe
	 F8fNd8FHTh7/9wN/A9Kdjh78ca74hzOZEvh/nbJG0FKUgH9zE7bqyTkQCZFTp0z/laF7I
	 ZCHmdkdc/O0LySp7WsjWAa6uozDI2TVvx8JbTWtfe3joVenO4HejLNmFgcf5UUHEGhm4X
	 EKwvGxSPmAieEwAkPe7A5HXiwLdxhBgeQflg1Q7dLHEiZ4g+jg/5KuEPjG6hSFK7G7KFC
	 sJ8S3+0NxcbcpHyr7j5S0O40TBUErbFhVx3BA4FHsjh2BzsyW/pVx9JYNiXZCvXL5LQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793051420;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=solQDS6OF82GnkjKD6YfnVBXaLIzNbcG8ZGqeWhOVYY=;
	b=egExkzZQQ4qV1zCo+Fa00OwvBTJdXNd7m1XpnLtBRxlL3bkGjDuHC4dyFRF/+u3Vf1uj
	 W02q0bXIZN3X2nFUkRqlZDNUCNanmYcnNZ15BpwjCV/8WwpAaVYCEXjxYKayQ/5dhuHsT
	 n5eI1o2Cu5Tm/l27Q6gGyEwN6/RVviMAULRS9o0TzugiEsP+OLAlo+rGcrNDPAchgIEDz
	 iOynRD1MdmHO0WPs398VSM9TivjTDaKvGRDiG/m1tq2uXXHH4aHN6Y2tUU5Rpnz76hZ1l
	 QuydzPdo0oCurAVRkR8ztSYO9oGiPHhO6HAuQLlOzfMyJ9FkMEUa8qmkdbjG++eCqEA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793051420;
	bh=solQDS6OF82GnkjKD6YfnVBXaLIzNbcG8ZGqeWhOVYY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=rnywfd/AM6PWtcO89E6NA9JcMot5oTJDUEkZgjmLqWGT+6ZOPrXkikZK2G9eTDAJV
	 CMIFg17oSGxuIFQbCrssjqZk1ZxLs7Sp2EosMDxek8TlAGFn9kTgVOmHgez/jgbtss
	 OOCrdKUV5zc4piC3Z0Yho9RKd5HfRD10WmbRia+Y+eR3jiZTXXl1/54vmDO/03eh38
	 RtdtdWjaTX+EBHR/BTo20kFNZAkT60RUsxNV/EP4C9AIwo5jTKaq42t6qK2BiY5pts
	 r7ZnGstnM8rjX99IiYTnSRSJWAcBMfCpTXNrma3GLQqS5MS/bm5CNlKkF54HSgHw66
	 GExCYJyCfZKuQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 131C740604;
	Mon, 26 Oct 2026 21:50:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 005823423
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB29140604
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1A7UajiL2ljV for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 21:50:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 23BAD40538
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793051416;
 b=le7Fr+jAhFjV1zHefjIY3k6L+xWQFNRf4XzOtUxNLfiSWJ0wWJ6kEqyPYYIRdAKrv/D0
 xLcER7fyHdCu1DmncQZf4+sBkUa3ryUBGeU7A0bbRKZZ7rEztXvJy5SABh72lBleujeop
 p3acK5A00ZWgqM6Im3KEhmMQq64/myGpAx2F7mGL6OYYJQozoWMJjO7+ZE54C7kRWyp3x
 /tU+2TnoLpD4J/57R4vQ1h8OR9maF27S2nShlAIduyq04o9kMyy/HcdnyU0OcplsNCUg5
 CgKUhPq9alLhtTt8jr0MpprHL/QyILSYaKESA0cmXv6zgcfeQEVkgPoY8JJX5cy7qsQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793051416;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LdO0vV/fA+hPiljuqMNxBpzAoi5VGutpADVMN9FP0CU=;
 b=BXnQPw10aa1OH7AOnbq3c3V8nItzVLPfsLQZjd5Ez4UCIj8Nv2oQOzUGBclmZE6ReKMD
 16vBK1DEv/co8K1WOynBiM6VztXkM7kc7s8ID0IbEdwOiFxxj46xtQ6x5w3eRI5pJq9I7
 xMOpSnvisbBLuVydw2FNTByRVxzS+WnNZPxRkDT+81zsyl8xOIKN14fgkbtph+BRLQW2d
 66C/QghBmiLKK+59x0e7uYM7pojepkKthlJY1LlnDyxExBq7ebzDfoZ227JwIleWjxscn
 PGSfGFkhI/jGxMUa2qKmWsmQnEf3R4/PV0iHBJ/g7k470dJuDRobOdOT9T4B/IuPQwg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23BAD40538
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:50:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F124B9CFC8; Mon, 26 Oct 2026 21:48:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 22:45:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ce28c57eb5f92cce815491fc463f168945daab3
X-Git-Newrev: 8e9bda8e6434d1cf7b7ec33d5b40c2a9723405a8
X-Patchwork-Hint: ignore
Message-Id: <20261026214849.F124B9CFC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ccrypt: fix build with GCC 15 on
 musl
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8e9bda8e6434d1cf7b7ec33d5b40c2a9723405a8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When cross-compiling, ccrypt's configure can't run its getopt_long
test and always falls back to the bundled getopt. Its getopt.h only
prototypes getopt() when __GNU_LIBRARY__ is defined (glibc, uClibc),
so on musl it declares "extern int getopt ();", and getopt.c declares
"extern char *getenv ();". GCC 15 defaults to C23, where an empty
parameter list means (void), so the build fails:

  unistd.h:127:5: error: conflicting types for 'getopt'; have 'int(int,  char * const*, const char *)'
  ./include/getopt/getopt.h:150:12: note: previous declaration of 'getopt' with type 'int(void)'
  getopt.c:404:21: error: too many arguments to function 'getenv'; expected 0, have 1

Add a patch that always uses the full POSIX prototype for getopt()
and gives getenv() its standard prototype.

This issue has been present since commit 75891397abe6 ("package/gcc:
add support for GCC 15.x"), which made a C23-by-default compiler
available. It therefore affects 2025.08 and later, including the
2026.02.x LTS branch.

Fixes:
https://autobuild.buildroot.org/results/dd2b362542488a306a523fa05dedc859dfb0cf7e

Fixes: 75891397abe60dbe3d82a1ec39654ff81d1b1406 ("package/gcc: add support for GCC 15.x")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...d-with-C23-compilers-on-non-glibc-systems.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/ccrypt/0001-Fix-build-with-C23-compilers-on-non-glibc-systems.patch b/package/ccrypt/0001-Fix-build-with-C23-compilers-on-non-glibc-systems.patch
new file mode 100644
index 0000000000..002d011062
--- /dev/null
+++ b/package/ccrypt/0001-Fix-build-with-C23-compilers-on-non-glibc-systems.patch
@@ -0,0 +1,56 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Mon, 26 Oct 2026 14:41:24 +0100
+Subject: [PATCH] Fix build with C23 compilers on non-glibc systems
+
+C23 (the default since GCC 15) treats an empty parameter list as
+(void). The bundled getopt only prototypes getopt() when
+__GNU_LIBRARY__ is defined and declares getenv() without parameters,
+so building against e.g. musl fails:
+
+  unistd.h:127:5: error: conflicting types for 'getopt'; have 'int(int,  char * const*, const char *)'
+  ./include/getopt/getopt.h:150:12: note: previous declaration of 'getopt' with type 'int(void)'
+  getopt.c:404:21: error: too many arguments to function 'getenv'; expected 0, have 1
+
+Always use the full POSIX prototype for getopt() and give getenv() its
+standard prototype.
+
+Upstream: https://sourceforge.net/p/ccrypt/patches/7/
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ src/getopt.c                | 2 +-
+ src/include/getopt/getopt.h | 7 -------
+ 2 files changed, 1 insertion(+), 8 deletions(-)
+
+diff --git a/src/getopt.c b/src/getopt.c
+index 23ab9c3..9974486 100644
+--- a/src/getopt.c
++++ b/src/getopt.c
+@@ -209,7 +209,7 @@ static char *posixly_correct;
+    whose names are inconsistent.  */
+ 
+ #ifndef getenv
+-extern char *getenv ();
++extern char *getenv (const char *);
+ #endif
+ 
+ static char *
+diff --git a/src/include/getopt/getopt.h b/src/include/getopt/getopt.h
+index 1abae0f..d8b4edd 100644
+--- a/src/include/getopt/getopt.h
++++ b/src/include/getopt/getopt.h
+@@ -141,14 +141,7 @@ struct option
+    `getopt'.  */
+ 
+ #if defined __STDC__ && __STDC__
+-# ifdef __GNU_LIBRARY__
+-/* Many other libraries have conflicting prototypes for getopt, with
+-   differences in the consts, in stdlib.h.  To avoid compilation
+-   errors, only prototype getopt for the GNU C library.  */
+ extern int getopt (int argc, char *const *argv, const char *__shortopts);
+-# else /* not __GNU_LIBRARY__ */
+-extern int getopt ();
+-# endif /* __GNU_LIBRARY__ */
+ 
+ # ifndef __need_getopt
+ extern int getopt_long (int argc, char *const *argv, const char *shortopts,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
