Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 025B7C433F5
	for <buildroot@archiver.kernel.org>; Sun,  1 May 2022 08:01:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 994DF410CB;
	Sun,  1 May 2022 08:01:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zXDYGeaKaOLQ; Sun,  1 May 2022 08:01:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3201B410A3;
	Sun,  1 May 2022 08:01:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6E71D1BF3EF
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 08:01:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5B1A1410A3
 for <buildroot@lists.busybox.net>; Sun,  1 May 2022 08:01:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZrrzritDePPA for <buildroot@lists.busybox.net>;
 Sun,  1 May 2022 08:01:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1ED3E409BE
 for <buildroot@buildroot.org>; Sun,  1 May 2022 08:01:07 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id d3so6370875ilr.10
 for <buildroot@buildroot.org>; Sun, 01 May 2022 01:01:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I6k1Rn1+6DpcGRbKQ5Iy8nqZUW7U6uzLWVx5TdSKo2Y=;
 b=L/D4737dN3nst2DBpcf7/DQ/cM2eppk8r7h0kxIJimmCfYi9QDshE8T0EW4zWNmZEf
 6QuMCGZp0bYh4rcznhgV3zhf4GVvX10PHQMepxGuASfT8k5O9dSYzao6M51+/rLjss9W
 SYB6gTrujqBEmGXo0YcvDeFBvIIBT3C3UyEcCsQoJGh0TOlVQ2jZL1tdwCArqKhCrz2g
 VupWSSURzEMzxEgC83u+e7gKmH+eqopLxeQsCuxveXpnihVlQHfvHZWB2PEe6XSrNje0
 vUGaSlDhdJHs2iEOIkTx9gXQyCp1CU34y0g4+tmSeG5eafmPyIPy/R1f9Osp1apctaym
 07LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=I6k1Rn1+6DpcGRbKQ5Iy8nqZUW7U6uzLWVx5TdSKo2Y=;
 b=u+CBP+K8zbVJAV5EmxZVo0ulwP5HGfoG9tPxfCGpQcrLKRu4/NcWelVQpUrLT96fPS
 /hA4CG/anRFovLkDNNZq5q/bksIGLr0Hk+wX3+vl3rEXOW5HBQgi3SkD5xgCTGUuBQCt
 U8rc/fgnwYtEZJFmLR8OMBogTCLXKVYVQ6VluJwdSJfbugMjrWtyjn5jK5hNkT5TKYi8
 +Tu6dqO/aljRukreU8Llisp2U5jvw+8S9jkCwKpTChPzdrAqkGxjbfzDZ0nc98lRzH6e
 OZdjlma7th8eHeGHHFEqynZ85kVkmskg7aw+ER9+zk1dwpJVPyE/bFNHCsPNQaZJiBh7
 MPJw==
X-Gm-Message-State: AOAM532bxwQ1h5aX767UOCRRcpCcviNso53cgwpQQv7lPTMfTgCobiM+
 PP5cgp6EHFwyqGpYIwoFY2AaCU8iE9A=
X-Google-Smtp-Source: ABdhPJwtzyayQctZEYypMDv/MrfqKrbrmC0m9t8exYIL9R4ADmql/ttbTf8IDBxHyvfK+gzeQa2r1Q==
X-Received: by 2002:a05:6e02:1708:b0:2cb:fbc9:c69d with SMTP id
 u8-20020a056e02170800b002cbfbc9c69dmr2620944ill.54.1651392066931; 
 Sun, 01 May 2022 01:01:06 -0700 (PDT)
Received: from james-x399.localdomain (97-118-252-238.hlrn.qwest.net.
 [97.118.252.238]) by smtp.gmail.com with ESMTPSA id
 z3-20020a056638000300b0032b3a781749sm2089915jao.13.2022.05.01.01.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 01:01:06 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  1 May 2022 02:01:02 -0600
Message-Id: <20220501080102.3125294-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-cryptography: fix symbol
 redeclared error
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport a patch removing invalid OPENSSL_NO_PSK guard.

Fixes:
 - http://autobuild.buildroot.net/results/1f2/1f2f203ee5130fdfce005281e71bf371699701f3

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 ...id-OPENSSL_NO_PSK-defined-guard-7146.patch | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 package/python-cryptography/0001-Remove-invalid-OPENSSL_NO_PSK-defined-guard-7146.patch

diff --git a/package/python-cryptography/0001-Remove-invalid-OPENSSL_NO_PSK-defined-guard-7146.patch b/package/python-cryptography/0001-Remove-invalid-OPENSSL_NO_PSK-defined-guard-7146.patch
new file mode 100644
index 0000000000..5d953b8931
--- /dev/null
+++ b/package/python-cryptography/0001-Remove-invalid-OPENSSL_NO_PSK-defined-guard-7146.patch
@@ -0,0 +1,56 @@
+From 891a06101d7b48c61d0d3174f79e9962b995770e Mon Sep 17 00:00:00 2001
+From: James Hilliard <james.hilliard1@gmail.com>
+Date: Fri, 29 Apr 2022 16:06:10 -0600
+Subject: [PATCH] Remove invalid OPENSSL_NO_PSK defined guard (#7146)
+
+These symbols are not conditional on OPENSSL_NO_PSK in ssl.h
+
+SSL_CTX_set_psk_find_session_callback:
+https://github.com/openssl/openssl/blob/openssl-3.0.2/include/openssl/ssl.h.in#L847
+
+SSL_CTX_set_psk_use_session_callback:
+https://github.com/openssl/openssl/blob/openssl-3.0.2/include/openssl/ssl.h.in#L850-L851
+
+As such we can not guard the fallback with defined(OPENSSL_NO_PSK)
+as this will result in redeclaration errors.
+
+Fixes:
+build/temp.linux-sparc64-3.10/_openssl.c:2286:8: error: 'SSL_CTX_set_psk_find_session_callback' redeclared as different kind of symbol
+ 2286 | void (*SSL_CTX_set_psk_find_session_callback)(SSL_CTX *,
+      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+In file included from build/temp.linux-sparc64-3.10/_openssl.c:832:
+/home/giuliobenetti/autobuild/run/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/openssl/ssl.h:855:6: note: previous declaration of 'SSL_CTX_set_psk_find_session_callback' was here
+  855 | void SSL_CTX_set_psk_find_session_callback(SSL_CTX *ctx,
+      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+build/temp.linux-sparc64-3.10/_openssl.c:2293:8: error: 'SSL_CTX_set_psk_use_session_callback' redeclared as different kind of symbol
+ 2293 | void (*SSL_CTX_set_psk_use_session_callback)(SSL_CTX *,
+      |        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+In file included from build/temp.linux-sparc64-3.10/_openssl.c:832:
+/home/giuliobenetti/autobuild/run/instance-0/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/include/openssl/ssl.h:858:6: note: previous declaration of 'SSL_CTX_set_psk_use_session_callback' was here
+  858 | void SSL_CTX_set_psk_use_session_callback(SSL_CTX *ctx,
+      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
+[james.hilliard1@gmail.com: backport from upstream commit
+891a06101d7b48c61d0d3174f79e9962b995770e]
+---
+ src/_cffi_src/openssl/ssl.py | 3 +--
+ 2 files changed, 2 insertions(+), 3 deletions(-)
+
+diff --git a/src/_cffi_src/openssl/ssl.py b/src/_cffi_src/openssl/ssl.py
+index 1314b85b0..d036e4f2d 100644
+--- a/src/_cffi_src/openssl/ssl.py
++++ b/src/_cffi_src/openssl/ssl.py
+@@ -785,8 +785,7 @@ void (*SSL_CTX_set_cookie_verify_cb)(SSL_CTX *,
+ static const long Cryptography_HAS_SSL_COOKIE = 1;
+ #endif
+ #if CRYPTOGRAPHY_OPENSSL_LESS_THAN_111 || \
+-    CRYPTOGRAPHY_IS_LIBRESSL || CRYPTOGRAPHY_IS_BORINGSSL || \
+-    defined(OPENSSL_NO_PSK)
++    CRYPTOGRAPHY_IS_LIBRESSL || CRYPTOGRAPHY_IS_BORINGSSL
+ static const long Cryptography_HAS_PSK_TLSv1_3 = 0;
+ void (*SSL_CTX_set_psk_find_session_callback)(SSL_CTX *,
+                                            int (*)(
+-- 
+2.25.1
+
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
