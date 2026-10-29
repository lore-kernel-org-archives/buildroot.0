Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E369E606A31A
	for <buildroot@archiver.kernel.org>; Thu, 29 Oct 2026 19:02:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=FdQdNgcn
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B79CD8101D;
	Thu, 29 Oct 2026 19:02:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nFAQAQMJx6nC; Thu, 29 Oct 2026 19:02:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org D60298100F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793300536;
	b=gDcb5rO3TRJYpI3wm0UlxWgQIovuPWv0odtOfnyLfEQ3hjQM3PRrfEyzSYRze2m7Ld7T
	 ib+y8zhFezPES2otQfgim+AZhHibjDiz3SBA8xt5179vjczLiFiV8J/tDlUzlguj0PsbL
	 nQMMaxHRepMaG2Io0KpmOkcDEaV6E9n+yAIlj00MaORM3VUKo86EcY9Ksj0YrbF2Nk+mZ
	 c8W9abyREkbWgHKGXakrYI+IFJHT3rHXCTFWUoAlFPtG2dhxgNfub7PBTwww1u6uKTeS+
	 E1qS6vvHRYFUKlwxM4nLiZEqxyF4737Xu7i0gLfY6OfCOdb6ZfLuepyDzItwy4EsRCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793300536;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=auUVcjkPby5D259p4Pfp1JuWDpqJOlc5SpHPsxe1WIg=;
	b=PI275qT7IAfdO6tcoMfAK9ZBhOWUMh4hQdhtKDx5MKVWtXNJJw9+S98JSph0KkBTjE7h
	 SI/ZDAtyPpVPiIrw5Njhlve+3vptOwhWwLryV2kT/SLgb3u+5vvg+7G5ju7xwgtvOz2gE
	 UgkBVztqqaKN+C6yZ53OhyJ3Dx5otvorT8V7Je0yx0GNbFJt+jGkCneAvvedr+mkvVcGL
	 g0crDIHdElMwx0yBsfHdGugitNWqYhSAtT8UuSV4swfL561w0ows9bi5Pj425C4OCjFef
	 +gadpirY3fgN+nP8CFY2qo33v6vVM/W3u1oiEafX9GYGRO/vBMgZwlWq57fY2HR+VqQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793300535;
	bh=auUVcjkPby5D259p4Pfp1JuWDpqJOlc5SpHPsxe1WIg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=FdQdNgcnP3HIl2DMiVfF5AV+tcjfSbQ+TH2xGxDZIUmBu33eOCICG49kAkkU3sQe/
	 sV6WiiYhfU3FvGYBGn2EGMCoNMCngDs+f5Ms9VtLfP2O8H4iOtL3m7IroFgmT5KmVw
	 fvPeBOad+jQ/59uZlrIm0v5JqdKH4SC7bTxWnQBJUpqoG6eXmIBQ2vyM7GVoGnrM0S
	 d68d3vymvIoMdWQ/OPixXb/eJYM+5ZO7c3NFw5GWXt4dlJvXjalPQQEYbD/dN7ckxX
	 3nTQxNwU8IznCqbgn6qeWyp25IkHj+CYD4tv6EU8IdNWF0QGpq6qZkVFykj02Y9pOy
	 lGgnMuD5tTvAg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D60298100F;
	Thu, 29 Oct 2026 19:02:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 733931DE
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 19:02:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 650EC400C7
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 19:02:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yc87vjblx4OU for <buildroot@buildroot.org>;
 Thu, 29 Oct 2026 19:02:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 7531F40048
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793300533;
 b=hkqozXxaWWbSwrbcODCIzS1UX/eAJSoFHW8L5/C9Sunfpj6SOX1I0blZFv0ekHs22KEK
 +DOkqHzqIQ5fCy8oSrvaMiSUGYHxYb8QwNoBZ9xqih1w5GV3MuwRAu9+lSV5Tl0hXnGn8
 tvb1t+VaXCqw3Pin8NI+0vYVOHSHhGG77iZf/TQRo1g71l3WHSZriTpZmozYGRFaC3pq0
 dIRwPthBe1NNO95O/09EyyHJDqUZAdzjc8dNnYAsz3NEaGnX3yZt0zaeGsyYFL6RRJmbB
 +00gGLp/oSljZ1bSM+B8Pe2EclfC7b7AZLDSJv1iFoqbQYQZ4jv7L3HP8pwNGrVIVYA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793300533;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=tk2h4S4tmwEeuiQZkZA6h0bbbESsQLbQe88PsrvmJJc=;
 b=cZMGK3nEUfuc9VvcBMjT73esMBVMCIgDytZLlgLPmgdNb2nVykfDXJ3Ljou1avKfrCb1
 v8AKA48sd8ihPahMMmHSpvpPmfW6LX+aEH/B4OIEcLPnoQCppGt8SEjgMqkb+S194wxPM
 +gZgSoCKz9dFh+3xQ/dy2Q9ZwMEo/2jazR/2eSu2buOypg3lwWo96I4Rq9WtMGpWQOEgp
 R04T3cHJWC0ZiQnpfGjJnPvgglRmnYyj3vkc6XdsWIMTNH2nA94Sm0XBhaZTs9ZX6mHm6
 qQtfSEqYn/VDOa584ClE+77QmSiOnqk63MxpklATMmou5UriRX+VXJebWXzwE+emk3Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7531F40048
 for <buildroot@buildroot.org>; Thu, 29 Oct 2026 19:02:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F149C9D2BD; Thu, 29 Oct 2026 19:00:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 19:57:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 727b904c13bbc2a9a7a530b1f8e47d7d180c2768
X-Git-Newrev: bc0ff4011c15928e49a891f920d15538076474a8
X-Patchwork-Hint: ignore
Message-Id: <20261029190045.F149C9D2BD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dtui: bump to version 3.1.1
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/bc0ff4011c15928e49a891f920d15538076474a8
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changes since 3.0.0:
- Toggle tree nodes with Enter
- Bump chumsky dependency to 0.13
- Regenerate stale Cargo.lock (3.1.1)

LICENSE is unchanged, so its hash stays the same.

Signed-off-by: Christopher Obbard <chris.obbard@oss.qualcomm.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dtui/dtui.hash | 2 +-
 package/dtui/dtui.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/dtui/dtui.hash b/package/dtui/dtui.hash
index e45f979934..b042812c73 100644
--- a/package/dtui/dtui.hash
+++ b/package/dtui/dtui.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  57bcf3a8b6681be2695762da17c20d2efb7c121131138868ba7a4485fa08c335  dtui-3.0.0-cargo6.tar.gz
+sha256  cff3895576d31a321e82ca63ac45f8a7dc2ae902ae2b9a3efa68438cc5d8aab3  dtui-3.1.1-cargo6.tar.gz
 sha256  b7b3cd0d92fc6638f0a7bd2306d715c747d040c6d851ed821a45c5538663e57a  LICENSE
diff --git a/package/dtui/dtui.mk b/package/dtui/dtui.mk
index fad5f818b4..86bb0fa213 100644
--- a/package/dtui/dtui.mk
+++ b/package/dtui/dtui.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DTUI_VERSION = 3.0.0
+DTUI_VERSION = 3.1.1
 DTUI_SITE = $(call github,Troels51,dtui,v$(DTUI_VERSION))
 
 DTUI_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
