Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5369606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=MkxKy4Qc
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83BCE40D98;
	Fri, 30 Oct 2026 14:19:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H8APg5aPRWMs; Fri, 30 Oct 2026 14:19:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 780AA40D91
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369973;
	b=RLK6WpQJPQQlzBfidjsNTLi6O8zEHcJ4kutfZwKQU7BpZC5gSl5Zim1iPJXZh/WvybNz
	 NsybUurZHDhBDr14WGELvoWzslyo/+PR0CGbJw4A2dNlPIjpCSgLtw3/yDsm0g2HhYNZH
	 LXv4hW03DnmCEL5/snvsuvQQvFcK37kUIxuBx/PAiJqaL1zKnurK3h+9C9penajJPH1In
	 K38+fMFB7JCWHbouEwavi/NLKZZY3qwuHjw0BM6+kAe2AS5LMVBXo22XU2xWfd9dGKB86
	 kvLmdQcWq3Q1wrQ6TgAXLvjBbWk/izspobtpG/mXf13CTIZ+ERSONv+ZQTxjlbKQJ0w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369973;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=jY5WKegRdq3KJoTmYryQSS44IxPGE1adx/vvpWlVzwU=;
	b=ru2gq61umM+IEEbu7Bphjkuz4Dj98ggIXGp9FHcgjYMJeGPLoMm14D2y0rspb1/s3vN9
	 AGKx3hZjGA3SZEIiO0lvuxfrAOxhTLN064jE+SOeN6yqQI32KzPmf/nZLypm/EP8irb6d
	 zw5slr/mdj0iPu8/cfBx2d9ulTEoYoAVLnrn/XQg9oddL6B2aUCVP9WUe94IQlZQjlvX8
	 exSvdV07zfIYuy4GfGIgpcEQVBkX4yD7vEhHLP3mXuxPMbQPm/6OzkFqntu5IGEmsw+0E
	 Nv5mZ/E/dCHXKILArGKUNCRjxSiIQssl4d+a7HRBeCPTvDhWxdLsxxMXSXFt03m5f4g==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369973;
	bh=jY5WKegRdq3KJoTmYryQSS44IxPGE1adx/vvpWlVzwU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MkxKy4QcixacBToe/o6QzJNEQP1+6QdWIZ2CKfCn3ABhT+XWuk4WDqaPkBbyyVQxS
	 zeOgxc25uVgUyuX8Kj193DM+5RVKLcsjz4N8D/UJ8VfEtsvkMt4VI5GxNSYw9MHHOu
	 ua0Fsc8bhyP+pEYMegiO2QJ5N/1NbxNqzEmPDTGq3Xxz5w41LDXnnKGb67FUpApZT5
	 ZYopzXWy4d9K53A84PqvNh3lQ328d3SO/etBDGyxu8CgD0MhS0WAYALR1yxs8CD/tQ
	 glCYeJWmd1Vhn3dn3sJMQC4NcuMswZo5FMHCQ11lLs+ErSg9iBfUz01+He6HUEKKzH
	 YAAGR3OXUyGmg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 780AA40D91;
	Fri, 30 Oct 2026 14:19:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 648B3362
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 606E3808AE
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZkCueW5WG858 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8A7AB812C5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369891;
 b=i/Zekm5dx2lCUDPNf6jqrnZhAa8fhwX4oRDag1+ntO8VDwmrcUDxtNk3WwkSrq04nygG
 D4EZmpDR0ewPOIAN1z5RGx6iSl4DTAqgiO3iDZyCB+JzQKETlTL0oKfWh/pf/emiEtEg+
 1LQv9L13rf40ae+0mCxx0lAbbPWMa1HtaxLL5YVj1n/xgjWa69wiD3PXsRBiYNfYhrkv4
 4tAMtR+3++SkAJB1nBon8LIYUapw5bjFzSYwYBgxtfPqpwz1gimv4tmFQRtUbR6kqIOUa
 n7NYY3EZ2OzimDbIqyVVfFdglZ39mmOGtXALSFhYv+r0oCVCEK/sLlTbqvltnMvh+Tw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369891;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=73n5TKmA2GbmsXdn+4JL3yjX9FroVOUB4VyDWPDF07E=;
 b=kFWQ9yTyVHj+O1CC0uVYUPs54evaxyO1FMnUztxmL0vMGYfqjxCDgjsKXoG++yhHHLbd
 vRfPltSxtq+X8Ae6yVlFYSQQ16douNnguhhe8NHgGM/GM2ObkNL6CJdyMtQI8HG6E5T1L
 pOWHmk272KNPZmpnbnKwV6fDXSk2TTBuKvYr4D6/QNYm7SYcquDRWJbi7OYxrOEjliSSA
 6zy212kS/PydINnaT/+OumYE7yuAr38n8yaMW1YgfGn+K1UN94RtUs49dlbwHBNFdTy/R
 3TXT1ZD/vrv65VRJE5s5u6djm8RipSMXG3wWsOL5thi82VLizpBgnf0Odg+vgZdVL9Q==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A7AB812C5
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9AE929D388; Fri, 30 Oct 2026 14:16:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:07 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: ae37d2f000ea3d9dcbb71b66dffea82839a7943b
X-Git-Newrev: 29ef0fe8e037ab2af97fae44688a3c7cee982d67
X-Patchwork-Hint: ignore
Message-Id: <20261030141643.9AE929D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/iozone: fix build
 without ASYNC_IO with GCC >= 15
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
Content-Type: multipart/mixed; boundary="===============2118767059035679758=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2118767059035679758==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/29ef0fe8e037ab2af97fae44688a3c7cee982d67
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
(cherry picked from commit b56db7616008c93d9e6803a2376ccc9873eb6f7f)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============2118767059035679758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2118767059035679758==--
