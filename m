Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E83C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Dec 2021 11:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C9F4B607FD;
	Sun,  5 Dec 2021 11:22:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mtqof7-1QqKM; Sun,  5 Dec 2021 11:22:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 40B55607D9;
	Sun,  5 Dec 2021 11:22:20 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0446B1BF27E
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 11:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E2F6D4040E
 for <buildroot@lists.busybox.net>; Sun,  5 Dec 2021 11:22:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DSPgYynW_own for <buildroot@lists.busybox.net>;
 Sun,  5 Dec 2021 11:22:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2774B40155
 for <buildroot@buildroot.org>; Sun,  5 Dec 2021 11:22:17 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id a11so7375051ilj.6
 for <buildroot@buildroot.org>; Sun, 05 Dec 2021 03:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AA0mqCWEEzVa7ZXdVCFcl27Q9F+RJm9G40LpMXoeg3k=;
 b=UYdes6BgHgbnBLzQr3jLUg6UlciW1JlY47G4sAO0oTVNt7asIZZt+ShkHh4VU+gUFp
 h9t9mycdaOGqFEhUyYq8PYJAPiUMjQmJW79lwsUFj4cZmaTr1Iw3KkzueDGQkRwZtiZi
 9bZyNCxPUN908eEsmeKiX4phZjioMStqNZmuCryqaY5JTg+36Vj6YALg8D64x+1PjWDT
 dzQATjAhL0bbh9RxGSWgwbBbCEYbxZ4AYwWKwtVDEQJmiPN9vltCqqW2VQeltkkE+CXV
 j+58IukGztvkPGFxIx3YJodsl7IWzyg/zPagl9xsKz0KfjOVYk/fuL7gIlAmtV1U7CEH
 tGIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AA0mqCWEEzVa7ZXdVCFcl27Q9F+RJm9G40LpMXoeg3k=;
 b=vBuLZbjfE0SyXBjZiNEjcDZWPhQ+aUmhUBzvaNTZ5Kyp4aNA5Of27fugCCaXNtY/Qa
 OnPcChjEFesFeKC5PCjPim6Ymj9ynvCBdQCAso0zZPDD4V7TDOuvYMKCXkx82qqVlaEP
 DvxAK3wH4W7TLlYd1MSWMU36nDwOgEE1v41RwoB1Zo7FLMuLvnoseuTEmq5KERnrn4bA
 GT/s1J8/YUuYzWgKaHNfFifG//+Xqr/7kgCRq1k8ld7svGse1D2TVK4BlQeMzHsNAAae
 PVPnNJShT2rUxP1R7HHf4LLl/SAiP5+rP9AXqoX//jFyKz4rMRGJSjuAPkqhTFyJm74H
 xj3A==
X-Gm-Message-State: AOAM532TrcA03SbRpV/JIwgNyzevA59RpkS5VC42e+SODTfoO6eQV0i1
 SI7hxyVYTi6PXG2UBNJSlblSrAscNmU=
X-Google-Smtp-Source: ABdhPJzczaoM0s8dU7KiCWkysAP/YhcQhM+V6FUxtcdQXpt21uAH7fmXHyN02w7NRxRd47xyiFTuhw==
X-Received: by 2002:a05:6e02:1c85:: with SMTP id
 w5mr29152546ill.211.1638703336093; 
 Sun, 05 Dec 2021 03:22:16 -0800 (PST)
Received: from james-x399.localdomain (71-218-107-26.hlrn.qwest.net.
 [71.218.107.26])
 by smtp.gmail.com with ESMTPSA id f2sm5543906ilu.2.2021.12.05.03.22.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Dec 2021 03:22:15 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Dec 2021 04:22:11 -0700
Message-Id: <20211205112211.2919028-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v3 1/1] package/network-manager: add optional
 systemd support
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/network-manager/network-manager.mk | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index a787c25c00..974320fce0 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -113,6 +113,21 @@ else
 NETWORK_MANAGER_CONF_OPTS += --without-ofono
 endif
 
+ifeq ($(BR2_PACKAGE_SYSTEMD),y)
+NETWORK_MANAGER_DEPENDENCIES += systemd
+NETWORK_MANAGER_CONF_OPTS += \
+	--with-systemd-journal \
+	--with-config-logging-backend-default=journal \
+	--with-session-tracking=systemd \
+	--with-suspend-resume=systemd
+else
+NETWORK_MANAGER_CONF_OPTS += \
+	--without-systemd-journal \
+	--with-config-logging-backend-default=syslog \
+	--without-session-tracking \
+	--with-suspend-resume=upower
+endif
+
 ifeq ($(BR2_PACKAGE_POLKIT),y)
 NETWORK_MANAGER_DEPENDENCIES += polkit
 NETWORK_MANAGER_CONF_OPTS += --enable-polkit
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
