Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78AF9C47258
	for <buildroot@archiver.kernel.org>; Tue, 23 Jan 2024 19:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E7F6440462;
	Tue, 23 Jan 2024 19:09:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E7F6440462
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i0GEU7-YkHxc; Tue, 23 Jan 2024 19:09:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id DCA2640484;
	Tue, 23 Jan 2024 19:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DCA2640484
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 29D451BF852
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 19:09:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F04F660D7B
 for <buildroot@lists.busybox.net>; Tue, 23 Jan 2024 19:09:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F04F660D7B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LzvUTDgOVUs5 for <buildroot@lists.busybox.net>;
 Tue, 23 Jan 2024 19:09:06 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59FD260D68
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 19:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59FD260D68
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-40e7065b692so50979905e9.3
 for <buildroot@buildroot.org>; Tue, 23 Jan 2024 11:09:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706036943; x=1706641743;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+io72VlfX3y4t/jKcBAQCRs5KH/CZEZKbGCPCkFmReY=;
 b=i55e5KZW7pC3nXl4FTZe9fdANqGQ8Ep+WbYRqJI5wYTSbdoY8DCBFBn5SGldwqMnJV
 M8LStE6KeuLHeKmcQtEwt1VybGl7GOfx9+SB0z6w0jpCPuJ224uxUFjm4z7pN2bCmZmm
 Merfvrp3xbJ5dwgpA/PjJUY0w4rmIUzqvlPDvKxhUb0H3bQ1u8nxMktFzMyDVvww0QkV
 Vct2e1WdQyJulocRUOQdtgh6w51kjbsEzbN8IXaLlf5TIvpu2Cin7SpGGxXr5UBuObX0
 ylED8SIv0NhbBsNrECVk+14TPxndArDnOpTeaRzWFVyeErKDKNfLPaMWu4YQtE4AJhI5
 eZDw==
X-Gm-Message-State: AOJu0Yw1fF8w6xY0Pp5yJVoc9l+WWrb07ROibdNXne6zM0/D7bSfVZql
 eG4df0CWcorVeH0HWwG023/fKx2v4pwvJ3A1BWLqJL1E4KyWaMz+DqsYIDjC
X-Google-Smtp-Source: AGHT+IGfNEhLXL5T+ICyUUJ5S9ZYBwsvPHM45ceWk352cl195kULZAbam5zBlvhUzMzmiq21+RAE4w==
X-Received: by 2002:a05:600c:19d3:b0:40e:7b39:183b with SMTP id
 u19-20020a05600c19d300b0040e7b39183bmr393991wmq.42.1706036942911; 
 Tue, 23 Jan 2024 11:09:02 -0800 (PST)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 fa6-20020a05600c518600b0040e861ad5d2sm25321365wmb.0.2024.01.23.11.09.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 11:09:02 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 23 Jan 2024 20:09:02 +0100
Message-ID: <20240123190902.1285941-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706036943; x=1706641743; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=+io72VlfX3y4t/jKcBAQCRs5KH/CZEZKbGCPCkFmReY=;
 b=Sz17KYZlrY2gbaLeGd4G6P1wKechwmlUJDO7CGUxAl1+ZzPno9LE1kdv2L6zUmw0lM
 lam6TajHuvhYeWgByiL91DDLSnfkwph8T8AdbIYEDxZF9vU4VDOSUxx/CUyqeUX3fRdM
 NVdXu5ztR3kk4d4bBTnWPkjSgAXvArUAxZNF0IELCcDDEByMQlWcFQrZ0M6L5ukeHcBd
 urR6xwvche5nVTQhKtNK4Ea49skNm213QwoP/k9Hr555CxNgQYVmhdddk9adUJncnaHs
 JA7acdNJmiELa4TcRCaAJUyhSvyoaWR5Gb2rxRizvxuPcKgWOQ0orkEFQMmzqob56Fyi
 aqtQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Sz17KYZl
Subject: [Buildroot] [PATCH] package/libvirt: do not use 'qemu' user if not
 defined
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
Cc: Alessandro <alex@0x65c.net>, "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit ed12e2fbed3d (package/libvirt: add lxc and qemu options)
introduced the definition of the 'qemu' user when the libvirt daemon
is enabled, but unconditionally uses that user in its permissions
table.

Move the permissions needing the 'qemu' user under the same condition
the 'qemu' user is defined under. It means that a few permissions
needing root must also be moved, as they belong under a directory
needing the 'qemu' user. It also moves a few qemu-related permissions
introduced in that same commit. The list of qemu permissions is
reordered alphabetically (the others are left unchanged).

Of course, it also requires that the qemu-related directory and symlink
be moved under the same condition as well.

Reported-by: Alessandro <alex@0x65c.net>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Jared Bents <jared.bents@rockwellcollins.com>
---
 package/libvirt/libvirt.mk | 54 ++++++++++++++++++++++----------------
 1 file changed, 32 insertions(+), 22 deletions(-)

diff --git a/package/libvirt/libvirt.mk b/package/libvirt/libvirt.mk
index 1dc61a7549..7f2a33e926 100644
--- a/package/libvirt/libvirt.mk
+++ b/package/libvirt/libvirt.mk
@@ -250,6 +250,36 @@ define LIBVIRT_INSTALL_UDEV_RULES
 endef
 LIBVIRT_POST_INSTALL_TARGET_HOOKS += LIBVIRT_INSTALL_UDEV_RULES
 
+ifeq ($(BR2_PACKAGE_LIBVIRT_QEMU),y)
+define LIBVIRT_USERS_QEMU
+	qemu -1 kvm -1 * - - - Libvirt qemu/kvm daemon
+endef
+define LIBVIRT_PERMISSIONS_QEMU
+	/var/cache/libvirt/qemu                  d  750  qemu  kvm   -  -  -  -  -
+	/var/cache/libvirt/qemu/capabilities     d  755  root  root  -  -  -  -  -
+	/var/lib/libvirt/qemu                    d  751  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/autostart          d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt/qemu/channel            d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/channel/target     d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/dump               d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/networks           d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt/qemu/networks/autostart d  700  root  root  -  -  -  -  -
+	/var/lib/libvirt/qemu/nvram              d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/save               d  755  qemu  kvm   -  -  -  -  -
+	/var/lib/libvirt/qemu/snapshot           d  755  qemu  kvm   -  -  -  -  -
+	/var/log/libvirt/qemu                    d  750  root  root  -  -  -  -  -
+	/var/log/swtpm/libvirt/qemu              d  711  root  root  -  -  -  -  -
+endef
+define LIBVIRT_CREATE_SYMLINKS_QEMU
+	$(INSTALL) -m 751 -d $(TARGET_DIR)/var/lib/libvirt/qemu
+	ln -s -f ../../var/lib/libvirt/qemu $(TARGET_DIR)/etc/libvirt/
+endef
+endif
+
+define LIBVIRT_USERS
+	$(LIBVIRT_USERS_QEMU)
+endef
+
 # Adjust directory ownerships and permissions. Notice /var/log is a symlink to
 # /tmp in the default sysvinit skeleton, so some directories may disappear at
 # run-time. Set the permissions anyway, since they are valid for the default
@@ -263,29 +293,16 @@ define LIBVIRT_PERMISSIONS
 	/var/lib/libvirt/filesystems             d  711  root  root  -  -  -  -  -
 	/var/lib/libvirt/images                  d  711  root  root  -  -  -  -  -
 	/var/lib/libvirt/network                 d  700  root  root  -  -  -  -  -
-	/var/lib/libvirt/qemu                    d  751  qemu  kvm   -  -  -  -  -
-	/var/lib/libvirt/qemu/autostart          d  700  root  root  -  -  -  -  -
-	/var/lib/libvirt/qemu/networks           d  700  root  root  -  -  -  -  -
-	/var/lib/libvirt/qemu/networks/autostart d  700  root  root  -  -  -  -  -
-	/var/lib/libvirt/qemu/channel            d  755  qemu  kvm   -  -  -  -  -
-	/var/lib/libvirt/qemu/channel/target     d  755  qemu  kvm   -  -  -  -  -
-	/var/lib/libvirt/qemu/dump               d  755  qemu  kvm   -  -  -  -  -
-	/var/lib/libvirt/qemu/nvram              d  755  qemu  kvm   -  -  -  -  -
-	/var/lib/libvirt/qemu/save               d  755  qemu  kvm   -  -  -  -  -
-	/var/lib/libvirt/qemu/snapshot           d  755  qemu  kvm   -  -  -  -  -
 	/var/lib/libvirt/secrets                 d  700  root  root  -  -  -  -  -
 	/var/lib/libvirt/storage                 d  755  root  root  -  -  -  -  -
 	/var/lib/libvirt/storage/autostart       d  755  root  root  -  -  -  -  -
 	/var/cache/libvirt                       d  711  root  root  -  -  -  -  -
 	/var/cache/libvirt/lxc                   d  750  root  root  -  -  -  -  -
-	/var/cache/libvirt/qemu                  d  750  qemu  kvm   -  -  -  -  -
-	/var/cache/libvirt/qemu/capabilities     d  755  root  root  -  -  -  -  -
 	/var/log/libvirt                         d  700  root  root  -  -  -  -  -
 	/var/log/libvirt/lxc                     d  750  root  root  -  -  -  -  -
-	/var/log/libvirt/qemu                    d  750  root  root  -  -  -  -  -
 	/var/log/swtpm                           d  755  root  root  -  -  -  -  -
 	/var/log/swtpm/libvirt                   d  755  root  root  -  -  -  -  -
-	/var/log/swtpm/libvirt/qemu              d  711  root  root  -  -  -  -  -
+	$(LIBVIRT_PERMISSIONS_QEMU)
 endef
 
 # libvirt may need to create persistent files (e.g. VM definitions) in these
@@ -296,22 +313,15 @@ endef
 define LIBVIRT_CREATE_SYMLINKS
 	$(INSTALL) -m 700 -d $(TARGET_DIR)/etc/libvirt
 	$(INSTALL) -m 755 -d $(TARGET_DIR)/var/lib/libvirt
-	$(INSTALL) -m 751 -d $(TARGET_DIR)/var/lib/libvirt/qemu
 	$(INSTALL) -m 700 -d $(TARGET_DIR)/var/lib/libvirt/secrets
 	$(INSTALL) -m 755 -d $(TARGET_DIR)/var/lib/libvirt/storage
-	ln -s -f ../../var/lib/libvirt/qemu $(TARGET_DIR)/etc/libvirt/
 	ln -s -f ../../var/lib/libvirt/secrets $(TARGET_DIR)/etc/libvirt/
 	ln -s -f ../../var/lib/libvirt/storage $(TARGET_DIR)/etc/libvirt/
+	$(LIBVIRT_CREATE_SYMLINKS_QEMU)
 endef
 
 LIBVIRT_PRE_INSTALL_TARGET_HOOKS += LIBVIRT_CREATE_SYMLINKS
 
-ifeq ($(BR2_PACKAGE_LIBVIRT_QEMU),y)
-define LIBVIRT_USERS
-	qemu -1 kvm -1 * - - - Libvirt qemu/kvm daemon
-endef
-endif
-
 ifeq ($(BR2_PACKAGE_LIBVIRT_DAEMON),y)
 define LIBVIRT_INSTALL_INIT_SYSV
 	$(INSTALL) -D -m 0755 package/libvirt/S91virtlogd $(TARGET_DIR)/etc/init.d/S91virtlogd
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
