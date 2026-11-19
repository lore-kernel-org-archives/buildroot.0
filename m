Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1441C606A320
	for <buildroot@archiver.kernel.org>; Thu, 19 Nov 2026 07:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=QiZe+XgP
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0FD9340A1E;
	Thu, 19 Nov 2026 07:33:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iQ-Q7MLKs8wv; Thu, 19 Nov 2026 07:33:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EB251409D4
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795073601;
	b=DXbxI0JOP8vX9eLyLqi9q1DMJkofGmua/BOJlaWlGqZL3msko/JGtCQVUqhahJDUypXS
	 tPzuT5S7+muRnY9z3GxvfbWCx5+aogz/oEFtW0HI7ODDR52jjQnittMPJT5RDm6j7vwrz
	 2HK4cQT29y3En0ZwKqkCmNB3DkUahVjOVIqrIr2MEd4UjQbEW4Y+iDFP6nslPK2bN2DUD
	 7YPOMACCycDLr/nFkoSCmmi6DdaVCG55EnfH3G87fREQYH0MPA7pEN0gNSwAdo/FXs5pD
	 +wjhKncu8e5GX25xUqhSAtrHkIZOMVc6LZuZ0Kx3Dm5tyzVgQ7RooXYlqoB8E/krk6w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795073601;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:To:Date:Message-Id:X-Mailer:MIME-Version:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=GJ9UXl65gVC9jwlGnocImdC/5w/mKUcIwH/S9fBdSOc=;
	b=dP7pckgr82/JWJy4d+avGNlNSHejYpLUbwI7OfM55T3gooEDoz/XDaZxglI1bSyw+qXb
	 H/1nqNJLpdHDiu7scmf9WzaIfJ0f3DtDVpYWkUd2QCJwEjQ1buZbcgX0HqzV0BD/kFuW6
	 Lf5tqIKuVn8wyYzImJtQxQ6TGax/o5qYTxQdL2mFhomZcjx3Lg0dGk+lRr0NHxowKSRDC
	 L5vsN+CXnp1q8lNCsfukkSymBtA59dvfcPOpmXOEnA9/7ckbQ6lTVKLNs/XeJPIpJrdM0
	 Xt4C37gDqqth74Z7OKGnn57JC2vfqscop+y1j0/RTIDX1mE4dzX5rOojRrvCHrx+mOA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795073601;
	bh=GJ9UXl65gVC9jwlGnocImdC/5w/mKUcIwH/S9fBdSOc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:Cc:From;
	b=QiZe+XgPbGe50JLKf9t6qMOSLTMSm+4qN+GhsURy98EUg3VT/gePXHApWBvs4uJIq
	 MHof25BwVsvZTF4iBObhQ5PPqJ3H4kF7TaaotnGY0HXoYakSI19pwsevS2xgX3dFf4
	 EVmakC64Ct6lbgAuvVv4iMXIGcogN0tkyxyL39XN6xixqf7EXN4ynKkcaWukOQ9XBT
	 odCfSdgJzC7rPX/VbUTQxaeKw30Ip6NgNWlgikGrYGhhXUKEBL+mvlHP4iBDeoLRzL
	 wXIJOoz4Rs4qMFy/P3/fj0v7u8X//yH9TSh6+XEwK3EwDIEbDx7D6L+9xfuad5yceQ
	 kNVTPRVYMptEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EB251409D4;
	Thu, 19 Nov 2026 07:33:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9CFCF79D
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 07:33:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 99CD360A94
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 07:33:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K2xUxT_5qPwZ for <buildroot@buildroot.org>;
 Thu, 19 Nov 2026 07:33:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5183E6064F
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::62f; helo=mail-ej1-x62f.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5183E6064F
 for <buildroot@buildroot.org>; Thu, 19 Nov 2026 07:33:17 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c5133831027so3654466b.2
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 23:33:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795073596; x=1795678396;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=d+cT3zgwF3eNOKL3y6HCqqW4l/r4Vixf3DngdARAa8M=;
 b=1KxbteZRmZY25ySZkt5wdFFmyHtNiLOjDa0t/PQYgDSifrK3RRAzzB1QApPTnMdRcf
 3QOILD4cHOQjyC6hvEQCtb+MxPgGRqJUFnGfRhlO+sE9gOp3BPJs1NTdiaAMPoPQmKqn
 VXJX2XU0Lbjoxl1DaamV31PHyUNV8Kg3JjZDyJL+Y5Z/ACZ24k+ZGpDCH3AVh3qN4zOI
 cd7iysZd3QE3IAEnrqfHp1rCaKjXLLC10DKmnhOuF13D+GwPJHvjqRWAxdr6mktMIJYb
 M/tx4wK7ndGFM4E1mBrisTdrEJWY/VGYQXAYcLkvbESIZDaK1qHYaYbRM6QunB6pi+bI
 +6Yw==
X-Gm-Message-State: APuU4Z8ixnEp0tICtehUDZSaTOFXyJYoMF0r2Sd0YjrD+3N98Bhip84K
 i+s/FJ6OwuivqkbEtASS4xRfESxJD6BYU/eAWiSVY6yQs740aHYUgwIRMCWWdQ==
X-Gm-Gg: AYBFou3KiZZ1yfJyAiNcVo47HfyPzswmWRdycMQYhXNGmynEkPKd7WsL/mWXNXMloCN
 74+EypUINJoS/3L1K+WQHjQaFDNMO7+dj+Dybc44Vg6Qrz5XneYBWdjbLr5+sCiQYESO/4lzM44
 fP3sBfmeIq4MytOCJXtwYgsAsqy2YN/ruDvE6Azxukp6yJoFLZTxqsVjROtZN6GLZucSnx6chjt
 NGbiKWLOPWx0jQtKrb4SQf+wbfVfBQ34257XUcCzh16sr4e6sAIvYgoRkC4s7Ap/vvaVR+OrzOd
 60v/SfhF37ha88hc3qcoyawmacmporgsVWlnp2VSEXfuoEh7+0EqA93MYSpAib2uoU6m6Qm5j7n
 KYdiZ2LMKFW3sxsb1omdKAiRbV3aSd9TgvTcojnrd4qaSSCbDsGehGAzKN4JUrP8rLzpe4ZBvM2
 rDO5JNMRoLZ3BBsmabWBhMhgq/OWv693t58+LwcYGB13o5ivTBEb0kloJyQxrSerRop31pmq8ik
 CTCZCfIF85SDX58Uu3vLTgtpAAhIzfW+pG6B4tvT94fOodpfzl0E5bzPpruZJMZ8bf0JuxImmCP
 VBbtqmskR99rjxcj5a32iVNxJ5QSuC6MuRuskGdkwvp1FQY7pge0ktH7O9fiweDnukwQ44pbwmW
 7pMEiEzA9
X-Received: by 2002:a17:907:9403:b0:c50:564b:c63 with SMTP id
 a640c23a62f3a-c510deb862emr505736066b.6.1795073595883; 
 Wed, 18 Nov 2026 23:33:15 -0800 (PST)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c512341984dsm80805266b.38.2026.11.18.23.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2026 23:33:15 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu, 19 Nov 2026 08:33:15 +0100
Message-Id: <20261119073315.2434687-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/iotools: fix build with musl on PowerPC
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
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The SCOM code, which is only compiled on PowerPC, fails to build with
musl:

  scom.c:38:8: error: unknown type name 'off64_t'; did you mean 'off_t'?
  scom.c:68:13: error: implicit declaration of function 'lseek64'; did you mean 'lseek'? [-Wimplicit-function-declaration]

scom.c defines _FILE_OFFSET_BITS to 64 but uses the explicit 64-bit API
(off64_t, lseek64()), which musl only declares with
_LARGEFILE64_SOURCE.

Backport the upstream fix, which defines _LARGEFILE64_SOURCE instead.

This issue has been present since commit aa7217276d0d ("package/iotools:
new package"), as scom.c already used this API in version 1.7. It
therefore affects 2024.11 and later, and all maintenance branches.

Fixes:
https://autobuild.buildroot.org/results/a20267e877a5365ff58a890b25ce591e6a9c0a93

Fixes: aa7217276d0da805229739b1ede8eb3a1fe365aa ("package/iotools: new package")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 .../0001-scom-Fix-access-to-lseek64.patch     | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 package/iotools/0001-scom-Fix-access-to-lseek64.patch

diff --git a/package/iotools/0001-scom-Fix-access-to-lseek64.patch b/package/iotools/0001-scom-Fix-access-to-lseek64.patch
new file mode 100644
index 0000000000..c41cd66698
--- /dev/null
+++ b/package/iotools/0001-scom-Fix-access-to-lseek64.patch
@@ -0,0 +1,65 @@
+From 7dd70b0208a5a9856f1d80ab8097736f88f2452b Mon Sep 17 00:00:00 2001
+From: Aaron Sierra <aaron@bubbl-tek.com>
+Date: Tue, 4 Feb 2025 16:24:12 -0600
+Subject: [PATCH] scom: Fix access to lseek64()
+
+A build error, included below, occurs when building for 64-bit PowerPC
+with musl libc. Since we explicitly use the 64-bit lseek64() API, we can
+simply replace the _FILE_OFFSET_BITS define (i.e. make off_t 64-bits)
+with _LARGEFILE64_SOURCE (i.e. make 64-bit API available).
+
+scom.c:38:8: error: unknown type name 'off64_t'
+   38 | static off64_t xscom_mangle_addr(off64_t addr)
+      |        ^~~~~~~
+scom.c:38:34: error: unknown type name 'off64_t'; did you mean 'off_t'?
+   38 | static off64_t xscom_mangle_addr(off64_t addr)
+      |                                  ^~~~~~~
+      |                                  off_t
+scom.c: In function 'open_and_seek':
+scom.c:58:9: error: unknown type name 'off64_t'; did you mean 'off_t'?
+   58 |         off64_t offset = xscom_mangle_addr(scom);
+      |         ^~~~~~~
+      |         off_t
+scom.c:58:26: error: implicit declaration of function 'xscom_mangle_addr' [-Werror=implicit-function-declaration]
+   58 |         off64_t offset = xscom_mangle_addr(scom);
+      |                          ^~~~~~~~~~~~~~~~~
+scom.c:68:13: error: implicit declaration of function 'lseek64'; did you mean 'lseek'? [-Werror=implicit-function-declaration]
+   68 |         if (lseek64(*fd, offset, SEEK_SET) == (off_t)-1) {
+      |             ^~~~~~~
+      |             lseek
+scom.c:69:42: error: format '%jd' expects argument of type 'intmax_t', but argument 3 has type 'int' [-Werror=format=]
+   69 |                 fprintf(stderr, "lseek(%jd): %s\n", offset, strerror(errno));
+      |                                        ~~^          ~~~~~~
+      |                                          |          |
+      |                                          long int   int
+      |                                        %d
+cc1: all warnings being treated as errors
+
+Upstream: https://github.com/andy-shev/iotools/commit/7dd70b0208a5a9856f1d80ab8097736f88f2452b
+Signed-off-by: Aaron Sierra <aaron@bubbl-tek.com>
+---
+ scom.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/scom.c b/scom.c
+index 0c9fbe1..a0f76c9 100644
+--- a/scom.c
++++ b/scom.c
+@@ -21,7 +21,7 @@
+ /*
+  * Quick POWER CPU SCOM register access, requires linux SCOM debugfs support.
+  */
+-#define _FILE_OFFSET_BITS 64
++#define _LARGEFILE64_SOURCE
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <sys/types.h>
+@@ -65,7 +65,7 @@ open_and_seek(int chip, uint64_t scom, int mode, int *fd)
+ 		return -1;
+ 	}
+ 
+-	if (lseek64(*fd, offset, SEEK_SET) == (off_t)-1) {
++	if (lseek64(*fd, offset, SEEK_SET) == (off64_t)-1) {
+ 		fprintf(stderr, "lseek(%jd): %s\n", offset, strerror(errno));
+ 		close(*fd);
+ 		return -1;
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
