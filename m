Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745D0606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:07:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=M8koIsTU
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 51B74811CD;
	Fri, 30 Oct 2026 14:07:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4dvCVBlHeBzW; Fri, 30 Oct 2026 14:07:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 7176581191
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369233;
	b=PWDINQj7g+0l0SCkwVtVkabYEbkLvcGuhUyn3y7AI4ZDccsuA2ZNvGLbCc9LzPSOXuVO
	 WOG9UrdWQGLT0tZjqcvO9E2cakyTGySDmyQeRYOPK0nK52QGkVh+A8kgvbRqjVdIAyh6Q
	 6lvtnR6iV2E47dhu5WszAdBzUtLmhjkMatMqqwI7K3FTIhTcfUzjvtuhjmkmLxZAMDLQy
	 rlYLADo32ewpm/2EBvQb2UZjxBEZVTxgUQawqX7LnMvmjAMZAdG/h4sKDjNNBrq0ToU+A
	 pKgDyGVeaUt0MvqY6mmg7h+v0HLFUa0MZB5zQQIuMW/X9JzByUqBdPWr1/J0QJCTKIA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369233;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=2Uv/ISptkdbkMU7qkRLjL/phv7IkuxYXJAChQlmxL8k=;
	b=F3251AOHBY6y/nIwDHJH1drsrlB/MIIuPjFRmmm/eog6FlGVEOgH9GShT3/U5SEkU1wl
	 BAwXAvLCCaL9l4hxvEHLE6BJF7ylzPA9VhDS1EPwlq0cRJXDEelF3awmQ2tSyoAWH3Ub1
	 inlqqbYSRXIQ3braTUNLvRKhV2MNeEpesbR0bpMyFQ0/DQqZOx84Rlahno/yrackLRqcV
	 PBsKNhTr+Litgi0HD88kTw18wu+Nv3DYrsDBRfPhsl4e3TZVwkH4cNiuzPL9JylizGwnh
	 7AvPbTDr/Xcn+uWr8Vce7+QoVe0XQKawC8BzXwwQycgtziiOCVdqyhZ4m1nMC1kmV6A==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369233;
	bh=2Uv/ISptkdbkMU7qkRLjL/phv7IkuxYXJAChQlmxL8k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M8koIsTUGZoeJS3q8gOfCZuVQN/49M8aDp8XJfJMEz3IgdWcRvHxWFXNifSIK9+lY
	 PuuiWdMl2Egteav6TQ8fCyuaeyBbXOkaEQps+IiHVrzhxy26Ap13uo5MSd/478K4QF
	 QGig8ruieESIX0qWcL9CVgeYbAV7ecGyYfLMEeymPJCmVi2VbhaQw9zXNw90x1EZ8x
	 JfrkqLSnj6AolOjyKrwpgyugHGaX6SP+p2as1qw2099loJqIJUpojW/oou2VoWkw9C
	 Rjx/O7qZvG0p6P6iv1uRoviGvH1arsSF/EN6lur+ys/p3LDnuSqVBGQgM8jHDI6nUq
	 70//73xK9apAA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7176581191;
	Fri, 30 Oct 2026 14:07:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A764DD46
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 90FEA40B1A
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 83DZyAvb9X1y for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:06:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org CF25040B2E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369165;
 b=iayMxXGZ5bQrMPaWaz3Kjp9Cio3SUGi+QXLb3wVvMdghnh3bLqiVhMRaFKN6RQA2zZc4
 YeIJnTK08hVS68PxYkdrRPZuSE+eZamhJtfX6z4MlPtrcueROzR/vqTMHVrge/5FyK7T9
 eQKn0vqNGKxTRyEEy4PjwDY1Qq9FCum0LYLE4hzRB2doGQzc4NNFKid4WhIQ/lkbNJee/
 E6GHHVSgGpKEwLKO0pIWqufZ/SsYAF+GgZZGSPZGS0WgRNFA/Ztdy4Z+tWvYEJItIhjRL
 v1BPJ3NmJF3thn17x34Pie2gSnSKxfWtPJVkjh/DsMzOmU0B8v68M/qCR2CD9XW/QiA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369165;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=NA+X5v5aMH96+ousznmDa/vUz5nwx5E67wCrOxmbbZs=;
 b=MkSfaDqSbyvqwBvgLNDoc7dJ2L2pGjF3qlbD5KWQgsF6mcdtCkLAmDTrX/GvH5qlIFwX
 aHTTaUJFuFE4biSbpSekb9StpjEs8oecYjJj7M3RkOgvoFCmFkiaR8xHisQp0FzrhpCT7
 fL7jtYE9yZiG4exGcGJVBZWn495/8CGUuBUR10OjzOViqbW5fniUilNnz2Q++LhIB7bXe
 mChnJ5kUj1uZwtXyNQ3h7yQ+Q7OqbbmBPZ9ZXWMTxrgIRw+2W9Ck9vNRNwxV70qcosT5U
 ALj2f30s+byhnRoWSXJ3v3ZQpT3e7KjVzmAYE/o3doJIxCpRRBG/ZQrWuunsjPoL4Pg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CF25040B2E
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:06:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EEA749D388; Fri, 30 Oct 2026 14:04:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:19:58 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: d7b7aae5600b6752de3b0e400737410268c722d5
X-Git-Newrev: 6020814a14ec69d65941b768b52cf100dbe35c94
X-Patchwork-Hint: ignore
Message-Id: <20261030140437.EEA749D388@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libnss: bump
 version to 3.113
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
Content-Type: multipart/mixed; boundary="===============3835257667270814515=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3835257667270814515==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6020814a14ec69d65941b768b52cf100dbe35c94
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

For release note, see:
https://hg-edge.mozilla.org/projects/nss/file/tip/doc/rst/releases/nss_3_113.rst

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 477a0cad139c0668f229fc178dc31a93c6ac7eb8)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/libnss/libnss.hash | 4 ++--
 package/libnss/libnss.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 00bc5baa45..7fcb75e6ba 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_112_RTM/src/SHA256SUMS
-sha256  33ae72d43b275957252adc8639e84229d3ae692a57b6191b059d9456b8568a68  nss-3.112.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_113_RTM/src/SHA256SUMS
+sha256  acef06b512d3bd81c87a63b3c8653d258bb689d2191fc0e64decf5a1efa01c0f  nss-3.113.tar.gz
 # Locally calculated
 sha256  a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index ce267a2adc..312b361cde 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.112
+LIBNSS_VERSION = 3.113
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist

--===============3835257667270814515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3835257667270814515==--
