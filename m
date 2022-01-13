Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EF8C433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 23:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 89D3A40A7D;
	Thu, 13 Jan 2022 23:30:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zIPVYI1v5MZV; Thu, 13 Jan 2022 23:30:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9EE3F40A7A;
	Thu, 13 Jan 2022 23:30:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id E24901BF3E1
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 23:30:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A3EF4165B
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 23:30:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hXKaQBL3NWXK for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 23:30:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18CA34165F
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 23:30:27 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id q8so12796006wra.12
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 15:30:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=clseozheJlxxmui9/ZX/g9lhK9f51zhFc8HKclaqkXA=;
 b=JVS3OT9WuEQsQY9+2G1NJfOPkWZJ0wFkiB8rLR/Uyr+zmpWuLqc4zg37KIAqBDXTe4
 3SQvEeNqklrIRGuFx97STXLXQCdtvZF7WsUmS2Zo94P1fwZdxCjM2ayD5auhNjnwv8u4
 bRuM0uUyuFhGwZwia1MVdSWVYn0CW66xjcU3an2qXGNHwSDQ3sj0cufnENbs5ZeQKfDr
 t9JE2FFdtuVCeb9wOVxrb2vJxc2X00JgiZOeOy0GGTe8Gw8r2N0577OLhXQYXEp9TD1t
 QQci5WFDxwmIeS5pD23q3ilJEpaQX5dmH4UxzEhJbsq8ZxVkCex/2OzKOY9pKlHKinPI
 OMSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=clseozheJlxxmui9/ZX/g9lhK9f51zhFc8HKclaqkXA=;
 b=Z420EhS5Nlbv058rqVo1rc881zymFkSrX8tr7MHC3W1dDk7GspjHo5WpJudGpk6ZUZ
 ox1ACFHIaUKviBLoy8w2pIsrpdy2Ksgm08OyL1wReR3U4NfkUGx1wIdoIGd2iwXmvcPj
 y/BrQX0znMxbNxJr5N5Vh7aku2zAJHrTokGm+JkRDwJn/STF+7vi6Gy9diUQf/U99qaE
 GacSXHayxfgD408HXNG2a8SNxT0acf8jcFM3dvkw6xgyyK7Jv89e05pumw+aD5Iw0/zl
 IR/k+LodaSaWYRZ39K5C6QPahyyckmnN3Ljn2rP7o6Y9aH0u3hbM0BAyC1ps0ou9zQ7U
 X6dA==
X-Gm-Message-State: AOAM53010OW6jKBZTQ41MpdFOvzh0c6jPEbVK3vWK5pGKBTjfemJQNdn
 sp6XVtN3kko4csMxy5i+DF3tbVmxT0w=
X-Google-Smtp-Source: ABdhPJwbGMkn10LN1aJ5B903PWY1/QYi4gS0C1ypp1LQZVyQJWKsbHZHvJkNEaMRLDECOu8uGGtG/A==
X-Received: by 2002:adf:fc4d:: with SMTP id e13mr6001168wrs.716.1642116625206; 
 Thu, 13 Jan 2022 15:30:25 -0800 (PST)
Received: from kali.home (lfbn-ren-1-358-126.w2-10.abo.wanadoo.fr.
 [2.10.19.126])
 by smtp.gmail.com with ESMTPSA id z4sm3469514wmf.44.2022.01.13.15.30.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 15:30:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 14 Jan 2022 00:29:03 +0100
Message-Id: <20220113232903.318853-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/1] package/gensio: add avahi optional dependency
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

avahi-client is an optional dependency which is enabled by default since
version 2.2.0 and
https://github.com/cminyard/gensio/commit/5ab117c9743fd4719f610cf9f1ba45023cc25d7c

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Use BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT

 package/gensio/gensio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/gensio/gensio.mk b/package/gensio/gensio.mk
index 389de1e263..266ac137a2 100644
--- a/package/gensio/gensio.mk
+++ b/package/gensio/gensio.mk
@@ -9,6 +9,7 @@ GENSIO_SITE = http://downloads.sourceforge.net/project/ser2net/ser2net
 GENSIO_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (tools)
 GENSIO_LICENSE_FILES = COPYING.LIB COPYING
 GENSIO_INSTALL_STAGING = YES
+GENSIO_DEPENDENCIES = $(if $(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),avahi)
 GENSIO_CONF_OPTS = \
 	--without-openipmi \
 	--without-swig \
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
