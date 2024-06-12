Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2844C27C77
	for <buildroot@archiver.kernel.org>; Wed, 12 Jun 2024 13:57:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8122382B1A;
	Wed, 12 Jun 2024 13:57:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5UYbs-i35ft; Wed, 12 Jun 2024 13:57:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD4A9829EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD4A9829EE;
	Wed, 12 Jun 2024 13:57:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FE1C1BF371
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 13:57:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A407081097
 for <buildroot@lists.busybox.net>; Wed, 12 Jun 2024 13:57:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Cwmz52cCIz6F for <buildroot@lists.busybox.net>;
 Wed, 12 Jun 2024 13:57:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 2360481196
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2360481196
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2360481196
 for <buildroot@busybox.net>; Wed, 12 Jun 2024 13:57:31 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.fritz.box ([82.135.81.77]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MxlzC-1scmz023vK-00wbWn; Wed, 12
 Jun 2024 15:57:28 +0200
To: buildroot@busybox.net
Date: Wed, 12 Jun 2024 15:57:24 +0200
Message-ID: <20240612135727.11811-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240612135727.11811-1-ps.report@gmx.net>
References: <20240612135727.11811-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:o66P/n2MqSg1RF/x2DWCub+IjNG7qnN/aTU7ww2QrdYmvIo80Lx
 7Df043fk9iBv2tSUmXVhVyZppifqP+ZM1eztQIcWnWeL8lhbIjbdawojzfc/UfvHU1H6sGc
 3hTq/F0uVIOLE9fs9XJv6Ua3ShqEK8i4rUuIzbMB2h4jjnsYL+BZBmSsHp0oY8G68oHeh7b
 9V9gVidaJCIcEY7yJJpig==
UI-OutboundReport: notjunk:1;M01:P0:sXgK/ur6fiI=;h0vanKogxI7CxSdNogRv0ImKovl
 TAq+ffoApuqoblPSS/b1cbva15SnyPCE9rDLrtT6nl0qdVKVhEYICXFKTqfyzLj80cRyxvqpd
 uL+DDkuYOnwn43xtkLkOlKJ4hCLAf4xE2uzciSqlP11Mn/A2yTvcAljbwFdAzmtIfHTUe0UPl
 qvT/OnnMTSfpaLa2GAkZi7MtvX05DhBPZi52z1P6JI+Xg+pMBxWPRf5lmAMm/w++O6gWGvKGr
 xEsMPEC7Ka8wsp/nvuEIY2s8kdB9svId3XmVbmZNYMUTIxb3QCoq2prPVgN469qU3do9LhNpj
 DfzWEfQjoiyDg+PagNbWHyPiExLWPeVLnC9OcysBzdkllKN0Sjtc6Vs/nKt8ongmGXn0z8QTK
 fddg37uH8xJ722rjuapTKK9zEiQKcj4BpTyQHUiU8rZKpRu8A0tID7+glL3wG6i7l5YbZoCHQ
 V5/y7Rk/MxCZnp5t14zoJ1kOS80/++5W/hN0y3afXnUV927NTMBJgEjW9b8sGBMK38Ka8XrGb
 424Fhzw/hhJR0oxcAgTEfVG1Ls1yk5qYv0+38JSEjgDkPZQB6OyRvuayYYTUR3E1mV9dJau1s
 VcE/pYxDBV7eZvWWTJky+xGBYrMhx7V3wQejcTvN0VheQfao8wgS51Sgyt+TjTImskH5Rb848
 C2VTTt0c7d/H9XbCtMSQwJF9BILHS3MpD/rcAXcbZJl/0BfUj0CK+ytqctdlJ3VcdgO8/cRxf
 zhlmkWt7++lSfdk2D4Db8IKD/9zHzHyMl6xa5j2C7aXD0Hc7sKGpYMBuULz1mJa89NhCAfcLS
 WW3P1KPvPfMQPY6Tba3MSuPbEn7lhwCHp/vdpdGFgnooE=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1718200648; x=1718805448; i=ps.report@gmx.net;
 bh=Wqu+e++/PfXT3PpgpigRNxYfPzFJlSC4k8CplhYHL3k=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=KcP5ypr3IIiu5LrTubnMs7Hjlyq8xCuxiBb6MVWGmNGO0leqhHCxOn32Mg7QnRZq
 1ZKxo4lksC9Ze1Y8Gv7gdwnr7fBvidf5TXvQ2LD7yl4pJPap0EskHWRQoaoWZlJtC
 5TjGrwiwjMbnoqQkQyg9hKvcsfwGr+SWjdSMF28hnDpwVr5kwHIlZyPbLBH+WjYk4
 G9o8SglScYb7HHRydcb11ldvKLiYLJFbVN2xJYFA09wZY5EfeaGB4aX8yP3jKbvxs
 WXq95/yJW5K0Jg54zS43xYqeTUGoxGP4WBexqE0uaWDFSJwYYYX2NlfNTYUToIscU
 vEts/25ioMnTPKGorg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=KcP5ypr3
Subject: [Buildroot] [PATCH v2 2/5] package/xz: bump version to 5.6.2
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
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Cc: Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- bump version to 5.6.2
- add BSD-0-Clause and update license file hash accordingly (see [1], [2], [3],
  [4], [5], [6], [7] and [8])

For details see [9].

[1] https://github.com/tukaani-project/xz/commit/b1ee6cf259bb49ce91abe9f622294524e37edf4c
[2] https://github.com/tukaani-project/xz/commit/689e0228baeb95232430e90d628379db89583d71
[3] https://github.com/tukaani-project/xz/commit/28ce45e38fbed4b5f54f2013e38dab47d22bf699
[4] https://github.com/tukaani-project/xz/commit/17aa2e1a796d3f758802df29afc89dcf335db567
[5] https://github.com/tukaani-project/xz/commit/bfd0c7c478e93a1911b845459549ff94587b6ea2
[6] https://github.com/tukaani-project/xz/commit/fd7faa4c338a42a6a40e854b837d285ae2e8c609
[7] https://github.com/tukaani-project/xz/commit/62733592a1cc6f0b41f46ef52e06d1a6fe1ff38a
[8] https://github.com/tukaani-project/xz/commit/6bbec3bda02bf87d24fa095074456e723589921f
[9] https://github.com/tukaani-project/xz/releases/tag/v5.6.2

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - bump version to first one after the backdoor incident
  - omit homepage URL change (reverted upstream)

Notes:
  - while searching the history, detected an previously/alterantive patch
    for the initial version bump by Julien Olivain, see
    http://lists.busybox.net/pipermail/buildroot/2024-February/371577.html
---
 package/xz/xz.hash | 8 ++++----
 package/xz/xz.mk   | 6 +++---
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/xz/xz.hash b/package/xz/xz.hash
index ff070f6775..6012e1001b 100644
--- a/package/xz/xz.hash
+++ b/package/xz/xz.hash
@@ -1,11 +1,11 @@
 # Locally calculated after checking pgp signature
-# https://github.com/tukaani-project/xz/releases/download/v5.4.7/xz-5.4.7.tar.bz2.sig
+# https://github.com/tukaani-project/xz/releases/download/v5.6.2/xz-5.6.2.tar.bz2.sig
 # using key 3690C240CE51B4670D30AD1C38EE757D69184620 Lasse Collin <lasse.collin@tukaani.org>
-
-sha256  9976ed9cd0764e962d852d7d519ee1c3a7f87aca3b86e5d021a45650ba3ecb41  xz-5.4.7.tar.bz2
+sha256  e12aa03cbd200597bd4ce11d97be2d09a6e6d39a9311ce72c91ac7deacde3171  xz-5.6.2.tar.bz2
 
 # Hash for license files
-sha256  72d7ef9c98be319fd34ce88b45203b36d5936f9c49e82bf3198ffee5e0c7d87e  COPYING
+sha256  ee3b35b82f7bb0ba5fd9f13ca34ebbe757a59c05bfde5ab9d50ff4188ed33396  COPYING
+sha256  0b01625d853911cd0e2e088dcfb743261034a091bb379246cb25a14cc4c74bf1  COPYING.0BSD
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING.GPLv2
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  COPYING.GPLv3
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LGPLv2.1
diff --git a/package/xz/xz.mk b/package/xz/xz.mk
index d5dceb0eae..10590f6be8 100644
--- a/package/xz/xz.mk
+++ b/package/xz/xz.mk
@@ -4,13 +4,13 @@
 #
 ################################################################################
 
-XZ_VERSION = 5.4.7
+XZ_VERSION = 5.6.2
 XZ_SOURCE = xz-$(XZ_VERSION).tar.bz2
 XZ_SITE = https://github.com/tukaani-project/xz/releases/download/v$(XZ_VERSION)
 XZ_INSTALL_STAGING = YES
 XZ_CONF_ENV = ac_cv_prog_cc_c99='-std=gnu99'
-XZ_LICENSE = Public Domain, GPL-2.0+, GPL-3.0+, LGPL-2.1+
-XZ_LICENSE_FILES = COPYING COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
+XZ_LICENSE = Public Domain, BSD-0-Clause, GPL-2.0+, GPL-3.0+, LGPL-2.1+
+XZ_LICENSE_FILES = COPYING COPYING.0BSD COPYING.GPLv2 COPYING.GPLv3 COPYING.LGPLv2.1
 XZ_CPE_ID_VENDOR = tukaani
 
 ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-- 
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
