Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D559C433F5
	for <buildroot@archiver.kernel.org>; Tue, 12 Apr 2022 18:01:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E5DC183F8D;
	Tue, 12 Apr 2022 18:01:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 49qEP3LJTAHQ; Tue, 12 Apr 2022 18:01:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0303383F40;
	Tue, 12 Apr 2022 18:01:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DFF7B1BF3C6
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF15083F40
 for <buildroot@lists.busybox.net>; Tue, 12 Apr 2022 18:01:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZfOgZ1ga2NEE for <buildroot@lists.busybox.net>;
 Tue, 12 Apr 2022 18:01:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C601983F2A
 for <buildroot@busybox.net>; Tue, 12 Apr 2022 18:01:54 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r13so28838306wrr.9
 for <buildroot@busybox.net>; Tue, 12 Apr 2022 11:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QPvLK8TrOumlPIdCOiYudqXTPM1MuN0UbcwKKLHGicY=;
 b=BKGMQmPGmlVlNe05He3HIdPrnEIxQVlSL+oAd7UajD0cr9sW2fRJPnEcGyEFnU/N0C
 o9Filu7AmL9yIdqi9Gga5lVkC5LPWeXb2JTpMlHmxTheoPpEu27ccJ7/kUOKcT8pxKsL
 oMxENVKninvpf0PEmj/RBsw+9XuHMOOhfvvT5TE9Dg3HVwgDvkMS2mg7A/qwN+6Qa+fG
 B30GoUGXF4J0e1uSXOJX9OWqsTFgkiQWG3+BEQ6c/MC9ePB5Tw7+V0vaWKFBc7QjiD8p
 dYZChdWgTDAtlP0iRFe9JJwBPzV+R8qMVE0j/yRpMvj/kBOz48sQYi/qm86rvMjlYX0/
 1dIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QPvLK8TrOumlPIdCOiYudqXTPM1MuN0UbcwKKLHGicY=;
 b=6Kgw3w9tGclyGWFHOj/XEj/EtcFhwX16j6tE46dBwB57PiJpBfSRMGpmYAEbRgWxep
 SoHWnW7oAoikdjK1ouQfIjGj50q6mVOpW82S/MuS2qpB8QllfesmB7vIFAXVIspkDrf2
 aOVlBAX9IFMqlwN12Pf9yjfkm5Cru9w9/NhkdCjCUI3gdCJAc31T6Fa+Vj5H8crtsGHW
 /8OWTLbvbvLYRebZkkDd3Ub7lozDzcemylIp9pSXxBhEYXAh+ewBgqB/sEXQitcg21C4
 +EIu7FznXsloTGu1WWVpObv8eqCOMGvKjtj10xgGwdknJIId7yLTYkn7jZfhqWJ/vIrJ
 gp5A==
X-Gm-Message-State: AOAM533KMJjmZ2GnpH3k+B5Xbh4SzOEA7WNsjSvkzsPHrAUfPhV9izpi
 FTSIfQKLXLRZVezwLF9PfuQ+cgYVeOQ=
X-Google-Smtp-Source: ABdhPJw/MFfZa0rXgkhSqA0AdVAs1bYdo5u36FmOsA0VQKxLJwDz8tKH7ZKZq53HVeYIZRShw4RDSg==
X-Received: by 2002:adf:e687:0:b0:207:a4c4:b928 with SMTP id
 r7-20020adfe687000000b00207a4c4b928mr10237891wrm.629.1649786513111; 
 Tue, 12 Apr 2022 11:01:53 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a1c2b04000000b0038a0e15ee13sm180102wmr.8.2022.04.12.11.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Apr 2022 11:01:52 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue, 12 Apr 2022 20:01:39 +0200
Message-Id: <20220412180139.2709625-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/libepoxy: bump to version 1.5.10
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/libepoxy/libepoxy.hash | 4 ++--
 package/libepoxy/libepoxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libepoxy/libepoxy.hash b/package/libepoxy/libepoxy.hash
index 376920c3c..bf6c52f99 100644
--- a/package/libepoxy/libepoxy.hash
+++ b/package/libepoxy/libepoxy.hash
@@ -1,5 +1,5 @@
-# From http://ftp.gnome.org/pub/gnome/sources/libepoxy/1.5/libepoxy-1.5.9.sha256sum
-sha256  d168a19a6edfdd9977fef1308ccf516079856a4275cf876de688fb7927e365e4  libepoxy-1.5.9.tar.xz
+# From http://ftp.gnome.org/pub/gnome/sources/libepoxy/1.5/libepoxy-1.5.10.sha256sum
+sha256  072cda4b59dd098bba8c2363a6247299db1fa89411dc221c8b81b8ee8192e623  libepoxy-1.5.10.tar.xz
 
 # Hashes for license files:
 sha256  8d5144666f9c4df9bbd69b8900086d5979259152a1060421cdcc0fb9061a1c12  COPYING
diff --git a/package/libepoxy/libepoxy.mk b/package/libepoxy/libepoxy.mk
index 5a71fe599..2af2e2f6e 100644
--- a/package/libepoxy/libepoxy.mk
+++ b/package/libepoxy/libepoxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 LIBEPOXY_VERSION_MAJOR = 1.5
-LIBEPOXY_VERSION = $(LIBEPOXY_VERSION_MAJOR).9
+LIBEPOXY_VERSION = $(LIBEPOXY_VERSION_MAJOR).10
 LIBEPOXY_SITE = http://ftp.gnome.org/pub/gnome/sources/libepoxy/$(LIBEPOXY_VERSION_MAJOR)
 LIBEPOXY_SOURCE = libepoxy-$(LIBEPOXY_VERSION).tar.xz
 LIBEPOXY_INSTALL_STAGING = YES
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
