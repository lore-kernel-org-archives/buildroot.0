Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1386F606A332
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=O5MWB5tu
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E02E781061;
	Fri,  6 Nov 2026 15:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sQTBzlbyizVg; Fri,  6 Nov 2026 15:58:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org A3BAA8128C
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980738;
	b=DYZCgvI+1y3dHXsNeLeyYBjLDXI6nByH1SogqD9s8pQjMdhRVTkd2yk9tK9xHN66lzcg
	 pJO6/2dFuhOL59bz37D1OE++ml8+LbQSJ1nJQbwmMz0aj6wBoI0xqAhdmtWj43OVVrBA4
	 00f0nfuoQwNG4Pc87G3ZtZ+lpi9jJnxUGeZNO9gxT22FjW8SCIqYrd8s4DTUbStQuqc0D
	 2lNvq+UuvvRaLtqUb+VL/35v/PU3A7VbfPBAS1Bo4Gbo23z34KQAVFTc8FhRaPoiPpdzx
	 2PQYgLx2Fc7Ydep5J/mDHoa2Qqy44RVEowjGbkSAMREhG0ll8PRTnznUVNNH8mIOnDw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980738;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=kTa/dlbWWmPQNeOyk+7R65RqJyh3FUeL3U1G+wAgcKo=;
	b=ebdZ+jvppfK7pFPX54rZVEBYL4mi0uGinNAsBJYlYMdBrpxzYjHQrVA4pbAkVr1WFNvX
	 cOJHuEy8dKMX6L4ODX2qB6S4t2oU+p0GzZK47pLadTOU6Vx16CmLK+n7/QsTl/KqfJItJ
	 k0xqzLCPuNZtqaGlhZ1FqPKWUSVC7YflRsDcwPFnvHsKoE/JVPTj8CRuQNMc+oNTD8eYE
	 2ZW+MEWV4drkEdNUAYVORQVvWwHaoSFkADcaSWctbFeBEXGVXP2cJ16AgTP4TURCRTWyl
	 yBuNS/qT1dyfgGUeLEjBaQ3Yg0jwwjhn8tkpLsZ2wIKwd/RLk/cCoKgkTFOt2XM4o2g==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980738;
	bh=kTa/dlbWWmPQNeOyk+7R65RqJyh3FUeL3U1G+wAgcKo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O5MWB5tuzsH6cBafVnKz8px2yjLnwmIUlJXQpkhOfzOFcdcq3JurpkS/AemNYmqNl
	 JMWM7cvY7yed46GDsg9co4s4nMTlUyGvdhsyXcCQuGMvDEadagUIvnX2Oj5Paw9P2u
	 yC1Jkdswb+1AGrhmsmx8iEsvnOjNraqaabPpgqQyFXYRqxkFV4QtEIgJiIcqVIwVgs
	 CLn9EV1TFebevsW+TQ3HnMHAM3QbJYt7bCFMweLi8rqRsxk06am0fZLQgUS38hsVxg
	 H4b6lICjAP/jb+ssVRfworoaO5lCBl9H5lkkITZ2a9tpjTLK0O3XJMP5AUFP+RBYQP
	 vaLqzfNfKq2MA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A3BAA8128C;
	Fri,  6 Nov 2026 15:58:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 443EDA14
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 421A74093B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9G7VnLvxCybJ for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org A5C764091B
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A5C764091B
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DE0239E0A8; Fri,  6 Nov 2026 15:56:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 12:04:26 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d4f97a9acc33629ff0bb7d2895be145d886c94d8
X-Git-Newrev: bada8c6f630e7861aa112837f5f1cb0e71a53e1c
X-Patchwork-Hint: ignore
Message-Id: <20261106155655.DE0239E0A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/dante: fix build
 on musl
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
Content-Type: multipart/mixed; boundary="===============8035087083994270204=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============8035087083994270204==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bada8c6f630e7861aa112837f5f1cb0e71a53e1c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
(cherry picked from commit d69c401301a717418d5db0a1d5ce8a137e6cb0dc)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
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

--===============8035087083994270204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8035087083994270204==--
