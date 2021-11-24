Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED4EC433FE
	for <buildroot@archiver.kernel.org>; Wed, 24 Nov 2021 07:47:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35B7E404B7;
	Wed, 24 Nov 2021 07:47:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id chWoY4ITIAlw; Wed, 24 Nov 2021 07:47:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A1D4740458;
	Wed, 24 Nov 2021 07:47:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 264871BF42E
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 07:47:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 13956400D6
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 07:47:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hdvSFchTT3df for <buildroot@lists.busybox.net>;
 Wed, 24 Nov 2021 07:47:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 97ABC40003
 for <buildroot@buildroot.org>; Wed, 24 Nov 2021 07:47:13 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id d24so2598652wra.0
 for <buildroot@buildroot.org>; Tue, 23 Nov 2021 23:47:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vgftccGWDssacjj1MQE4g+sFGpv327i5qIkOx1XrzvY=;
 b=EkCyuO7X9jcg6JicAxj7PuxJqgkFFCVKugxskg1hXnwgWtGFpMGDjz5EHDHXMqJPUH
 mBKeIlcssDrU8TEFWtdgCQUnrPrNHhpKYV6XzitfKdBid8n/p2wXr0yF6s6dT310c/ms
 HB6q3GI5Jb6ASWMk+7oXe0TTRmdxlJfxvXYWmpgcXjAilUvQ/1oCmFqeJx/OxL0D+ZqU
 ASMCguKt49shtwx/tk/6TR86tv97ng/GhYtc7swPEDV48iXLFSc81mZUFB/nIHUF75+J
 GYxkUZzaBMamE6AkQ10G09o4dFx8TAq8stDOOR+pg4r/BeoM7t3EL7Lv7oHE+3AfPWvq
 jW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vgftccGWDssacjj1MQE4g+sFGpv327i5qIkOx1XrzvY=;
 b=TlkGdCW+de32Ru5PVBBbGe1W+fTNbSqgUTGy5YRdH8xO0MfhU1vYkVRqDjpYmgTOwQ
 u97IcJ+JLNSok9Vv/aXm5BUl3LeHm6q251yUQTXk6ah3ArbTf9c6+dk79CARg6fVBUpY
 y7U/SbE0kEF8lVSv/SDQB6nTP4jAnE41B/qw2kg8oFgIClA0lkrMmVcK7woH78PteEbI
 OoGTv1s/WgbOdGzctFgFJokh+7/sH8zlOCyZUXS2IsQU11xjtFtRg5ldbdb7ZmVuqTcZ
 vu3rpJ7KRgAv0TJWdep7eNsAzoxmAsynA/PAkxlZfDdiV+ZWRyV5gx7FnbKnpd8S7Qds
 x3fg==
X-Gm-Message-State: AOAM532LXWKB5jE0aYBFrQdfh4T2vGxFvpLj69FHkiTqKvoJ6TtQT40v
 0yAGi52SLb4pJXCS+KrJoc3mHJzeVio=
X-Google-Smtp-Source: ABdhPJws99pJw55pjZ+HwhliDdfUjO0xJ4SyU+kVfPKMOXaFUNLe8/Kh1NoClaIDxbsIUzunTvjVeg==
X-Received: by 2002:a5d:6d41:: with SMTP id k1mr15882752wri.134.1637740031443; 
 Tue, 23 Nov 2021 23:47:11 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id b197sm3583271wmb.24.2021.11.23.23.47.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 23:47:10 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 24 Nov 2021 08:44:38 +0100
Message-Id: <20211124074438.3917455-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/mtd: drop unrecognized option
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

install-tests option has been removed since version 2.1.3 and
http://git.infradead.org/mtd-utils.git/commitdiff/7170a28d46d5db1e7a9da24a5555a194a233ef0b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mtd/mtd.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mtd/mtd.mk b/package/mtd/mtd.mk
index 6385b9ee0a..9f4cc27ef1 100644
--- a/package/mtd/mtd.mk
+++ b/package/mtd/mtd.mk
@@ -47,9 +47,9 @@ MTD_CONF_OPTS += --disable-ubihealthd
 endif
 
 ifeq ($(BR2_PACKAGE_MTD_TESTS),y)
-MTD_CONF_OPTS += --enable-tests --enable-install-tests
+MTD_CONF_OPTS += --enable-tests
 else
-MTD_CONF_OPTS += --disable-tests --disable-install-tests
+MTD_CONF_OPTS += --disable-tests
 endif
 
 # If extended attributes are required, the acl package must
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
