Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 525E8C54E60
	for <buildroot@archiver.kernel.org>; Sun, 17 Mar 2024 13:15:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 20FBF60598;
	Sun, 17 Mar 2024 13:15:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id soKWe8aap1yP; Sun, 17 Mar 2024 13:15:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 21FCA605A2
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21FCA605A2;
	Sun, 17 Mar 2024 13:15:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 128601BF2F8
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 13:14:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0CD6680B36
 for <buildroot@lists.busybox.net>; Sun, 17 Mar 2024 13:14:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Onmy5Kz_C8gj for <buildroot@lists.busybox.net>;
 Sun, 17 Mar 2024 13:14:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C384080B11
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C384080B11
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C384080B11
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 13:14:57 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-4140e6e9ce4so1662435e9.0
 for <buildroot@buildroot.org>; Sun, 17 Mar 2024 06:14:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710681295; x=1711286095;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HoC1/AZ+gswWIXEXh9U+jayYFX4uqbq9wc2iYFjCofg=;
 b=BVRf1gunvNmbNN3zJ6Pa9XuJXeOl7NMcr0NFtsekHTZsZWZIp7ro96kB5v1XmbRio1
 LnhwGPZMnGSDJZZYo1AsVWA9Ed5vim3KMy/1I/2+eJEdIgY2NZrONT46nsXKVmKpbm7T
 tceNls/l3Ogu0837z7uG2F5U9wBf8I4YkEmU0DNZNgmyYtEmloM0td1JQEjFWaY/wfmA
 OP5+XvAvRzNo1wNQeomJWMvb8eR72TJre5Lb8OdzY017v8Q5bUcDv+NAIZJ3IOwHlO0q
 aR4E5XXYLfu7YF1cQIO2brA0xNnlZ2eyUvXeg1aJXQZqoMIkD3uM5QRXDylJcFVvxDid
 BjVQ==
X-Gm-Message-State: AOJu0YzgnI0tgdTaFWv1vBFe0+5QF0iuULwBpkiG+Xp2wWFmFWzqIUI6
 LTtvpRZ7M4l5OuMHSaMQCmPt8i/BkeBnfBF2PqJvafRXgv2Iq/NEq8tslc76
X-Google-Smtp-Source: AGHT+IHBzxvFORsbBrTTOAU7Y4xpzvbAOMeg9Nlnc0OGmqgb6spziL2gFKLsv0CDA0mTM+6M/sw39w==
X-Received: by 2002:a05:600c:4e8c:b0:412:a06d:6cef with SMTP id
 f12-20020a05600c4e8c00b00412a06d6cefmr7246484wmq.37.1710681295046; 
 Sun, 17 Mar 2024 06:14:55 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-787-165.w83-197.abo.wanadoo.fr.
 [83.197.114.165]) by smtp.gmail.com with ESMTPSA id
 h2-20020a05600c350200b00413177c3f1dsm11519431wmq.18.2024.03.17.06.14.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Mar 2024 06:14:54 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 17 Mar 2024 14:14:46 +0100
Message-ID: <20240317131446.535633-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710681295; x=1711286095; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=HoC1/AZ+gswWIXEXh9U+jayYFX4uqbq9wc2iYFjCofg=;
 b=irOCFlaNHbObTzQ4qumeRZirrHLQWTWHm7b+MRK9Od9wwEz+OeIN7DcVwTeUL6wn6p
 kjafPAJAdJt1MVflbR132X4X/tpD9gWQI/rm2ldSUqvUK4jU1H06TMIhXwxiklXjdect
 +xO75MprvzztoU9ljNoEfnj/h6Jgjpo2t/fRgVx34A0mYXwkx2L5W19eNNkcytDdZ/CN
 jRLfqtGN63ZvC/8mEZzNjh9FoQUsagvmQJ7fQ1uPofchADVSkTytNbKENlkbFnZQl9F3
 Zx+4SmY0NCcULKI404HRtQsDU4sha4tdgtEEaJefXqQ5WMRp8LfSZgskD2en1XJCwpVw
 hm2A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=irOCFlaN
Subject: [Buildroot] [PATCH 1/1] package/spice: fix libressl build
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since bump of libressl to version
3.5.2 in commit 8b216927db080b38fdbf1f8b025b6f90a89d4bc2:

red-stream.cpp: In function 'RedStreamSslStatus red_stream_ssl_accept(RedStream*)':
red-stream.cpp:526:22: error: invalid use of incomplete type 'SSL' {aka 'struct ssl_st'}
  526 |     stream->priv->ssl->s3->flags |= SSL3_FLAGS_NO_RENEGOTIATE_CIPHERS;
      |                      ^~
In file included from /home/buildroot/autobuild/instance-1/output-1/host/i686-buildroot-linux-gnu/sysroot/usr/include/openssl/err.h:120,
                 from red-stream.cpp:33:
/home/buildroot/autobuild/instance-1/output-1/host/i686-buildroot-linux-gnu/sysroot/usr/include/openssl/ossl_typ.h:173:16: note: forward declaration of 'SSL' {aka 'struct ssl_st'}
  173 | typedef struct ssl_st SSL;
      |                ^~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/273eadf9e49af55e0932a8293ca65762fb43114f
 - http://autobuild.buildroot.org/results/97601f321efc532de0c2ea6aa618ce11fad9e851

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...SL_OP_NO_RENEGOTIATION-fallback-path.patch | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 package/spice/0001-server-add-SSL_OP_NO_RENEGOTIATION-fallback-path.patch

diff --git a/package/spice/0001-server-add-SSL_OP_NO_RENEGOTIATION-fallback-path.patch b/package/spice/0001-server-add-SSL_OP_NO_RENEGOTIATION-fallback-path.patch
new file mode 100644
index 0000000000..edb8b2ed17
--- /dev/null
+++ b/package/spice/0001-server-add-SSL_OP_NO_RENEGOTIATION-fallback-path.patch
@@ -0,0 +1,43 @@
+From 5e580eefac44d0c709afcf93eb5fca2fb353166a Mon Sep 17 00:00:00 2001
+From: orbea <orbea@riseup.net>
+Date: Fri, 26 May 2023 13:38:34 -0700
+Subject: [PATCH] server: add SSL_OP_NO_RENEGOTIATION fallback path
+
+With LibreSSL SSL_OP_NO_CLIENT_RENEGOTIATION is opaque which is not
+compatible with the OpenSSL 1.0.2 and earlier code path in
+red-stream.cpp while SSL_OP_NO_RENEGOTIATION is not yet defined for the
+newer OpenSSL code path in reds.cpp.
+
+So with OpenSSL 1.1.0 and later if SSL_OP_NO_RENEGOTIATION is undefined
+and SSL_OP_NO_CLIENT_RENEGOTIATION is defined then define the former as
+the latter. This will allow the build to succeed with LibreSSL 3.7.2 and
+in the future when newer LibreSSL versions add SSL_OP_NO_RENEGOTIATION
+that code path will then be used automatically.
+
+Signed-off-by: orbea <orbea@riseup.net>
+Acked-by: Frediano Ziglio <freddy77@gmail.com>
+
+Upstream: https://gitlab.freedesktop.org/spice/spice/-/commit/5e580eefac44d0c709afcf93eb5fca2fb353166a
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ server/red-stream.h | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/server/red-stream.h b/server/red-stream.h
+index 716e93317..8e57c5e5e 100644
+--- a/server/red-stream.h
++++ b/server/red-stream.h
+@@ -25,6 +25,10 @@
+ 
+ SPICE_BEGIN_DECLS
+ 
++#if OPENSSL_VERSION_NUMBER >= 0x10100000L && !defined(SSL_OP_NO_RENEGOTIATION) && defined(SSL_OP_NO_CLIENT_RENEGOTIATION)
++#define SSL_OP_NO_RENEGOTIATION SSL_OP_NO_CLIENT_RENEGOTIATION
++#endif
++
+ typedef void (*AsyncReadDone)(void *opaque);
+ typedef void (*AsyncReadError)(void *opaque, int err);
+ 
+-- 
+GitLab
+
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
