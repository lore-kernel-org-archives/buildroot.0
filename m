Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56639C982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C39960613;
	Sun, 20 Sep 2026 14:17:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iG3LKUwlij-Z; Sun, 20 Sep 2026 14:17:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org 23B6860639
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789913823;
	b=oQHn4qJO+Whf95KQ8E79M512cAvXXddU5r2URmOpG/mBf3yE2hwo7LNEC99KpN+YQHiM
	 8K5ZPARo91ecGJGX2lNBhMb25KgfB5qHOnAQdD8NBq+VIgwSZZ+YqNyiNvzHAhoS6Qe6A
	 twiXLBt3D3rONXIKvmbwZEFBwmIJYTG42tvZyTrwUdAd0BSt06Iy25ZKBJjPR1V55un7e
	 xMBZ0U65F6dUiIlXS1kQy8D/of947PZVD0j+dZ+t3JvlSMRJm3ltAs3EmBjTBYDxVc5mz
	 DLY57ynWmY2UHZgax/wxulPXeL6n8TPpDdlktdeD7aWaZX9R5HAdtLowVKF2CLYp0ag==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789913823;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WJzF32aQ1RMys9fT+vk0JJoYyJ/7s3OHnmc8AP32+1c=;
	b=XeK9dvwSsMKe8d8gBSllSgVMPGAn9djJG+CVSndTvO3VGwSn1dV5XdTkXyA7r71Of1Ht
	 FEJocKhC6ke88oekq67IxSeA2a7qYkS1R8PA6nVL/2AR9x9h5Lj3KsD9F1XOsFeClqR+j
	 amx72l/lqVn+kZfhyhK1XebaAY8d2YYDlrzj/ckT8FvAx7nefslsMNvKuncuv9LiRXVZR
	 puITgkZcYvRfffFQuIDXCbf5I45W9bx8rG9HjWfaRrw9kXPNhoMZog1dHZ9YqWVKszatg
	 vYVcTJtfuCt/k/fcAJcuUKevvvMKRMoJWnrthOQ10uaW1ZRNcRISj6/+piDfHybNjrg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789913823;
	bh=WJzF32aQ1RMys9fT+vk0JJoYyJ/7s3OHnmc8AP32+1c=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=czZcxLngmFL51zX/jVW23aOTKceQn9j1Sps0K8T8DXlOJ+pLLjArCTAw0fJJdsRxh
	 kaaVvuct1oKe5G0E0FWjHWBlT7tM95SbuUw3r3xhBl/lEQ/n/5bArVfwUzjG96BUm5
	 PlK6HQo2LjUABAft4cW+gxhixx8AQ4Nu2q2BkaWxjeoqqElyS3bjviK07XdqTgJT1S
	 0aJE9/B10m0EQgUqJFm7bFhm/pLqC1qA9XLEMwkZZhGWEp+nVchD5kcVdu1pLL6nlk
	 Q64ggra1Dq9LJEtCbmAz9JDdc2X4ODVNRDGrCziUYiWe8ev0glAbmdv+U7K9uU/g0y
	 wClZMF9WmdybA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23B6860639;
	Sun, 20 Sep 2026 14:17:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B1628392
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:17:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A301840E2C
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:17:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id th8m8DL0rBzj for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:17:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 4251840DCD
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789913820;
 b=ZDTy4SBCbkLo0vxwgRBQzip2dwg0z3S0zRUyKKT3nbmBvuKGNcAxd6Zx2ft3DgjfIXsm
 PXlZLvHiQ7fEyN/x2fsh5KTNOSCP/R9bem12PP/DBCTQ8xk+fXmqNFB3Krfcy77iLe+q2
 N1KlYVtBkGNAazsEWqve9jc6DP4SWGZR3awJ9NyUV6Ep2RJXmUMoiUsqGO4BGEA1zgaRr
 EUTmuYImH2x/6OW8a65tVQ5tP/gyvCJww3NoRip7CYuZJAKB7sPn3X1yAGajfkjUzh3Tr
 KjJzozvGnHCnnHEl0gjgaxkacZ0PKqih4OSqVVTXkqg7/5I9GajvzpQvXVaxwOgy//g==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789913820;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=0Gt9QeeoKRBd/HmqYihaOYSmW8EEm7wN5WmmlIkHDmw=;
 b=Gdmxgz8AJmc7vqig2aawAyvNV1vP3aMzIVwQIsXjgQWGjW22YQ/vVe4LL2zQnGnBpUec
 uF8JYxb934nto1VC3isqFhZ6BNNe2BTa+4LvMGEAL0IpORLn6EEgUxoc+Iu5tXgjfU97Z
 76kEV351V7zQF2+QOQYZ1VFFgCd7AgE4+hq6YndNEplaZMZh0oisqqLHxOA/fkEbFbGTF
 FyqPvV5ORqATMNetJrCrh9oMbRoNGihdYpVFaK4ALS4xvW9/8G06KvozEf0lb2Vk/Zbn1
 2mZQzlGcx0l3Rv+LU14CcX6BJ8wODTLgt15WbZJgA+erjsO5bwm8Vi64lCOgUeUrIbA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=jnvT+MVG; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=jnvT+MVG
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4251840DCD
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789913241;
 bh=0Gt9QeeoKRBd/HmqYihaOYSmW8EEm7wN5WmmlIkHDmw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jnvT+MVGBmGgJ0UxtxgCQoWC4AB1s7+JamWl4a1CZaz/lY8D3eurL+DJxHVqAKEvt
 VSvBYILRFDw/FKYi33uRXOaCOuQxCu9K++xmtD5OwyK2Uu5RP8dXHYCRPnkoTCxD34
 kgxACll1pfuzKbyBVQlGvK7PhvdMEXRtl/8fjUvbGWYKfj84xrvU5XmI1DwnuURXAA
 D6ZuXhLIejfrZ+AZfciG9ZILTp1LYPo7hYvKOV7ztZa25X4SaxjPPM5XVByWSIRH40
 amZBpfG+rU7ZLNs7RbZ3imDDhKpqUOTn2Xj/wCHy7jRZeALYyAFxlFXJMNfQSjMX1F
 RodF8WWZHZKow==
X-KAS-Sym: v3:f51bdf72230551df:kLsnpyO7xBQrienfp2HUkZLPIhoTWu0/2yOhSoEwU9REifldITt5uV1ZdfMxSIXWRKvTv9N0MZy0diMQpN0glcVgMpe+EHt4b9SSwIYdetNWrA3E4NHKWfeZ/Yj39hsXFoGsOc8DrIkTkE1cC8EDIzHMfql9Fk3+lmPjxillh8Rm13WqHm12wYfkg5zOONe3wQt1e4nql+laa117tthJT7FrH8LMc8sT6Y5hh1ZURpz+CgjkohF28/JMh91Xek4Jjzq7nWhnLLJK+IRHJUgBaWAXDGJyfMy5p24uZes2P0HVy2Hp1VIUhvBjLxL0/3h3AKkiBTMMXv2yTZN4hJ68hw==:KNqvhkZTcFGxszrwnPu0ulDS+rGiGKaE+5AuNWBhPYmZQZUVhwgxuxXb/AVhShbmQPrV1Q6PGcdaun96NQShqgNeXupYsr3n6KHnrEXeSwzIv+eyxXGMsjSLqvdry1v7HXKwjcSBsHOfbRSJDT7o7uTLyTfHvb7Aa6NhSPP6DW6ub36G4B67FQlHhIVMkJ3q55fdCg8XpZlM0HRyeBbFsCW37rE30xli3HuJ6gEGWdElyH9pO56spWJcMpObMfgyYgA6a8V10XlKcsf0EEglo4KxSEf8GG1C1jtvkV1a9KjgdG0N/EpaLtpztgNGReZfYeFx3Cmu3Rl1mnlMJrjJDh13FI2eHXJ/T4b7+es0h/wVf1CH9u70kck7av0Uy620Mpyhl8BCDk8aEcw8S8M9OupDW5CkR0TRLswdZzb3xKrirOjc78gdV/ub98vcZy2JGZP/YAGAaKhOZVYcHcH/4EeHUr0ut0ZvPDvXd/Gg7ImINr53gCqqH/5E9wNK2mkYCZcgOpyhpneLME2ctJdZkXqR+AhaiAUE0a2WSifFzM2Z/4qDsO+jS6f2vQjjZtUGw/Ue3YEyWIy/yPdonw2/WYsYge0zSiPNKFWkW6gLmY2VuT
 RQGP2C4o0kCKKELtdnYNtwLCXwCAkdmzNk0CfaQ0aUoFo2joISPLSJxEtxs7qCpmE3YQVWeCOQ
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 107E5A4C4882;
 Sun, 20 Sep 2026 16:07:21 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39216)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8IBK-000000002J9-2btD;
 Sun, 20 Sep 2026 14:06:14 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:05:39 +0200
Message-ID: <20260920140605.3005461-42-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920140605.3005461-1-bernd@kuhls.net>
References: <20260920140605.3005461-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
Subject: [Buildroot] [PATCH v3 41/66] package/mtd: Fix build with OpenSSL
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Marcin Bis <marcin@bis.org.pl>, Robert Rose <robertroyrose@gmail.com>,
 Yair Ben Avraham <yairba@protonmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 =?UTF-8?q?C=C3=A9dric=20Ch=C3=A9pied?= <cedric.chepied@gmail.com>,
 Heiko Thiery <heiko.thiery@gmail.com>,
 Philipp Richter <richterphilipp.pops@gmail.com>,
 Titouan Christophe <titouan.christophe@mind.be>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Joris Lijssens <joris.lijssens@gmail.com>,
 Thomas Devoogdt <thomas@devoogdt.com>, Romain Naour <romain.naour@gmail.com>,
 Roy Kollen Svendsen <roykollensvendsen@gmail.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 =?UTF-8?q?No=C3=A9=20Rubinstein?= <noe.rubinstein@gmail.com>,
 Norbert Lange <nolange79@gmail.com>, Jesse Van Gavere <jesseevg@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, David GOUARIN <dgouarin@gmail.com>,
 Andrey Yurovsky <yurovsky@gmail.com>,
 =?UTF-8?q?Andr=C3=A9=20Zwing?= <nerv@dawncrow.de>,
 Daniel Price <daniel.price@gmail.com>, Christian Hitz <christian@klarinett.li>,
 Gregory Dymarek <gregd72002@gmail.com>, Stefan Ott <stefan@ott.net>,
 Baxiche Su <baxiche@gmail.com>,
 Philippe Reynes <philippe.reynes@softathome.com>,
 Sen Hastings <sen@hastings.org>,
 Fabrice Fontaine <fabrice.fontaine@orange.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Karoly Kasza <kaszak@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...t-compile-engine-support-if-not-avai.patch | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 package/mtd/0001-ubifs-utils-Don-t-compile-engine-support-if-not-avai.patch

diff --git a/package/mtd/0001-ubifs-utils-Don-t-compile-engine-support-if-not-avai.patch b/package/mtd/0001-ubifs-utils-Don-t-compile-engine-support-if-not-avai.patch
new file mode 100644
index 0000000000..21fc2ca2fd
--- /dev/null
+++ b/package/mtd/0001-ubifs-utils-Don-t-compile-engine-support-if-not-avai.patch
@@ -0,0 +1,62 @@
+From 50136f0ec6d8c9763889d49b31ca6965189afba5 Mon Sep 17 00:00:00 2001
+From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+Date: Sat, 29 Aug 2026 19:25:02 +0200
+Subject: [PATCH] ubifs-utils: Don't compile engine support if not available
+
+OpenSSL 4.0 dropped engine support which was deprecated since 3.0. The
+replacement is the "providers" API.
+
+Add an ifndef OPENSSL_NO_ENGINE around the engine code so it can be left
+out where it is not supported.
+
+Signed-off-by: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
+
+Upstream: https://lists.infradead.org/pipermail/linux-mtd/2026-August/114868.html
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ ubifs-utils/common/sign.c | 10 +++++++++-
+ 1 file changed, 9 insertions(+), 1 deletion(-)
+
+diff --git a/ubifs-utils/common/sign.c b/ubifs-utils/common/sign.c
+index 032a6ac..5f94c0a 100644
+--- a/ubifs-utils/common/sign.c
++++ b/ubifs-utils/common/sign.c
+@@ -23,11 +23,14 @@
+ #include <openssl/bio.h>
+ #include <openssl/pem.h>
+ #include <openssl/err.h>
+-#include <openssl/engine.h>
+ #include <openssl/cms.h>
+ #include <openssl/conf.h>
+ #include <err.h>
+ 
++#ifndef OPENSSL_NO_ENGINE
++#include <openssl/engine.h>
++#endif
++
+ #include "linux_types.h"
+ #include "sign.h"
+ #include "ubifs.h"
+@@ -139,6 +142,7 @@ static EVP_PKEY *read_private_key(const char *private_key_name, X509 **cert)
+ 	*cert = NULL;
+ 
+ 	if (!strncmp(private_key_name, "pkcs11:", 7)) {
++#ifndef OPENSSL_NO_ENGINE
+ 		ENGINE *e;
+ 		struct {
+ 			const char *url;
+@@ -177,6 +181,10 @@ static EVP_PKEY *read_private_key(const char *private_key_name, X509 **cert)
+ 		}
+ 		*cert = parms.cert;
+ 		fprintf(stderr, "Using cert %p\n", *cert);
++#else
++		ssl_err_msg("PKCS#11 ENGINE support not available.");
++		return NULL;
++#endif
+ 	} else {
+ 		BIO *b;
+ 
+-- 
+2.47.3
+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
