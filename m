Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF70C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 10:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB57540247;
	Mon, 22 Jul 2024 10:49:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zGSNrC5N2g3g; Mon, 22 Jul 2024 10:49:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A9B74027E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A9B74027E;
	Mon, 22 Jul 2024 10:49:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C61D21BF28C
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 10:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDFF740282
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 10:49:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WZZG52gWtxfr for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 10:49:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=fontaine.fabrice@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 51F784028C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 51F784028C
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 51F784028C
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 10:49:05 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-4266182a9d7so27478025e9.0
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 03:49:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721645342; x=1722250142;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4EbwU4vJ6INNkHyghbndhjaAuNn5Do958esKBTMeckU=;
 b=Pfsf4a7qfxHvADOXsM6cTpd7oSsQwLdKwmcpv0yOfAFz7RLragYoN9q5lK1lEFbZtg
 3Tl+fGbGTu5vVcc7LLtyFkF2amhpAKjdYiDuseRc+KJJ2rx4PNioGQ93oUaxfug62P/j
 C+rBPe1No8aPspbpgHBh4oGzGlSLegTt0FvI+ywrlrogSY7QmJ1DWYbn+nQTxrN77Ahb
 80F5Sx/81Z+hf9a3v/p0/hkqXwDF6PEDia8kt+b/5Osv5tJz+OsHLFyGYQcd8ytYSWaG
 bZacFFT9nQbK6h61Tu6Ksfi/c+9UzQ7kgXCk6t1SujnnyTQkWHCd0mfH+Bzy3JtANCrx
 EcmQ==
X-Gm-Message-State: AOJu0Yywlmsqhx6lQhZb6IBiqxracPZM4yqCIWgiWGbX/insWFgVbloS
 ov2iGu37tNqwGaIcVfcjWqnHuEAQspEhWt9VXs0G3w1osSfPGMDM21YuvQ==
X-Google-Smtp-Source: AGHT+IECVYQXEsZvGf3Ip5X0bEXF/HtAP9LLdgAtTKSbj2nwMIhBdtBhrSbgyWD115Zx0aVbwhLkJw==
X-Received: by 2002:a05:600c:1914:b0:426:629f:154e with SMTP id
 5b1f17b1804b1-427daa60cf1mr41398715e9.30.1721645342303; 
 Mon, 22 Jul 2024 03:49:02 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-785-215.w83-197.abo.wanadoo.fr.
 [83.197.112.215]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-36878695a52sm8200613f8f.64.2024.07.22.03.49.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Jul 2024 03:49:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 12:48:59 +0200
Message-ID: <20240722104859.1092677-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721645342; x=1722250142; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4EbwU4vJ6INNkHyghbndhjaAuNn5Do958esKBTMeckU=;
 b=B64YH2qLp7djcEMxE4qLsSMciAPl9QDRKFFSiKJwLZq/w6+tEV20jDxE9z4PutvkTF
 D60hQtn6/kwLtI+W3tQcDa/tBQRmJBaFpkL9KVqsN6gJde+mGT5P3ukTXgjUOAAYs+7E
 yRkib9vmv7NrpGSgJ10L/zhIQFGJJOY33GNS+lUQmNQptZBBGw0WnEY4miTxuZ75zk3c
 m8UjUQxPYCEKHttNt4UUFGEj9HV+yXdvii6QeJekiUUzsHWvuXA+IXBXTW6xuUWDmITj
 GeHNCkJZVDMoHLo+s2mGMbKyQsW1qRrFhORdmlWtb0fyY0jAIbg1XC/5NS5Wmbr+VO5H
 TQ6w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=B64YH2qL
Subject: [Buildroot] [PATCH 1/1] package/apr: fix musl build
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
Cc: Bernd Kuhls <bernd@kuhls.net>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

strerror_r on musl always returns an int since its addition back in 2011
with
https://git.musl-libc.org/cgit/musl/commit/src/string/strerror_r.c?id=0b44a0315b47dd8eced9f3b7f31580cf14bbfc01

As a result, setting ac_cv_strerror_r_rc_int to no results in the
following build failure since bump to version 1.7.2 in commit
783cd8d90d37b5e0b59d6f0bfca6667855b2b9e1:

misc/unix/errorcodes.c: In function 'native_strerror':
misc/unix/errorcodes.c:385:9: error: assignment to 'const char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
  385 |     msg = strerror_r(statcode, buf, bufsize);
      |         ^

Fixes: 783cd8d90d37b5e0b59d6f0bfca6667855b2b9e1
 - http://autobuild.buildroot.org/results/9a42a4427ff64d47da61c731abb99d7585781cdd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/apr/apr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/apr/apr.mk b/package/apr/apr.mk
index cb8c12dd65..d4526a4172 100644
--- a/package/apr/apr.mk
+++ b/package/apr/apr.mk
@@ -39,7 +39,7 @@ APR_CONF_ENV = \
 	ac_cv_sizeof_struct_iovec=8 \
 	ac_cv_sizeof_pid_t=4 \
 	ac_cv_struct_rlimit=yes \
-	ac_cv_strerror_r_rc_int=no \
+	ac_cv_strerror_r_rc_int=$(if $(BR2_TOOLCHAIN_USES_MUSL),yes,no) \
 	ac_cv_o_nonblock_inherited=no \
 	apr_cv_mutex_recursive=yes \
 	apr_cv_epoll=yes \
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
