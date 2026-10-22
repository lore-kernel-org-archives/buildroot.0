Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18108606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GvhAO9Cd
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0EC8381371;
	Fri, 23 Oct 2026 12:24:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c3fzPB5Eqrmy; Fri, 23 Oct 2026 12:24:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 00F28812DB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758266;
	b=CZ+DeZbAa+abdq7sUIFfaK9QqraZ1p8dYmQEvWMwYYNSSHa2LLZoynAP0x8jo9utuRsX
	 3CfjhHgfka1MUuSnyk9ZwUCyngqha4hyNGnxbAW5vQDOUm8cNhj9zEBhD/jRDJ8E9C+Ll
	 ydv1g+SJ+yCCK8PN+GSaxvYlyegSDLxZBD1RMt2rbLRTSF3GXztVRofTQIO00QBun7KxT
	 QvUsVUJfy1xGF9jsF20LWiDyU/LrJHMlM66DId6Lwe4+uPEfJz/Lcx68IqnaD7j6XsLbo
	 TkMjkPpQcyRAZEQO1rpDqD4iv6FJ3Y8jFYF5KCv6qO9DDcoVQi5CxcZuzNeHayi57LQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758266;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=rzWdDlj0av5tHwbHMJp+varYooWSyvfHzcZT6mPWiGc=;
	b=kZ5+DYahGgSFPujiJHZY6I1z39iwhaCJhO/N5A0kbZ22n+URtCG4GnIroE3vZolYAutz
	 sBytMt5BGmPxf9hhKFjrw06u8pByc+0Lq0+2rLjR1tPM5fwcAMWRuYVQTotP4opJUc4Fr
	 MiEiY3c/AYV+9z+heWnU5dNYA7nDIf9JBTCK54u7NkasW99yHLdYfPBntavHPZceXc+Pi
	 Xg1Zz9VFaX3APqgilRBL/jZvcbRtQGbyfLuWTPaNxkVy4TX2g1gycF2ENGsTl05PMI4MB
	 oF7qvexsI4RuEIu7sMW9CXFChIEA53Q4M3uW/qzm4cg+X5Qp2INBwAr7FgV+R3bN9Pg==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758266;
	bh=rzWdDlj0av5tHwbHMJp+varYooWSyvfHzcZT6mPWiGc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GvhAO9CdK2H5aEe/EKx/+40M5gl19BfHkIcyuW5PCna59psW2Lx19FqTkET78jy3z
	 kH9oRN2bdRZIx2k/719yDqkH1DFD2upT1adEeZOsjH7r72uf2zoQUYeRVoyYntbgGr
	 j1MXF8zVkkeVNlQkHEFM+3Fxqz1gbuMTbSO1fK794QdAE2RnqZiRoaw5iRhFz4U2v6
	 jbrchZVDwaI0PZUP0zYzYp1a1kvYaeAz57zyJPL6cBPgMa5DxscHliMFoB8JHHPLtd
	 B2diPvXp7FpIYbdf3U0vCDU7i3v5Z+smJjx/6pQmw7uGLamo99n8Sx+dEpxZs3B/CX
	 wUds0bZkCuotw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 00F28812DB;
	Fri, 23 Oct 2026 12:24:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4BFE723A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D4DA40782
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B3CkJKcIjiGZ for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:24:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8D4BE4072E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758261;
 b=BspN6/LHmSWCAY+1QvHUo11kyG8xYkK2L43ElWFKOrLG2aa9OKeDJu58gt1QydaVceY9
 O5WROdV+maJ4dL3wPTM8ZBZrwA2zA/ODnRWI64mq0377spykmv2rGsLvxIXbjTLdtW1XJ
 73nQKbnRfdYSpSmDiKZDtifo+ciMn0SchmXUQv74qlONK3UMJyf7KR1zXabN+E1MYtkos
 kyBOYVPKnKwvUfN86+oBvJbYaGCsV0/ARfIYuPM3wVHrqIvay77+AoYjkqR2+raABI7C/
 gtg0QbMjI3m/Cp4TO7KsPj9ORARiGAbKjGsxrlcTzjFnF5QFEawcY2+rlkyaCWXcXIA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758261;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=+oXe10h/+0zVG3vFbLw0F3PJeZCwwRToncEZ80WOPIc=;
 b=aPCKUUf96YJxPdIs/4Hcj+A4P0pvCffSvZzO1kMGc63RO3XGzYrVaOoLYxYuyC8Vytaf
 t8JVB4itsF+pHwX74sc678l7TQZ05aJ7nk0F72EKR/kZC95LFYs0y/uAzlMwWRWRW7L3J
 QBaL28dohh2YLyzNSi77emyIV4OuOw0mSYt5tjIAOnK08UpfwqvJg0Yi6OU2CsWrV9CtO
 +qPdiJbsmyaIXxtKweQgM4ZmsV0Ho18wPmMPIEnFhunsrtMZhv6YDnRblypyW7/Y8zQJH
 009LUP3yxkPezbvA7Gjyt0Jxqnq4rcwKuWoFDa0qr5iC73+L5hhwJd8W/xPfWHBsE9A==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8D4BE4072E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 138E09B9AA; Fri, 23 Oct 2026 12:22:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:49:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 5d0ad5b077ce7b53b99e499e6f3db543b0fddd69
X-Git-Newrev: dd33fed5e1bdcda6959f52c5f6a1184a8367ffb1
X-Patchwork-Hint: ignore
Message-Id: <20261023122257.138E09B9AA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libzlib: upstream
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
Content-Type: multipart/mixed; boundary="===============6913234995722342158=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6913234995722342158==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dd33fed5e1bdcda6959f52c5f6a1184a8367ffb1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
index c73328deee..18438415d0 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -14,6 +14,8 @@ LIBZLIB_PROVIDES = zlib
 LIBZLIB_CPE_ID_VENDOR = zlib
 LIBZLIB_CPE_ID_PRODUCT = zlib
 
+LIBZLIB_IGNORE_CVES += CVE-2026-85091
+
 # It is not possible to build only a shared version of zlib, so we build both
 # shared and static, unless we only want the static libs, and we eventually
 # selectively remove what we do not want

--===============6913234995722342158==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6913234995722342158==--
