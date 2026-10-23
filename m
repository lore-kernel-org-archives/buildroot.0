Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED15606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 07:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=egzDYT6F
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D9FE6062B;
	Fri, 23 Oct 2026 07:27:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r7s2IQAQwnwp; Fri, 23 Oct 2026 07:27:04 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 5EB036064E
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792740424;
	b=j8GvUPVs54d+BAYise/c1fA34LAD1fSS0xRDs0maGNTZJlVU9o8YqgFe5Nx0Y5+nSETe
	 rZaM/l7Q9P1rz0NmwujvQ0brrnSRAAJLjV6QbCklvPYvq0xPy7baDc8EGAbVmnHWDEhJl
	 RW7pJqNmFVvL7giTlFc9EU84sns9+KtezOmEmIfQzJSDr24vRs0NnHoRy5aMQw4x5w9Hh
	 stBaJDPtX8ZmnBgisXa52jO/WfiB/myrU9AAyb2zQQF3DBTDcYSew0tfNgEglrWiu9TOJ
	 UN8POR6C/ii0Gvh2TuCz8fK6DLQyYvrw9KqvLSg6Gtu/62WSEGsdMjYLkFqrYRhSveQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792740424;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=AaThyhns8hhfULScVI0lvVJFvuAZNtMZVXQe6vcGwIk=;
	b=gJp95V1GiAlCMue5vFkSP2p1GXiTxmr8dSddPMvOfDQqif1I7YlMg3N3oKfmk3coZR+j
	 UhcNCpQYbsOlGzoTmzZ7TZ4W4CwnAIPoKX8bbAG1e8LcCR63o/em/uDaTDhFuy8jEOZc1
	 UCSPWeH9PllOe92P1IHu2ALJe/i0n9XKNen24B7OUR68kJ7PZJ+/Ou6PYAckMhURFUTYe
	 bVV5T7Uo9IC4S2D3k76nJK73uH2g17fgS7riUXZZXqXlju0W3CqyILk9Y4w6b5MfxJgSs
	 3NeIDoXxJbucVn9bDgN0QoDWCXg9aN61zVAaFblH+XjGRxo4O0xrAOc6sCZQ1f4Is0Q==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792740424;
	bh=AaThyhns8hhfULScVI0lvVJFvuAZNtMZVXQe6vcGwIk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=egzDYT6FakoMDg7KjHi+JTAmzlAL6BzLM7fYbMLdl2tuc06kGhuUm3EaE/Rfa/o1Q
	 0K2g0IPZo6lqqVe8rWS2Ssf1vOlp33CHo6AX92P5yyo63f59IQEa3LF+yVhVqCkP1+
	 tUa/gnEGaG3A4fO1raFeGUxbTqc5hjHx1seLRAkCSORJ/F9FZ6bEqEqBJS7D74xn50
	 EJocjNvmynL05ibSCxWiZWOehvUwnmOeCw7qL1VNh0mBifradcMQ/Q1x10DISMCYbP
	 fdzoqVrQSh/S/qRAXrH4VLQnUymQlkiwxfLzmbbHELBkk1ca5FbmLA+46ntCK8DB+i
	 RrmVGFejbcRew==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EB036064E;
	Fri, 23 Oct 2026 07:27:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id ABE0749D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:27:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A7D6C40913
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:27:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p2tNRQ16B8Rf for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 07:27:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DCAD640919
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792740420;
 b=mNggtUGpD3K6/nonGydZZxR8XHXVTH8SPWHVBHuLmIrHWiLePsoL5N5QZwkz2kaiPros
 3jmzgiIAfFmm6H9ov+PphRGAs1pI6s6qwlYdrpPQ0EUYXV47qGX8MRMDKbxiDezsdBHA8
 15mfxVQv6sxZ6P/IPtDMfnR3W0Lvpz3yfCscNwi6yBO+UN5FnQKoaT00nL20wlxBjU+v/
 FAIUOAvif9W8aKDqByN0RrLn3YbHm//oAA7bd4I4JaNMZmQCoZDpG7NrgJBNLx9A5DRJo
 cgdbldwR3ipEWUuDbbl10xcVQpyh1Nen+osrveXYN2GqALoMTRV7xesf7kRFxy62zrg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792740420;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=3GR2nvGKID+/uUr/ydKgLgEmu3ODGDZVx/RcNDKm4TU=;
 b=iERz/o4Cau+Upd7OG5qCZINKeK4mTju72IeoOLuFR4iKnbalFG0c4xl1xVk8R7vGilPg
 ETnQCZETqBAjys/pnlluTR7nu4tU9PCbz0YCsgVNwNoOtcnxHR8itlmLS1osjZhreHyyy
 SF8nQJd/exDBTIUzfoGT+HYNrAXEtR3tyrsvkbLZAhP6YQMD/TcUkssb8F0C+V67AUM5Q
 XO9mb/QehldCT1Gd1p/UyG1jGGpvK6dCqUfjwy3/9h5x7db/KVNatMrneLVPLMgil3TkH
 dvH6qBsGhCiuMcJMpbVly//HvbUkzVE0ocKh+7d2b8kxe+gjm72DTLS9xJt6mlTVfMw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCAD640919
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 07:27:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 640649C641; Fri, 23 Oct 2026 07:25:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 09:14:53 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d035a9a7f368f2336fc9d3a3912129c1ed8856ec
X-Git-Newrev: fdf2cc620edc3f176dbff1a021c4ed103e50f813
X-Patchwork-Hint: ignore
Message-Id: <20261023072536.640649C641@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iozone: fix parallel build of the
 linux-noaio target
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fdf2cc620edc3f176dbff1a021c4ed103e50f813
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

With uClibc, iozone is built with the linux-noaio target, which lists
libbif.o as a prerequisite although libbif.o is built by the
iozone_linux-noaio.o rule. With a parallel build, make also builds
libbif.o with its built-in rule, without -DHAVE_ANSIC_C, so the K&R
code path is used, which fails with GCC >= 15 (C23):

  libbif.c:191:1: error: number of arguments doesn't match prototype
  libbif.c:170:1: error: prototype declaration
  libbif.c:193:9: error: too many arguments to function 'do_eof'; expected 0, have 1

Commit d7233ae04854 ("package/iozone: Fix parallel build problem")
fixed the same issue for the linux targets only. Add a patch doing the
same for the linux-noaio and linux-noth targets, which were added by
0001-Add-new-targets-for-iozone.patch.

This issue has been present since commit 75891397abe6 ("package/gcc:
add support for GCC 15.x"); before GCC 15, libbif.c built with the
wrong flags but didn't fail. It therefore affects 2025.08 and later,
i.e. 2025.11.x, 2026.02.x, 2026.05.x and 2026.08.x when GCC 15 is used.

Fixes: 75891397abe60dbe3d82a1ec39654ff81d1b1406 ("package/gcc: add support for GCC 15.x")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...if.o-from-linux-noaio-and-linux-noth-deps.patch | 48 ++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/package/iozone/0005-remove-libbif.o-from-linux-noaio-and-linux-noth-deps.patch b/package/iozone/0005-remove-libbif.o-from-linux-noaio-and-linux-noth-deps.patch
new file mode 100644
index 0000000000..0c4987d4df
--- /dev/null
+++ b/package/iozone/0005-remove-libbif.o-from-linux-noaio-and-linux-noth-deps.patch
@@ -0,0 +1,48 @@
+From 3bfbc2fe58400d32aabbceaa19a4348981931d9d Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Thu, 22 Oct 2026 22:59:56 +0200
+Subject: [PATCH] remove libbif.o from linux-noaio and linux-noth deps
+
+libbif.o is built by the iozone_linux-noaio.o and iozone_linux-noth.o
+rules, with -DHAVE_ANSIC_C. Listing it as a prerequisite of the
+linux-noaio and linux-noth targets lets make build it in parallel with
+its built-in rule, without -DHAVE_ANSIC_C, so the K&R code path is
+used, which fails with GCC >= 15 (C23):
+
+libbif.c:191:1: error: number of arguments doesn't match prototype
+libbif.c:193:9: error: too many arguments to function 'do_eof'; expected 0, have 1
+
+Do the same as the previous patch did for the linux targets.
+
+Upstream: N/A, linux-noaio and linux-noth are Buildroot-specific targets
+Assisted-by: Claude:claude-opus-5-5
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ src/current/makefile | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/current/makefile b/src/current/makefile
+index ba5759f..168fe93 100755
+--- a/src/current/makefile
++++ b/src/current/makefile
+@@ -180,7 +180,7 @@ linux:	iozone_linux.o fileop_linux.o pit_server.o
+ #
+ # GNU 'C' compiler Linux build with threads, largefiles
+ #
+-linux-noaio: iozone_linux-noaio.o libbif.o fileop_linux.o pit_server.o
++linux-noaio: iozone_linux-noaio.o fileop_linux.o pit_server.o
+ 	$(CC)  $(CFLAGS) $(LDFLAGS) iozone_linux-noaio.o libbif.o \
+ 		-lpthread -lrt -o iozone
+ 	$(CC)  $(CFLAGS) -Dlinux fileop_linux.o -o fileop
+@@ -189,7 +189,7 @@ linux-noaio: iozone_linux-noaio.o libbif.o fileop_linux.o pit_server.o
+ #
+ # GNU 'C' compiler Linux build with largefiles
+ #
+-linux-noth: iozone_linux-noth.o libbif.o fileop_linux.o pit_server.o
++linux-noth: iozone_linux-noth.o fileop_linux.o pit_server.o
+ 	$(CC)  $(CFLAGS) $(LDFLAGS) iozone_linux-noth.o libbif.o \
+ 		-lrt -o iozone
+ 	$(CC)  $(CFLAGS) -Dlinux fileop_linux.o -o fileop
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
