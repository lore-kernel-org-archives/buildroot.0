Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270D5606A31A
	for <buildroot@archiver.kernel.org>; Sun, 25 Oct 2026 07:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=boISFtiA;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AqK/VnKD
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F09356061C;
	Sun, 25 Oct 2026 07:17:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ksQlxqqgFgqX; Sun, 25 Oct 2026 07:17:15 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 19FF460612
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792912635;
	b=UHY9rdM7/JCxqxP1tb+2c4ypSYBE6GbmgjwUDEg9UHhCFAaLVTT9ZRo/wGFow9Nvg+ys
	 AWF2J+9gr4P8W0/x5ZGGJ25mUBqK3G1vQsRX6sJnn4wuJVTyFP+eNvRbpRU7Y+bMUKSn/
	 U3ZHvaxZ0EknVJzgkf3pyCJIzl1tmS2TVLhnGeupe/U7oo51s2Avdzi/0/vkMXdsIn1Xh
	 Tp/wBZ+IIC1KOu3FQ/jJj0K9dLM4Tvn+iwdeQMFwzlg3hXi1tG84seohWlSzO3uu0Crsj
	 Hr3hZHZv8BAwxQR7GGuJW8hcOS2rGgVaAU9bq/u5I57yRLFbhA0goyB2lpz+2iA+jyw==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792912635;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=5bt6rHgygH2o6ukrtBalQqfotMWLJxDRS41az8cfekU=;
	b=GFeWTO5mUgVJXb82q1lfifeS2gPVN+jXLyRu7rls0WFzftCj70BLYGnD2c6bqlGFLxjA
	 bmPjwiA/7Sqq51ezitM5KuVUCdsExhfe9HxrK+IiQ8y/jo4NV1liU7++QxTRaP76NNy5b
	 LKm5pZsq6QJAPgFne5pne4eGXjO9nsORvnuXlDPGbhsVv97kP0tq5pth3dnqs8hu95j9F
	 OD0zt0RecjuJ1En/r1cnKnP+exiBKKBoYfbGdQbKmyajmU3ibwN2YVAJvybu9//CcheWV
	 +3tq1b4M4ZYOmwNPZ1xmoCJ7PVRuUoKOZ4pA3A5K5YP0gBBGt135PwYcFJ9Befm3oJw==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792912635;
	bh=5bt6rHgygH2o6ukrtBalQqfotMWLJxDRS41az8cfekU=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=boISFtiAHFVUutCWMJg6OaMmt/2AmUsdxw/b9emTYCXp1X2nhv+yYO6yoBCf5gAA7
	 EdkzqU2CTYocvW63RZpP8Yy7CUGR9KKM5HKwdWU0T11p82N1nvvij0vdr8TxPtFAa7
	 IjG5dkpPQA1NR4fJ3/L6FJ2aZbvxb5A3kxkP0XxvTaOyCfCy3G51VhyT7zG19IDyrd
	 +vHxtswzfNSJyX+F+5iChinDLt/tY8I9Oie3Nsk8lwKShe4LIzJmfpOU+bmLvQP1Kq
	 VxA3/5DjhPACF7N/G/RzU/Pzi5KUAI7jsWcElFGCjFCnKnFaTUGLAN2KZlcqM3Tnii
	 SZzSS4qgB8W0Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 19FF460612;
	Sun, 25 Oct 2026 07:17:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 401B6380
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 07:17:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2523B80EA2
 for <buildroot@buildroot.org>; Sun, 25 Oct 2026 07:17:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hQ71eyQTI0q9 for <buildroot@buildroot.org>;
 Sun, 25 Oct 2026 07:17:13 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 1270680DB3
Authentication-Results: smtp1.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792912633;
 b=tgHGoRwXFO9L85rmdwuJq7lSSOcTAvU/0L2G46ByFjtydol38PXLaog1l93Y/Xg6CCmq
 3Ar2KIMzlG+FWuJ8iyWO61krmeV1jJx4YYpSVYSpSDmQAQzqJyxtxOQmLjSiYpnjlTS7x
 ozOw5Vffkxl8dJ+BxOnTFeDkoB3DOqvG0M4ytF/3LhxJ8CKe4uCLaMd21ZAT96lEkRh0S
 Qu8ZIAuqB8R/GLlvGGX+9d1KazuIabNbvAH4evdrsHjwOrtmaaLMmWtrLFZMI2ZcEFqil
 5tGXNJpRAQqhKqL54DN+HyfH7xB2F7ub1vF2CESLSc6dx4AbfeK5pBSiR86LrLUN3Xg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792912633;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=9R3mFpWXRBdUESENnmuQq1HfmDgktNsuDSWhoFxRFjI=;
 b=qOfUiZq6LbWObyeO4pdgS1eJKdHHDOQmSzf58H20tIyS3XK+EeU0TKpOWalN+qy/8jph
 NTUaOwaVislVgpJcHUgbi54fGVR8KxrbmLNPLr8moYJ638xOKiH7etFSerYNshmcGIzun
 tlXXE97z8V6qGpRuFz3GVFG6/WYX1NUm84JujG8OriVle8opi+RMa2rp1PbAILRxJC5HI
 K0CPQoJRUBDmMJK739t6yNR/k91mW10HiOtTfqq7o74dpFWcFqQjSweA7llMcd8RrPnDb
 nV+xfCGjrQ7UBf0fVp4GAVN1L5/hC67dzUnPRGHj3svXEUKMI+VNJ+xSsD8wMANZgAQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=gmail.com;
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b="AqK/VnKD"; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::32d"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=francois.perrad.86@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=AqK/VnKD
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1270680DB3
 for <buildroot@busybox.net>; Sun, 25 Oct 2026 07:17:11 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4a20a37703bso15854715e9.1
 for <buildroot@busybox.net>; Sun, 25 Oct 2026 00:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1792912629; x=1793517429; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=9R3mFpWXRBdUESENnmuQq1HfmDgktNsuDSWhoFxRFjI=;
 b=AqK/VnKDYnjLXLBv79TwvY9FvxHwewICiU43+stbDUFVROvrxJU+Fj9Vcp6BA0RBPu
 CR70ZlL3qEVn0lak8A2qPD3nntSUNdHGm5r1RXt1WBUrSx7anGQkgOCdluUi13sA78ec
 SiGnMjnO7a7It8IY/wlpzpCqr5eDRw2LsryV21NoD+ynM+rG7jzbiF5xCT6yQPocS3MH
 NDrUNNC/S+6MBO8lkzHhHPEWELe2L8RsW8XRfo0GkEVf6bqzk+lhp/OWyt+t9BzZcmp7
 DmNTMzNZsK6NjLXqENcBwHxWI8JF55BSBeKAS5+zWroXqhLNWj6RUvbslWDmS0nwl8BX
 lYtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792912629; x=1793517429;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=9R3mFpWXRBdUESENnmuQq1HfmDgktNsuDSWhoFxRFjI=;
 b=u+S0lHlDtS3bv4njF0L2aRodsYk3khAVFj2f+/Cfw6rsFspx3GNUoRPQmtXvPzrO/i
 sGnfO7t01ty+bhZYbgKKk10RB8pvZRdH//C3yCj4ja2gXMYNEvKQSZMN5zLOXsB/wu6i
 0nD6TAaaHq4wXTztdroh1DLSLP872PUZ1OHxIFbLryUfWgfbrWTa/5GrwxYSxipki6R4
 A5HCXYWCBimkLRQA3+0TTeriI3dkZLhkIP/j7lNudA4EAm61WsXNImXHwKLSOM8ZRQTP
 1FZf60EbYnuqx2K+vAHGm2oi4DwYItFHasAghRxtM02EnJtCE67nc4h9PEZw66Oz31sh
 Sknw==
X-Gm-Message-State: AFq9FYJnoUyeF/tJks8332geoeoXcLVfYlhgS3PdoXWC4HdZMcY07HcP
 wgpU3W20rcEyP0pV4qql7fKrjD2lmPxZTOOaaKAES4Vq0qfrRQ+Zo34ZPHhGew==
X-Gm-Gg: AYBFou2pxn9/9jFWn6gsMOzod+Jg2aePTW3p3i0DLclEVlajTth00vTZ+ZX8opOuk8+
 +rabwm/yXbKVAHNtZdeVAuG3+IgHZ7gDIXIjNH1pcvn/xWPdznh4IKL2OzZhYp6Vi48OWEQ5E4S
 Zw3PmKkrEg0NbIBnUHuEwU0I1hLDe8n9Pb+/JzvzgcMBMawGN9DZ9TXbbIRQs42blkb3/JS2dLm
 2cAa7BpqCaDJji/rOik7KCRECoztrAPaW2Nl7KLBd5r3RMqLI6fZkQgpiKxKKg3OMHxOGfFgWiC
 wefGJZD+VB3W3wZygBJEW+Nt19LSp/7bvze2SEUUZIJ4L9FmGzr/0E8obPhotOTljMraY6IwJF1
 T251mMw2BKWfKFTM9/13b/SuljaPcJZXopbhN597rqZnNJ3JIXRXZw7H15+SCz9TwWoNAfjqv1h
 7OPch1fm7wby4wX/saTLwicAUU1vTiePfqIMkDzBW4R3B5w8ayvBymBYOclHqxmDLc2h0wEp+gC
 pXoPqh7y+uRbh/6iVqeEsMh9u2c6L+P+Ds4BB9WMt7RW8B+Srql1OgQtIlH5+NIHdq0AG5muB3i
 NSvVyYsHZFWtKCvRd6rh8xXdRNiQ7/BXLKq2fXlnp1O0MCcpBN0LlA==
X-Received: by 2002:a05:600c:1c2a:b0:4a1:dfaf:f465 with SMTP id
 5b1f17b1804b1-4a35ac3a7d9mr77574565e9.4.1792912629223; 
 Sun, 25 Oct 2026 00:17:09 -0700 (PDT)
Received: from vm-2404.. (51.186.66.37.rev.sfr.net. [37.66.186.51])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-48e3ebcb8d5sm8918048f8f.28.2026.10.25.00.17.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2026 00:17:08 -0700 (PDT)
From: Francois Perrad <francois.perrad.86@gmail.com>
To: buildroot@busybox.net
Cc: Francois Perrad <francois.perrad.86@gmail.com>
Date: Sun, 25 Oct 2026 08:16:54 +0100
Message-ID: <20261025071654.193924-1-francois.perrad.86@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/domoticz: allow Lua 5.4
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: Francois Perrad <francois.perrad.86@gmail.com>
---
 package/domoticz/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/domoticz/Config.in b/package/domoticz/Config.in
index 2af63baec..a12f2322c 100644
--- a/package/domoticz/Config.in
+++ b/package/domoticz/Config.in
@@ -7,7 +7,7 @@ config BR2_PACKAGE_DOMOTICZ
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # mosquitto
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
-	depends on BR2_PACKAGE_LUA_5_3
+	depends on BR2_PACKAGE_LUA_5_3 || BR2_PACKAGE_LUA_5_4
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-thread
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # exception_ptr
 	select BR2_PACKAGE_BOOST
@@ -33,14 +33,14 @@ config BR2_PACKAGE_DOMOTICZ
 
 	  http://domoticz.com
 
-comment "domoticz needs lua 5.3 and a toolchain w/ C++, gcc >= 7, NPTL, wchar, dynamic library"
+comment "domoticz needs lua >= 5.3 and a toolchain w/ C++, gcc >= 7, NPTL, wchar, dynamic library"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
 		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_USE_WCHAR || BR2_STATIC_LIBS || \
-		!BR2_PACKAGE_LUA_5_3
+		!(BR2_PACKAGE_LUA_5_3 || BR2_PACKAGE_LUA_5_4)
 
 comment "domoticz needs exception_ptr"
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
