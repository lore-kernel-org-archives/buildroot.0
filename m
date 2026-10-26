Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E535A606A31A
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 21:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=AvxD7YSS
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A5AB7606FA;
	Mon, 26 Oct 2026 21:50:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J0AoBXvQ17hb; Mon, 26 Oct 2026 21:50:19 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org CB61260607
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793051418;
	b=DIlLeojzW/iEcTy4BZ6Eh268jMbdRhOAB2Feqqv2TjrSVR+HzplU9ipf02FYcH+HT8Vz
	 l3b6biAsXti/i5SvalnDFZXrRzMjOOgjbh3/4FEQhHCWiu0IsPF/TbGcCPHeLBQsgZZsj
	 KF798DlWIoV9+VVLlEgxbfiLu8l/f4JmpRm19waPCCUE8ej+i5ykLAADfBHkgjXBmyxvY
	 /O3RtaNBzNPpcf34BAVqxOy1Efnou3sHI45qLIK5O812oRc5VUGqNGLYxvJhcFtv804Cn
	 9MnqO68RtNTmBDzcFlUVC6Yiq6p12IOl/fX4h9Rk9oVysW97WyKuVGiUAWKfB3Q61rQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793051418;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=CqlIFaTl8rJZiRt2+aqbSqwJvBl8mHElEeG+WNG+Two=;
	b=s9iqM/DJT+DfMMR/EfwWdBYoxceKAW2bwvMMltHtwF90YZfmSpPmlZBMg076B7wzsowN
	 3SDw0ZqCCWqRbjeCm140Bvr1nNeXX1NktTKNFAVbwk6FVrSIxevaEsjWU/aPpxw5zfubv
	 ToyteFmiqYmx81B8+9eS0r/8SaO8YidXdP0kkoKqSyVDOuVjKOuyZVLtwPSWO0fJ3x9MJ
	 Nv3BYd5Pc79bk2HyL/D8B1/KP8nddSlRkBh3AAoauHv3x2i/uPSdwM+zn+TpYZEcL5Iuy
	 k7t5QHyGNq1SHUTX/q5kRpOFGGtqIJY0oQecPkM0ac0dPt0c+XPDNCMQtJlHvPQh+ww==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793051418;
	bh=CqlIFaTl8rJZiRt2+aqbSqwJvBl8mHElEeG+WNG+Two=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AvxD7YSSaD+8O85mCNpOJ6HkXlrvdirX6FZ6wmkS8WkPSmP13SkQ8E/9xu4Mvb7gA
	 5N+QmWrpArfPlmjntFKzVkuV9UnHbYl9hrYxnys9JzFEVJp+Pn45q+PgylVE53Z2Ne
	 l8ABLX4BCuCOtRnSS5k1S4SMhExiQ5zlVion1WHhUEey+fYfZmvAP+cnFdhkTsqWmE
	 ih/Jb2HY8WCTDOI98/WZ4S0fbeaQSz28ywbcXokbR+HKqja5JSN1FC2HnPXY3pyi9j
	 fLMmQE5gv7KQ1dt2IonLnCng/zVZI1AVIKAIrF7ZLPbB62d3H+viRxjftAt8MK8GUT
	 J9ABFnQ1ZwwbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB61260607;
	Mon, 26 Oct 2026 21:50:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EE5813422
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:50:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D2FC94060A
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:50:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 37nhkRKhhamB for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 21:50:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 2D65C40604
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793051416;
 b=B5yXIlgfNm9cHwsC35jKpe2pFAkQfepgnJce7r52++gvUo/PQwjo4awwmI4FG7izK1xL
 ldalNa1k7QnMkUQLEd1uDFFiFFs7ySfrLAJG/rYZ5B4+3Krw43ktjtl1SXt3mtwLA3aBf
 jLSyN9X93UcNJyNEBSYvNMCvjtevWlJFrzsORER31Xj382Vc74CAtPTd6jdQWGYHE3XWg
 rXtg7MDffUtby0DGsfS9x5l6UTEtCfg4GkDbWgF47LEZ0q4RsJY+BF5JEQv6LtevmZkih
 6UZ2MkcOUs6RhqF8HaiXi8dlxO+l+xH6FdBqQ7blfjst0Kus1OKW/VED02uJG/8mwuA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793051416;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=7PcEHS5390AKSBqtLDyNhZ0fh6Y784bLaxbfek66y+Y=;
 b=Gsci+mD7uBMliHcWmlpC/VeT/VuAItvR2rAcwCSBE53tv5bE4Hh6V6RmR4hrPaDfyyC3
 uuMl8IDXOFT22iMZ38ShUp9p0QnOetUJRyHIwrvCra70mY18BdGYGuU6jlltP3m5H/gEU
 I5T1zNyKXnleGe3VsNavXNq2apU1hY4246o8bzXml7BvaJJqOQ7gM9xLLChe95eKRE3d4
 MsTKTgexrLj9pXTrUT/W+W10gmawGCNb+SszKEiTETll5NWfY04/k6dLy8PYRFSb4OOo/
 ORrXf1bhHmGoHFS9oKQEdOLZQc1I8usPMCIPVeYo315qzXgjQO1agc/5G44tN+4AQ3A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2D65C40604
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:50:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BBEA9D030; Mon, 26 Oct 2026 21:48:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 22:46:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e9bda8e6434d1cf7b7ec33d5b40c2a9723405a8
X-Git-Newrev: d69c401301a717418d5db0a1d5ce8a137e6cb0dc
X-Patchwork-Hint: ignore
Message-Id: <20261026214850.0BBEA9D030@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dante: fix build on musl
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d69c401301a717418d5db0a1d5ce8a137e6cb0dc
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Since version 1.4.4, dante's sched_setaffinity configure check defines
_GNU_SOURCE before including <sched.h>, but the actual build only uses
-D_XOPEN_SOURCE=600 -D_BSD_SOURCE -D_DEFAULT_SOURCE. On musl, cpu_set_t
is only declared with _GNU_SOURCE, so the check succeeds,
HAVE_SCHED_SETAFFINITY is set, and the build fails:

  ../include/sockd.h:1604:4: error: unknown type name 'cpu_set_t'

glibc declares cpu_set_t unconditionally, so it is not affected.

Add a patch that defines _GNU_SOURCE on Linux in compiler.m4, so the
build uses the same feature set as the configure check. This also
keeps CPU affinity support enabled on musl.

This issue has been present since commit 7d95c34d6450 ("package/dante:
security bump version to 1.4.4"), which brought in the modified
configure check. It therefore affects 2025.11 and later, and 2025.02.x
since 2025.02.8.

Fixes:
https://autobuild.buildroot.org/results/0706b54c06cea6269d584bde2abeb8ee030e476e

Fixes: 7d95c34d64505214d56e452abc1f3502323266af ("package/dante: security bump version to 1.4.4")
Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...3-compiler.m4-define-_GNU_SOURCE-on-Linux.patch | 36 ++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/package/dante/0003-compiler.m4-define-_GNU_SOURCE-on-Linux.patch b/package/dante/0003-compiler.m4-define-_GNU_SOURCE-on-Linux.patch
new file mode 100644
index 0000000000..c2ce03422d
--- /dev/null
+++ b/package/dante/0003-compiler.m4-define-_GNU_SOURCE-on-Linux.patch
@@ -0,0 +1,36 @@
+From 0000000000000000000000000000000000000000 Mon Sep 17 00:00:00 2001
+From: Yegor Yefremov <yegorslists@googlemail.com>
+Date: Mon, 26 Oct 2026 14:58:11 +0100
+Subject: [PATCH] compiler.m4: define _GNU_SOURCE on Linux
+
+Since 1.4.4, the sched_setaffinity check defines _GNU_SOURCE before
+including <sched.h>, but the actual build does not. On musl,
+cpu_set_t is only declared with _GNU_SOURCE, so the check succeeds,
+HAVE_SCHED_SETAFFINITY is set, and the build fails:
+
+  ../include/sockd.h:1604:4: error: unknown type name 'cpu_set_t'
+
+Define _GNU_SOURCE on Linux, so the build uses the same feature set
+as the check.
+
+Assisted-by: Claude:claude-opus-5-5
+Upstream: sent to dante-bugs@inet.no on 2026-10-26 (no public archive),
+  Message-Id: <20261026141309.1892005-1-yegorslists@googlemail.com>
+Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
+---
+ compiler.m4 | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/compiler.m4 b/compiler.m4
+index afd1939..3546f87 100644
+--- a/compiler.m4
++++ b/compiler.m4
+@@ -28,6 +28,8 @@ case $host in
+     *-*-linux-*)
+ 	CPPFLAGS="${CPPFLAGS}${CPPFLAGS:+ }-D_XOPEN_SOURCE=600 -D_XOPEN_SOURCE_EXTENDED"
+ 	CPPFLAGS="${CPPFLAGS}${CPPFLAGS:+ }-D_BSD_SOURCE -D_DEFAULT_SOURCE"
++	#for cpu_set_t on musl, matching the sched_setaffinity check
++	CPPFLAGS="${CPPFLAGS}${CPPFLAGS:+ }-D_GNU_SOURCE"
+ 	;;
+ 
+     *-*-aix*)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
