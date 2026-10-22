Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E4D606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=g4lIYNQC
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3BB381493;
	Fri, 23 Oct 2026 12:32:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aKwA6m2kKes0; Fri, 23 Oct 2026 12:32:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B5CBF8156C
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758737;
	b=GL/c4R3YCGHmFLnILx3U5yteYWRERXt/f2KU7Cv9Vg7jMV2SsYQf5tYkoOngz96fJffy
	 kV4wkl6oNDF6OkcI65++xbnvfayF53dfkBj83TwWjgtaGK9ZMn72fEEL0P4JaO9c1oQty
	 KqWJWTlDSCUsChtm5/0wd8zfkMsz+f+Cp3sx44WAk7y8JV4X8p0O0a+kCkPSrAGChDjgc
	 ElJJTqvwYJo9jcFWYrnY3rp20Clk3GyThMM1rKDafUhtW0J2V5KPN1Vem02V5Bbn3L+FP
	 +srtTmDH3RVY/FA4XGsqAd1zathX+kNiX12GRLOX+FGk47f9YkGLnUCk+NRMLJxSgOQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758737;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=Om/CwEulEn1ueVzbYrDcmquC23xUlx5IM+pdpDMLlJc=;
	b=o8uZqx7ctGj98GHoJO8jAe1V/CvA/FUWHwsDnf1v/KIivQ3XyAzK4jOu7h6tVMDq7ahT
	 XsZDQJKuZZKtUAMememjR2YO9G2aKBRGZ/aDNyDu3D5I92qO79N18Sha+gOukltcKbWPG
	 t+PMHCQ6Voon6H4ehHDuDfwgWWqcNszp9+9m3AjxdqMfcHILa3WoqFSWR/HCRuIgx/wNI
	 K+jRMHRxzB1D6CzFgpfN8Eg0BMPWfKpyR1B5AUnqAyn4z0LX6x86+X+vj3QOUVIgcgo/z
	 vUzPCTfILQufwx4VZUjotHYw0AgoaxBNoeR7pp5MFNjKnXmCErVitslU4K1I4yhYS8w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758737;
	bh=Om/CwEulEn1ueVzbYrDcmquC23xUlx5IM+pdpDMLlJc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=g4lIYNQCfGDUDXf6vzverzc4WJJOCduS980VnZNyYWowF9VU1Z6NOwAC/hGwQAIfM
	 XGBszdVu/lF+rOxjaW/uDn71JZ8zCNE/SY5tJSpYqqSM9kYmNfnmPZze45enfK5p/u
	 AO1JiTIUGb4E6CvdsdiP2VvjwP3TOl2IeRu+5AerL35Y5A4sr0BYQ1vdRBZhtTYyfo
	 4nLqGJ/JdnhYB31RR6/fC4FT6ui9iTN+wQ4vMO4ei4dBUDz+RBKz6CxQoU0gJBNvkd
	 PXyew52b4QK3H1dfT9PExVb7SnhDkWszbhQ2sJiS17XZ4NKCslqoFSIAoVatXOZM1j
	 1G/j9s+hQ9CdQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B5CBF8156C;
	Fri, 23 Oct 2026 12:32:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CDE3F2739
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BE2696067E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qgRCb2HU7Nes for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 02BDC6068A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758726;
 b=cWpVOh0VpTbyP6Ii/kL6uQTnLwsCWCBk6xfUDMkkdY7+bQBpKxMrb4wKwV1zqRVoM8QL
 RbVsPm/njQ5tX/1eUVbzChyAg5QynJLO5+LknkMRFBfofGbtM/BPAW8dGVyOLqQKwLVJw
 COsHv+YJx937WLVcL51YJfRMR/qG0VisRjiP4nUYc4dHjT1rQQgRcSE5j+VGrnPOrp/tc
 MXILPCfb7TKseMJxToRWdhFMgIJ7oKFJNTBSI0UcKsNPHFnMcXnvtpmgtxepHcQNvSvRO
 xXEc28GIMWit0wlq2uoM4Sq6rB4zJxSYjAE/CsZD6j1L9+dSs+k5SIge0u0EVa/8U8Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758726;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=02A/khuApG8AerkzttWK8qLtTdw1JFs8V6A8SH4xMHk=;
 b=hQtNB6YyuB2dRcw2IPK3HxU2uLL5CFf/+nSEwz7E1LWvz4+5/yT2cMk8lh7ejB8/OSZb
 ZJ1X/PCgpFZxeGAVZv7BY7p8q9u3/AkPIwiEfu+4P7RiY+aVKpvV5O8RQLta6ItA3wS7h
 kUeH7XTwUPcRWfxyUTpK+w2tuQ+UtvSPdwygRDQyMAWj/Miqhdhp0J7kaBncNq+wS2frt
 jMDj0g4qaLGsBlL0KcnmfhTfEOaZF4BAoeUOibqJJs5uTU2QtW49ULiGh98Mezl3qh5T9
 MzXxjGXNaRmSRTWmwAlAJQNIaVHI2pJ2wvEoQrH1KSlN9vQiPUFqFsjS3erOdggRqaA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 02BDC6068A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:32:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 83F699C66A; Fri, 23 Oct 2026 12:30:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:50:23 +0200
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 87dd5fcf9c6336e951a4e58d06637427a5b102f1
X-Git-Newrev: 42684bae0780c8e1db53961cb89ca76c78c19f4b
X-Patchwork-Hint: ignore
Message-Id: <20261023123041.83F699C66A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/libzlib: upstream
 patch for CVE-2026-85091
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
Content-Type: multipart/mixed; boundary="===============3852037469289209866=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3852037469289209866==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/42684bae0780c8e1db53961cb89ca76c78c19f4b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

This fixes the following vulnerability:

- CVE-2026-85091:
    zlib versions 1.3.1.2 through 1.3.2 contain a heap buffer overflow
    vulnerability in the gz_vacate() function when processing non-blocking
    gzwrite() operations with stale external buffer pointers. Attackers
    can trigger the overflow by calling gzprintf() or gzvprintf() after a
    write stall, causing an unchecked memmove() to write beyond the
    internal input buffer boundary.

For more information, see:
 - https://www.cve.org/CVERecord?id=CVE-2026-85091
 - https://security-tracker.debian.org/tracker/CVE-2026-85091
 - https://github.com/madler/zlib/commit/df84af25dc1942490e1d1c899a07619152a46148.patch

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 58e72377a0eaa0b76f252c6351d25cf31c25a7ee)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 ...ffer-overflow-bug-in-non-blocking-gzwrite.patch | 31 ++++++++++++++++++++++
 package/libzlib/libzlib.mk                         |  2 ++
 2 files changed, 33 insertions(+)

diff --git a/package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch b/package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch
new file mode 100644
index 0000000000..32aaabcc76
--- /dev/null
+++ b/package/libzlib/0001-fix-buffer-overflow-bug-in-non-blocking-gzwrite.patch
@@ -0,0 +1,31 @@
+From df84af25dc1942490e1d1c899a07619152a46148 Mon Sep 17 00:00:00 2001
+From: Mark Adler <git@madler.net>
+Date: Wed, 16 Sep 2026 16:26:14 -0700
+Subject: [PATCH] Fix buffer overflow bug in non-blocking gzwrite.
+
+This addresses CVE-2026-85091.
+
+Upstream: https://github.com/madler/zlib/commit/df84af25dc1942490e1d1c899a07619152a46148.patch
+CVE: CVE-2026-85091
+Signed-off-by: Thomas Perale <thomas.perale@mind.be>
+---
+ gzwrite.c | 5 ++++-
+ 1 file changed, 4 insertions(+), 1 deletion(-)
+
+diff --git a/gzwrite.c b/gzwrite.c
+index b217b85ce..512329244 100644
+--- a/gzwrite.c
++++ b/gzwrite.c
+@@ -242,8 +242,11 @@ local z_size_t gz_write(gz_statep state, voidpc buf, z_size_t len) {
+             n -= state->strm.avail_in;
+             state->x.pos += n;
+             len -= n;
+-            if (ret == -1)
++            if (ret == -1) {
++                state->strm.avail_in = 0;
++                state->strm.next_in = state->in;
+                 return state->again ? put - len : 0;
++            }
+         } while (len);
+     }
+ 
diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index d71d5d5233..9ce08d7093 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -15,6 +15,8 @@ LIBZLIB_PROVIDES = zlib
 LIBZLIB_CPE_ID_VENDOR = zlib
 LIBZLIB_CPE_ID_PRODUCT = zlib
 
+LIBZLIB_IGNORE_CVES += CVE-2026-85091
+
 # It is not possible to build only a shared version of zlib, so we build both
 # shared and static, unless we only want the static libs, and we eventually
 # selectively remove what we do not want

--===============3852037469289209866==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3852037469289209866==--
