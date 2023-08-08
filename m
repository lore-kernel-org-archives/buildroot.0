Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1DD4C001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 18:47:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 814488206A;
	Tue,  8 Aug 2023 18:47:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 814488206A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Qju6B8_xgmXt; Tue,  8 Aug 2023 18:47:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D055282050;
	Tue,  8 Aug 2023 18:47:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D055282050
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 092B21BF330
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:47:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D674382050
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 18:47:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D674382050
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XK2w5geVR5Xu for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 18:47:53 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 905448204C
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 18:47:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 905448204C
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([89.144.222.147]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N5GDv-1pmmem443x-011BOL; Tue, 08 Aug 2023 20:47:50 +0200
From: Daniel Lang <dalang@gmx.at>
To: buildroot@buildroot.org
Date: Tue,  8 Aug 2023 20:47:35 +0200
Message-ID: <20230808184736.4245-1-dalang@gmx.at>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:cuJvkyl0roFCXx7vTZJXWwK0lCT5U0tX5rKZM1nIqQdcEJ9vCe3
 L1fyjOpu1aO/yjJcAcZ5FB9I6Kr3XwxeLjxmfMbyHTIdwrw5FeySbmgErBVPpyf9GWrf30L
 /R8vheZ6u3k+2Xmlqs93+1xbuMgA6kn8L8EqSh8WK/Y03/fztXOsjCoA6znQQgK3HFEosRK
 aiq0xQn+AzFiup9zDJYJg==
UI-OutboundReport: notjunk:1;M01:P0:bHoKY5p4xjU=;31Mv1FGVxxRzHs8r5M4YWeQLWvt
 pH7qNDzb09Y9OCCcr0NQdSADB8Oy1Lp8wac4fiQe0jsHFLZ697xENKpytsrb1gmp7bV3FKOXa
 pHIJS9dFzs3SlghL7l0wJr+8mikbvbV1m9M9DYeVxB18GOR32J0oTFA/Z86AAY4FIt6/hMN7h
 gvPRiWp5oIwJR8t+YfhisPu3chxXle10RRUe+1+a7NVdsYSuZQD9E36JDkmMPjul/n++yCtV+
 VQi/btJlSsJEfWbSHIGE2fwcMq3E4inbGgbZFmWP9ubLXs3G9ngDZF2GWr6nDhEHDuF0CtGb0
 JnmkxbHGDZja/yiwQYoavXXG0R4s6sPSU0u+NzMhVylb5pQImxpzNGl0QZ/kHbm2RYlDUkvmD
 WwwfWto5FuoVpt9IH8M773495Dpn0946hYECX8cceclZSMA9WzR0pPgYkqXKwGjwH6WZnSgui
 4YDXOrArEBDZbIbVywD5iemG1OZmfYNFTVgytv0KMF39rwm6gMW/FN6mhU73FnmJiBfuIR7Rq
 Udpf7roKOD6V8mRWD/vOF0G3hH5RbP4LT+ixNqhyMNp/82unaoBWwSmFJ3Gab2PKWKO6Ncpcm
 FcbmjmqQBuXZkzteuVrFDfsEK/kft5qCNBsjPWxxXahlw+AOcV5bqgTClotmejqiuuEayH8HJ
 dJ1Zpgu2o/sxXKXsg/Y0zKuTFL+oHhnll6MM0/V7Nxj2QpUdzsy2WNg/MEqaHPVNAxKDYe6NE
 +nGUOi/cTuOsJ7xdnJNVdEoqlTYJUWz3BCAlBgChITcF5+alZcvbzpm7YH1F9cVgw3jp47XiQ
 GuzCYRa8LjpC8hJVeQfaSPTF0k8NxsyPh8lkOTinKz3Axk64Zfeouo00xT/U0XiyZYWJu4GNA
 jMAtvOBlDzss0FvVYxO5YGYAoMQklxjU4suGESWiF4iZSWdoK16Ua75F0vIpa3U7+IwJFZLFC
 wWMu/MbKu1OJJpiSAEeJgAMluFY=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gmx.at; 
 s=s31663417; t=1691520470; x=1692125270; i=dalang@gmx.at;
 bh=uyaZJ05+ZMECnKwDl4B5QYFnAtYc9uIMcSNFODeZ2r0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=TDaMp7KdUUnTMXMbrZaX7onQHPS/xKWVeIq9lFuhI2h19ppTW9hf3R1cLWgiqHvsGm6HSb+
 OaPPDYJ4nYFYVwIaEl4Q6fKOTsLR26Eaxky3EsC/7VPGj7vsoxxa2iBONc72sYRBOHBdMCgcN
 E5TPrUg0N+h0pxG/WWMDDNBq4Y4cIDBjFk25m7tLEwYD5Lml9iLd9IFVwEdV6ZRoOgbEHJFLT
 XlDsgxGosjPlIZATxfO+UwxLoIkuGU+nUl5+bVk+WykQkNKonCzBwoZxAOjLgNHarOns7vLWP
 pfQruropENYEzWKeJzRkCRr2SgdfLoogzRZO9c0qS33fOPjXRtBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.at header.i=dalang@gmx.at
 header.a=rsa-sha256 header.s=s31663417 header.b=TDaMp7Kd
Subject: [Buildroot] [PATCH] package/libcoap: add CPE ID
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Joris Lijssens <joris.lijssens@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

libcoap:libcoap is a valid CPE ID:
https://nvd.nist.gov/products/cpe/detail/FA3B1D63-B4E6-4EAD-A2C9-CE4E52D83E37?namingFormat=2.3&orderBy=CPEURI&keyword=libcoap&status=FINAL

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/libcoap/libcoap.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libcoap/libcoap.mk b/package/libcoap/libcoap.mk
index c0a941a0c8..4b536d8117 100644
--- a/package/libcoap/libcoap.mk
+++ b/package/libcoap/libcoap.mk
@@ -9,6 +9,7 @@ LIBCOAP_SITE = $(call github,obgm,libcoap,v$(LIBCOAP_VERSION))
 LIBCOAP_INSTALL_STAGING = YES
 LIBCOAP_LICENSE = BSD-2-Clause
 LIBCOAP_LICENSE_FILES = COPYING LICENSE
+LIBCOAP_CPE_ID_VENDOR = libcoap
 LIBCOAP_DEPENDENCIES = host-pkgconf
 LIBCOAP_CONF_OPTS = \
 	--disable-examples --disable-examples-source --without-tinydtls
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
