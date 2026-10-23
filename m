Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879F3606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 10:50:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aEYoy931
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C096811AA;
	Fri, 23 Oct 2026 10:50:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3kUpNAu1yYgy; Fri, 23 Oct 2026 10:50:33 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 84CCE811FB
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792752633;
	b=nI8Sq8ZXcr0GB53ntz2JE5HfhfivnbTd9CLekwnXpVhNAxiRnd7w0bKQDPsnwl3XpFJM
	 ro5Ao3655Zj0jpci0crMvLCwdP4Ku9ERyK77QvisVV0mEdm/63eVthq+p4fhw/nHY5QGX
	 mMZKPIkrSJv87xcPI4hw4vR0xUiEUHbwGB+OIaB7MOMO5/4EC9WvA2D547s6USRcZMJsA
	 DyfTy/QRKss0I6aTGkXtfyHxhk1RUni5pq78VzV4VwksvCXm1Kbmt8SbkCHzXraRAiwjK
	 fBO34GL7BtpCZ+nUTkR6YpS3AKmGchTHLQ/+4fvOWxK2knH4hHIWacSEH3ZCTwEqvkw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792752633;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=a/SPurIZHe01SiWyFzuy+nExVpIYvy9dBlpMPS/Ggb0=;
	b=cYaMfCKDadT49N1mTI81FPzqMGYoXoUmm/f33rDqDuSCPgUJVEtVvztsVBAVUZbjUeBA
	 PXHyVH1ABimfCUJKmOO+ju54gpfjkN/EPYfM6e4F/UhBc7q76LrS+g2fmgxEkEQ15U6fT
	 RgFuyoQ7tubkCq3sioIP9AVKRZyffFPXPkGQwumEp3uUzGL0u+s2ybjNbvCSHC0+BL1XY
	 1EG5Yx5bZDShjj9TclI499SJggstu0J6no/wuQ29mo4SoANDKnJRPA+q8EdJr3yshjk3q
	 EiIo8R5HlMDcTMBf9EBf81ZGrIdGF0/8LUQbb4tVdZhTG4Ba0BJsigCTMU+R0YvHcTQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792752633;
	bh=a/SPurIZHe01SiWyFzuy+nExVpIYvy9dBlpMPS/Ggb0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aEYoy931vv0M94ETYyQiKDZjK+TQaeouTwb+ni9N5NOnQHD/F27J6xf7F7dr2Bp30
	 K292mH6GfYHDnImYqp9jj8sP0RNZlo081cgCEzTHJe5D1LsylssoqvranjIWvc3cMh
	 kdnVLI0NLJOL9LWOrv9+ffBck787d7tvBa5sGEsf+AsYB9cfd4IMi/zvIYH/MtPwf6
	 9fPHeIIXPeUtAdn/YoCwfZ4h1Qubi7cDL+97uMq9Hx6Wwmg3alkmeYYXJxQC/Q7cPz
	 iPzc0edCjVOQ5ZmTr0zNQzbRs1+sdhqe9I/SNIGtvyeoI9HUcWamGo+MZ5RW/s0+tZ
	 X6M4XmPuvuQZw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 84CCE811FB;
	Fri, 23 Oct 2026 10:50:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B7F9B02
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D43B811C0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5QCz13-RMvMe for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 10:50:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 5F4A3811DC
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792752629;
 b=OTBwKb4savInXWF7paxnssms6kbj7cI3RJ4WFyrcHsSH/cUPuDXnpyid5lK9ZVAfckq3
 PpUvs7huWyM5WdkgEiT8/lViYhEA7R2V+HBApDjvuG6OZWQjm1V7Jt3uq35w09Eq3UdKN
 +YtnhGRD6SNpQZ0TP4JrgoDjKK/erOCLZ6MBa1rgamnA2+WZvHF8LpQauHi6hfUjKtMiA
 VQ7zXA+k7y4Ur8obikioBIbeLUgqc/FoR85RRwvV5fSZXrUk8EQ0jb37Po+cXtIvMncCl
 NWoI1if54wRMDCAuCK6o/kbatTd5QMm2eay+b/e7/SS9P1UMEabtIXdGY8mB5XzqD3Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792752629;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=hhrAHsFn/7Ej2lcqFA3yWPtBb7Qy68XAIZb4WVyjG/Q=;
 b=oWlrCwzIXt0X2eSNbfNia0AMUtwmAHuOnmVSlclSnWht+h2/bYSZcihh7V4x/UIitAqk
 0q598KgPKRvCSXqcBhKlx35QBun56tUL2v6XiEsiDeFNu1H7WU/IwP9EGKm2aYlOJU/X2
 QQKA5rJiOqf9KGY0zwSTYOC0+2u37bIxwFUJqAghqXfx52nhj7ZnZUXHSHsWg3H+f24LA
 dL48+F6AZ1TuMmhZG/f3tyCu/cOu7i/KjoioLQNH2i9jLtZ/a8SOOPCUDTJnDEHxSfbwu
 EYqqnWa5KUZhkspEl4qaJi9QBSbKdrp3XLIWLIwxB+sxuF8MPe287X9/AXgFvlsV4MA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F4A3811DC
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:50:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ECB589C658; Fri, 23 Oct 2026 10:49:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:49:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f6dd7e28aec579e318b1f63dbaa1fd719f71e84c
X-Git-Newrev: a370fbaa27bdb23c5ab27846b49168b2f5856751
X-Patchwork-Hint: ignore
Message-Id: <20261023104904.ECB589C658@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/brotli: use github macro
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a370fbaa27bdb23c5ab27846b49168b2f5856751
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For consistency and to end up with a nicer filename.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/brotli/brotli.hash | 2 +-
 package/brotli/brotli.mk   | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/brotli/brotli.hash b/package/brotli/brotli.hash
index a777737338..c851d7fad1 100644
--- a/package/brotli/brotli.hash
+++ b/package/brotli/brotli.hash
@@ -1,5 +1,5 @@
 # Locally generated:
-sha512  460591287d428c8b5a8a2766b5b424d14501fcda12c7118b8f3cc4bfae44b90ac75ca156557f07b6e22542612724d904533e5f70019be07dbbb604c46f03ab69  v1.2.1.tar.gz
+sha512  460591287d428c8b5a8a2766b5b424d14501fcda12c7118b8f3cc4bfae44b90ac75ca156557f07b6e22542612724d904533e5f70019be07dbbb604c46f03ab69  brotli-1.2.1.tar.gz
 
 # Hash for license files:
 sha512  bae78184c2f50f86d8c727826d3982c469454c42b9af81f4ef007e39036434fa894cf5be3bf5fc65b7de2301f0a72d067a8186e303327db8a96bd14867e0a3a8  LICENSE
diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
index c040878c36..47e2f8e57c 100644
--- a/package/brotli/brotli.mk
+++ b/package/brotli/brotli.mk
@@ -5,8 +5,7 @@
 ################################################################################
 
 BROTLI_VERSION = 1.2.1
-BROTLI_SOURCE = v$(BROTLI_VERSION).tar.gz
-BROTLI_SITE = https://github.com/google/brotli/archive
+BROTLI_SITE = $(call github,google,brotli,v$(BROTLI_VERSION))
 BROTLI_LICENSE = MIT
 BROTLI_LICENSE_FILES = LICENSE
 BROTLI_CPE_ID_VENDOR = google
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
