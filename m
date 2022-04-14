Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8485EC433F5
	for <buildroot@archiver.kernel.org>; Thu, 14 Apr 2022 16:43:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DAF4C4094E;
	Thu, 14 Apr 2022 16:43:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BO1xGfADrDz4; Thu, 14 Apr 2022 16:43:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B7E414091E;
	Thu, 14 Apr 2022 16:43:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F00CD1BF34D
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 16:43:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCC6B4091E
 for <buildroot@lists.busybox.net>; Thu, 14 Apr 2022 16:43:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mUbV66XJrNz3 for <buildroot@lists.busybox.net>;
 Thu, 14 Apr 2022 16:43:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E41F540902
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 16:43:11 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id e21so7698895wrc.8
 for <buildroot@buildroot.org>; Thu, 14 Apr 2022 09:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bTP31FNlW77W6FoLIcQiFr8ss7XtoXc1AlZHwDmYbLM=;
 b=KUqPKcFQ6kzC3dXDDQnMFLl5WVv+zWbr+kjlYNl6HGbE86wht/IUM69WRb5ICkNuhh
 nDQSBpPqpJDqxGOxL3ajdmENXkRf00MGd89bh6C1r9jVPyzxGpSfaBeMfK5IE9uUICzW
 gIZOt1/ZtBxBZddP29RJRJDwyh9vSRnvSkRdGCmcZVh7FMwyzScXaLSZj0i7kKE2U/0W
 i7R6uj5lhs144chwq7JNPoJ99bpsQsTX7VKRdvkrkTrdnnr/5GuRYMAoFWR/ctlXzYkb
 OQruFikLlCGYGnIzZQPVHgopGQnPlqamnBVAAR5j1pwwDJkAw5NH9Fi5mtv9PaZxd+eZ
 4hEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bTP31FNlW77W6FoLIcQiFr8ss7XtoXc1AlZHwDmYbLM=;
 b=YYZmN4RQlrWmc+yMCTtueaxI9ZPGzo1l7RRt0SFR9GW7J5PUOuB8XKjLq9O2E9zvRi
 x6M4st7V5sC1pqVOTH4Q9Y3r2dxtK0jignO5UFhAkBPSDhL9x2IijIEu79AvIuQsjGZh
 K4urKU1oZV//TuhDtq8Va5CqLP2XeveISRGGdguIszaFYkzORTcqWUbz0U/EBaqBYNkA
 KB+CqIk5wq4hCgn4JK7j49u+yaMqxONxJYI36NItQUtXtGPmkPq9YzOASlABMju+zMjQ
 CdnpZEcOZ5Av8YeNFc+wx6OXKH8UjZQFBYlIWO/drIqb2P9Mp8LtDSlDkmC9BSgOra0k
 mCPw==
X-Gm-Message-State: AOAM532iMcBuEAZg57dmfqXXfI5BflYkcFZ/VZolR9zk6fcEcckl4U1/
 g2b1DeLvgk8DJzmzVVNZ1Hf2/GhYFiQ=
X-Google-Smtp-Source: ABdhPJz4wr/43ZfsEZplsSz1madh6Q8A0BKzVtTNxuqipu7tXgK+K9dcLTRKY384rt9V++poUs5CeA==
X-Received: by 2002:a05:6000:70a:b0:207:a120:bfbd with SMTP id
 bs10-20020a056000070a00b00207a120bfbdmr2685948wrb.142.1649954589727; 
 Thu, 14 Apr 2022 09:43:09 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 i9-20020a5d5849000000b002058631cfacsm2483230wrf.61.2022.04.14.09.43.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 09:43:09 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 14 Apr 2022 18:41:09 +0200
Message-Id: <20220414164109.1724873-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/dhcp: fix install of internal bind
 libraries
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

Internal bind libraries are not installed to target since commit
0c8dd6ebd656e06cf99a63eb93343715f4853503 resulting in the following
runtime failure:

Starting DHCP server: /usr/sbin/dhcpd: error while loading shared libraries: libirs.so.161: cannot open shared object file: No such file or directory

RANLIB must also be set to avoid the following build failure at install
step:

libtool: install: arceb-buildroot-linux-uclibc-ranlib /home/fabrice/buildroot/output/per-package/dhcp/target/usr/lib/libisccfg.a
/home/fabrice/buildroot/output/build/dhcp-4.4.3/bind/bind-9.11.36/libtool: line 1719: arceb-buildroot-linux-uclibc-ranlib: command not found

Fixes:
 - No autobuilder failures (reported by Eugen.Hristev@microchip.com)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/dhcp/dhcp.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index c58592cc45..6ac9ed0147 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -28,7 +28,8 @@ DHCP_BIND_EXTRA_CONFIG = \
 	BUILD_CC='$(HOSTCC)' \
 	BUILD_CFLAGS='$(HOST_CFLAGS)' \
 	BUILD_CPPFLAGS='$(HOST_CPPFLAGS)' \
-	BUILD_LDFLAGS='$(HOST_LDFLAGS)'
+	BUILD_LDFLAGS='$(HOST_LDFLAGS)' \
+	RANLIB='$(TARGET_RANLIB)'
 
 DHCP_CONF_ENV += ac_cv_prog_AWK=$(HOST_DIR)/bin/gawk
 
@@ -70,6 +71,7 @@ DHCP_CONF_OPTS += --enable-delayed-ack
 endif
 
 define DHCP_INSTALL_LIBS
+	$(MAKE) -C $(@D)/bind install-bind DESTDIR=$(TARGET_DIR)
 	$(MAKE) -C $(@D)/common install-exec DESTDIR=$(TARGET_DIR)
 	$(MAKE) -C $(@D)/omapip install-exec DESTDIR=$(TARGET_DIR)
 endef
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
