Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CB1CA0EC1
	for <buildroot@archiver.kernel.org>; Mon, 11 Sep 2023 21:09:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 418C04097F;
	Mon, 11 Sep 2023 21:09:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 418C04097F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sSEI4-k2AmPd; Mon, 11 Sep 2023 21:09:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C79F3415DB;
	Mon, 11 Sep 2023 21:09:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C79F3415DB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2FA141BF955
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 21:09:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 08F1060BDC
 for <buildroot@lists.busybox.net>; Mon, 11 Sep 2023 21:09:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08F1060BDC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RtV86aQcZT4Z for <buildroot@lists.busybox.net>;
 Mon, 11 Sep 2023 21:09:30 +0000 (UTC)
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B452060AD5
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 21:09:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B452060AD5
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-31fa15f4cc6so1667331f8f.2
 for <buildroot@buildroot.org>; Mon, 11 Sep 2023 14:09:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694466568; x=1695071368;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KkcfcpA78xGEoVQwREq4Ul9CBo3i6dvhZrGlu9jGm88=;
 b=q+wJ7avRfVZWAlkP0DPpJN0Ocj1QF0YQbDA7x01ATfoiwPwtbXENHWhS4bUpzDwcAn
 5vY9Lt1XPBBPawxt/26ig1kR73r+vLOIiiC/b9s1Y1wWQLFuseqfZa8r+5GhukR0K8qM
 0yBZDU2Hxq1VSYTV0PbOmdukuKYdAkrFGURvSH9k4Br9hrbiQTh2zsaEvTgcwXdGku1L
 LE43P4fXaL8j6CRdv90s4c5CzbcDedgB+edsjl3qTRRPx3TA/4IdQGgJeYPa0Bwf6wV1
 8dQnpCQhkfnNi01zH5VPUyFZNwW3OY1MqcfeSYE6BdpWRBBZ3F3h8JtT7MagBydBYj4Q
 bdFw==
X-Gm-Message-State: AOJu0YxZK3clQJeTO1YvYqfi4ncXwDS1Cg1Y8NEDpY85h9eH8nFR73I2
 KREoIlcUuEFMmvPL9CZ8hw3I3DKnPUE=
X-Google-Smtp-Source: AGHT+IHIJ0QaJl+g392hbyYGtuFH+r7j8dX7DsKirl55aYaf+DuUKTwFvOVwX7khp/AdJv0339qYzQ==
X-Received: by 2002:adf:ce0b:0:b0:313:f68c:cfe9 with SMTP id
 p11-20020adfce0b000000b00313f68ccfe9mr10043070wrn.35.1694466567563; 
 Mon, 11 Sep 2023 14:09:27 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 s12-20020a05600c45cc00b00403b63e87f2sm2430678wmo.32.2023.09.11.14.09.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 14:09:27 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 11 Sep 2023 23:09:17 +0200
Message-ID: <20230911210917.1114974-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230911210917.1114974-1-romain.naour@gmail.com>
References: <20230911210917.1114974-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694466568; x=1695071368; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=KkcfcpA78xGEoVQwREq4Ul9CBo3i6dvhZrGlu9jGm88=;
 b=DICW5Sh/g+p+gJnGiMIanAzDgI2SNvbZGFzBuay0nA19qYeQ2g/iQsNIjbgxu5iiAF
 mFPACIA2OwxVtNw0Apo6gEgLsALYCoK2ju1FO3I7L71R1BK/PXShPhafvhG3wMon71p+
 E8caS7EruQ2dBOZwUH3wuGpcZzRFWxkINErAewLdCXwyfTk51yPkiHnceNDT8iWGhUw4
 G2ieJSI3VVqpQPSdv8D8q1EiKCgAtLG7Vu/6KT/zfJeejosIsWi9leXjqU6bzNQeMHNH
 qX4kWXWUdcq1VplRYSYbelP+snBUoDKPEMW6Id2xUXoS6sAG7WGLF/L4rCywXEW4wtwk
 VcfQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=DICW5Sh/
Subject: [Buildroot] [PATCH 2/2] package/localedef: build issue with old
 glibc (<= 2.38)
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While building host-localedef from glibc 2.38 sources, it uses the
features.h header from it sources that define _ISOC2X_SOURCE 1 as
soon as _GNU_SOURCE is defined.

_ISOC2X_SOURCE enable __GLIBC_USE_ISOC2X 1 that enable the header
redirection to use __isoc23_* functions introduced in glibc 2.38 [1].

If an older version is installed on the host, thoses functions
doesn't exist and break the build.

Add a local patch to keep _ISOC2X_SOURCE and __GLIBC_USE_ISOC2X
disabled.

Fixes:
host-localedef-2.38-13-g92201f16cbcfd9eafe314ef6654be2ea7ba25675/build/locale/ld-ctype.o: in function `ctype_read':
ld-ctype.c:(.text+0x6cef): undefined reference to `__isoc23_strtoul'

(glibc 2.31 installed on the host)

[1] https://sourceware.org/git/?p=glibc.git;a=commit;h=64924422a99690d147a166b4de3103f3bf3eaf6c

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
Patch to be squashed with the glibc 2.38 bump.
---
 ...X_SOURCE-undefined-to-build-localede.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/localedef/0003-HACK-keep-_ISOC2X_SOURCE-undefined-to-build-localede.patch

diff --git a/package/localedef/0003-HACK-keep-_ISOC2X_SOURCE-undefined-to-build-localede.patch b/package/localedef/0003-HACK-keep-_ISOC2X_SOURCE-undefined-to-build-localede.patch
new file mode 100644
index 0000000000..741bd7b47f
--- /dev/null
+++ b/package/localedef/0003-HACK-keep-_ISOC2X_SOURCE-undefined-to-build-localede.patch
@@ -0,0 +1,32 @@
+From babfa64585bef6c53c1d399a1c244aea89437c9e Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@gmail.com>
+Date: Sat, 9 Sep 2023 23:58:50 +0200
+Subject: [PATCH] HACK: keep _ISOC2X_SOURCE undefined to build localedef with
+ old glibc
+
+Fixes:
+host-localedef-2.38-13-g92201f16cbcfd9eafe314ef6654be2ea7ba25675/build/locale/ld-ctype.o: in function `ctype_read':
+ld-ctype.c:(.text+0x6cef): undefined reference to `__isoc23_strtoul'
+
+Upstream: Not applicable
+
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ include/features.h | 1 -
+ 1 file changed, 1 deletion(-)
+
+diff --git a/include/features.h b/include/features.h
+index 7c51b4a2e4..f385370d18 100644
+--- a/include/features.h
++++ b/include/features.h
+@@ -207,7 +207,6 @@
+ # undef  _ISOC11_SOURCE
+ # define _ISOC11_SOURCE	1
+ # undef  _ISOC2X_SOURCE
+-# define _ISOC2X_SOURCE	1
+ # undef  _POSIX_SOURCE
+ # define _POSIX_SOURCE	1
+ # undef  _POSIX_C_SOURCE
+-- 
+2.41.0
+
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
