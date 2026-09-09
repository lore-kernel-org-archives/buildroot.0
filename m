Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8775CC79FBB
	for <buildroot@archiver.kernel.org>; Wed,  9 Sep 2026 21:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4786380F5D;
	Wed,  9 Sep 2026 21:35:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ip_EEIChfdT4; Wed,  9 Sep 2026 21:34:59 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 53FC480F60
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788989699;
	b=WIkzxP7LEQk/p8T+VHyuTNDRYLb6DsV/nQf1QSY96Zp1OkeCOBhMPXxQvV5ACiiOyNo0
	 8kR0RkHLHW1rvNINqgrxMGx6LDvIF5ZOtLSkryTf3w8wCzHngNw2riUusN3m9Ob8jTqHE
	 Pj8rXS4kmzz11DcMv6sdRLg19b94/InvedRRNA3dQM3AftSL+eQAoX5YgG/SpQg4ZoFob
	 x5Ze5Hj6oUjP8x933tA+qmHQ2RCymGYSMjgvCeFL2NIHw0F4ThvtDWg1C3uwYO5wYEFaC
	 P9/YBJLXU+q6WKqgReSOdYS/1qsR6rKVkIS6Ky/JnqWApM4wu0L1e3zGuFmXBk3DjAg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788989699;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=NNweWpWe/cEI/DdSil3ESq9Pvx9MC/GcQkPWR/3LzU8=;
	b=DEcPxnQSVPArNrifK5myxkmfvH2wm/xRkQ7GCeMMs7NtKroMLupUKn/xxOiPCACQ8oUL
	 tJdjmsLJuLE/3R4sx9ZO3gxpedHuHbsXbL6jLnPcLj0lPz8UsgKqbNfIkodRugOMMzLHr
	 2OqK2gM1ZI2DaMtaIiasdRknX5xvjC94VZRmyGci4Hj1TL6ueLjGOlyIGPE9mkWj9FTeQ
	 4jfWKkCEM30pM3m9MBG6Knaf9ZGF5iH5D/LnETWr9SCAlacHcN9jBocjXa2G3L+lmxJVO
	 3t+hYa4C/gWBMFtAn9UMWg0Lu2eTi93iufSj4Ni/dlM+ebMG0nScGs1sT+6T3dznWag==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788989699;
	bh=NNweWpWe/cEI/DdSil3ESq9Pvx9MC/GcQkPWR/3LzU8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=tHMSNwgU+j/+9MNFM1cbjPON4SZLTVdRyeXJSSXAf28bw8Z2dGG+VG3YYvQnHNyfM
	 zYvGslTQBrW9uPlhLBULMfxNQ69hV2zEky/uxBAts3ZNQGqWuZxMS60E/BWOywUPNA
	 5hpBVICdfgbGQJKIAI4HwCm+nkckCuACFg7CNOlzIEEcZJlkNQt3/otR2Rfm0r6kvY
	 z6PnNVwxva42iN1StGD7SYHqtXDu0mctfvYyHDbW+9aRLKku6/lEh/gBFJRxL/WTpT
	 6g/E3jNUhVnzQEIoc8QzSZBGWSd/gLmlAteyEyF2JOJRtp1enmqiCp7yaqn2h34OaR
	 8M8MGl/dEoeYQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 53FC480F60;
	Wed,  9 Sep 2026 21:34:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F3933724
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 21:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D9D50607FD
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 21:34:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0ep951JGHGus for <buildroot@buildroot.org>;
 Wed,  9 Sep 2026 21:34:56 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org DCE0B607C4
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788989696;
 b=k91UxAo06pzyYF1f86F1ocea0X8l+3Q+hiIXMBiKElLO1LP5wnwQc6IYIojpL/Oq+NAL
 TAE7fnesWBkdYTOCReKvq1chJ64g8ULUxUNQe8ztoKdykoHSWOLlUy7jThHnZOrHy/hJE
 ogWvMm11/EufHyeONVxMVhqgDaNEkVHL+Lz2AtHNtKwzimiTf8IhyBlYD/x5SO6TyrRa9
 BR703UCWzyIPzOqsF49LRYx6xArC3t4/6hTMa+G6dEMWWJuk40nKe3Xw0p7MonkHYvKjy
 YBc3q5s5MbS/m5b8ZTMtmiLmKfdjTKfEc3MrgfzYvLPOFLevAzE6/5vBIipNYzLIwaw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788989696;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=n7EY0iCc8zAccXYWzNYcT/UQiIJDe2A7rCMpA6DEyyU=;
 b=iMPjpO1FKkurbzJrRcaaLmr+oDhqdEnyjKGHKk90GT6atYJLMHIXGdO3628606LpjSVB
 WyoXZDWnBGj7gS8HNCYZBdh2FaJjilLf6nXCbxvFV4sg84wKaRBd4C0xIM+r4wFL1295M
 xOED5UQQaxFCfmiyzMrYs1SuKNFWiBH7Gk9s6X8+gttSra7/BqeOcRC1gu6FIpMxkMbFe
 M7sIuqT+ftYF5BkK2kzlmZxwxOCeeHfAvczTkpfIAme6q+2BGmDBuXu7Unvox9K5PNJZf
 FGwTdc7uDW9951IoIUf7epa89XyWjVkHv9a2kLTBCQEOVDWSPvkDdmNvz6vMcITdruA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCE0B607C4
 for <buildroot@buildroot.org>; Wed,  9 Sep 2026 21:34:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2C4795508; Wed,  9 Sep 2026 21:33:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Sep 2026 23:18:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 271bad50ffb2d4495f4bde4d28a51e23a3571918
X-Git-Newrev: 15a422cee13237b61a200c20f2a969ffe4d1bd33
X-Patchwork-Hint: ignore
Message-Id: <20260909213353.C2C4795508@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/turbolua: security bump version to
 2.1.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/15a422cee13237b61a200c20f2a969ffe4d1bd33
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/kernelsauce/turbo/releases/tag/v2.1.5

https://github.com/kernelsauce/turbo/releases/tag/v2.1.4
Security fixes:

HTTP header injection: header values were only checked for a literal
 \r\n, so a lone \r or \n could still split a header. Now rejected on
 either character.

Transfer-Encoding requests are now rejected with 501 instead of silently
 mishandled, closing a request smuggling avenue.

A real default request body size cap (128 MB) with a 413 response,
 previously unbounded.

Secure cookie signature now binds the cookie name, so a value signed for
 one cookie can no longer be replayed under a different name.
 Verification failures return the default value instead of raising.

Constant-time comparison for the secure cookie HMAC, previously a
 timing-leaky ==.

util.secure_random_bytes reads real OS entropy (/dev/urandom,
 BCryptGenRandom on Windows) for WebSocket masks and util.rand_str,
 previously math.random.

WebSocket: unmasked client frames are rejected per RFC 6455, and
 fragmented message reassembly is capped to max_buffer_size to close a
 memory exhaustion path.

StaticFileHandler decodes the request path before the traversal check,
 closing a bypass.

Fixed a 32-byte-per-malformed-request memory leak in the C header parser
 wrapper (found via libFuzzer).

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/turbolua/turbolua.hash | 2 +-
 package/turbolua/turbolua.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/turbolua/turbolua.hash b/package/turbolua/turbolua.hash
index 12c41c6e5c..253b12e47b 100644
--- a/package/turbolua/turbolua.hash
+++ b/package/turbolua/turbolua.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  4dbfbe4919118977c2ca40a4da81054ffe407d09f38bf5420eec5ae1449299d3  turbolua-2.1.3.tar.gz
+sha256  65b602ae0638bd14405567de999ef57e8d49f0c8ebfa3561952f4ae7242e9d0c  turbolua-2.1.5.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/turbolua/turbolua.mk b/package/turbolua/turbolua.mk
index a85256a3e1..6765654afa 100644
--- a/package/turbolua/turbolua.mk
+++ b/package/turbolua/turbolua.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TURBOLUA_VERSION = 2.1.3
+TURBOLUA_VERSION = 2.1.5
 TURBOLUA_SITE = $(call github,kernelsauce,turbo,v$(TURBOLUA_VERSION))
 TURBOLUA_DEPENDENCIES = luajit
 TURBOLUA_LICENSE = Apache-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
