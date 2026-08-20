Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E0BCC5DF86
	for <buildroot@archiver.kernel.org>; Thu, 20 Aug 2026 20:27:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5A6040839;
	Thu, 20 Aug 2026 20:27:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zvqI1rg4tE5Z; Thu, 20 Aug 2026 20:27:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787257674;
	bh=WkU+LwX+mnPsnQridPKD1vGf51kilHwwdOTVdWR55Cw=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=nMQRatz0pDNx3flx663wdWBUsUf3HLvIF8AlxuXnHds4rBwcxzj0UYayJEnDP7wWP
	 e/XnfdEOikMPKM1fB8yN1OXKs5h2xeDM5d597Lj9l0LtLs69jZE3Zms6ufRpTyUZZV
	 pY1EMbm5/X2oeaWxNBw6zAcqdTApxl9Y54yqyDCeMzcaUUGm8Um1dqGSh10xF4J9JC
	 xVbektxf1Cy/nGbA8f0uFma7BQjKRtx0Q/xEo7qaBuFgzGPejOBOEypjAIC0rDHeeb
	 alYQ5K06NCKfPcXIsTM/57jQ+/Gkx/WMr66lmIr8xG8l6SYJuxrnufe0XtSwhkobB0
	 /ItyrklW0s3/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B46324083B;
	Thu, 20 Aug 2026 20:27:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B3003198
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:27:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 983B380F8B
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:27:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id slozlOpsifQZ for <buildroot@buildroot.org>;
 Thu, 20 Aug 2026 20:27:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77C3A80A76
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:27:51 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 271301A1776
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:27:50 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id F070F5FF59
 for <buildroot@buildroot.org>; Thu, 20 Aug 2026 20:27:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 665AD11C767DC; 
 Thu, 20 Aug 2026 22:27:45 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 20 Aug 2026 22:27:35 +0200
Message-ID: <20260820202736.1301073-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820202736.1301073-1-thomas.petazzoni@bootlin.com>
References: <20260820202736.1301073-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 2/2] package/igh-ethercat: bump to 1.6.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The two patches are upstream, so they can be dropped.

From NEWS.md:

Version 1.6.12

- Backported CCAT fixes from Beckhoff

Version 1.6.11

- Protect datagram receiving mechanism against re-ordering
- Prevent creating datagrams that are too large for one frame
- Reacted to stmmac API changed during Linux 6.12
- Adapted debug ring to kernel 5.6+ time API changes
- Use str.read() to read into char* (deprecated in C++20)
- Unload `ec_bhf` before loading CCAT
- Added cpplint checks in pre-commit and CI tests.
- Improved and formatted markdown documents and added pre-commit checks

Version 1.6.10

- Added RasPi 5 macb (Cadence GEM / RP1) driver for kernel 6.18.
- Added igb and igc for kernel 6.8
- Security fixes against malicious subdevices
  - Protected `rec_size` calculation in FoE.
  - Check for malicious EoE frame details.
- Avoid writing invalid MAC onto r8169 NIC on removal
- Fixed insufficient re-allocation of SoE request buffer.

Version 1.6.9

- Protect datagram injection mechanism against re-ordering.
- Fixed for genet and igb drivers for openSUSE Leap 16.0 kernel 6.12.
- tty: Implemented new timer interface since kernel 6.15.
- Do not require .config to exist in kernel sources.
- Fix: Attach slaves before calculating DCs.
- Discard EoE traffic in CoE statemachine, if EoE is disabled.
- Support for Linux 6.19
- Added `--with-kmod-dir` and `--with-ip-cmd` configuration switches
  to specify the paths of the tools used in the `ethercatctl` script.
- Changed the default path of the `ip` command to `/sbin/ip`.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...new-timer-interface-since-kernel-6.1.patch | 63 -------------------
 .../0002-Linux-6.19.0-support.patch           | 36 -----------
 package/igh-ethercat/igh-ethercat.hash        |  2 +-
 package/igh-ethercat/igh-ethercat.mk          |  2 +-
 4 files changed, 2 insertions(+), 101 deletions(-)
 delete mode 100644 package/igh-ethercat/0001-tty-Implemented-new-timer-interface-since-kernel-6.1.patch
 delete mode 100644 package/igh-ethercat/0002-Linux-6.19.0-support.patch

diff --git a/package/igh-ethercat/0001-tty-Implemented-new-timer-interface-since-kernel-6.1.patch b/package/igh-ethercat/0001-tty-Implemented-new-timer-interface-since-kernel-6.1.patch
deleted file mode 100644
index 5e568eaba9..0000000000
--- a/package/igh-ethercat/0001-tty-Implemented-new-timer-interface-since-kernel-6.1.patch
+++ /dev/null
@@ -1,63 +0,0 @@
-From e32e99f8b8ec02a340ad3b93cc8abd36781ff568 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd@kuhls.net>
-Date: Sun, 15 Mar 2026 20:06:42 +0100
-Subject: [PATCH] tty: Implemented new timer interface since kernel 6.15
-
-Upstream: https://gitlab.com/etherlab.org/ethercat/-/merge_requests/187
-
-Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
----
- examples/tty/tty.c | 4 ++++
- tty/module.c       | 8 ++++++++
- 2 files changed, 12 insertions(+)
-
-diff --git a/examples/tty/tty.c b/examples/tty/tty.c
-index 4d47a49..e5b4d52 100644
---- a/examples/tty/tty.c
-+++ b/examples/tty/tty.c
-@@ -233,7 +233,11 @@ static void __exit cleanup_mini_module(void)
- {
-     printk(KERN_INFO PFX "Stopping...\n");
- 
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 15, 0)
-+    timer_delete_sync(&timer);
-+#else
-     del_timer_sync(&timer);
-+#endif
- 
-     free_serial_devices();
- 
-diff --git a/tty/module.c b/tty/module.c
-index 2b7b22b..12ad1e7 100644
---- a/tty/module.c
-+++ b/tty/module.c
-@@ -292,7 +292,11 @@ static int ec_tty_init(ec_tty_t *t, int minor,
- 
- static void ec_tty_clear(ec_tty_t *tty)
- {
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 15, 0)
-+    timer_delete_sync(&tty->timer);
-+#else
-     del_timer_sync(&tty->timer);
-+#endif
-     tty_unregister_device(tty_driver, tty->minor);
- }
- 
-@@ -367,10 +371,14 @@ static void ec_tty_wakeup(struct timer_list *t)
- static void ec_tty_wakeup(unsigned long data)
- #endif
- {
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 15, 0)
-+    ec_tty_t *tty = timer_container_of(tty, t, timer);
-+#else
- #if LINUX_VERSION_CODE >= KERNEL_VERSION(4, 15, 0)
-     ec_tty_t *tty = from_timer(tty, t, timer);
- #else
-     ec_tty_t *tty = (ec_tty_t *) data;
-+#endif
- #endif
-     size_t to_recv;
- 
--- 
-2.47.3
-
diff --git a/package/igh-ethercat/0002-Linux-6.19.0-support.patch b/package/igh-ethercat/0002-Linux-6.19.0-support.patch
deleted file mode 100644
index 6a6af5508c..0000000000
--- a/package/igh-ethercat/0002-Linux-6.19.0-support.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 2c947e90d93d9c5a0129b62744de9720b48d2a17 Mon Sep 17 00:00:00 2001
-From: Nicola Fontana <ntd@entidi.it>
-Date: Sun, 8 Mar 2026 15:39:41 +0100
-Subject: [PATCH] Linux 6.19.0 support
-
-Commit 89aec171d9d1ab168e43fcf9754b82e4c0aef9b9 (part of linux kernel
-6.19.0-rc1) introduced an arbitrarily sized sockaddr struct to be used
-instead of the classical one.
-
-Closes #200
-
-Upstream: https://gitlab.com/etherlab.org/ethercat/-/commit/c42c9cf8bc31c56cc20ae630605495e3f19f3f9a
-Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
----
- devices/generic.c | 4 ++++
- 1 file changed, 4 insertions(+)
-
-diff --git a/devices/generic.c b/devices/generic.c
-index f6cef9b5..a08af54b 100644
---- a/devices/generic.c
-+++ b/devices/generic.c
-@@ -234,7 +234,11 @@ int ec_gen_device_create_socket(
-     sa.sll_family = AF_PACKET;
-     sa.sll_protocol = htons(ETH_P_ETHERCAT);
-     sa.sll_ifindex = desc->ifindex;
-+#if LINUX_VERSION_CODE >= KERNEL_VERSION(6, 19, 0)
-+    ret = kernel_bind(dev->socket, (struct sockaddr_unsized *) &sa, sizeof(sa));
-+#else
-     ret = kernel_bind(dev->socket, (struct sockaddr *) &sa, sizeof(sa));
-+#endif
-     if (ret) {
-         printk(KERN_ERR PFX "Failed to bind() socket to interface"
-                 " (ret = %i).\n", ret);
--- 
-2.55.0
-
diff --git a/package/igh-ethercat/igh-ethercat.hash b/package/igh-ethercat/igh-ethercat.hash
index 9f1172464b..23c28ccc24 100644
--- a/package/igh-ethercat/igh-ethercat.hash
+++ b/package/igh-ethercat/igh-ethercat.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  e9b97d4a8c3a1224fe9119ada448f4024bacea2ca940a811073170e42d828b76  igh-ethercat-1.6.8.tar.gz
+sha256  1fd0c5746980de42b4c1d476d4bd20f5525a9b3fe6e6ff50032bc565c82dc85c  igh-ethercat-1.6.12.tar.gz
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING.LESSER
diff --git a/package/igh-ethercat/igh-ethercat.mk b/package/igh-ethercat/igh-ethercat.mk
index 03f004d2b4..8876b59f30 100644
--- a/package/igh-ethercat/igh-ethercat.mk
+++ b/package/igh-ethercat/igh-ethercat.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IGH_ETHERCAT_VERSION = 1.6.8
+IGH_ETHERCAT_VERSION = 1.6.12
 IGH_ETHERCAT_SITE = $(call gitlab,etherlab.org,ethercat,$(IGH_ETHERCAT_VERSION))
 IGH_ETHERCAT_LICENSE = GPL-2.0 (IgH EtherCAT master), LGPL-2.1 (libraries)
 IGH_ETHERCAT_LICENSE_FILES = COPYING COPYING.LESSER
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
