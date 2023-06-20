Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D413EB64D8
	for <buildroot@archiver.kernel.org>; Tue, 20 Jun 2023 17:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 329EE416F8;
	Tue, 20 Jun 2023 17:07:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 329EE416F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mX2oanebVUrG; Tue, 20 Jun 2023 17:07:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69256405B2;
	Tue, 20 Jun 2023 17:07:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 69256405B2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BF8D81BF83B
 for <buildroot@lists.busybox.net>; Tue, 20 Jun 2023 17:07:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9CCB0405B2
 for <buildroot@lists.busybox.net>; Tue, 20 Jun 2023 17:07:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9CCB0405B2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R_DjLyNsNsIh for <buildroot@lists.busybox.net>;
 Tue, 20 Jun 2023 17:07:32 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 713AF405AA
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 713AF405AA
 for <buildroot@buildroot.org>; Tue, 20 Jun 2023 17:07:32 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-57015b368c3so42715977b3.3
 for <buildroot@buildroot.org>; Tue, 20 Jun 2023 10:07:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687280851; x=1689872851;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aSMlxYp7A6routjwPBXkts55rfs21Vn817xzg2XSdzk=;
 b=jO6UhPTZxmrATxf7OmpFgWx94yb451ymDDP2/U81+N2cWdtRDqJpk7UCrETv2t8q8d
 LiC1O3jD9u6oLNx35Vz1SZpr1CqKhl5oQ/E0jvgMrrH/+5sH/Y9/GkBP4yv9SnKZ58Mt
 pHifysCpEGFaJNxncmGG3F+1a+nBNYCe0BTVT8kgtnm2APjF9zuHLn677S3J7QbWACUa
 DELldGhddug026sDwWdCnK7lfShG6+Q9dMH5ykOER8Ma1Tf4P5S0RmLxwXGb+ZaPZvSv
 fT08SwamK8hAT067s2KHBnh0BCDzYGHJE/M7IpI0O29Ghcw4sY+J/rCWILwsSGas0hh5
 sV6w==
X-Gm-Message-State: AC+VfDwh0TPiWgdQmg1HOEddjKT+ZBKCbKcXu+VhA15olDR7O36F00yE
 cVhaVTFIBemV9DfwMRDRvWIMRlSad8M=
X-Google-Smtp-Source: ACHHUZ6D0nqjjF0j6vaiJXA1iNM6t7bA6dQDiLMmmhQWaA/qGBqTSa+1XuL9dH6aS8Wr53SCB/yT9w==
X-Received: by 2002:a81:bb4e:0:b0:570:25bc:fd58 with SMTP id
 a14-20020a81bb4e000000b0057025bcfd58mr10990361ywl.10.1687280850883; 
 Tue, 20 Jun 2023 10:07:30 -0700 (PDT)
Received: from CP-WR7J591QQC.attlocal.net
 (108-193-1-150.lightspeed.sntcca.sbcglobal.net. [108.193.1.150])
 by smtp.gmail.com with ESMTPSA id
 m67-20020a817146000000b00570336e2729sm588039ywc.24.2023.06.20.10.07.29
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 20 Jun 2023 10:07:30 -0700 (PDT)
From: Charles Hardin <ckhardin@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 20 Jun 2023 10:07:26 -0700
Message-Id: <20230620170726.3644-1-ckhardin@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1687280851; x=1689872851;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aSMlxYp7A6routjwPBXkts55rfs21Vn817xzg2XSdzk=;
 b=OJDRRMBOmrdMNhDK4ZKET24h9MUxh0k7s42oEC2yTnyy+xNswXSfZJ/UxJogQPpIgd
 zHk7JSmrkpMhZuLfHb5qMb/rKH3dXaV1bXcKnjULsdD8ui7CpbzPMNDDqh11yqCOmUSk
 IQa0dqVZBg6SLpTC5kinanQfqaOCnvM8tJCBFUaHO51vQ3NAuIMSW4DyM8ipbyhGbYxw
 +4NcXlI+OHlJXe5Rcc2gfAwKKe7SPEgAE1IjvtogRQ7/MaimFICRgY24BU0YlBFSBunL
 NBYpNiOv57jSLMhi7fS+V4ZU2Q5ONUuZkrZcPmKsWUGev7zQppwzG35InOtq0QkPS/xi
 +Jwg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=OJDRRMBO
Subject: [Buildroot] [PATCH 1/1] package/dhcp: fix dhcp symlink in
 target/var/lib/dhcp
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
Cc: Charles Hardin <ckhardin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

In a readonly fs configuration the skeleton-init-fs will move
the var directories to the usr/share/factory and the run a command
like this:

   mv $(TARGET_DIR)/var $(TARGET_DIR)/usr/share/factory/var
   mkdir -p $(TARGET_DIR)/var
   for i in $(TARGET_DIR)/usr/share/factory/var/* \
            $(TARGET_DIR)/usr/share/factory/var/lib/* \
            $(TARGET_DIR)/usr/share/factory/var/lib/systemd/*; do

If the symlink is to the /tmp directory the glob compare on the
dhcp link will evaluate and result in an incorrect entry being
created in the resulting tmpfs mount on var.

    L+! /var/lib/dhcp - - - - ../usr/share/factory//var/lib/dhcp

So, make the link relative and the result of the configuration
doesn't get impacted.

Signed-off-by: Charles Hardin <ckhardin@gmail.com>
---
 package/dhcp/dhcp.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/dhcp/dhcp.mk b/package/dhcp/dhcp.mk
index 7be40191c8..edbc6a0d2a 100644
--- a/package/dhcp/dhcp.mk
+++ b/package/dhcp/dhcp.mk
@@ -103,7 +103,7 @@ define DHCP_INSTALL_CTL_LIBS
 endef
 define DHCP_INSTALL_SERVER
 	mkdir -p $(TARGET_DIR)/var/lib
-	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
+	(cd $(TARGET_DIR)/var/lib; ln -snf ../../tmp dhcp)
 	$(MAKE) -C $(@D)/server DESTDIR=$(TARGET_DIR) install-sbinPROGRAMS
 	$(INSTALL) -m 0644 -D package/dhcp/dhcpd.conf \
 		$(TARGET_DIR)/etc/dhcp/dhcpd.conf
@@ -113,7 +113,7 @@ endif
 ifeq ($(BR2_PACKAGE_DHCP_RELAY),y)
 define DHCP_INSTALL_RELAY
 	mkdir -p $(TARGET_DIR)/var/lib
-	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
+	(cd $(TARGET_DIR)/var/lib; ln -snf ../../tmp dhcp)
 	$(MAKE) -C $(@D)/relay DESTDIR=$(TARGET_DIR) install-sbinPROGRAMS
 endef
 endif
@@ -121,7 +121,7 @@ endif
 ifeq ($(BR2_PACKAGE_DHCP_CLIENT),y)
 define DHCP_INSTALL_CLIENT
 	mkdir -p $(TARGET_DIR)/var/lib
-	(cd $(TARGET_DIR)/var/lib; ln -snf /tmp dhcp)
+	(cd $(TARGET_DIR)/var/lib; ln -snf ../../tmp dhcp)
 	$(MAKE) -C $(@D)/client DESTDIR=$(TARGET_DIR) sbindir=/sbin \
 		install-sbinPROGRAMS
 	$(INSTALL) -m 0644 -D package/dhcp/dhclient.conf \
-- 
2.39.2 (Apple Git-143)

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
