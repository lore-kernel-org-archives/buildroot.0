Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C85606A319
	for <buildroot@archiver.kernel.org>; Thu, 22 Oct 2026 20:59:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=n1/OkfA3
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 683DF811E7;
	Thu, 22 Oct 2026 20:59:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6t2XGjUBUShu; Thu, 22 Oct 2026 20:59:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 8551381248
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792702760;
	b=eVqFcJxAUeyYhEMOtypH1uTGQewc9pFvQufnxV6mkgAgbFCDy/tRcCryROAaleYJMXec
	 zVqEX/PJAB6H9A9H1o9StLdW7SGoAgOuUK7RnX4ORMuwThkNRCDPZrPSPcSmld1eVQzp9
	 WZqQmAvF7X58/PSYH33hG49LpUbAmz5lsm7vLFH3rvaiDj5wJ5Nm7GfczRzV5cuF5D2do
	 Jz48vrQCucR1tzlUjuBM8bOCDPMP3c/axNUlgUeb6aMVy7tTAsICyhHRq8psuzfVTF6MZ
	 hDHV6nxyngj2RWUhAwfCSw8NOyjLTCQ0XxVlb/l0h8wvce1qR3ad/6JWiOf2UwgElww==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792702760;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SCZkvXHkDSEUoYJCGbu9RTe3WzHVQ86ahz7JVH1T7Z8=;
	b=q6ecWONWYMWUe6Ak1c+cm6cN73QFWkvhKUcWnBaajeMTX05KlyOOznmTL3pAIo3ZCXnr
	 q3ZE+7VzEP9QO9v38w8AmFFQywbmoV94UY+5UU/CHoH4uUfyk9D+FYui5XtV6nxuYWKi7
	 QE4ZTBVY2IYcs46rJjxB0ZNDow/Y/NNlZ/AMFFDn9AStkmvP5xxw88AVvRe6E4z7aoNFq
	 f31zE/PfGybKP7OsWfMe03+7ifQLs6eD7BzKaDR9Q+zesj5D8xgiYGO3215+NzN/vj8wD
	 WPjG9HzBouVkWZavHNr2MF6Wq5z7/81W8GA2e6zuT3VvG5ACSM9pDBZsNySZ3/zFMLQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792702760;
	bh=SCZkvXHkDSEUoYJCGbu9RTe3WzHVQ86ahz7JVH1T7Z8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=n1/OkfA3rSc/MuKSegXnfWol2PeVHQcGjvoHJI4rOlsj8RVZkjTQJMxNBsVUcanLa
	 rlXVOqEib70ldbAtIifbiJhIpdH3llqsvGkw+qMye01x4en9QknyfXehLMyYzyDNGF
	 Nk9T73/lMJgTNhPP8YR8/yafM4H+S3pqRy+WaDd9cJf1GdyxWwmLOxKsUu1bEXWEjt
	 J8dtsIatdyoE9+dscn1/Nma+p+w0sYQYOF0UgrqIGBrQRW69yUxI0L2/aPfBcv9QGk
	 IT3mqXvK/Fy0SSddZgxTwuLB/+RtvrvT8lAqoXsDnWzVHHNhcf/YspT26kTRTjeQyN
	 p6wHbL65HRY0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8551381248;
	Thu, 22 Oct 2026 20:59:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B3A73A4
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 814398120B
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:59:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YO7RUgQzp0Ho for <buildroot@buildroot.org>;
 Thu, 22 Oct 2026 20:59:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org C21ED811E7
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792702758;
 b=DJkSADE8w2LDwqNwM5TKMjU1YIN/NLa1sTNqHmlzMp/wKnMCSVBdZnJtScMfO34X/Igk
 ZEW/jaIZGGb6N6GPaFD5/lLbvNOBjShOLFeTf8QovghJlcKA7AI/xMTfxV1SXAYFsFxZh
 W7CJlxNolMLoJnB2zXzL0pqFHyBywFHjaPAhXqaU9Tl4ERPcuL5HhM46/lJWWqD0QWJJi
 NZUeTIUpCk8zrAJDFSBbQcfnZn1mdHILnC/XPWZEjqjzEv7qzBYFBkKWi87kADxUXrQY+
 F/ODv69gk9hCS6zOM7jFuYtaHV661eyD/U8xCK21QAmyKGxDj+TGzjojGbNfJF9niuw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792702758;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=LbzciuAzz9CDKftcBXocWy/xiSo1e50jwKadEu0vuiA=;
 b=R6Nu2ZshIEc/48GA9LO48EP/rjMhwOfQbISXy55p32FcZfFY/+s0JkgQb5Q8OjKf98tj
 NOYHmOa7HUkjFGLTwOel1aAub6PlXmeG2y3BRtSxXy6bJdZivbLGVCvL+6DNarKcbMlIx
 a+K7dJhxq2Hjvo9gRLF0h5RWejyLnkNE3tiMd6sm89Y/UDA1VU+XO17zaKyiFo0XuDH7B
 /FCPLoG0hhRrIlImmjg2WxG7/Ta6xDHGBcb2XR5BnyVO8KCPjbyYZO0EP6tjK/AtK2zs/
 4MzUKKLWo77RWClQ4X3a9C+MXrtS8GeIORowlm6i8YFVr37jHB2m1tb4auPSrXGl9nw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C21ED811E7
 for <buildroot@buildroot.org>; Thu, 22 Oct 2026 20:59:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 962F89BA5F; Thu, 22 Oct 2026 20:57:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 22:59:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5676346fd77e3ce5e672e94732b2d098dda2da55
X-Git-Newrev: d51abccf376d6273acb681e7d561f24e98b60ea1
X-Patchwork-Hint: ignore
Message-Id: <20261022205754.962F89BA5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nodejs: security bump to v22.23.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d51abccf376d6273acb681e7d561f24e98b60ea1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
