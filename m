Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC7AD5B86F
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 669EB40B17;
	Mon, 15 Dec 2025 21:10:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aLm_pyrK4J12; Mon, 15 Dec 2025 21:10:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2FD2740B00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765833017;
	bh=kK8iZ0C5UAnVe0SQ0vlOleyI3X9OWUnThIF3jZfSwoU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gVUUZT16hA9htrc9tTZjE3Ak/99xwEaUamuuYQQ72vQfHB2Oa5qq6yQk2IVdut1WX
	 E7W6b9eouhgwOZdZ6myheK/ldC/RSfCQqgt4gRzYgbHJfcQTXHFbe3TEvVmcUtH0B/
	 6uLBW/F+4eBRU5GaoG6tUASTa1LhXGqd3wS5im9JlCi2OhhiMSVO/m45s5sIhJGGY4
	 v+ZTlhDqgitAV+ALjLNO9dJ9Z49G5m3/b1G9b9rw8E0IFi7BnaR0JVesklco4+9h9x
	 miELsd+QfXrZ/y2j2HKJiWOoGDa4ZIcxRlEx5zSdLDsXB+O1CJ/N5JdQona6YqSV8T
	 W9r8pkFBrZ6JQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2FD2740B00;
	Mon, 15 Dec 2025 21:10:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E653255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3645E60F06
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GdhOFUzRrGj7 for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 961E060F04
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 961E060F04
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8687886FB5; Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:33:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 85b7dbeeeeb8a5c4b2aede270be0b5c21e620442
X-Git-Newrev: 8dde5a279ea97e24bf26af110a774b9fc698eb60
X-Patchwork-Hint: ignore
Message-Id: <20251215211000.8687886FB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-libevdev: bump version to
 0.13.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=8dde5a279ea97e24bf26af110a774b9fc698eb60
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switched build system to hatch:
https://gitlab.freedesktop.org/libevdev/python-libevdev/-/commit/d3542404761357e335f61530b95af8a7fe196f8b

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-libevdev/python-libevdev.hash | 4 ++--
 package/python-libevdev/python-libevdev.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-libevdev/python-libevdev.hash b/package/python-libevdev/python-libevdev.hash
index c48ddbf716..a6afddbc5b 100644
--- a/package/python-libevdev/python-libevdev.hash
+++ b/package/python-libevdev/python-libevdev.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/libevdev/json
-md5  9bf8acc011c72d1466ae8f0b8f2c5fac  libevdev-0.12.tar.gz
-sha256  02e952632ec6c249cbb9c66f6fa00012ea448b06606c77cd139133bc2fe46b08  libevdev-0.12.tar.gz
+md5  86719624bedf7e9e5d3bc15803d01a49  libevdev-0.13.1.tar.gz
+sha256  dc3369cd1401767b9ecb1117cd6b73faba9038e3bd9e1695a710a9e9d9415e8d  libevdev-0.13.1.tar.gz
 # Locally computed sha256 checksums
 sha256  a547b196da4e5bb9588a6e24f1f36ae9e2349ca5375e2cf9c315186e237d9f6d  COPYING
diff --git a/package/python-libevdev/python-libevdev.mk b/package/python-libevdev/python-libevdev.mk
index cc40adc874..1d2fc74708 100644
--- a/package/python-libevdev/python-libevdev.mk
+++ b/package/python-libevdev/python-libevdev.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_LIBEVDEV_VERSION = 0.12
+PYTHON_LIBEVDEV_VERSION = 0.13.1
 PYTHON_LIBEVDEV_SOURCE = libevdev-$(PYTHON_LIBEVDEV_VERSION).tar.gz
-PYTHON_LIBEVDEV_SITE = https://files.pythonhosted.org/packages/61/6b/e0193f4ba0c3b7d20f8f1b961793d39df5538451c0959abb115020d4ec2d
-PYTHON_LIBEVDEV_SETUP_TYPE = setuptools
+PYTHON_LIBEVDEV_SITE = https://files.pythonhosted.org/packages/86/ff/4f8ab38330965168be742b772bcd151a7a052ea17b2481c43a607875d4ed
+PYTHON_LIBEVDEV_SETUP_TYPE = hatch
 PYTHON_LIBEVDEV_LICENSE = MIT
 PYTHON_LIBEVDEV_LICENSE_FILES = COPYING
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
