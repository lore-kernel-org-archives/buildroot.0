Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C935C606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 21:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=XWhib4kQ
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A60F860848;
	Thu, 22 Oct 2026 21:23:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KycCPBhpAZSS; Thu, 22 Oct 2026 21:23:36 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B331C60874
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792704216;
	b=QyE+i1EfjzC693HX806BdVELCG/MAZr9WN3XZGBnn/DrJXsSSqcEUanv1rm0IqcV85Fh
	 vqdqCSUU7xDiCHI44ow40o3H9TTvaCwmtHO6v0ZVtePaLrCbfVqj8nzEahbeS1ofhnNWY
	 SkNzjVe3Q35eq7QLk7vbMMaXJlKWqC5C5M0Y9TzDtEK5MIGR9wVXAy8M7yAggtD05O5P9
	 2QkOYFdyhMRGJlEI9YAzBE/Q/spZ9B87yzr9rw324C7sc3Fq17lR8S/+6jpgBATp4GVF4
	 LJikdU2PQQyuABglqeqYwB9fzRZgxuSBB9vb6+zt3ltun9/0uObg1TbreUvZ7LovQOw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792704216;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=HJlW4ymKzqxDqflMgnVEyyQHoFHoA9bupZS/uALXVOU=;
	b=tdx+zvxXXwtAX6VHhTcpwtUd3QFeMHNpElWQgGEu8n26qP1hYNRBDGvL1yLJmQBTl5DL
	 gvENvMbH/EmWcMIk2MQa6sV2MeyLlP7kIM4Z4Yf/TVu8xGCZob8ZNe04GuFfe+UGgoOZZ
	 KAHxhtJ2++teutjC7q3VgLax9NVyTKbbphkVD8+pLGkxlAPCl37+xHhH+MhbGHPJoZdbc
	 VYHesTEpVgKAJntdCpaIpWYz71yKNCzk/NGsLrpZwKNpgTY/JMlfy0jtOlJTvyjWTxGjH
	 N6hQzsL8yAH0DcLTG6jUew5jNeSbxbsMg5y8nsRJ0u41Nncb29RK3ucVRK5D/OlolRA==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792704216;
	bh=HJlW4ymKzqxDqflMgnVEyyQHoFHoA9bupZS/uALXVOU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XWhib4kQIBuxVjHNf/bCub8uvjUMS4ORO1s2bN/GGgwhu/hnIoAO6peCSkh3naQkD
	 Ng1TIf+Yd19Xwy0sU2MH6hwhJO34KbDccsD43MnSZhr1RT83xFGRjFZ7aDjdorjI//
	 aXaYund4Mgqe4D4Bg6Wwdtz1Suc8uvx0VK06+ti4kANvXpO3RaMPlCFFd+pIVCBgR0
	 HKNMBykhZp3wSlNWVYN2x5H+AizFuvalGarzwxVaixWF8Ogvs0zqj/DjGm8q14C1ji
	 bgrJ5LsNX15VpGkD7troenGSYotHLBjv8FWTrezmyv+rkoeWvPuTVZiDJx3TFKlx7+
	 S2FSW3raU6JLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B331C60874;
	Thu, 22 Oct 2026 21:23:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A7D5A3AF
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:23:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E03A811F1
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:23:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hXz3rMXWd_qs for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 21:23:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B895981112
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792704213;
 b=H+6hnBMvi1ZghQBkuvYA5DZqzNpPvib9E9Jctfc9HDignkSdSLZL30lSOWVJtMOGoFEW
 7pv9CFdKigPKvyrIjcR1pPTerTw4URFmSX0Yec3DNGrScWgL35dmx04gQy7l750Z/k49S
 0ZWs8wwJgPcrJMSsIkgXsno0hh4yv5xbC2XTgB/dPoMOPr805I7oYZO8VuoLuw9jNkk6s
 pP46DY2EwDftLDqVonE/5xaXeWD2dkPf1kmrFVdaZjQlyYepwkAvqtnh1x8DhOS+1lv/W
 Z5djhrmea40eBeI2aZDM5nhxO+424QMz5/KDOjt8eROLvqYNNmZ0LfpEb4Ay8TOskQQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792704213;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=wIN7s6tJ55Okn1l7UM/vzapRR55kQsnlr3+1kR+qLes=;
 b=AoeqMycJXGhgPzH4R2ZTgYMn0EZzVJQ4m8813kkb0EHSooWueCcQWRT6STmfN2BspKQc
 uXUl1xYIiq8OPPDd2KCCRVyzS/TIxuq/seSAqWNqWgEinIYTtgzGHabv93Kzc0Q5ywpmZ
 EpP9mpxl9Le6I6tevC0r0PvJoR+giKWSIn1E91plTV1eija7Hljjjpvq/BAL2c3mjw3ts
 DAcrm/KMcmWrCj7VYSWwN8rayEmR6kfxsOXWObNzKpjTL0A2QH4Ty9axjzsnhpdqCyZ1L
 rVErMMLC30ilmydfDh6AL35zcjsQIOYArcrkxBknzNKMJgj9ImJuFRh3VWKjh8HfARw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B895981112
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 21:23:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92D409C27A; Thu, 22 Oct 2026 21:22:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 23:21:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1af96e786ef1d420bdb66c285a77d18df97db689
X-Git-Newrev: b56db7616008c93d9e6803a2376ccc9873eb6f7f
X-Patchwork-Hint: ignore
Message-Id: <20261022212209.92D409C27A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iozone: fix build without ASYNC_IO
 with GCC >= 15
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b56db7616008c93d9e6803a2376ccc9873eb6f7f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

With uClibc, iozone is built with the linux-noaio target, where the
async_*() stubs are declared and defined without parameter lists. GCC 15
defaults to C23, where an empty parameter list means the function takes
no arguments, so the build fails:

  iozone.c:8150:32: error: too many arguments to function 'async_write_no_copy'; expected 0, have 7
  iozone.c:9126:31: error: too many arguments to function 'async_read_no_copy'; expected 0, have 8
  iozone.c:20165:1: error: conflicting types for 'async_init'; have 'void(void)'

Add a patch, sent upstream, that gives the stubs full prototypes
matching their ASYNC_IO counterparts. iozone 3.510, the latest release,
still has the same stubs, so a version bump wouldn't help.

This issue has been present since commit 75891397abe6 ("package/gcc:
add support for GCC 15.x"), as GCC 15 is the first version defaulting
to C23. It therefore affects 2025.08 and later, i.e. 2025.11.x,
2026.02.x, 2026.05.x and 2026.08.x when GCC 15 is used. 2025.02.x is
not affected as it doesn't support GCC 15.

Fixes:
https://autobuild.buildroot.org/results/4090fb0d0a3b8bee60707b1672c35dada744bff5

Fixes: 75891397abe60dbe3d82a1ec39654ff81d1b1406 ("package/gcc: add support for GCC 15.x")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...04-Fix-build-without-ASYNC_IO-with-GCC-15.patch | 96 ++++++++++++++++++++++
 1 file changed, 96 insertions(+)

diff --git a/package/iozone/0004-Fix-build-without-ASYNC_IO-with-GCC-15.patch b/package/iozone/0004-Fix-build-without-ASYNC_IO-with-GCC-15.patch
new file mode 100644
index 0000000000..b049ce60ed
--- /dev/null
+++ b/package/iozone/0004-Fix-build-without-ASYNC_IO-with-GCC-15.patch
@@ -0,0 +1,96 @@
+From 0cc510655874362bc95c608021ef7921ae389559 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Thu, 22 Oct 2026 22:16:32 +0200
+Subject: [PATCH] Fix build without ASYNC_IO with GCC >= 15
+
+Without ASYNC_IO (e.g. the linux-noaio target), the async_*() stubs
+are declared and defined without parameter lists. GCC 15 defaults to
+C23, where an empty parameter list means the function takes no
+arguments, so the build fails:
+
+iozone.c:8150:32: error: too many arguments to function 'async_write_no_copy'; expected 0, have 7
+iozone.c:9126:31: error: too many arguments to function 'async_read_no_copy'; expected 0, have 8
+iozone.c:20165:1: error: conflicting types for 'async_init'; have 'void(void)'
+
+Give the stubs full prototypes matching their ASYNC_IO counterparts,
+with the long long * cache pointer used without ASYNC_IO.
+
+Upstream: sent to capps@iozone.org
+Assisted-by: Claude:claude-opus-5-5
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ src/current/iozone.c | 26 +++++++++++++++-----------
+ 1 file changed, 15 insertions(+), 11 deletions(-)
+
+diff --git a/src/current/iozone.c b/src/current/iozone.c
+index 8de26cf..5542714 100755
+--- a/src/current/iozone.c
++++ b/src/current/iozone.c
+@@ -1332,11 +1332,11 @@ size_t async_write_no_copy(struct cache *,long long ,char *,long long,long long,
+ #else
+ long long *gc=0;
+ void async_init(long long **,int,int);
+-int async_read();
+-int async_read_no_copy();
+-size_t async_write();
+-size_t async_write_no_copy();
+-void async_release();
++int async_read(long long *, long long , char *, off64_t, long long, long long, off64_t, long long);
++int async_read_no_copy(long long *, long long, char **, off64_t, long long, long long, off64_t, long long);
++size_t async_write(long long *,long long, char *, long long, off64_t, long long);
++size_t async_write_no_copy(long long *,long long ,char *,long long,long long,long long,char *);
++void async_release(long long *);
+ #endif
+ void do_float(int, double, int, int);
+ int create_xls(char *);
+@@ -20144,37 +20144,41 @@ long long length;
+ 
+ #ifndef ASYNC_IO
+ int
+-async_read()
++async_read(long long *gc, long long fd, char *ubuffer, off64_t offset,
++	long long size, long long stride, off64_t max, long long depth)
+ {
+ 	printf("Your system does not support async I/O\n");
+ 	exit(169);
+ }
+ size_t
+-async_write_no_copy()
++async_write_no_copy(long long *gc, long long fd, char *buffer, long long size,
++	long long stride, long long depth, char *free_addr)
+ {
+ 	printf("Your system does not support async I/O\n");
+ 	exit(170);
+ }
+ size_t
+-async_write()
++async_write(long long *gc, long long fd, char *buffer, long long size,
++	off64_t offset, long long depth)
+ {
+ 	printf("Your system does not support async I/O\n");
+ 	exit(171);
+ }
+ void
+-async_init()
++async_init(long long **gc, int fd, int flag)
+ {
+ 	printf("Your system does not support async I/O\n");
+ 	exit(172);
+ }
+ int
+-async_read_no_copy()
++async_read_no_copy(long long *gc, long long fd, char **ubuffer, off64_t offset,
++	long long size, long long stride, off64_t max, long long depth)
+ {
+ 	printf("Your system does not support async I/O\n");
+ 	exit(172);
+ }
+ void
+-async_release()
++async_release(long long *gc)
+ {
+ 	printf("Your system does not support async I/O\n");
+ 	exit(173);
+-- 
+2.34.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
