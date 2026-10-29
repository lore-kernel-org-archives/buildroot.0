Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D9AC606A31A
	for <buildroot@archiver.kernel.org>; Fri, 30 Oct 2026 14:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=JyWOeGN7
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 274D481662;
	Fri, 30 Oct 2026 14:19:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N1h91Z5QQmkO; Fri, 30 Oct 2026 14:19:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 3EE658156A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793369966;
	b=EKfokWPjsGowJLDAhBlYiX5u5cMIm5U8vnBbBz5kpy+SRoOd8LQKcl89jkKiw8AcssPA
	 KCc7tcgfQ6+9ZeVnutB8NnrXNFuKCcYJiPAoVKIb0UsfyP3sgDqOu3GGC3hlkDfdRq8u8
	 r4FzF2Slqux63AJtFkgWQhGYDX5gquTuvF7aNWNTnRwZubRusiesVkZHaTrRuGtPNHTrX
	 gpX8PCPzcCjnWXO/hOmUHFezJDwFwYwcmT46Rx7sEaAgUbQQ+TJiX0PsgnOYfuaC6B2Z1
	 RYDrWxdYaEt48pJyxPEa3BcKaF4MTBWriSKmg4sXSzlnBX+xDr4IMCOeZQHS3hz0E3w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793369966;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=X3+0XKpWBYbvPhKatvcNs6gsE3kO3wKyU9CxSrTs5do=;
	b=SVpGszgbG97HmriAiKd/qZRzEiOLkkPOSoWg9IjNwRp4dtTCTLNXxs2u/CyYG20lieY1
	 OLEHsBZbu/A5cjgc/pWg8IuDFBEY+44Ni+x5arz50hHS81NuQ7nUsrkkA/eKbEN4Eu6mZ
	 KAR3W0ai57rLukU9zX8cQBG/aTyaPlw3VJ+vE01eCL6fqeY2o5e3RFvxIAquSpBj2wgGn
	 LAR3C1DYZ61ks14G70ODDmxr/6JBTe70z1KUz57gsbTLz3jQh9zrGeuVfHk4TBPhpfTXB
	 ZU8eGvqsoB+KEO7A4aPIfygSYlTQ9j+FaGKqSDBkAbXi2t09xIa52fa8sZx9w4K1quw==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793369966;
	bh=X3+0XKpWBYbvPhKatvcNs6gsE3kO3wKyU9CxSrTs5do=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=JyWOeGN7IO+GNeag1OwVUF+V7aw1uxhmuJ198pE/BsTL6oCuj4zXWTGsRR26VCw/s
	 U6kl4jxSTksIHXqKOsf3HbFXmjS6cWvvy7NCw2CY/dGaR0z2fE6sWC4DWbHYhhwSk+
	 HEujBtaBCH9vBFiXEJ+oW3XUNRcEX8YeIUsQ0Cr0Ix50jGP1acLLScHSxdvuDW5BXP
	 oAVRL1enKSnka4Gg4J1UXpQGoGJEslJInB0t6cE2AAcqWmis8eso6AjIkWtjEA7JBN
	 nhpb2jJrsbXt7t01Qs7yf0zrfVhD+0hkhggJFCoWVb5LiP16bnvpCOAO86UFKwM0/e
	 G6pPFtY4w6gOA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3EE658156A;
	Fri, 30 Oct 2026 14:19:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EFCBF712
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BB1A14052F
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ivm6i4yuXjQ3 for <buildroot@buildroot.org>;
 Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 1681C4053E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793369891;
 b=E7RDXnxBs2peftuFfaOBv/GM3g7lzR/+tHduaP7kwZSK4Pr6TL55hy4Uo4F02rg3apWI
 4yRQknb3qS9L9Tv0dzj/SkqD6SqrDd6JXCbLXBlVmV5aJhbTvVQ/tQSxf8ESBo82euxKM
 aYNpvXiEZg4PUwgz0JznNhzVnFlroMDB1bcMVEsoUjNgQaD+GAldEhFRatF7Vq0yoeYGw
 41s11mtLXccgIFX8qX//yrLTS+fzjJFf43q4ieRpdaDm/HJr/MF7zL0fD8qEmAFc6uI8L
 pQIWMLxnqRaHXkVkg2CMcarJUQDKY1qeiRapnwpunmhYRvrwVQBzMPkmvEYguJKdrHw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793369891;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=/Mk2LiunQqRyaj05i1kvZhqNzxSr8Z6uD4aymTn7BxU=;
 b=fU0SlNvKmOUEqM3trNaZcQVhhWxIqtfAlzWpPQ2lStHnytqFxEkg4f8JaMBIWd64vkYt
 RIiAOC/l41fOzvD+lWZyzm97390qL7z/BIMYsigOq8Aw0Bu1JCoYsOZxu54BeegaxtMBq
 F3ZAKMe6o6ZDI5cZwzqH9E7dceZI/9XAODs6xShzxw/Iaat36LBqFcrpx9WYxNjgvvhwu
 UZnVpnwugxjm5vnqldg7rqCqXTXuHzvjat9oT883qCOYZJp76zOKbPUr0U+5QXifrPN1e
 kxNJOIeDxK7AHzndFHgKDmfYt2i3NEU4KFY7FwTPMB7bYr3+3KoWj22twbFBZ9eDnmw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1681C4053E
 for <buildroot@buildroot.org>; Fri, 30 Oct 2026 14:18:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3576F9D389; Fri, 30 Oct 2026 14:16:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 29 Oct 2026 21:21:07 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 2dfc5ab88d214a7922bd85147fb4e1528f90d747
X-Git-Newrev: 097c03607d0cfa5c2c6a9b3bda1d55942c3a45a4
X-Patchwork-Hint: ignore
Message-Id: <20261030141643.3576F9D389@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x] package/nodejs: security
 bump to v22.23.4
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
Content-Type: multipart/mixed; boundary="===============2098862994133742072=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_PASS autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============2098862994133742072==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/097c03607d0cfa5c2c6a9b3bda1d55942c3a45a4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

This is a security release with multiple fixes, notably updated
certificate following the eMudhra intermediate CA compromise, brotli
remote code execution. For more information see:

- https://nodejs.org/en/blog/vulnerability/october-2026-security-releases

See the release logs:
 - https://github.com/nodejs/node/releases/tag/v22.23.4
 - https://github.com/nodejs/node/releases/tag/v22.23.3

This fixes the following vulnerabilities:

- CVE-2026-105481: http: ensure agent data guard works without I/O
- CVE-2026-105482: dns: validate resolve inputs for null bytes
- CVE-2026-106069: tls: reject non-canonical IP addresses
- CVE-2026-106073: permission: check permission model in realpathSync
- CVE-2026-106074: crypto: reset random caches across snapshots
- CVE-2026-111497: src: expose BROTLI_DECODER_ERROR_FORMAT_BLOCK_SWITCH
- CVE-2026-111497: deps: brotli: cherry-pick 0ed4268a4401abcb44720963

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit d51abccf376d6273acb681e7d561f24e98b60ea1)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 package/nodejs/nodejs.hash | 12 ++++++------
 package/nodejs/nodejs.mk   |  2 +-
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/nodejs/nodejs.hash b/package/nodejs/nodejs.hash
index bf7a8358ba..5a9240d4e8 100644
--- a/package/nodejs/nodejs.hash
+++ b/package/nodejs/nodejs.hash
@@ -1,9 +1,9 @@
-# From https://nodejs.org/dist/v22.23.2/SHASUMS256.txt.asc
-sha256  fff4078c5def658577f92c88db7db3bc0072924bfb93fe52c1e744a54e94abb8  node-v22.23.2-linux-arm64.tar.xz
-sha256  ef8f26a3de19acd8c23548e6c3cfc2052610b0e67abb5fd64dbd92c8b1c1245b  node-v22.23.2-linux-armv7l.tar.xz
-sha256  e2ba10110ad34096c051fe47134fcd12175ecc48e7e879d7d4c78b70cf66442c  node-v22.23.2-linux-ppc64le.tar.xz
-sha256  d60acfe00a2932254bb0ad20e01b0d74397a0875595de719654b214f4b03f307  node-v22.23.2-linux-x64.tar.xz
-sha256  bbe768df8d5815d7fa76124052985332452e0a4742d39f32027550d1aab8f6fb  node-v22.23.2.tar.xz
+# From https://nodejs.org/dist/v22.23.4/SHASUMS256.txt.asc
+sha256  6287aa46b6c375d816e63ae66d024fbbfd70404825aabdfdf898a970871d2f4b  node-v22.23.4-linux-arm64.tar.xz
+sha256  c9057c6a3b8fbb9651ed115c1e96d4a7281b7b9c9ca89fa05865c98ed7ffd437  node-v22.23.4-linux-armv7l.tar.xz
+sha256  e4732f45e0cad787d6ba70c4eb6db45dbdb3f286f67dee429dbc6b4ff36eac43  node-v22.23.4-linux-ppc64le.tar.xz
+sha256  1805bcd35e6815559bd2eb97db438d3fdb0eb3a5e6a977b7c1badca76337e9ce  node-v22.23.4-linux-x64.tar.xz
+sha256  7b9adc82d612d0a2a863d96c46de2292552e250cee51956ebbe0146c42aacae9  node-v22.23.4.tar.xz
 
 # Locally calculated
 sha256  c738ae413cf561f174e34f6961f8ca458aae2369a73640dda6234c629b98bcc4  LICENSE
diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
index 1147245504..d8ec70af43 100644
--- a/package/nodejs/nodejs.mk
+++ b/package/nodejs/nodejs.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # _VERSION, _SOURCE and _SITE must be kept empty to avoid downloading anything
-NODEJS_COMMON_VERSION = 22.23.2
+NODEJS_COMMON_VERSION = 22.23.4
 NODEJS_COMMON_SOURCE = node-v$(NODEJS_COMMON_VERSION).tar.xz
 NODEJS_COMMON_SITE = https://nodejs.org/dist/v$(NODEJS_COMMON_VERSION)
 

--===============2098862994133742072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2098862994133742072==--
