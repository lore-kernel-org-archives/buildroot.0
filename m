Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD1DC982D8
	for <buildroot@archiver.kernel.org>; Sun, 20 Sep 2026 14:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5EB340CA5;
	Sun, 20 Sep 2026 14:52:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZktQVDbtkstc; Sun, 20 Sep 2026 14:52:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 0911D40CB6
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789915966;
	b=PbVa9Q7GzfSYMIWhJ0qQaBDj1q91X/hWkSvGj62rxLlz5Q8zTK9uGZKOvxamzWP8CY7n
	 TKxxizwoG4G4EMKvLtkaWy5VHol/kQdw/yV+msTxfjS49W6u8VjCu6kp4jy7wXEHB2V+n
	 oT94UjPgUFfa5T5v+7Ef4Y1eVXSNt4Dxafgp1q5xZYUcoqE+L8WVeS+PUnn/7/5K0xIs7
	 Xd27VzjDJE62IfoHseszrx2Gu8KTXB9SmjP1vRzSNeDFeMZSNQTxRNwEwWipMKS7W0+2l
	 mo3PNHu2YMBmNJjY+fNJ6JBJcbYqu9ZjuMklFdX95dgv+tSFpdZblicQywSjm0iiI3Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789915966;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WJzF32aQ1RMys9fT+vk0JJoYyJ/7s3OHnmc8AP32+1c=;
	b=oD2vMzrcUeH1d684jlFXP9OAASzQ0/ojJOhWlOwVGDiIYmLr3G1+4pQyC9/bC64Dr1aI
	 v3FEy0ZT9QGx5VBCkekQ6jAgp5TdOXaVJEDafoQ8yHd1HStV9dOii5pM1qkq4ZZlfNyie
	 8MgdymMFhEKr96EZtYRfCwVMXFVaEUI/JCGO5IZxm7UNWpLZ+TNzCAZydchJd73YpTeHH
	 ztfljBQ6gvlftKLtiZ+H1DfLsNryqBjO7CTA5fvOMTaH8UGxokdp5UraG2/yTsJt9IzXy
	 EfXTMgelxXK9plTAy4jFihR1PoN0ne5mlaoGekGFssUGPQZF4si3KXkhqvGhmYkELvg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789915966;
	bh=WJzF32aQ1RMys9fT+vk0JJoYyJ/7s3OHnmc8AP32+1c=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=qnDcCsWOqsrIaQEMpWuYuD+OML2ao34yKAuqvdzYte7Bt7zasU5G3vo/IbySW8oWW
	 Vu68II5Scc0kCZcReuPduVPwRdbem+7+b/LV4J2mR8nQDr1TFeJjbrbbqX0FnMComL
	 CYMZx4fGL0um3095uHNrH9Xpdhe+MiJP+cOtJPmOgp4WntXqKloob8CQ1OAaSxPV37
	 RDoRHTTN6r82EnzT5rCcB055D05rT6WlxCXLRFzm56oNOUFDFPvG6PyDyqs4FZxBt3
	 sIktqcLMPLB3LIN9Inb+dURlTNvKllTTrtjxuy0Ecx7J0UwPmi9opaPSSKswbdxsQn
	 ArTfsAPjbczIg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0911D40CB6;
	Sun, 20 Sep 2026 14:52:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 40E8024D
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:52:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26DBE4002B
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:52:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y_p2YiJaujJa for <buildroot@buildroot.org>;
 Sun, 20 Sep 2026 14:52:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 3986740022
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789915963;
 b=HSIFDF6m17+oPf9ne/CxCGSg794lgJOtEXK7fJSepYOJ6/tcqqzjtRGXFZJF+NCh4oRN
 oOvC6/xc8SuuLfx/2paWm/mwDyPIEj6+Jjtxu9FMUveal1Gqq/9ndw7OHwB4a59MNP9Am
 PqKHG6i7WYr3gylEkszVr7hCsD1iWDw73IPgyQGjt2JU6cPVqpKSKQt9+GQB4jgE9HyT+
 ZX4rU2Eoy1vmkwLSneovVgCS/7D8KXdqFWA/ECd7D8zUqqg4vT9VMz19mYczLUxEBfB2Q
 MO0SUhrI8s98ImIhGWmxvhy5MRLxwRhdaaI0QYO+Jqp3cuGHZ+MJ39VpNiPKGeq3FxQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789915963;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=0Gt9QeeoKRBd/HmqYihaOYSmW8EEm7wN5WmmlIkHDmw=;
 b=Hbe2k+Jzn/ZsESuy+7vo6dVmAmV+RNqxo/3e9riPv+FL6VDIh2/FQro7eBAWOtbfAPI+
 /qoeo8Ra7eSLFWyYyi63WPj1d1/j+8tOZYO73aDqOcQ4PaAjCFnsB4Mp1bZOKyhiChjK4
 UuF2cm7muIiDft7d9DEmHba3dcm3FARbfk+1it1fxVbT+L9h+cZSGTueEUWrhfuXQKnRp
 2bUZxcY9381DE8IlHXzkjLAWuL/zzPrRSnjI6QFUz5uFnpHdmd5ZzNNq7t2S/RPrgtHo5
 N56HAxSzUhHm9E2TkS03PpkTFWvf8jWR4xVUE4hKK1uzcue/SR72FXjzxHh3R0Et+Qw==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b="LKu/UBVK"; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=LKu/UBVK
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3986740022
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 14:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1789915504;
 bh=0Gt9QeeoKRBd/HmqYihaOYSmW8EEm7wN5WmmlIkHDmw=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=LKu/UBVKaJgI//Ba+xGbzuAUojoJJsJ55FxOLIOrBsqv6m29TmkrY/2XcpE6g8rp/
 7lDuFWPEOdhIcSBEK2AwjNX4StHBJNYpePubtLcMdjsOupnna2y3jK6siBPc2rWUqy
 56vi2YDQ70l0j9UgyhIX1gDwsgi2TO290hyXyOojlhXK7t7e6AWaKjh+0Kb/kPN5ue
 Cs2E0qw/UzDQZloC0Rhd3ew4/SXYSJsbAxvpXSP3xp9yONr+o65+S1pTaCWa0uxx8R
 boNQ20BvESQGwPfKtmMewkFjNSR9eA9264jb6RnZ3Gsk+s1KOFHrIFAZ100HFApNUX
 OqH/GVrADRkfQ==
X-KAS-Sym: v3:f51bdf72230551df:f9NnCreHs9kSnbMHh6AQdUFyi4vT0ysTuSfFuAQb1+Gxoi8Jfz3lO+KrB2DeTBKeXjT0lwPd2ophCA3F+v+GZvhFlIBU+QKhu+ybVOfg3EHT3MlcRpRvQktOsgJhRsIPALxvYyBhhxNnYCE6obl1o50gAonnv157yLjz1DqCWN47h7t3uGG6haE/+QCl6peUI/vdtKUEOPguOHtIjeLQw2ZSvs9SigPQ0ly22rWdnqQfFx4YWvu/1HbcD6LUsBe0xcLvKWC7ZgeG69JhrpeXORhdzb1VUBZOYiQJc18uAWs2B+mptoIqbEFj6Yl1D0sZ4aKGuMvi+V1/RbjqRW8wdA==:4sAvPSxW0CD23ZIr3U3MIPsg2YG4XeKg+SMTJVWzG1sMtoyT4Aty8sSSW45669LYL26vo45/JheJoSIbtg6A4h380L2BEb2L5OmJVfwgshR4IWr/Zxw9JZyXrtjPHtPCvc/2GwZzdV/4anXTW3nlT7vBpbzBF7cn04WPGZKIiY3zzvpa77b5KxkpqGXMdY55KV9trLidLtvyxh4ZZEhOCjTLGNd+JoLln8D30pfzTiSQn3l1/5BQLNzTeRN789V1yk/3wvyN835oOiJCbespY896xayvph0d9FRzwsJh4JZtH6j/IOKBYtbOUORDW3fIW5E96X6FtU70oxveuNXqgcx4cCzzI4KXH7t8Gfcv7umInwgiPKeDhPFoj3j8QCrVpV2j9sYrJxgGi55xmX6ZVpXm/4N0VRu/L263awYG68VZzWztXO1lVj4F1vBhkiA9h7Ks4/oSuuk/qMwvpPUMD9UFPa+jNwPubIwGgbRrfmdXEnJtWQv9InzkOmmDAA0qmzQfUa4Cco8G8trEOZjwLUN3MsgodkdAqmf9pkhTKBKCuQTjAU60uBr1rc94GcYxFkwOF80K3WC1OoTCW6Q7SQE6IZblycU=
Received: from fli4l.lan.fli4l (p54a1b276.dip0.t-ipconnect.de [84.161.178.118])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 08393A4C489A
 for <buildroot@buildroot.org>; Sun, 20 Sep 2026 16:45:04 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47000)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1x8Imk-000000000hB-04b5
 for buildroot@buildroot.org; Sun, 20 Sep 2026 14:44:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 20 Sep 2026 16:44:02 +0200
Message-ID: <20260920144428.3009612-42-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260920144428.3009612-1-bernd@kuhls.net>
References: <20260920144428.3009612-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: -
Subject: [Buildroot] [PATCH v4 41/66] package/mtd: Fix build with OpenSSL
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
