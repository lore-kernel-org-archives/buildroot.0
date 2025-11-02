Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6B4FCCFA02
	for <buildroot@archiver.kernel.org>; Sun,  2 Nov 2025 10:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DB0F848B3;
	Sun,  2 Nov 2025 10:55:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eyOJdVQtxu1Y; Sun,  2 Nov 2025 10:55:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BABB3848C0
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BABB3848C0;
	Sun,  2 Nov 2025 10:55:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C6D52436
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 10:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BEF77848C0
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 10:55:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HZPMsXEyfLBn for <buildroot@buildroot.org>;
 Sun,  2 Nov 2025 10:55:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.126.130;
 helo=mout.kundenserver.de; envelope-from=paguilar@paguilar.org;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B1CB5848B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1CB5848B3
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1CB5848B3
 for <buildroot@buildroot.org>; Sun,  2 Nov 2025 10:55:41 +0000 (UTC)
X-UI-Sender-Class: 55c96926-9e95-11ee-ae09-1f7a4046a0f6
Received: from uxmal ([81.56.223.94]) by mrelayeu.kundenserver.de (mreue011
 [212.227.17.189]) with ESMTPSA (Nemesis) id 1MBUVj-1vOYCz2DXD-003gvt; Sun, 02
 Nov 2025 11:50:26 +0100
From: Pedro Aguilar <paguilar@paguilar.org>
To: buildroot@buildroot.org
Date: Sun,  2 Nov 2025 11:50:05 +0100
Message-Id: <20251102105005.109179-1-paguilar@paguilar.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:588sK6JQtdngqepuNnkOX0qAsKioN2m0epdSd/8z46w8DUMAP+R
 ArsVtXgDNjiSoqYPN1Uki33YH3Y5k3e7V0D7gBs78mej6/DEvV6xa1eFZqYsSTPm/E4/eF0
 4n00JFPt6lQHnxWBbSGPOlodaYnT5QfmeneFbqAbw5t6d3qDEwWR7ZGmuK+MUvrG4Z26ZNv
 0p7LT5nCKmAb3BQS1ZF0w==
UI-OutboundReport: notjunk:1;M01:P0:uULEUkkVsTA=;PjF2oWjJdZdhAIzaKtaBtewGom4
 0J5XdpPazGRtES13JzRVieL25+lMCjNlJ3J9yocqb4WqT/pQtVRYECtTLUexOmaJJTu8JhX8l
 //lcol6l3WNNm4YMNd0p0QikxrFJmijUGorCXpA3bFBBxRFv/HziICqobVysHx8C3/JNEh2XP
 9Ks6KTuAXntdE4pDPV69LqNaUcdX5UAv49cf6F/2CkHDVQ4rhFffYplc8PDXGo6G3lTOPwZrA
 nVxIOdnrDBlkDy2vs82IToHpjrQhVa7XrbT3WKY32AkcSS5tzucCeGWX6GjZ98vy7cYS+IaER
 8ivu/8Kb0dmqI7tsx5525QjBwXL1vr8MSGMmOg6tuS5mAfaNNrfUtFm0XACQEWF2ENQC5WiIf
 oy2A1wNU5aZ+q+rfR7qgKoJZ60hnVbyTzfD35PDtFO0V53EnK7a3RcMgIu1KIhVdC5alRKuQR
 /V05pRpklbtVr0vOu7ecfEAgEf91f//C3yXd5+3mzmR2Btn+PCp+RXH7GX5rAbDISAajBEARa
 oGTjwyQfyfbeZdHgbgG2HM0tlrN0+jmFp7wT0NAFnEboNZ+pi2iE5l0/WDNP7RUCmc+ye7nug
 M5f3OPM/BgNipFSsuF3wdkNrbP7StlT8UC56AYqtGsSRaMnjlXYVr0gb8nDx7a+0Kfp4F7VNL
 OLIlZqGIhxzShVgEekkLZYgqNCRSF/PHFG1nxfN7gBMwNEX/b3nejEyA8aZT1JwIsH7o2oIqT
 cB4lyKBgEBhggfawkDYPDD7WJ8Hq3e6D4eobX4aA43Ho2jAcjGx34bjR+y7Qx5pG/1f7gogLy
 OOfJxPUFJfiHydL1LPQkVAfRZwQp2MSO1jGA8kKo9rKwUluHqkNAQzsKZAUObfAaRvYJhcKtt
 FMpM4rxfsC6expLGH8ULM1k8OLchvvB59l34KOi5cvOcbTPykhRVMf8NP2t3d7PWc4Zi9VobK
 7qPP1id8IPTecKDA/++6lpO++xWzqYahOYu7x2E5qkU7ItD1MOK6XMBwnVCzCWzSa7oFBg971
 BCNNHqXDJg7NTt3FzRhaXiqcYRWgjdIAFhXEMDN+Z/k+s691uk7UwRFhsRLb9lDkZa9KIF1Ee
 79RmcyW6fZ9Ho7KhgU+xFQCYPLoB1YbtndcgwSa2KIsNZf9dbquHlz9BJG8Di43qvRwVtZ8HQ
 Ra4MnQgCKfMBkDfNMPzfs/APn4QXsHu0hgQ4Iz+owlECgC2qAHqEYqIsVafke5DWebI3/AYqE
 y1iheDu/YScBuK5TmVXf+yKheAbzDzA7lpHAa6nhxsr1MfOl+sUaO5nLGEuXGQInANOOp+XXV
 MfI9TVNTlM/9QlRyy6nrrYScyCaDtdMi+j8B3QZSZVVWV+Ej8NVD86B9aAHRE9udSOfw3aD4c
 TePBI4xzgwvnVlIvoZz+EmXFL+ImI+KhkRoKEPsRZ1qNg4LtFdpmHF4xERgIi/C2yGC0NA0ui
 awCVloGdwaUcZq4BisrXOEWg1j5FHnyigfRVVgMbFhhPZxWs1JHDl9Lgu2G+x49MlDUzgJ/ie
 jOC3dWdLO4ERWot0pjyCKfthhg9Qb67Wig0n1Hyv2gk7iirpwTx9PC8u6bKFOFpt7P5QPg/lK
 9agQnwI1yLxJ/ECGX6rEzIwHbw3QjPB3mUgYKB4xvz+xcNtLK43IGkHeOwOkUilyeg+avptJ5
 rzRGBswWyIFNB0KjfgVolf
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=paguilar.org; 
 s=s1-ionos; t=1762080939; x=1762685739; i=paguilar@paguilar.org;
 bh=WNXpzxJsC7NXMk1KZux4OkZtuIl4v+6mfT3GrsZ3tCM=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=xU7NBVEs63dZXgug7VissHYooRXsvDdOvB/98UQiRqNvJwd9wj6RmdAqjTkVuXNU
 K1DfRX5HUD7XPVfN1TKrruvtZzA9j3IMP8kPciaGJkPqLz3TaA4e9mYlqx1e+90zs
 aJPslxWBiabFRi19Zo/0TxOUjQlbCnX7VYiuxxbkdkrqzNTNVrxOg0/VH8UnUN63n
 quDcyy527J7g477PwOezZX7msP9+mfD7PzRI0ETU7xYlSvd9n3LP2P/N3Bb4nQ7YA
 G1zDOBnR2ZC2RyOq66t41kD0qyMcHdu43L89k5Ow8rInKgGR0I3if+a4U/BHbAe8w
 BZrroXWumB3Stp/8Dg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=paguilar.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=paguilar.org header.i=paguilar@paguilar.org
 header.a=rsa-sha256 header.s=s1-ionos header.b=xU7NBVEs
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
Cc: ju.o@free.fr, Pedro Aguilar <paguilar@paguilar.org>
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
