Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 741D8C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 11:01:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1305880B9B;
	Sun,  9 Jan 2022 11:01:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yZl4OTDvJv4p; Sun,  9 Jan 2022 11:01:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A82880BCF;
	Sun,  9 Jan 2022 11:01:44 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 39E341BF4DD
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:01:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F58C60B34
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 11:01:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ubv_sFsuD4OU for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 11:01:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0330860B2F
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 11:01:40 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id l4so6926718wmq.3
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 03:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FddDuFjNnqE5jbjgARMir8ynNMFoQs+MeYktlIbsHbA=;
 b=PVxDGl2x2kv+oYAFqUu/6fn9KPEDRu+EUUbZCwoI9xiqTtCAhcnSdZPtiS3clMQ2AR
 bjUf+CspY02EIUKUAKG7bYIRSKEeiFlEMefnco2KarDYfUrTIXc72fU7D/xiWif+2hJY
 zjF0aSls1ofWwV5RkKq0GmYmR1ePWqkUIm+xSZ79hmE5wJmwUIuyr63fBRHIviC9JTA9
 6MCuSiKjtAUpGNK6Ne7wwyXIOS3JgAut7AUZ4dsl8KfarN3WmCrqyY87JTxtG1PnFQiH
 Tk6jlC72cIp3RZ5MPtf5eNszyd5sKt7W3GiKV7TOz69CBknCp0sBO4+kRxYkCaMv0neT
 xeBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=FddDuFjNnqE5jbjgARMir8ynNMFoQs+MeYktlIbsHbA=;
 b=U6dYlbPcg/+acH113KHn9fNOENLb32ljI5DTtetkT41ru8oahG7dLcRJkdVoPSZd26
 aC570hSZCbkiziH0Z4JwvPsOyJrAbY4dkSCSRR3pBNwovcX+7Agb94DJ+BzyDkNDWa+7
 yd2XuILcl6fgZSON0g00HU+3kRjPUM6qTArbrGutbGOgdqSKOmSSjJpPAfCVhnHUp7+v
 wpK+h9Ed/qI0DmHPZq1gq7k2AnQ3enOOjaMObPObfW2shjCuHL26zQdoi2rUd3ZuthEd
 JoqBrszGI5saIU3burztoFAiywBLcu54VF33bVsnJPiN4xqSUg312gx4kwQw4tLQ1niF
 ycHQ==
X-Gm-Message-State: AOAM533Sy73HOn3tTM0I7maaWG0qXmq13EuFoenGRR4mwQdcAzSd/i8w
 s4mNgPxRtDL2Do9pMYPnLwQqdNlS58o=
X-Google-Smtp-Source: ABdhPJz8ZCjcUAA2KPCcDVG3FSL6065W5F7dHVJ0J5CiactEA87J6HhOqGtcu/R7Hym6amX/BpW80A==
X-Received: by 2002:a7b:c208:: with SMTP id x8mr12305988wmi.114.1641726099083; 
 Sun, 09 Jan 2022 03:01:39 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id az1sm3878445wrb.104.2022.01.09.03.01.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 03:01:38 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 12:01:30 +0100
Message-Id: <20220109110132.3430-1-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/skeleton-init-systemd: support
 /var/lock again
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
Cc: joseph.kogut@gmail.com, Norbert Lange <nolange79@gmail.com>,
 yann.morin.1998@free.fr, aduskett@gmail.com, maxime.hadjinlian@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

systemd's own configuration file is not installed anymore,
as side effect of disabling sysv support.

the funtionality is added back in skeleton-init-systemd,
since this is a buildroot feature to support software expecting
this directories to exist, as well as trying to be similar to
other init systems.

Signed-off-by: Norbert Lange <nolange79@gmail.com>
---
 package/skeleton-init-systemd/legacy.conf              | 7 +++++++
 package/skeleton-init-systemd/skeleton-init-systemd.mk | 1 +
 2 files changed, 8 insertions(+)
 create mode 100644 package/skeleton-init-systemd/legacy.conf

diff --git a/package/skeleton-init-systemd/legacy.conf b/package/skeleton-init-systemd/legacy.conf
new file mode 100644
index 0000000000..0a5393408c
--- /dev/null
+++ b/package/skeleton-init-systemd/legacy.conf
@@ -0,0 +1,7 @@
+# Create legacy directories for buildroot
+# This is a subset of systemd's legacy.conf
+
+d /run/lock 0755 root root -
+d /run/lock/subsys 0755 root root -
+
+L /var/lock - - - - ../run/lock
diff --git a/package/skeleton-init-systemd/skeleton-init-systemd.mk b/package/skeleton-init-systemd/skeleton-init-systemd.mk
index 5d6b716f7a..1e212cc2f7 100644
--- a/package/skeleton-init-systemd/skeleton-init-systemd.mk
+++ b/package/skeleton-init-systemd/skeleton-init-systemd.mk
@@ -62,6 +62,7 @@ define SKELETON_INIT_SYSTEMD_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/srv
 	mkdir -p $(TARGET_DIR)/var
 	ln -s ../run $(TARGET_DIR)/var/run
+	install -D -m644 $(SKELETON_INIT_SYSTEMD_PKGDIR)/legacy.conf $(TARGET_DIR)/usr/lib/tmpfiles.d/legacy.conf
 	$(SKELETON_INIT_SYSTEMD_ROOT_RO_OR_RW)
 endef
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
