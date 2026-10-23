Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13213606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 10:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=i03HVYQa
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB5CE811E6;
	Fri, 23 Oct 2026 10:50:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CEdvndyDG0AB; Fri, 23 Oct 2026 10:50:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 17256811C0
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792752632;
	b=hIS4cQedOBK38D1CBoIga/9R4h1OtfgYdR8u0XULKVq7LCik20t+rVUqQZskPmWP3XEV
	 Yye26nLAQDrJyYDMd1QS/Sk8+AB1PVmSx/Al5mxNIpEGvKxA7oF5rgtg9w1d1301HRdMo
	 5GXVlnD7YJ9sgwMoSoVofpnpPNc2wCYkZrXsENlcRfbU9DlmUDqQP8XvqaxclE2YRjQ22
	 iLJvbsB8sLepYhCvXdhzo7nLql6Dz0lnW9103321dpUKNXOepDLYQJhkJ4cVMdXcRX7Zw
	 qC5GCSyWs+E3HTJ2UTratAcRuxYQG1T0BBsOTBl79deQ2nMI6V5hv6hSECXx3BIf1ig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792752632;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=MpvYVlWdy4zFSVe2I6CeBNuynAIhEpESP0uhk6x189Q=;
	b=I1HrQyhGbJebmzdOPE3Zuiibq4c+eOaf8MrDwkxsf21I9YsnHlgeVncRQ/p5CuzO4QVt
	 OvI0IWlkIqKOJhWAsc7Hzova6Im5wdKysi7+O9g+HsYv5tJFgwJBtDQzCqIZkKfe0YJvF
	 JaguZbhuHzSFcs3DL1g30DFQLA8ywx06S20jSAmUT3vpkTcbHCMgChiFnkWAA+ZpScHN3
	 xwGQlhvqcplqN0bb6Q0K3+XAp9buHgnskAb3nsxK2q4Lpek7yPwIAzYkF9LUFRJH3aO8L
	 VQRJkHJvPuk9xr7wwbEGiKwvdnJdAzu1oUNQ6qYVB28aNdVwGOioh0yl/UZmqXuU9yA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792752632;
	bh=MpvYVlWdy4zFSVe2I6CeBNuynAIhEpESP0uhk6x189Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=i03HVYQa5QV+ZEus3BzoZqF9eBJCDWIFVrlAbFmZO0wgejzuTnWmoBeGa3uSK1Ksj
	 OYbKV7nj5YuU0KOeZDxqM0AXwiw/sUVJO4Wea0Pu+kx7a11Yvmfz1WEMR5bk3/5oGr
	 nRo3meyNvB0QfFctn1FyKObkfvd6Jq87HvY3iVLd5yI6CcrLqtkht47RNdTpVO4LzS
	 yksfFyZ3oO+0zut0L3mWkkgq/7nulEk2vWuM8QAmAOuvfQ9+GToHJkMDD12M1Qqs8S
	 2ouh2R67D7ZTZzySPecEosqvsSqkoQx44+v7JF84DOigc2yEnUt6eAELvsVbqGx2k6
	 sw4rJ5DexojZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17256811C0;
	Fri, 23 Oct 2026 10:50:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 79CFB49D
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77386811C0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:50:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JurtwJvvL91J for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 10:50:29 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 62D87811E5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792752629;
 b=SgIp4lPEtaNNhch+/OKbNDGisr3l1BcG6WyapRFOidB6JdVqdmIqnMU390+tjreatsA1
 NijlGFan1ysma7sI8iKe7I45TrkCntVyo92XCzr774WGMtPU+lRRdOphQMTKdc2ZVK1C/
 FH9WhZT9Nb7gtN9BV4g4LXsLF50P3xN1IfTxjqR71elbzP6eHWJ8v3F3OXfOsyFS5JTm7
 xw2HKJfFzoJ2zylF78Jfs9PZ5SRAH1HbpPNYKSo6gstQzzWIYeOt2q57ioOhc4gMHjkP2
 VD5sgU3zhXDJzaR/uBPwSLSX5zLjlidm58ZRDqs9xzPpua71yYXsggPnRdqulO9HQmg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792752629;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=qCsO3pIziZBU1N6CGoHr1BFldbHpeiKZ+3JCk4Lw+9I=;
 b=hzs17f65UdD+OafmGTAe5kRyKwa+92YnKrpVhubNLHnB6xkaMDtRb6d9XaJ1mVa8Zlsj
 838TOvN2ABUaSTkQ6QKxrbuWyiuU1voakp4qgFX1BJJWvhspaUymmFE79ysWs+Ukxv0RU
 aMvPzDfio7fRuMijvGPnZ1pTDMuSScVK9jS/BGY24M5MSXNLffDZKjLcT783H/ihrMKtK
 RSACYHk35zHL3JWM80qlvDHWXWCmhhkeKCgz+/a1zpPg2aTBBUMnH9V3weWgZxV6QAsy4
 rRs0+bO/Fws7iOucFALjBu5ZudwqHJ6u4bIjHSNE6ZHS9Nz3Vow5VWfRMogrpv5cRVw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 62D87811E5
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 10:50:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E0DBD9C656; Fri, 23 Oct 2026 10:49:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 12:49:35 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb32332ec4d06cf310293c2928d9da0a4a41b13a
X-Git-Newrev: f6dd7e28aec579e318b1f63dbaa1fd719f71e84c
X-Patchwork-Hint: ignore
Message-Id: <20261023104904.E0DBD9C656@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/brotli: security bump to version
 1.2.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/f6dd7e28aec579e318b1f63dbaa1fd719f71e84c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes the following vulnerability:

CVE-2026-111497: out-of-bounds write permits remote code execution

https://github.com/advisories/GHSA-9v8h-qqgm-4m35

https://github.com/google/brotli/releases/tag/v1.2.1

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
