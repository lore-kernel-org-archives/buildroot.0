Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672F6CCD185
	for <buildroot@archiver.kernel.org>; Wed, 15 Oct 2025 17:28:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10EE184371;
	Wed, 15 Oct 2025 17:28:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1sAeTid6KpZ3; Wed, 15 Oct 2025 17:28:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 179F984372
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 179F984372;
	Wed, 15 Oct 2025 17:28:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id B74461BA
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 17:28:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A28C84372
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 17:28:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c-zSIkhDm9DX for <buildroot@buildroot.org>;
 Wed, 15 Oct 2025 17:28:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.10;
 helo=mout.kundenserver.de; envelope-from=paguilar@paguilar.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C042584371
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C042584371
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C042584371
 for <buildroot@buildroot.org>; Wed, 15 Oct 2025 17:28:33 +0000 (UTC)
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from uxmal ([81.56.223.94]) by mrelayeu.kundenserver.de (mreue108
 [212.227.17.173]) with ESMTPSA (Nemesis) id 1MMoT4-1uqJzf0kMu-00SUwy; Wed, 15
 Oct 2025 19:28:31 +0200
From: Pedro Aguilar <paguilar@paguilar.org>
To: buildroot@buildroot.org
Cc: Pedro Aguilar <paguilar@paguilar.org>
Date: Wed, 15 Oct 2025 19:27:54 +0200
Message-Id: <20251015172754.11737-1-paguilar@paguilar.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:4/Bz0ftlxthAqNrQmxvBzGWHaKx/HnDwovptFDR6CHAH5z2BX4M
 JV2FX3yw7d5fb8XwM2ZuTAsvBiyeh54kn2p95GUA1Si3br7i0bnbispuiHpjf69QRP6xa/5
 5Q6uf6m6k0PpNTL3utqkyrkIrI0+yrGw+n8CAoo+hmW+/dWVNw9TLvBHy6VlzxPe1bRr8Vy
 ACaSa9ZzlJtUK1a5cT3ag==
UI-OutboundReport: notjunk:1;M01:P0:PQSOUxP7RME=;p22Ywabr03adOjNy/kWq8G7zpK5
 UIqI+y6s/t354yB6DSNuxnEls9mvfvI3faZ+oseNNYP+Gt0FsQc7+BUul5cfaSUw2d5lGI1Gj
 a7rOP4fJhA81euejLviXi+htLm6k9gc6TtvdCgV6augCeZ1F6ex6816Z+J6sHGgP2haXBQIn0
 pm3fEU5n0xiqmNrPPWuMGtLRGlmMmp3RIxn8ewvInaWXmpfF3kkhKWHIkeSt1U82LRknVYDt+
 W11qhtq+hh8CUIcKue2QEHNwMBEHeZhyKLAzTCvv0pJtSr/ndtBWKiqRFOpVYnwv4QMypXhAE
 DXCzuNaDrdf7l81Y6aoGlrcRWhlmOn0/ruevCnDsP6/rYX6ABPEsDXa0bsLpqrqoTeKsGXr++
 DidoN/XUZwB6vv40C29WHZILQdO2mzL3MhWxg+U8/WMMj2fGJ2c3g5cQzl5/PY1owUP/q2mHi
 j6qwhqg/AzqCjHGjBLHYHimqkJshZSAVm3YJIeHFM0ZnHNUbXX1uuzwZjzh7F0h4pzgj0JhgW
 bg8RI21kyVw5V5Hykg3KArLwKROaVP+DosGJb7WTtrn3W/qyZ2l7DQfsGS7UejyFoTbKY6Hw5
 n+PYWcb2rZeivoRBB04ns6ehP9J3EnaHBrmOuI9rwfQLNP8oceWG1C2SV4cPK15/Yp4H6BrjB
 DEnYeBiXTWBWzpVZOSSyuHDwy/q6BwJBopX1baXWwWJgrIgLHaUGsPAoFgwgO2PF3mK70EMKy
 j9c6H6mg7KqFs2x7tZLZQ6PRtRI0mpwDf4cXGvxJalMa55KLQseTYZ3PXuzLQ/PHqD6fM47sY
 n67yJwNMVbYTsQMQKnqmSVMM2bHADoj3W+aVjmjKJ9mW5SmSu2ESBgrP02jGY8bjWcNF+fOkW
 uLOoByr+2Tv0/g7vlIgNULc7NLpMN1pSgyrXg9x1utc8zE4dqGvMFosOR9gqtKucFCeOjmrpk
 tZHVMQyetF+Z6ADPmQRcb+gUE8APBMkw40RbswvZNjwdRZ9CW3J6s5jYvKNiAUjcUOHbdJLTC
 Avdkhtxpbzo2zGYVGi2gFR3EmDIYIgUg9kGyC924vw2NygT6Hn7L1O4QGakC6iG2ALYN4mnSw
 Q3KwL90ifTg8Ppp0lw4T57+p2NLCVMXLNcjcgcZak78mjYpf2+8QaKi45paQYsEuMhBtM9ovK
 p38DD07iI67dHx1ief0UL7z/PUfVN9blTuqfYuoXe+4fnjTlN7vIILkhppiXD4ticddQquvIC
 8lvAT63Q2lRFurcTREMEHKs4D3msG3sUefe+73QPR+RqQHN8ygCK7NBc9gNC1wvTFfrwB0Lcl
 8xFYHIAZ+aASjdFM+ciq0BzWhZf4fnFceRMNDVeUdrFBhfAGz19S21n4gyfaIN42/ztSFK2/T
 2Thyg1rxpXbcDhMHA1D3qqY+5s4FhVaUJz1amYFc1tkUqcyhuPIE8o1e8vnmUBUAAgJLUDWXo
 qmIbjDA4YSys8ygj1sYbHoKLsGbg+tKxnK9OOZxHxdsAGjDrajMyNHjk3yS0wXqZBgibjNQdp
 GPOZ1V4aMDvOluW48lu2dFUhGiHcQtHrSkK5ZHozqIOjmweGIiW0hYpNhEp4T4iEHyFhCrOIY
 zLPNDdu15yCZBI0PwqsMU4WmXt4K7RjJGtlyjjWrpPzQhJU3vzAbzXZ9D73ogZjJmZSzeXUxh
 EzWGKVMRme0a0IvaMNX+EVz6P2IWdosoYTYCyypHSUVoj8YIIS0Wpi2v0jZRKerpk=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paguilar.org; 
 s=s1-ionos; t=1760549311; x=1761154111; i=paguilar@paguilar.org;
 bh=WNXpzxJsC7NXMk1KZux4OkZtuIl4v+6mfT3GrsZ3tCM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=lnZfis9wgM8wi71YGqqC+xzRJRYV7i99noIWkQEXPqdjJ+QJ6q1SJp83kVS4ObkQ
 Furf84gfBY2ii0bfYcdyUYb2WmKsgZpn1SlDkdb1P1O0k/qrrHCKGs4YPINK+Ps9s
 bXuO40DGN8Q8twyDlZensgoiv+Y8fLvjMZ1lwPbGnQqv1VbBoSJMkALJHlWfmwB2B
 PDTR5QEOBEYHVfIlbXVhJxzUMhWwNovilxv5ubulNO5nuUzpIKz04BSkxF50og4Ky
 WAY2hwqngSGnW17MrTMcaBDDu9PLoGag9x6NAUJk0mxFgUOKuNZZUMMIHJ08y3Z5U
 OL+WCbbmoPdM9/9aEw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=paguilar.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=paguilar.org header.i=paguilar@paguilar.org
 header.a=rsa-sha256 header.s=s1-ionos header.b=lnZfis9w
Subject: [Buildroot] [PATCH 1/1] packages/libunistring: bump to version 1.4.1
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://savannah.gnu.org/projects/libunistring/

Signed-off-by: Pedro Aguilar <paguilar@paguilar.org>
---
 package/libunistring/libunistring.hash | 6 +++---
 package/libunistring/libunistring.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libunistring/libunistring.hash b/package/libunistring/libunistring.hash
index e7fbc85414..f86b6f94b0 100644
--- a/package/libunistring/libunistring.hash
+++ b/package/libunistring/libunistring.hash
@@ -1,6 +1,6 @@
 # Locally calculated after checking pgp signature
-# https://ftp.gnu.org/gnu/libunistring/libunistring-1.3.tar.xz.sig
-sha256  f245786c831d25150f3dfb4317cda1acc5e3f79a5da4ad073ddca58886569527  libunistring-1.3.tar.xz
+# https://ftp.gnu.org/gnu/libunistring/libunistring-1.4.1.tar.xz.sig
+sha256  67d88430892527861903788868c77802a217b0959990f7449f2976126a307763  libunistring-1.4.1.tar.xz
 # Locally calculated
-sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING
+sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING
 sha256  a853c2ffec17057872340eee242ae4d96cbf2b520ae27d903e1b2fef1a5f9d1c  COPYING.LIB
diff --git a/package/libunistring/libunistring.mk b/package/libunistring/libunistring.mk
index fc785c28a5..1abbfde6da 100644
--- a/package/libunistring/libunistring.mk
+++ b/package/libunistring/libunistring.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBUNISTRING_VERSION = 1.3
+LIBUNISTRING_VERSION = 1.4.1
 LIBUNISTRING_SITE = $(BR2_GNU_MIRROR)/libunistring
 LIBUNISTRING_SOURCE = libunistring-$(LIBUNISTRING_VERSION).tar.xz
 LIBUNISTRING_INSTALL_STAGING = YES
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
