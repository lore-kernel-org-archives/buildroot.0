Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E056C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 22:17:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A451840376;
	Sun,  9 Jan 2022 22:17:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FVtHRwElxPAY; Sun,  9 Jan 2022 22:17:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B7E734010E;
	Sun,  9 Jan 2022 22:17:16 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E3F031BF41C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D104D40368
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 22:17:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k9-U2mRu-59Q for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 22:17:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7EAF5400FB
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 22:17:01 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id k30so5747975wrd.9
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 14:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0DDTTUIkeHotX+vsRk0Ct6jw4OGKFEtR+MBeF5pFeCM=;
 b=MM1GmJf0NiHHCJ1IYyG2YHIJso7XEqZKUjSfbZFHbdNid0vQBAWJmU+XccKxvMX0cU
 05Jkf1zNRKvH8S5tdvD6aM11mAPCKlxowjyo9/wkFWnWJ3lyutd3pxN3MI9Vd+lGR2LQ
 IBUxdLWlthN4syv04EJXn/trsssdeoHX908mY0piTVF0jTQpxix06TOnzwgFZv4Uxtyu
 d/uR3aJQk5fNhZBPA0dEe4KyCoctrbhMdol8EE3BC87ldDq0ydxnICTdGczvTuepxzQ5
 r9Zwc5MOj3BRWHUvGZCjWQ43OONpLBTu37XWgwTHhIjN2gJw0ole72UX9XidJqlRyCY2
 KMoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0DDTTUIkeHotX+vsRk0Ct6jw4OGKFEtR+MBeF5pFeCM=;
 b=WPrk45spEeYP1/gOEWTJ5cMiYsxQatwjP9zG7T4/46XvGnbyFV4gbGfm+rKa7wi9Z4
 EgEYqHcJgSxR5dxTHQTqeaMrEja6kKH9A4tTAa/1WSr5RG6SQkSBQVjenPCy1bggYD4y
 7fb/VbHbaHFZbIfxFBDrQtm6lv+9twxhoAjqnoC3bO3DRfrny0SF/qi7GT96mRA7llz0
 Zqzb6b8xK/YVeVXjHae1Xg1C8an3j1SPBvORSnt9uQUjcVRxiOeVaiu2gGqVVsCTbK+G
 X7/oqXGJIMvPxaAiAatuvQzFXOYXPH2Sc1Us1uBbJn6oAU4R68Kgve9hWczStYcb/lzC
 XaRA==
X-Gm-Message-State: AOAM533XjgC6mTFH71qz2VBsF4FQmHQ+ASDYrrTY+C7oEHBClash4XoG
 X3bpLdsU23hS6WMaaMvIsHBohH8M8ng=
X-Google-Smtp-Source: ABdhPJyBdT1x7h8q+t16efcQYpTXVuF1/Bj9QZd+XAtbFw50HpG3b9Wow8CLSZMY7p01nydSLTRKMg==
X-Received: by 2002:adf:dd8b:: with SMTP id x11mr52116694wrl.626.1641766619618; 
 Sun, 09 Jan 2022 14:16:59 -0800 (PST)
Received: from debian-noppl.. (62-178-205-20.cable.dynamic.surfer.at.
 [62.178.205.20])
 by smtp.gmail.com with ESMTPSA id 1sm5395468wrb.13.2022.01.09.14.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 14:16:59 -0800 (PST)
From: Norbert Lange <nolange79@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 23:16:48 +0100
Message-Id: <20220109221650.777610-2-nolange79@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220109221650.777610-1-nolange79@gmail.com>
References: <20220109221650.777610-1-nolange79@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v6 2/4] package/systemd: do not force dbus if
 dbus-broker is available
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
Cc: Norbert Lange <nolange79@gmail.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

dbus-broker fits the bill as a message bus daemon, so only enable the
original dbus if dbus-broker is not enabled.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Norbert Lange <nolange79@gmail.com>
---
 package/systemd/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/systemd/Config.in b/package/systemd/Config.in
index cc0736561e..1c227bb07f 100644
--- a/package/systemd/Config.in
+++ b/package/systemd/Config.in
@@ -26,7 +26,7 @@ menuconfig BR2_PACKAGE_SYSTEMD
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	depends on BR2_HOST_GCC_AT_LEAST_5 # host-systemd
 	select BR2_PACKAGE_HAS_UDEV
-	select BR2_PACKAGE_DBUS # runtime dependency only
+	select BR2_PACKAGE_DBUS if !BR2_PACKAGE_DBUS_BROKER # runtime
 	select BR2_PACKAGE_LIBCAP
 	select BR2_PACKAGE_UTIL_LINUX
 	select BR2_PACKAGE_UTIL_LINUX_LIBS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
