Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0923860A263B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 17:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=i1d88fOu
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6EC29608FC;
	Fri, 23 Oct 2026 17:44:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vsr8v8-nfy_C; Fri, 23 Oct 2026 17:44:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B3CE360626
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792777479;
	b=omrKs+Gb9ITDYRmcBcXLjaU4qcxznOgWsRKNg6A8drkc0dGM7UCyaZlRK110rHOmNZxv
	 Q/NVgpO9zey5HOvgWXtUpB0FbyZyAeQ+zZ3ZYkhiOf7hboyWQOHk+qMCncI/PYX9BcUa0
	 1xMlDC8J8i77POR5tnBYl459wijR1QmBw/qfcqewgPsFbo3hoRxpz1LiZoy+SM8bax06w
	 3YjiNhvXDqBpwth1LVsofN7R8yTX+5rVCgO5mlYmOMN+dpE8WmUqfuYbUs1jVP4ogmP8w
	 LX7DiMgYiTUK2XtD4s0S9/Xo8HK8eKgIZAVNB0DxrgH/Jryx6xOKRhro2EvhK+7s/xQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792777479;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=Z4x+pvXxPnTGcSXIsNTMDmDc9/HL2qHgZWV+LBMd2g4=;
	b=GOAimLXEl6MJK7L5Ibp7iAay6H1vNfD2mG6st68/IRlFjLgShOCcKl6Vc89/5/BjsGFE
	 Y/gfmRSVI1jhpRnRGa49Mdxngd0vMar1dmbE1R9VDZu5eBk4jd7YmdAoQ6xxYAWfN7UD7
	 SiSL2vB2ePwICjfxAVRZYAtLQXUr7KbkMhs18JXqeqlp/Ud77GSZJziONFkoRGyvfRC19
	 wccawmWVWHMK/7Kko/rUgZa8F3ChCwxCD/w8vAqP0hsvm2IGsvEbne1teYs2zDVQdIOwd
	 vzPN7pTwM3QLvDjKnsPTc7NlOGgHg3hZs5Q/HG0U2b433KctRgj7S8Bz6sVvY0s5x7A==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792777479;
	bh=Z4x+pvXxPnTGcSXIsNTMDmDc9/HL2qHgZWV+LBMd2g4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i1d88fOuEi4/eNm6gJvvkP+UgPOOtSSe8TujGuL6zTiyNep3mnOoZV3aF2ejgc/lb
	 NVqCu/gk3g6cFP1IcBu5e7mdwJTkfivc9w9ipIfD7lz6UoY2taFp5yQbmfO9yOsj7b
	 nFe9XW/RIM+YohGScL0MK4l9qk+V6oMxv1mBtzgAC2NmyJt01SmC74nuBRoEturaVk
	 n4wY+LG0eVTpxUjms7xnJjQhJLOjVGuRGx3Yev3pcwp1o53c29KqmPD+F1ocujb+8v
	 Ucc+5FrXlHZ3Xazq1SeuYUlmbyKMW1d+TRxDXmS8NUEjZcCYEo8s27+2T4RU30rMtE
	 I1MOB+i6FDO4g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B3CE360626;
	Fri, 23 Oct 2026 17:44:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 8EF953C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 17:44:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 74823409C1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 17:44:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zImPXRml7I1V for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 17:44:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org AA7C440886
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792777477;
 b=X3OHiANGl4AjV3QnFMzqinKEweE9i+Trgy0g+jDPvn3iCSAU+R91oYO08iZwfJvnLUbT
 UhhaSmusKSzn7u3ilB0p77TQ+DZ7MtnJxDZv+Z0pVMB+NX7ZynnAhtwFXyOg0FrGG3ElQ
 UHG59bjtGQXQ8vXgCpEOs6HcZgL31AIjGa4yD6NT0cOU6RLQy+ZtdawDMlOg40W9Sawiq
 xGAEqHLuz0nxXcL71W2IGkQQQyXakIwK4Y+es/J+Uo9QW0RaC6duzQfK9lzMMj6k/gFoJ
 OO7QTLh7j6connh9UF2iEL/vA2+G9t0sXWaL6DC3yrmsuVpXD9vd28XwzO5XGM0MJLQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792777477;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=jJVWSe0iTMIsMAEhA9NnB2yCrSZvfHcAbo5qEaZ0EQg=;
 b=kjDHAEeDJuPBlSgyO7JOh123qhg4zVKu+mATHVh8ShshB9U68OfmzqNy2GlIRrv/sY6C
 +iVBNHRpsBM9IjIXDcQQbp5y+j0RKfR8NHs3veSfir2adU39o1hADJywdQaFnTp+QCjTd
 IJ3bkq7TlFAyBSPiKrwx5NJktPEMfVTWGNBWC8Cj9Gflf0Doz0K5RDB2p/Y5cEzlDKG42
 MDDxPrwUZxkxwZFujH0WD+NXYtoO+eXdQd7Zy7ov4Y7VEOUD74ndyr84jYkwlGjpr4BXG
 8Rgrbw1D0vT8ZPWv/YtTDCGOug999a7Snpf73BEdtx3c4q5aDjp3rp9djcaBl4dOdww==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA7C440886
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 17:44:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 15A3E9C687; Fri, 23 Oct 2026 17:43:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 19:43:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4f9adc6e661d73123e929595deaf0f3c8bb496b
X-Git-Newrev: ed17a05a766f708ef69ab4b993f8ff4a686152ef
X-Patchwork-Hint: ignore
Message-Id: <20261023174313.15A3E9C687@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/feh: bump to version 3.13.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/ed17a05a766f708ef69ab4b993f8ff4a686152ef
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changes since 3.11.2 include:

- 3.12: %f and %n format specifiers are no longer allowed in --action
  and --info strings, as they don't escape shell syntax and allowed
  command injection through untrusted file names [1]. Use %F and %N
  instead.
- 3.13: switch the default font to the bundled NotoSans Medium.

ChangeLog:
https://github.com/derf/feh/blob/3.13.1/ChangeLog

[1] https://github.com/derf/feh/issues/821

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/feh/feh.hash | 2 +-
 package/feh/feh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/feh/feh.hash b/package/feh/feh.hash
index 61c35e6386..78babb4751 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  020f8bce84c709333dcc6ec5fff36313782e0b50662754947c6585d922a7a7b2  feh-3.11.2.tar.bz2
+sha256  785cd3bf51e05f6bb86ab0d649b7ed20e31892eb635bc5a25c963bf934088445  feh-3.13.1.tar.bz2
 sha256  c07900c3c11294d8dea3c592092aa41fda3789f58fa009910695de0ba2570aeb  COPYING
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 340418e570..c32ebb95af 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FEH_VERSION = 3.11.2
+FEH_VERSION = 3.13.1
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = https://feh.finalrewind.org
 FEH_DEPENDENCIES = imlib2 libpng xlib_libXt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
