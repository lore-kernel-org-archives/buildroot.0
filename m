Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EB0606A31C
	for <buildroot@archiver.kernel.org>; Wed, 18 Nov 2026 10:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=e+b9f7dN;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Z5lNU/Op
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 96B6D608A3;
	Wed, 18 Nov 2026 10:14:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AguFeV2J4Fzo; Wed, 18 Nov 2026 10:14:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AE5B2608AD
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794996853;
	b=d46w6gS6AziitszHfCVtOq/edc3FX8I6EI4Y0EuipB32SC4zO2hAxggFhewltJUdruTV
	 fky7MXu1PSIM7vpSt0uXOs+4srqM+EcDZHNbHXxlqKiWsFsR0xI6CTYSJ7tURWpnHbxf4
	 V8Im5fxk+V48BSjFFkMbYvazZvkesy4s2mzo6E6uAlfjcTfCBo5CKnudrK9ajCLdXTmuK
	 +isDArsHv1EisWWyH+Fe3DhrnEaWgl3/Nrf+YBtSDaQ1nH6p5rXQs0hwrCj8nCREkmxNN
	 5g/cXoE50s6aex0Kq1kbDtKY4mK6VI0UQECjVZbAp3Hw+qkG+FpFBzSzNyeWfBxfeGg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794996853;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Organization:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=x0LH/8rww5St+008J6MI5k9k9nLSOkLrR27JECtttNc=;
	b=ZHprbYZbBM+JLfZjFmPf3WwweIG8O1NmCFhvk/WtwXJWoLp+2V9wrv7DGFlCCY2V3+0h
	 20ymVeK5lWeizrYyx2zjOXvZXGvavC3mR1bMcjOwfs7yhKX2zOuGAVa6XL8pEkl5faTRK
	 PqUJJfvU7DLzWh4/p8Gk9+winD0z9OGpTdDuWDAaOXlRsanWfxYLI5ziPpVG2ShiUDQSt
	 9XdOfwLC9WvoTnGz34j9Fzfy2v/YuUpF4S+LyRlQ7VBQH8qfA27IMqaRs8VuR8nSsQve2
	 uevnSHaCoryAW8S+M+i6Mq56U7+j1EzxBExd/CynEdMcdRi7FGFuy10Qjh2lgq2mmbg==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794996853;
	bh=x0LH/8rww5St+008J6MI5k9k9nLSOkLrR27JECtttNc=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e+b9f7dNTLrWVknvMAyYmlnUUGFoCd6T6rogxgEV6GkSXAvmM1AGGfssUoYYWeluk
	 Tw+Wft2uHTn0c4lCXHpN3uITHyjWuTlSVZ8JAToQ5rldXijiNjxxx+nu4Qj5ToVNL+
	 RUai/0b56udfYf3CuwaQ9ETDGBJjH9ZpeN4VzPkoAiskqhBmwlVJ/eI4vlTVdiPhDf
	 nGMPlA8fLEWth1hmM6swr9Woqzjghv7uqQqWgrHqCqdCBDk0nVBQhY6XwGec5DKBWP
	 3VqYDouXSjYPTyFNaWmzFbSxfr1JEfk0ZK52xtr6+w+/DVzwkr/KdPiK2H5IetiUJm
	 5D0+2woXb0clA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE5B2608AD;
	Wed, 18 Nov 2026 10:14:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F1C061
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 10:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03D89810CA
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 10:14:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BCQW-HEUGOTO for <buildroot@buildroot.org>;
 Wed, 18 Nov 2026 10:14:11 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BAD13810C6
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::232"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::232; helo=mail-lj1-x232.google.com;
 envelope-from=troglobit@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=Z5lNU/Op
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BAD13810C6
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 10:14:10 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-3ae6a0ffb55so3785861fa.2
 for <buildroot@buildroot.org>; Wed, 18 Nov 2026 02:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1794996848; x=1795601648; darn=buildroot.org;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=zRImI/APIKYpm8Ca+TUKqtLbnVDM30c1nmcgdZ21XTk=;
 b=Z5lNU/OpF8eYrEj/VoiVxPiAdAeHBN2bQ7/JzN4su2heRdoGGtjz+rdY6o19kJUsdZ
 SxNVbmqX0rL5T1QioR53rQv8NFz3SD19qaozoIgVbnSBYUgmupPQip5eg/rfEF3hRZBs
 tgM2n+NGvODxIRG26Sth8ACErl7SjXVIXFTTV86BxuU7xX7FrG41SV2wT4dXo3Hj99U2
 Jsae6q6OAfI2HaBxXgB/vkEC20FGkg1ZQB/+NWCuQgZWN0I9bQmn3yGPE7YHGSfwbfbS
 OPDNa6udTWs58VKFW2Goy5rRjHVv9m7Y8Z4k1fqn7mk3zMS5gKAxHbb7oy4HoJMkU2m4
 4hMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1794996848; x=1795601648;
 h=content-transfer-encoding:organization:mime-version:message-id:date
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=zRImI/APIKYpm8Ca+TUKqtLbnVDM30c1nmcgdZ21XTk=;
 b=ce2YtEcuPm1P7y/FCwbvFc8N9Yu3xaeCH77IlRrovbmKMFgWVc3QKf7iOscxXOtyeO
 /HL2TXJEJZ3kVt0GeC4/u4IzAKfpVGAkboC10dZyrHa5wvnxbZETaujKPdMuHn6iRbH6
 Z8YoltbEwrniGzhM3kIzWIZRZnvEYM/od1DPo1Gdq8fMjzlex6/FzbIcrqX/aN1W9Mhz
 znsV6jd3s4KNBVNLZMrBcDKiZJLvIZlS4DkDlurvv97VqgeUk2wXuGTWHud7ydGqmomn
 wqsf5HQDsQ8nd7JXMNRr0QkyAcszbZpX3cHGJgJCnof5z2oI4uwY4H4WIxKMNiNYOZLQ
 i7vA==
X-Gm-Message-State: APuU4Z/zlzwcHNFubP0LrQ5kFUnF3V8UCUo+Qis7mHaMfb3PCoPd+OP6
 WxGK4XQ1m3Xr+kYWLNKpo7L1O/tskLHy0dfFEesXztRsgnZAWvJZyD9r1wTcYmET
X-Gm-Gg: AYBFou0gU/Eg8UQUhOYlDHAegL6163lcEq2NxGCoiI+Ly1Y3XnGdm89g6979nxcjPAo
 1/qr0N2SCNTRPC0St56yely6aGetHvqc5KyXDY5HoMbKhd2B30M2XhMFtFXAmDnj/549zpEl3KJ
 M3O81cdpo4CNXRJ97b0w0NF/0oxca6+XJYWAlioe9wXcnyHKHt8ALg8NfyTaIrBUaEbargUIqa1
 X6b1khWJFlSRsvYoOrPUwTs9czkFeYtNtSLeQkKNnzaERpIzSxRp8Now8qHN70d6jV58VCBo9k8
 0c8JAtvu+i7s9fbqEDesTyVb6F3MlSRUM/ZZjz9gPTR8pnszS6RkGNDXGHUQwFwo/Ec5QuMmWsC
 EbfkIu7myUnqT7MhCiD3WmX4V/XU8AHCNCzDfsA9YlHH1u6BgA3VxXL5J3WTJjd+zYRqyXFvXTB
 Nhwn+bBREKnnhsvRcabUSHctoHVD7td+1VE4pAskxXEWu/qPz64UxdIaDnTb1Ky9sJAheaJ9YO3
 nXpg9coJ6VHC/LNIOym4Pj+Q7loakk1inVDcB2DCjpYq93ZqbHfq//yCLrvagPx+FeiIToozuMX
 2Tb2iBsKAWTXSLytLlJpkrb6FJhdUwcyHtwl+kldQYlqtm9beD6A8ai+YuQSwfvFtDrZBUmaJlp
 arScHHcQcDB+2
X-Received: by 2002:a05:651c:a187:b0:3ac:7ad6:200a with SMTP id
 38308e7fff4ca-3ae6709cf85mr7490251fa.4.1794996847649; 
 Wed, 18 Nov 2026 02:14:07 -0800 (PST)
Received: from gimli.addiva.ad (h-79-136-22-50.NA.cust.bahnhof.se.
 [79.136.22.50]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3ae67b433ebsm4554601fa.37.2026.11.18.02.14.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Nov 2026 02:14:06 -0800 (PST)
From: Joachim Wiberg <troglobit@gmail.com>
To: buildroot@buildroot.org
Cc: Joachim Wiberg <troglobit@gmail.com>
Date: Wed, 18 Nov 2026 11:14:02 +0100
Message-ID: <20261118101402.108660-1-troglobit@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Organization: Wires
Subject: [Buildroot] [PATCH 1/1] package/mg: bump to v4.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Since v4.5, configure checks for wctype.h and mg falls back to its own
character table for word boundaries when the header is missing.  That
makes the wchar dependency added in 600ce3a71e82 ("package/mg: needs a
toolchain with wchar support") unnecessary, so drop it.

Release notes at:

- https://github.com/troglobit/mg/releases/tag/v4.5
- https://github.com/troglobit/mg/releases/tag/v4.6
- https://github.com/troglobit/mg/releases/tag/v4.7

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
---
 package/mg/Config.in | 5 -----
 package/mg/mg.hash   | 4 ++--
 package/mg/mg.mk     | 2 +-
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/package/mg/Config.in b/package/mg/Config.in
index 7eb052d1a8..35e0e6f57f 100644
--- a/package/mg/Config.in
+++ b/package/mg/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_MG
 	bool "mg"
 	depends on BR2_USE_MMU # fork()
-	depends on BR2_USE_WCHAR
 	help
 	  Emacs-like text editor (260 kiB)
 
@@ -17,7 +16,3 @@ config BR2_PACKAGE_MG
 	  and, in particular, no requirement on ncurses or termcap.
 
 	  https://github.com/troglobit/mg/
-
-comment "mg needs a toolchain w/ wchar"
-	depends on BR2_USE_MMU
-	depends on !BR2_USE_WCHAR
diff --git a/package/mg/mg.hash b/package/mg/mg.hash
index a5b88e5617..739d9d55bc 100644
--- a/package/mg/mg.hash
+++ b/package/mg/mg.hash
@@ -1,4 +1,4 @@
-# From https://github.com/troglobit/mg/releases/tag/v4.4
-sha256  5955f48138bd5fc3ac53945d610f4089446afc5eea99bfb5f0a01f079426907e  mg-4.4.tar.gz
+# From https://github.com/troglobit/mg/releases/tag/v4.7
+sha256  c8a38ad43a260874a3b5471963253e1a4dbdaf251e71ff451bc1fef000d1166c  mg-4.7.tar.gz
 # Locally computed:
 sha256  7e12e5df4bae12cb21581ba157ced20e1986a0508dd10d0e8a4ab9a4cf94e85c  UNLICENSE
diff --git a/package/mg/mg.mk b/package/mg/mg.mk
index a831e5e86a..743f22d226 100644
--- a/package/mg/mg.mk
+++ b/package/mg/mg.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MG_VERSION = 4.4
+MG_VERSION = 4.7
 MG_SITE = https://github.com/troglobit/mg/releases/download/v$(MG_VERSION)
 MG_LICENSE = Public Domain
 MG_LICENSE_FILES = UNLICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
