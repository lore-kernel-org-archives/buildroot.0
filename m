Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 883D5606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=lZ4s1Mtz
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61FCC40DAA;
	Fri, 30 Oct 2026 14:19:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WFGxwr9-Ie3B; Fri, 30 Oct 2026 14:19:50 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 7C57940D9A
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369990;
	b=Tfwy0vbrwNM6tzElAmT1UgmX0RHGnCro8Klo67PINSUwK0rU3QLFiIG3DlHZIF3F+Bhc
	 m6w/AhyPMAKLPFkgF5c91/1U8hoygt8aSbnQ78upWNjNrHNXiaw7sRrkfKfCAa5L/WS3b
	 6KKbKLt0LkA6nt0G1xYFgVWumChtUjfolxGwYoPKtI/gF6O5DHPoM9/QJWnsYS73Xjuly
	 lxNToN2A2ectzvjJjFoPLv65HzB0tUfynJZUtPB1X2pUMdLe5rWdJ5QoEXe5tTDZygHaI
	 BrlUtiDTrHpj7/+ZlZyiQ8VFBUAeC46VMufoST97CSvJVSbMzKaz/okcK8V6xJL5jDg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369990;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=gztOWf7zOhPqAnloTALfDTAYi23lV3KxlTH2kWPfTpQ=;
	b=C4G3zUG0LsJoAk85s7P41Rxt2qh2E0Hxon7dbCnhpQNkcpYUlG3pHDgVGas93AUvNw1M
	 GGy2jy4BxkIDS13LLqx8HyWiSNO2xEt0G1jt01fGeY0u1/dAgilgsAnZmX6O/LBMZqJjJ
	 GG4R/kQf5zo6pCCA4uURURjt8p04Js2CQ4Ti8ZjT9HKSZye8rheo2yA4Ws8+Q8iY9vDRy
	 lDZy4agYaYNr3gqA62l8KgP+0EWSyLr7hWh52OEjOlJcoU+kRykM2Za/wcN6qPlgm6qjX
	 TQNpE1Fs64Gn44+T6E4ohf4FtoCR8V9yCrGkW8BILS7XPruFFBCScG0eS5vWq25SpiQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369990;
	bh=gztOWf7zOhPqAnloTALfDTAYi23lV3KxlTH2kWPfTpQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=lZ4s1MtzVrtdKsAIUyYXAnxPPeosPdClZnQscppoZpN8/VOygGp/Sc6i+WVVaM/D5
	 RjJtGKJ9EBsQjybdDL/N/8itz/UrI0jJIBqrwvzo2l01QPJyneLXpbmT0Dv3+6uY2b
	 EEw4ODGmjXh5icIaEB3wGEyiuRuns8rN7nbGrJsE2+Gw09CaoZgm6kgIJRSNAAE5IQ
	 wcT0f7iew0761/7Xg7mH2ULFrouBs1IYIrj4lYJvPoPAmuY6B084QgjUkYSGzxIMhL
	 hdqoNFkObNeYY0muO/QtQLY5iRYyjxO5p5HVADEtY1+PnZwUAe5LGUoDCqNg55VjP/
	 N3A6Sa95Q2sEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C57940D9A;
	Fri, 30 Oct 2026 14:19:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9EC3C712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 90A844053F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6CeRPAy3_467 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:14 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org DEDE740243
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369893;
 b=Q4MnDt7DIw01VPCWODhETbZXKnha5l7LQHah/e1qpd+m5VBs9Y/pHKmK2OZwxMlZ31I8
 yc6IDHEpn1JCeyxv6xlcOapuCOg6s3cv8RB8/ikTkrKT2a1guXWZylXY4NlZRBUcNtnsW
 oLnxqdQzqqkRYoI51yVtsU+lto4qztbUoX/fFVVxmPp3COQzReyjDaH2vl+ivg3l9oAtH
 cSUomR4BJ7b3zQ65Y5lK1JkwbWAZIiPifXstQIbmHR4h9+CW5G9kZU1aK4XcohuUcfI4J
 lx8cVySB7dU9TVDY3jHu5IV8wxbLjDBi5DPvZI3pXHrGuIVfuaKbtZlz2jW5D5aEefw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369893;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=XReY5HDS3eLh59DlUQpbnfGiwhq0I5rlINvfjbngBeQ=;
 b=DosNeK0cQaA+F1kMMX1Zb6kLOsCYOkSntkUn3smZNwZElpfBX2BBlWQ83rkTSwRx20zQ
 kn36Q8IrzhG2lgc/M+xhEtipb7fQPsWzWAWc8tssGHjvzVIdGbwmZ2eKtKnSJaVgG1cdW
 SVmQkVdS+0H+qpSD6fIm67ngK56bwYf4FiDT//hdl3+uEV+DazJ8Y9M/hIdy4zKLhiZ7M
 xu403ps4UpJZl2r+bwz2Spm/72wE9HSagUGKJeYDBai+ry9lYuEJB0GFSRaeW3ucW80fr
 fS8HkPTlK6fzTgOFH61hzcfZWeQziwHaWOJEjL/9342stw82IARtHFFDqAus+vUI54Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DEDE740243
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F1EE59D389; Fri, 30 Oct 2026 14:16:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:09 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 45d25787543a53360dcfd8ee19b4054942631c07
X-Git-Newrev: fb3144a2a1ea5743f89a0cf741f5cb20058f645e
X-Patchwork-Hint: ignore
Message-Id: <20261030141645.F1EE59D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/brotli: security
 bump to version 1.2.1
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
Content-Type: multipart/mixed; boundary="===============5882408320622861560=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============5882408320622861560==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fb3144a2a1ea5743f89a0cf741f5cb20058f645e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

Fixes the following vulnerability:

CVE-2026-111497: out-of-bounds write permits remote code execution

https://github.com/advisories/GHSA-9v8h-qqgm-4m35

https://github.com/google/brotli/releases/tag/v1.2.1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f6dd7e28aec579e318b1f63dbaa1fd719f71e84c)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/brotli/brotli.hash | 2 +-
 package/brotli/brotli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/brotli/brotli.hash b/package/brotli/brotli.hash
index 9ec1f79c7d..a777737338 100644
--- a/package/brotli/brotli.hash
+++ b/package/brotli/brotli.hash
@@ -1,5 +1,5 @@
 # Locally generated:
-sha512  f94542afd2ecd96cc41fd21a805a3da314281ae558c10650f3e6d9ca732b8425bba8fde312823f0a564c7de3993bdaab5b43378edab65ebb798cefb6fd702256  v1.2.0.tar.gz
+sha512  460591287d428c8b5a8a2766b5b424d14501fcda12c7118b8f3cc4bfae44b90ac75ca156557f07b6e22542612724d904533e5f70019be07dbbb604c46f03ab69  v1.2.1.tar.gz
 
 # Hash for license files:
 sha512  bae78184c2f50f86d8c727826d3982c469454c42b9af81f4ef007e39036434fa894cf5be3bf5fc65b7de2301f0a72d067a8186e303327db8a96bd14867e0a3a8  LICENSE
diff --git a/package/brotli/brotli.mk b/package/brotli/brotli.mk
index aded9cf17b..c040878c36 100644
--- a/package/brotli/brotli.mk
+++ b/package/brotli/brotli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-BROTLI_VERSION = 1.2.0
+BROTLI_VERSION = 1.2.1
 BROTLI_SOURCE = v$(BROTLI_VERSION).tar.gz
 BROTLI_SITE = https://github.com/google/brotli/archive
 BROTLI_LICENSE = MIT

--===============5882408320622861560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5882408320622861560==--
