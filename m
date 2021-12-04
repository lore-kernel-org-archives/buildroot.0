Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18D85C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 21:33:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B2FF880DCE;
	Sat,  4 Dec 2021 21:33:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qGLUa-cqoPWL; Sat,  4 Dec 2021 21:33:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 08E2F80DBF;
	Sat,  4 Dec 2021 21:33:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5ABB61BF36B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:33:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 375F680DBF
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:33:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EkIQfk0eZ9Pr for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 21:33:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 079CF80C0B
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 21:33:32 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 az34-20020a05600c602200b0033bf8662572so4898689wmb.0
 for <buildroot@buildroot.org>; Sat, 04 Dec 2021 13:33:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NZNVVpipzI2UYwFgY/Y5z50nObmC8WEXrf3OCbm8P78=;
 b=Qzg3HBIyCgRGNYAjRfYnXzWcvpc+3u6/Is7doGW++cf+nEr86jvkjcUXnlNdCRwXh1
 LytyrHtAqgvnXZOjQ/ul/ntY1JQGBFZ4VLVN1qx5EuMVjUbsM8tt1GC73lAMyUoZ30Rj
 noU7G/yZqgHW7y3gamDGJXFBTAegR3i4Uo3fzhmSTPpD7z4Hdlc0KzBLhlxElh82bfl8
 2zaJxhM3DJIgr4Ry0QhLDe3GZ1gnDOZDUlxXvF+CRmKDXbWgaFwTtqXDOHV3GTjCDjUO
 FGEN060iPla+yRlN66cL9OnOa8IKu4YIuAE/JUpQChDp4JeXAnGYM9cfdj0C2zyraJ1y
 T46w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NZNVVpipzI2UYwFgY/Y5z50nObmC8WEXrf3OCbm8P78=;
 b=GMFa/AdlRCqde/qU14ypPug9u4/VfZPsbiAEEELkcOIsyQyRbpF8uy8EjYAagl9o5S
 1OSiOL6voZpCPsjkyVX/O8mhUH8FphsMbyfGiXlKunSI7bnZM6oIpLJYspuFw8Kg3Jfs
 J/WbXdnirgcXuZ7zqr0nUhM+rB0+fSYz5PWrPquFw33JmT1VSOe1kBcINCpgg7j31DQG
 yrERoBCBU2SfBqGbN9K98KtYbz16eOWSC3Z4hmpQGegmWM0ogUSjBFLyvdQbgwT2kRE0
 8E3R2hFAt6IHqnDmSCQG9Y9JZjFaDlH4lKsmiYHlejm6jkxJWnHWY3Z01GKCgxkjzLKm
 meDA==
X-Gm-Message-State: AOAM533o0YcaW0aqoEBRSragZa/Yuowdo993dnuJf8qqGSP3F9MaB8Lp
 gZsFdyzUz3avVKq4PZd71/W/zwcjBBENlg==
X-Google-Smtp-Source: ABdhPJyg6DW/eqzelsFhVl8S8wOtI5STwF1c2srAVtxPH642npcJfJvDTaFGWJIFMEJTvjG7OU8ioA==
X-Received: by 2002:a1c:4e17:: with SMTP id g23mr27523173wmh.158.1638653610914; 
 Sat, 04 Dec 2021 13:33:30 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id l7sm7917729wry.86.2021.12.04.13.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Dec 2021 13:33:30 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Dec 2021 22:33:39 +0100
Message-Id: <20211204213339.2019845-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/unrar: add UNRAR_CPE_ID_VENDOR
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

cpe:2.3:a:rarlab:unrar is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Ararlab%3Aunrar

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/unrar/unrar.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/unrar/unrar.mk b/package/unrar/unrar.mk
index ab8d9228c8..3c8e37a220 100644
--- a/package/unrar/unrar.mk
+++ b/package/unrar/unrar.mk
@@ -9,6 +9,7 @@ UNRAR_SOURCE = unrarsrc-$(UNRAR_VERSION).tar.gz
 UNRAR_SITE = https://www.rarlab.com/rar
 UNRAR_LICENSE = unrar
 UNRAR_LICENSE_FILES = license.txt
+UNRAR_CPE_ID_VENDOR = rarlab
 
 define UNRAR_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) CXX="$(TARGET_CXX)" STRIP="/bin/true" \
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
