Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2060C433EF
	for <buildroot@archiver.kernel.org>; Thu, 17 Feb 2022 21:46:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C02D6F75F;
	Thu, 17 Feb 2022 21:46:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H-_3jvcQm61i; Thu, 17 Feb 2022 21:46:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B6EE16F755;
	Thu, 17 Feb 2022 21:46:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 375A91BF37A
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:46:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 263A283FFB
 for <buildroot@lists.busybox.net>; Thu, 17 Feb 2022 21:46:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3SDQnhbk_FL5 for <buildroot@lists.busybox.net>;
 Thu, 17 Feb 2022 21:46:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 68E1183FFA
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 21:46:36 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id u1so11233135wrg.11
 for <buildroot@buildroot.org>; Thu, 17 Feb 2022 13:46:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BIdaN4cwP0aHXYTDaSwxQwsG66PPoCNW6Zyb/CDPUZc=;
 b=VhNCAlGZ14XMRpYjRqpzQunuG4LkN7VC5qoBjK+VpRzPkO7AHNyApuYdUNWliR2IIL
 OB1/fVFKQpeJfsd5jkWcU8ijxsAyLbedFIik9ljPcYHwQsqo83jcwr9dzxOCH6AlBF0m
 x87zQjZu3pwTE5MqoGQLd7j+HJ6kLCX/3idKwTGYPallzzlYw6ttttZccmrCjJ84m+mz
 8mWOjN04zAKeMXBgCO1viCVcu+D+EIJbxbP5NFqQK4O+X1aGWbpR2t3H2XHsmJiCquCv
 g6hv2U3f7CnIz7gbXnmT6DgllJJtubSH8JPAquDvjTDWofgFmGnQz7iCs6S/O5fVIkDx
 NYoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=BIdaN4cwP0aHXYTDaSwxQwsG66PPoCNW6Zyb/CDPUZc=;
 b=HdVOiu+gehAoK4SVmyMOpMk4sZTEtSk/fvZSyRbITLH78dopmQlNXDgWjIXo9xHx9J
 Ot3fga2l8arcmdvXFQsAWHlW4VyLs3HT/GHBAAOrtt+FDT7NitrdmaSo3t7lZuberK6H
 YFfUFXHjyLBwRkiUTEtomtz/x5kNfuPS73VvtgNse3FC1VyCmJB+aW3mA/F7dh9oLxmZ
 L+8wITJxJSu+5rKlnM5djz6+PL/0xfEttxkWKW7Sh8un/5znRh5aBmO8qRQdXqzm/pUP
 jDUYyU+y0lTAxksiRe6llGmHGHm87Ff4/JS4SA1ry8EHYMG42GPkGWIfp4mPmihWvOcp
 uJcQ==
X-Gm-Message-State: AOAM532jbqPx3kw5RO38jWLOdTFoxLCgI/2VC22iXGXbfe3JBk3uWVvY
 v/2FYnoa/fg6lGoE6rZyMZDmFGuEbZ8=
X-Google-Smtp-Source: ABdhPJwjNHZO52svauUKuuzwStz/jw78jDd7eofeAP8F46lRDaC/XBsKktIOzV0VQCYOJPjeBAi2Fg==
X-Received: by 2002:a5d:6205:0:b0:1e4:b3fd:9ba8 with SMTP id
 y5-20020a5d6205000000b001e4b3fd9ba8mr3712210wru.426.1645134394358; 
 Thu, 17 Feb 2022 13:46:34 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id i2sm2964172wmq.45.2022.02.17.13.46.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Feb 2022 13:46:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 17 Feb 2022 22:46:45 +0100
Message-Id: <20220217214645.555727-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/socketcand: don't override
 SOCKETCAND_CONF_OPTS
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

SOCKETCAND_CONF_OPTS is wrongly overridden in a conditional since commit
53e498da2f2ebfc87c3de0fe18bc9132e94b4fcb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/socketcand/socketcand.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/socketcand/socketcand.mk b/package/socketcand/socketcand.mk
index dbf859d3f9..1755d3ae56 100644
--- a/package/socketcand/socketcand.mk
+++ b/package/socketcand/socketcand.mk
@@ -13,7 +13,7 @@ SOCKETCAND_LICENSE_FILES = socketcand.c
 ifeq ($(BR2_PACKAGE_LIBCONFIG),y)
 SOCKETCAND_DEPENDENCIES += libconfig
 else
-SOCKETCAND_CONF_OPTS = --without-config
+SOCKETCAND_CONF_OPTS += --without-config
 endif
 
 $(eval $(autotools-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
