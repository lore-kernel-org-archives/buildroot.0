Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D929EE4993
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 16:50:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 11AF960AFD;
	Sun, 20 Aug 2023 16:50:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11AF960AFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PJJwJN34db5w; Sun, 20 Aug 2023 16:50:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5C5AB6060A;
	Sun, 20 Aug 2023 16:50:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C5AB6060A
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E9071BF373
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 16:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 078B76060A
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 16:50:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 078B76060A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KtPV63XZu81k for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 16:50:28 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AE3FE605D5
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 16:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE3FE605D5
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fed6c2a5cfso19890725e9.3
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 09:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692550226; x=1693155026;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oy4QpqI2lN/FVcgz8LRNCyexFmBueXmCpxSfRH5sKV4=;
 b=DbYWXUg0HWiOK66WtS6t4TKYeQYo0PsHebrlELwaoPIZ/pcc2fXg19VSxvOP8ym+8j
 a/epn0P8NCF7d18mhhGR8zwwWL97bwBUPabpfSPiZSmcFxKsy60esZwboPvy2jznz2Hp
 o3k2OjW72AQk1hxsPpOb4zMIMVvV6QlEHpnTVvPqrk6+BEqwiCClgpAkbkEMZE+5+Nh6
 5MzYsw+CX78XOHh2JiDeGRyPUseAbFf0Thr0+eSjxOaDRE7w8Cr7e38rl6zOZzniJZ83
 NsYPClefgGKps7kzUBJS2OhhWSh3nJDETelwKO+QugsCd1l32C0/8MiUSCRlM8V+zhI/
 u9+w==
X-Gm-Message-State: AOJu0Yz+j0BG7zZnPNSubqcQkR0Uguwe3zeP5LKINq6fWBysL0zZfF9Z
 ZSITtRpqnpmqkK7UdZ1D+v8iXWs8KqE=
X-Google-Smtp-Source: AGHT+IHS2dk5jjSE7LFO4yHwv4wrhjPc8R/lee50tTv8M4JA+K1hglbUlZGNl/pq3Q8JMz7a8fzo/g==
X-Received: by 2002:a7b:c7c3:0:b0:3fd:2e1d:eca1 with SMTP id
 z3-20020a7bc7c3000000b003fd2e1deca1mr3386829wmk.4.1692550225503; 
 Sun, 20 Aug 2023 09:50:25 -0700 (PDT)
Received: from localhost.localdomain ([2a01:cb19:8b44:b00:73e4:5f06:f514:c64d])
 by smtp.gmail.com with ESMTPSA id
 10-20020a05600c228a00b003fe4ca8decdsm13430534wmf.31.2023.08.20.09.50.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Aug 2023 09:50:25 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 20 Aug 2023 18:50:24 +0200
Message-Id: <20230820165024.2818686-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692550226; x=1693155026;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=oy4QpqI2lN/FVcgz8LRNCyexFmBueXmCpxSfRH5sKV4=;
 b=JCiiGQ1reQtLTdqG4hf35gst/A4cxrZp8WW0agXyuD/YHzIio3ZWKtrv2As+yHpJsG
 odc69AKo5iIuuk3FeupymBOhg75lP0FGj+WNYlEoMqgoDjSvPl7RJrAc0HSWt8HJUMgT
 RoRv6RE5OaA2nJn6WIrkDT/5G287nkuriKZCTZX+Hwmu2mhFjceDFdJcPORXJeQ6AGX4
 nNg6nYE5oO7HnmATeOYEauRO72KkWVZ9KkdekQjwkLkAuO0+XB7xN/3uPntze6jdZp5M
 xPWVThbBRWLJP0MhCY26PfR46FajtoreuP0YC08dktPVNM57s+sLq3AOi5ffQdgeQVE4
 s/NA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=JCiiGQ1r
Subject: [Buildroot] [PATCH] package/ca-certificates: create the bundle as
 target-finalize hook
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Other packages, or rootfs overlays, may install certificates, so only
create the certificate bundle as a target-finalize hook.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/ca-certificates/ca-certificates.mk | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/ca-certificates/ca-certificates.mk b/package/ca-certificates/ca-certificates.mk
index 202d0b92ac..fe115209a7 100644
--- a/package/ca-certificates/ca-certificates.mk
+++ b/package/ca-certificates/ca-certificates.mk
@@ -20,7 +20,9 @@ define CA_CERTIFICATES_INSTALL_TARGET_CMDS
 	$(INSTALL) -d -m 0755 $(TARGET_DIR)/etc/ssl/certs
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR=$(TARGET_DIR)
 	rm -f $(TARGET_DIR)/usr/sbin/update-ca-certificates
+endef
 
+define CA_CERTIFICATES_GEN_BUNDLE
 	# Remove any existing certificates under /etc/ssl/certs
 	rm -f $(TARGET_DIR)/etc/ssl/certs/*
 
@@ -30,14 +32,15 @@ define CA_CERTIFICATES_INSTALL_TARGET_CMDS
 	for i in `find usr/share/ca-certificates -name "*.crt" | LC_COLLATE=C sort` ; do \
 		ln -sf ../../../$$i etc/ssl/certs/`basename $${i} .crt`.pem ;\
 		cat $$i ;\
-	done >$(@D)/ca-certificates.crt
+	done >$(BUILD_DIR)/ca-certificates.crt
 
 	# Create symlinks to the certificates by their hash values
 	$(HOST_DIR)/bin/c_rehash $(TARGET_DIR)/etc/ssl/certs
 
 	# Install the certificates bundle
-	$(INSTALL) -D -m 644 $(@D)/ca-certificates.crt \
+	$(INSTALL) -D -m 644 $(BUILD_DIR)/ca-certificates.crt \
 		$(TARGET_DIR)/etc/ssl/certs/ca-certificates.crt
 endef
+CA_CERTIFICATES_TARGET_FINALIZE_HOOKS += CA_CERTIFICATES_GEN_BUNDLE
 
 $(eval $(generic-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
