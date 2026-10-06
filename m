Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95314CA6001
	for <buildroot@archiver.kernel.org>; Tue,  6 Oct 2026 16:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C86A407E4;
	Tue,  6 Oct 2026 16:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dCVMZ92Pzbh7; Tue,  6 Oct 2026 16:39:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4CD3D407DA
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791304764;
	b=MXnzm21hNdOGpYhVQvOvPuwnjHyjhz/xFbnpDxU/A44wHVBnJNcNY/6j5Gik2j1DIaok
	 d1f7r10r5TTLRk3IpaJWSj6FP+4GwPf/D0esSc8GTyPaYzskjLV7NEgmjrmaTPlh/QsFL
	 aDi7+FYKVbBzisa3M0pxRSRGtGIWtg6W3XPytor3xaj6OA10LRb5GAnYihFUFKrrLE6eq
	 zCPfdkMRxnDzSR+wQF6ITXdkvqnwUHKoF5cECAPia/m1e5Zg6c8SKBmNCAByKX+3i513e
	 QEDY1IcK7rjpIK57IcHTPlqe1GeP3pAIaa5nuAKnv/KNdYqCuOGWa3rV4goZgrb3pOA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791304764;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=haOtkK3FWovw/zGPh1bEPEtKImiHJAXti/heeUK8w8k=;
	b=GruDRKRFogiRDYd9MAnlHpnOw+MC5fq2UG11VucVsIbFBmLxPJZ+O20XmuOvy7pf4GGL
	 JjRYwlM0vXocaXQ2flQSvkVFuaVJY2oUfFH1jpa+jRP2YaMDIvYkeYJr/jEtEHoxpaw1J
	 GCP+xjPSrpG086cU3OZQ96L+RhVJ1HBkeSDMe9J0NdpmFQLPNWDIkDUtwUqO1owHheAva
	 lMLyeuxQV5ZOKDh4yr1dk+cn7v8ILRR6LfTDQpkjPGK155Fr9tuv0r/6pJDJZ9A1QpKOm
	 Urc5U5eyvxC52mRdoAsAKm7yVAfgXxjHXcpa5hgQdVl6DbvLKHClHBzHLj0oa/YYoKA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791304764;
	bh=haOtkK3FWovw/zGPh1bEPEtKImiHJAXti/heeUK8w8k=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=gwgvHetAImeQkbJbQVWE4Fcrd95CBiBzNHGE116Ga1gGWgupnKNzrhDj1znKfVLGS
	 TureyuuG7riA1q7Nch8MO6NJdu2r+vrI/0fpEj17vubeDPGUML2cvEt9l+N8GI/bEL
	 ErE9Vx7v9lnIEDBrBHjGIgNTCzZ/JfpmMAyftJA5KzTpT2dSgPS/bD94/61UldiI0b
	 t+cydLi5bDNBsMyeXINarpCJFLvu67gGMoOwEdF2tv/WSsZ+U8mJV5eL2cJfmsatY5
	 McLcOxsOZhv9gRW1PEU4bgPlpfwR8A535kde8aKuswYBwhrymA0JkKfI4RBzhWTX0K
	 1UJXr1M+L7Fow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4CD3D407DA;
	Tue,  6 Oct 2026 16:39:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id F1D9134E
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D0476402B9
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:35:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aaNBa6fgxqEu for <buildroot@buildroot.org>;
 Tue,  6 Oct 2026 16:35:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 02475402AF
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791304527;
 b=iGGi4EB9h/lOofjrUg2vQe+kcrT2cZNhL7m/augTtkH/wMVGIl6OO3KG2AyWABxyIrb6
 rytoFKvbapC63xyYOeOwZBfPKDNAM5v/u4W66Y9HyWessPi9jLDIW9lXOlYty4XOrtkS5
 VhDOSVamL5smYWwHd+/S8jKbBLFxt/4F7FDKmH/uGDrKAwCRHjfoU4GgaQQoRcYn41FZp
 Cl6pOTqiP0GVL6dcri4mj0VErdw7G3+eEquu1JfZzMMNbdaVqI6xWbxQHW9e5Ybw52NtS
 qcqZp3wG2Zgj8/86VHJklF8Ap7vZB4JVAk4MdfSbanh/QLJgNp+jUvTJsPkFDfQn5Fg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791304527;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=WI76P+OfaCW7gEb8BS14XCtVjh+eO41koRx60yvPwRY=;
 b=IJI8BgF2T6E6/bzKloK8rmk8xLB4u4+ioyJIPtJ+jKB4oXZCE6CHQREMfZmE/hsYQnzF
 LbWyo1S/8WRVj0gLwMQBJZToTcV2vb5Dy32QiaB8+IaWw2ZJGCZ6Difh7JiGpnbEWpZ/G
 lnKJGsFgWuhRYmPHW2GOce7GA624Zo5ghI8XtHkJ/lEW9BE+QT5y1x2zEZyqRowKvjGNN
 18q4PCwKCoDxvQUM9kK2yF41hGlu/qzvjAO8bfcY+BAvnR4gLUDIFhen7UNHHJOAKBoCz
 mLhxL1bs++NfjCNs6m/MFgeQVP3sGSW8eVadQgc4cQH/EtPqtxFYkStOrJS3x9XuREw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jyOOfPuj; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jyOOfPuj
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 02475402AF
 for <buildroot@buildroot.org>; Tue,  6 Oct 2026 16:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791303712;
 bh=WI76P+OfaCW7gEb8BS14XCtVjh+eO41koRx60yvPwRY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jyOOfPuj51hb7LeU5SHyCXwoRW+TVyo4snTAvSZ8CfeNgDxp9mq1uQdkCX1oPtSse
 pAQv4JEvbZhgYp3WmvZiFP+/oteqpKbmMxDqRPVTGJtCyJkxNOWYHsprdxAwzYzWdR
 TRNTGQ7H3eMaQihcDOINavQabd9e9UWlogMhRwXZYo/tQXfbUFox4xUHQv0spLxvfB
 V7J2E4MM/xbGh8o0G20o5xabrONsVtzEZyVwlba/fqppxTuhEv5e+TgwkblLDDxNf4
 8JqLdBW7Ag7JLSg1QVJf/+KoRAnoq48ypqlgdkKTmRnPfEkZ7v4HWmpHtdgcnaT0U3
 pXi0TTZfktIRA==
X-KAS-Sym: v3:f51bdf72230551df:UVRrC5WRPqTrQZ2snRs6ADaGTIs1fNMELseztNLkGZaoG
 nDVoIWJAJHxWOAZfar7ySv6hURHCYEJ486jY0wSzH4bn6X9oZtMeJOWXJWfbXQl4RiwCyrj/m57
 15sQ0uumxbq4Ni0Jg8upgOj44d4LDRY4qAHg+axEDZVbYP0g0yE2r2HU5OlzQlUaGimeYmMwhfI
 C2XbfRi5reOEXID85lh2h/YKBFEVYOpWHl87Xd6mrYgK6QCyW0YmzXJKF3rsfBDAdGW7GiuVnBc
 u7jtTtCWAX8A4fqyTLJm9T3xE0yk3CafN3r54xhVAFfUDD2DDyyj4LyhMirWwrBiHdxCKemg==:
 L07mLU89wKiBDYHd+CB45gG6xeTrARPOYStwxcnJIke9+Z/atmthfJKNeIc9phSRxJFBKRldkbf
 p0uC5pZl6o/mp2l9kP2uptKuKiN+jzckbcuJwiRnE1v2QHeccr0fJO8fy27qQQPMmNXsgIiKxOf
 MrTzk/c6xsIk25CC70Th8wj6PITPreamejOwGRjZd4lxIIasObYii7ou/7rJGqWgoyDUTM4EZQL
 nn3wG8BKsPyPUYhaXmRLC7UH/0BLVuWbY6GniCxQcaFsiiDXPwacyOI3sCCLXnSKZhf/+Kqaf9t
 BPP0n2ClxZeJotrPBKuH6CcTjnWKpFFGYmDC2QcTzYpamCP9DqKZr3wBwH4k3HesJLDAwc49qZi
 JYvnDRSbDLB0L++RGeqrn4ccoUAbFfZJNSib+4R12kXxH56fgyxORKjPz4IBUTODFa/yA4eL5QG
 g6W5tmeUpmxtuKqV4O7B61SYq+8G8jgyzixPO8Q5d8O97sIHUsdMqgbKI43b0OXMQl50Aos9tqV
 HJRTnVZwhzRuumCe3DdVSh1ryhKsKMXCQlU7NpFY0FOWawf/g75lL5IcsOTThcBUkxQGeo2NC1l
 YFuLIy0gSNvLNqNkEH3EgYtIoPsGUSxTGIr2+XpO7JzvYkNWM6Paa74eR+ESfRBf
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0965FA4C5552;
 Tue,  6 Oct 2026 18:21:52 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58872)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xE7um-000000000ir-2bqj;
 Tue, 06 Oct 2026 16:21:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Daniel Price <daniel.price@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>
Date: Tue,  6 Oct 2026 18:20:26 +0200
Message-ID: <20261006162106.3439373-46-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261006162106.3439373-1-bernd@kuhls.net>
References: <20261006162106.3439373-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH v8 45/84] package/redis: Fix build with OpenSSL
 4.0.0
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

tls.c:676:5: error: 'X509_NAME_get_text_by_NID' is deprecated: Since OpenSSL 4.0 [-Werror=deprecated-declarations]
  676 |     int len = X509_NAME_get_text_by_NID(subject, nid, buf, sizeof(buf));
      |     ^~~
In file included from ../../../per-package/redis/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/openssl/ssl.h:34,
                 from tls.c:22:
../../../per-package/redis/host/x86_64-buildroot-linux-gnu/sysroot/usr/include/openssl/x509.h:1041:27: note: declared here
 1041 | OSSL_DEPRECATEDIN_4_0 int X509_NAME_get_text_by_NID(const X509_NAME *name,
      |                           ^~~~~~~~~~~~~~~~~~~~~~~~~
cc1: some warnings being treated as errors

Upstream PR exists to fix the build problem:
https://github.com/redis/redis/pull/15227

Added buildroot-specific patch to remove -Werror=deprecated-declarations
from CFLAGS to not block the bump of OpenSSL to 4.0.3.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Daniel Price <daniel.price@gmail.com>
Cc: Titouan Christophe <titouan.christophe@mind.be>
---
 ...emove-Werror-deprecated-declarations.patch | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 package/redis/0004-Remove-Werror-deprecated-declarations.patch

diff --git a/package/redis/0004-Remove-Werror-deprecated-declarations.patch b/package/redis/0004-Remove-Werror-deprecated-declarations.patch
new file mode 100644
index 0000000000..3c33456d52
--- /dev/null
+++ b/package/redis/0004-Remove-Werror-deprecated-declarations.patch
@@ -0,0 +1,28 @@
+From b42c0326b542b0e5d29cbfef2ab08d0d36430803 Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd@kuhls.net>
+Date: Thu, 17 Sep 2026 23:58:19 +0200
+Subject: [PATCH] Remove -Werror=deprecated-declarations
+
+Upstream: not applicable
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ src/Makefile | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/Makefile b/src/Makefile
+index 205508596..4f31a3af0 100644
+--- a/src/Makefile
++++ b/src/Makefile
+@@ -52,7 +52,7 @@ ifneq (,$(findstring FreeBSD,$(uname_S)))
+   STD+=-Wno-c11-extensions
+ endif
+ endif
+-WARN=-Wall -W -Wno-missing-field-initializers -Werror=deprecated-declarations -Wstrict-prototypes
++WARN=-Wall -W -Wno-missing-field-initializers -Wstrict-prototypes
+ OPT=$(OPTIMIZATION)
+ 
+ SKIP_VEC_SETS?=no
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
