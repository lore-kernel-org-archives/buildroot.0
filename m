Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B06C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 20:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 45A6B40289;
	Sun,  9 Jan 2022 20:21:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iE8EQOls65cc; Sun,  9 Jan 2022 20:21:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6F0A40229;
	Sun,  9 Jan 2022 20:21:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 651CB1BF44C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:21:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F68640222
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:21:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AQgL7n_zgrqp for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 20:21:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DF2A400E8
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 20:21:26 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 p1-20020a1c7401000000b00345c2d068bdso8551549wmc.3
 for <buildroot@buildroot.org>; Sun, 09 Jan 2022 12:21:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eO/FKCdPwEAZ0y0MiEmFZhnC7bfmB2nXZ+qA79Ukspw=;
 b=HLw81B9xWFEl0yExYPIByqjGw3jZ5ZLfmMMzQGHlYTvYfpgg/hogyTtER8bv0GByND
 5IWt7+de6b2vVpVY9ow+MJ/QEz3iWt6Sxydo5+6+X2sUBIqjOuMzOTvy6on+dw1tzxnT
 n55U7FU/q7mNRlg8uEWW9kTV365MOOKWiYe3G3zpfNtO/UB4gY4hegwKFRfAwMWn/Thh
 WQH5bFs16CSrFmPZ1r0C1zGCy1jqwyDJixIYnXTszsOr0twYmpxlM+6RuDuUewWbjypk
 wp9wKVeZaDNriRdRW/rwAR4gSWnCHWH42p/oV5G55RxHrF1/swjnFf8tYfNSblZLjYvk
 cgaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=eO/FKCdPwEAZ0y0MiEmFZhnC7bfmB2nXZ+qA79Ukspw=;
 b=VrEDqqwT6UlQSyINB/f16f+b6F4eL4tul3kbFjqWM70pfnn4EqjdowscPQvDuX3n0J
 95XGzO3DVcNU/FNN0URMGpOPf84WYX4s2oMdrrY6pWA/xD7XjSzOwyLkMR5c5aQwebQA
 HaYINR3i4fjjQvnBM6seFamSK6rd93SbgMEZWzFtDDzX/SAarJ8e0zksMt9dPvabT4c6
 v8xoDpURl0/7Epi0S+7zjH3tWBgUrSIbheE+ytavPJ6mg1spOBj+eX8ONKt+pKUJHGMm
 9ZaSXVKhJTa87OkDIAXDMpUJYy0axSIRhsvM5fRDECNmfPkNWhPCuvBm37nOyrj0/6B5
 3UTg==
X-Gm-Message-State: AOAM533AC/hVpvASHJ8MFtvsll2Kfo9h32L5dp5/dM1U534IEh0AZUuQ
 KxVIsDqvCbZ5DDV+1VOhCk1meXgfbt8=
X-Google-Smtp-Source: ABdhPJxCzW/vXoC33alJQMSok4j9W2M81B1eTYbvI8C/SGouuORATAKxKpRNbfUg+pMXAwGIp3OqDw==
X-Received: by 2002:a7b:c317:: with SMTP id k23mr19688447wmj.20.1641759684805; 
 Sun, 09 Jan 2022 12:21:24 -0800 (PST)
Received: from kali.home (lfbn-ren-1-2129-201.w92-167.abo.wanadoo.fr.
 [92.167.208.201])
 by smtp.gmail.com with ESMTPSA id h2sm4945216wmq.20.2022.01.09.12.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Jan 2022 12:21:24 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  9 Jan 2022 21:20:03 +0100
Message-Id: <20220109202003.3338357-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/libvirt: libvirtd needs C++
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fix the following build failure raised since commit
fbf25acfbfd5a73b3560918bea081768abbe5723:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_NMAP
  Depends on [n]: BR2_INSTALL_LIBSTDCPP [=n] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y]
  Selected by [y]:
  - BR2_PACKAGE_LIBVIRT_DAEMON [=y] && BR2_PACKAGE_LIBVIRT [=y] && !BR2_PACKAGE_NETCAT_OPENBSD [=n]

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libvirt/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
index a35295bc97..d7ca5f8db5 100644
--- a/package/libvirt/Config.in
+++ b/package/libvirt/Config.in
@@ -37,6 +37,7 @@ if BR2_PACKAGE_LIBVIRT
 config BR2_PACKAGE_LIBVIRT_DAEMON
 	bool "libvirtd"
 	default y
+	depends on BR2_INSTALL_LIBSTDCPP # nmap
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 	select BR2_PACKAGE_DNSMASQ
 	select BR2_PACKAGE_EBTABLES
@@ -50,6 +51,9 @@ config BR2_PACKAGE_LIBVIRT_DAEMON
 	  Build the libvirt daemon (libvirtd) otherwise build only the
 	  utility programs.
 
+comment "libvirtd needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
 # Stateful drivers are useful only when building the daemon.
 if BR2_PACKAGE_LIBVIRT_DAEMON
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
