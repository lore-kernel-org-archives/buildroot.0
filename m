Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB9A606A31C
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:19:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=fyV+7ee4
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89F9F80A4C;
	Fri, 30 Oct 2026 14:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L0aM6eRnlX0p; Fri, 30 Oct 2026 14:19:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 841048168C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369987;
	b=UAV6FJ9wyL+XAHs7KlXH6d8wBt8CHtimiV9lvq/DkU325c9Oo/3mWw4KVW3BOnYpcS57
	 8Z/hwaqUA2uS25dHtYXHNimY6AHtD3Gz2H8hN/wbG0+Sg8Ei/u3qBvQrb7UgJDL3Orbbl
	 n3ykra7julAS9Ja19iktKOC77xxtgIk6f/nfwedfR2/CxggcNhQ3cYgQvRJPxi57DCcpT
	 82/LUQFc8SHckVu0z3+ErN/O4ve1se7GSmWJ6oauay1zHYUfRVa+G9WX0EzRZq/Rddd14
	 c4bXOZcK8+bhR3bQRWTf88ExklvlyO3dVQXQ29uPA7UdfTG88C0O6QvC7CmIcihnsSg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369987;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=94D8TWg9oxm0580ikCnVeYKJCX7uCTmqLSlQoWQqXMQ=;
	b=Y8P3P+Mc/DH7uM6oP9zpY4ti5ZLF6sOp1SzSNh2LzZTTXEAvDMkf+xnmCP9ZKZe2Vh5o
	 AJL1tOby+TXgbl7/NDNjcqT4l2wFMYA0YAka/IjN2bxEjG83xFFyhwkwrrSou1uLdZHTr
	 XCnxSQkjQKxps5aPfu4pd1nQqdrgQhOTlWUhuRPhHXA6jDftySeT7OXOKMekutsTABCzC
	 TuXu6Sqz08QkJ3gHSmmR7p/2OEjxEV5mLkwILHclExCeeNZNNmBNSH83eIyqST3DXU6yv
	 JnZyhUMqY9tMoTEVhAvV03guAq4dYp3ZFasu1yKS+ilJqMouQYeFRYhn7Xmjzsh9U7g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369987;
	bh=94D8TWg9oxm0580ikCnVeYKJCX7uCTmqLSlQoWQqXMQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fyV+7ee4IQr705ti8SLBbtntbYXuEHvckhIbJwe8aRd+gwkDAnLrlUXB7e9+kTlyj
	 IpPx0Lyo2Y6exatf7vJUx8wp/dhCFmLGxeVhkHi/ikHLzcWfWKc1m6OvrEFp/v5R6m
	 diTmdl5IElWG32DNzwmWIIuBUW/oMO7/tvpLPqA+c3qcIYvgCSGSL7rU9TgU8O2THT
	 nfEatGmKQpNB5+AuN6tkA1qIxept/iKIPFcJwznBSirKQZ+FVsDdT3C1PnYU/2Hlzr
	 6nT/MmkUqb5oh6rwxfHIFrzM7MOMLr975kT1569NXKJnO5TGeNx8msPolj+IsizlC0
	 tq52rjR6fSYPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 841048168C;
	Fri, 30 Oct 2026 14:19:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 75901712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66AC3812F5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1yVJUkABoACb for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 94FB2812BC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369893;
 b=a/9WWHiMjmnfnHryMzOv46IbtqlZrTsqHFvhmBr8CQZiQUPdiPOH9kD41s+daJLj3IQB
 YCtX18y7oZkgooOt8YpT2ltd09NdFjllPHaDQH+y7/4p0MLC/UgRkF+bGKuSbdkd5UXCg
 QKvpmnRtoGy/inoP6xa8uzYqFuO6G0ivLA+XCoIk/ZgumS7qZwHUJnx/1dGQyJnM36dk2
 L5D+4usKtifdKSoLa6Z04Arsztx39TXMW7hYSVUrmzA8jN4j+T5lkX8M7hCh+rfGCI5p0
 epsjsOaKfxBkFZnDVTspHQpVRzMzE8Wpcs5p+9TRN0PY6+MD+ip4QdIDEc/U4IBOnRg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369893;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=CRa2TvtDqQv/weh4IgcFfdBL85SYpGXX4KhIRKCdr4k=;
 b=JvqNCiyOgwoBcwNwLM3MKu32RQdByLeh9TQ7+9bguKPKTg8IP2Aqpjd4JMIHsI21WsO4
 64RZtha3dOhtJiIHUbzsCG4iTu7nGKgssciSqhKLALhEWHx8Lz9mczYUCdXBXb5TsYJmw
 3n/iB6pohWfF2RuMOUjkUkGxnf966ALXELnCjZUtCmFUqtLB8+5a2H1QLd5Gpvdr1Z011
 6q93dVv0Om86m4KBUGGkk9v6jZlzwGSQoPfA2V76H9xkntRjTQQ3Mus4HSoHXe3lPc4ez
 NvyUkxhSjCBqiNzk34UzrOSLQdCyXUQdSS7rRBqrhb/dDU18O8s3HZo7oSnSnQ7q/nw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 94FB2812BC
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B23709D388; Fri, 30 Oct 2026 14:16:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:08 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: d46b61c25af9900450839cf8b266f144c53e81ca
X-Git-Newrev: dbc9c7e2d46beefbd8bb0f70486fb9fa5deb8252
X-Patchwork-Hint: ignore
Message-Id: <20261030141645.B23709D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/iozone: fix
 parallel build of the linux-noaio target
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
Content-Type: multipart/mixed; boundary="===============6590769318679161134=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6590769318679161134==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dbc9c7e2d46beefbd8bb0f70486fb9fa5deb8252
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
(cherry picked from commit fdf2cc620edc3f176dbff1a021c4ed103e50f813)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============6590769318679161134==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6590769318679161134==--
