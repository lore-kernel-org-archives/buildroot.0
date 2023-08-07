Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D597BC00528
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 14:20:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 62EFD81E6B;
	Mon,  7 Aug 2023 14:20:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 62EFD81E6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qb5Gke4jmBJd; Mon,  7 Aug 2023 14:20:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7DFC38196E;
	Mon,  7 Aug 2023 14:20:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7DFC38196E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 214A91BF280
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 14:20:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 67D4040162
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 14:19:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 67D4040162
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kcTUW_fWDqJY for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 14:19:54 +0000 (UTC)
Received: from helium.openadk.org (helium.openadk.org
 [IPv6:2a00:1828:2000:679::23])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 43EC44085F
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 14:19:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43EC44085F
Received: by helium.openadk.org (Postfix, from userid 1000)
 id 990D0352BD4A; Mon,  7 Aug 2023 16:19:51 +0200 (CEST)
Date: Mon, 7 Aug 2023 16:19:51 +0200
From: Waldemar Brodkorb <wbx@openadk.org>
To: buildroot@buildroot.org
Message-ID: <ZND9hxOZvMoUHrgQ@waldemar-brodkorb.de>
MIME-Version: 1.0
Content-Disposition: inline
X-Operating-System: Linux 5.10.0-21-amd64 x86_64
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=openadk.org; s=2022; 
 t=1691417991; bh=pJYgYvbJKaFxmhxMAHp7Bp48IrcU3UvWgiPFJU8Vb9A=;
 h=Date:From:To:Subject:From;
 b=vrgHrayxVL9j16bJgVfMOTnpISnDEjpArxJgD+mTwyAKOxbD5zhigcqcyqRONmoz/
 7YtzbdeVQ025y3J7wK/JYMklDZIR2U7+skpmyomsu56qjVdtpdY6YrioZDbQdwrHzM
 cYYIMAZsv6TA/YCt0In0oiVAsts2nXdJNay+YX/Q3TGc1tSMf4pkVkd+nLcjgYs77/
 VtrhNFNbGVouuYMtisguCBtynaDdhuf9Pf3/UTM0YE9wmlf+On3q+p6qAAgmuXsJ+1
 A16+mmSEIVROZnDOKWHAFHZxlGpe6HfXWGgV/nnEniS+uAlKdMzWJkOamtnl+eJVfU
 bgXf+TQrQsqYg==
Subject: [Buildroot] [PATCH] package/mpg123: fix linking error
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

Fixes following build errors:
http://autobuild.buildroot.net/?reason=mpg123-1.31.3

Patch was provided by upstream:
https://sourceforge.net/p/mpg123/bugs/353/

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/mpg123/0001-mpg123-buildfix.patch | 24 +++++++++++++++++++++++
 1 file changed, 24 insertions(+)
 create mode 100644 package/mpg123/0001-mpg123-buildfix.patch

diff --git a/package/mpg123/0001-mpg123-buildfix.patch b/package/mpg123/0001-mpg123-buildfix.patch
new file mode 100644
index 0000000000..cc731ea967
--- /dev/null
+++ b/package/mpg123/0001-mpg123-buildfix.patch
@@ -0,0 +1,24 @@
+Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
+Upstream: https://sourceforge.net/p/mpg123/bugs/353/
+
+diff -Nur mpg123-1.31.3.orig/src/libmpg123/getcpuflags.h mpg123-1.31.3/src/libmpg123/getcpuflags.h
+--- mpg123-1.31.3.orig/src/libmpg123/getcpuflags.h	2023-03-15 09:02:58.000000000 +0100
++++ mpg123-1.31.3/src/libmpg123/getcpuflags.h	2023-08-07 15:57:19.444106173 +0200
+@@ -44,6 +44,8 @@
+ 
+ unsigned int getcpuflags(struct cpuflags* cf);
+ 
++#if ((defined OPT_X86) || (defined OPT_X86_64) || (defined OPT_NEON) || (defined OPT_NEON64)) && (defined OPT_MULTI)
++
+ #ifdef WANT_GETCPUFLAGS
+ #include <string.h>
+ // Wrapper needed for ignorant clang memory sanitizer that chokes
+@@ -55,8 +57,6 @@
+ }
+ #endif
+ 
+-#if ((defined OPT_X86) || (defined OPT_X86_64) || (defined OPT_NEON) || (defined OPT_NEON64)) && (defined OPT_MULTI)
+-
+ // We really evaluate the CPU flags.
+ #define OPT_CPU_FLAGS
+ 
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
