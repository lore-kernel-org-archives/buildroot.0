Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58A68C624DE
	for <buildroot@archiver.kernel.org>; Fri,  4 Sep 2026 16:22:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA51C810E0;
	Fri,  4 Sep 2026 16:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mUTr-RET_KWd; Fri,  4 Sep 2026 16:22:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7CFAE810E7
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788538937;
	b=FqotgiRvp9LMGehD1lVR1lyQMxlXj5y5X1btBVZHNtnXv0jC6G+C0Ac5pxzyHrt5tISy
	 54CvUacV5aXY5YBhF4DM04OMNFOL2salHhc58HN8AsIf/JNbbOlQG7PilO6cCGGSz8+9N
	 kNc3phIU2r1ngobgei0JfWikCSNlhqZrofNpJj9p6qL8S8SffXg1D8yU7xVyiVtMHgRlO
	 tdrxlZN/a86GuTUxthSGAwWV6Qe4YfQ18fHqqFICD6rSqNUl7sOwGCXAGQ9BEAgTolPuJ
	 uWDY4q1L2tUczi7oF7rq6qU7nM2mBJI8JrBjDNBzH3u570j1YoensuZTk/tvFvLIztA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788538937;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=5+IcdGkVn5Ey2l6NwtKXaRDHmfTgDIvfXxeN3XPYzDA=;
	b=SVyZr4eEd/xoyMZU2sYCkjmWB7S9WudnmmUkijAfgLgyj/q4Mozo0bAH7TFPY3HdPqOq
	 wDxl0i+KuLHvG2GV7SDOlVacWoecLP6JfiyU2zuEMBKynZKmgjBuxq6cEOEWoWWCsh5sr
	 RIdQLA5tYXKBffD1TVgILlZszTPLhuzm+Yq3+VNmkZeQL2YEjXGAJVlxp/21Iz7obI/5U
	 6LMhAQqVh+UKKhqnKCCxegKzNP0Rlo1SPjKbvjPXvdU77hi/ALl86EkYee4sCCZpCUMzB
	 LFHEAXtKbKOaKL6EQ4+T0c8fYzgCcK/lBlPPluKfEmlhTDsalqBTf9m70O67+UYN5BA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788538937;
	bh=5+IcdGkVn5Ey2l6NwtKXaRDHmfTgDIvfXxeN3XPYzDA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MEyufI89WLU3k4QfFjWWe67ku88fJd/cDHGujJk9zJvvEYmv80xVPzDjQ+1rWuD+4
	 OH9ZEvh22fJlEEw3K1rfoC0q87pB5dhmkE4MQb1kqntCSAJh8pHPSRvDPiQ33c0M9q
	 Bq7yG4bn58tZSK4JMiOFwgiwxcFBbohdDxSxkaH6WqUliB0d6bm+TVyU1MXMFEQCrG
	 97VBQFc8Va2rcxxpovIAxlBaiStpYmEvr1+7BIewdYcbpYq6JpRhmSu8PckpA93EyE
	 M9sfZEUO1jYmu72mibCNeelbGN1P4MCYOcc1A4KBvJNG9T57oS92zOqcYvBk7uv5RE
	 w9KmmGBZmPgWQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CFAE810E7;
	Fri,  4 Sep 2026 16:22:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2729CB2C
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0D265400F3
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6Devi6E9X4D6 for <buildroot@buildroot.org>;
 Fri,  4 Sep 2026 16:22:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org CC2F5400A1
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788538926;
 b=nljM+pWD4x7ivqH/4YOHI8zFrmX0o+fpLdXTg/V7xeWSt5EnNhr63YieM++z7aoNPVxk
 dekofygq4yMiW9gsJ33vVGZvTdFB8M4HeK1+SkE9n/KguUrYinB8KsmJQs5iZlwQTuZiG
 O2Ee864b7UxR/F2IhfigD/XlObBuD3+ZuAUlvsNISqZjCQeKH7VeQtzPUvWSkQ8cRMqed
 OhhdJrgDKKaqUetUQtJsYNRfIjmuNj7HNT5HKZ9ydUkvmKvJe8SSpU9csrua2RHekNoT2
 1Gx0XMVDd+Srd9gPh0KF/qT1pQynLhHwbbIaikcMqeX3iwVvaTBD/aelgO7kMq39jng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788538926;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=+apzPoFKGzmLPsy0ET7Jc9P8magxXw5fcn5Chm2lbzc=;
 b=D77yE8VEEDMqrAeg6smxGROYu1OsqYDy8wi2vn3UwIrwldFGr7nDY68+XSDkjI4pL3Lg
 FSq8m9Y2YClAhZ3YhbDk2f3Ua1wOvTkQw84Tm3FRKHZNlP8+qKoTneK5wc+8mdVfNIzAT
 lJikj/luorPoqkELClgQ+12J5AlrTr1VklaTsplc1WU2rJOIBUKp56miPO0+iPvUVr9zC
 IQO1GlG5LNnCphlnuk//5t66WyGizxRIcqeeINTR/k4zV7xySVAV0MBwfhurAfgvc5+FY
 DoPHlNCwc6gppKl9Z6zQoykXoQM/WP4vtm/um7xqg/8+RqW/851/vrOICke/Lbnenzg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CC2F5400A1
 for <buildroot@buildroot.org>; Fri,  4 Sep 2026 16:22:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4814E94CCC; Fri,  4 Sep 2026 16:21:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 22:29:18 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8a5fc970b48a432f5df3be1f1e7667095e712b3d
X-Git-Newrev: 0a91e760f467a90b0f0acf00ec76aac011b241f1
X-Patchwork-Hint: ignore
Message-Id: <20260904162106.4814E94CCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/igh-ethercat: bump to 1.6.12
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0a91e760f467a90b0f0acf00ec76aac011b241f1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 ...nted-new-timer-interface-since-kernel-6.1.patch | 63 ----------------------
 .../igh-ethercat/0002-Linux-6.19.0-support.patch   | 36 -------------
 package/igh-ethercat/igh-ethercat.hash             |  2 +-
 package/igh-ethercat/igh-ethercat.mk               |  2 +-
 4 files changed, 2 insertions(+), 101 deletions(-)

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
