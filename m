Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9492FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 11:43:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3709A80C89;
	Mon, 14 Feb 2022 11:43:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IsE09WfgJnnS; Mon, 14 Feb 2022 11:43:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80D8280BD8;
	Mon, 14 Feb 2022 11:43:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 179241BF3BC
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 11:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 04FA380BD8
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 11:43:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ow4OWE8ZuLdf for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 11:43:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 516FF80BC3
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 11:43:36 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id o24so23697061wro.3
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 03:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dNJeMT4cv7xJMwXAtvgnRB2eqNqvCORYElZt/0EfDtI=;
 b=WFwuodHYRpoMPfAzsQ+B5c6rvnBZhIU/v/2Qc3cXw8YjESklpmE/wI5YdJPOeZNW7/
 y7SxUcktM7awdZCuFLGUBrWxpIluEsuThwsAxsw0l46DQ8I3QeEU4bcDt9FPHpOXOUcV
 cV9gb2sKthd0XAOhC9K67blt/TkEfqFFvjp7kMr/jPR6wTldamA4HtnQImPLyC6QIkxM
 OTXNBcrpdh4knqvVyWSoqbdo1b6NHvQpaUHp8uvf3Wsd0sCgdvkOJfxFCBwGI//K5xpE
 lpzRNq1MkF0BGd1eJVY9infPM+CY/nrWrXGJKYQ6EZVlpJAPXb4HD54+FoFFfrHcBV03
 S4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=dNJeMT4cv7xJMwXAtvgnRB2eqNqvCORYElZt/0EfDtI=;
 b=VFiDdXw79Suv/EKhJMp6pyGPgKW7su2ldcQUGF5r7Dj8NYbGpKXE8J1IW5lwwQnOZo
 a2GKnTP40rEdxuA3u32tnP/LoM/zVE1YR5nv8IbDoRUSxAxXF9X7mhi/Z5IIWAj+FOR1
 ZCxKZmOUqMeuyHIgGBaJnLF7/P84fsTa3XstOljGEzPFn9Y7z339gkNA8f74OuYy9zou
 hl4m9OW1VmIj9APGHCl/Utf7f39LeiVBBwtINqlt1/0NaZ/wQ44cSrm5je3K7t4wbhiu
 8FvJ5UC/zKXyG0yMsxb9X0CyCBC+fjXqbK3h55vHUeWvOea0IU/7MWkkDk0eD3jcwUG/
 AgeQ==
X-Gm-Message-State: AOAM531aUZZcGJs4UATCJ6NAynLAL/6TaJTqNmnzCbSGH0iL8tLIVKKy
 lKukvVtukXIH4vNNARjojEKhOVvXLT4=
X-Google-Smtp-Source: ABdhPJxBV//v8oWSMlVi+cRajopNH+tpFWUWViyWSFP/EYF2ovNkFZm1eN/q1uoYO/oIe+FgMU3J9A==
X-Received: by 2002:a5d:47ae:: with SMTP id 14mr10919567wrb.579.1644839014288; 
 Mon, 14 Feb 2022 03:43:34 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id k5sm17043667wrw.117.2022.02.14.03.43.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 03:43:33 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 12:43:51 +0100
Message-Id: <20220214114351.2372109-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/kodi: add bluetooth dependency
 comment
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 43122d64e05a2831a96dabcbf149ba199726767f forgot to add bluetooth
dependency comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/kodi/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index c7e746fad3..692d562af3 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -135,6 +135,10 @@ config BR2_PACKAGE_KODI_BLUEZ
 	help
 	    Enable bluetooth support
 
+comment "bluetooth support needs a toolchain w/ headers >= 3.4"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+
 config BR2_PACKAGE_KODI_DBUS
 	bool "dbus"
 	select BR2_PACKAGE_DBUS
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
