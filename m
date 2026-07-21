Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572EBC4451C
	for <buildroot@archiver.kernel.org>; Tue, 21 Jul 2026 20:19:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CDF3A6089B;
	Tue, 21 Jul 2026 20:19:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id be5nczmV1e5t; Tue, 21 Jul 2026 20:19:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD70C6089D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784665187;
	bh=B6jrZUIaccSKcW77pVlyEHiUxOnHFyb0fCf6NfHt7O4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NBFLC1z+maFdmVent2lhXBk6MkXt8A19ggb7nL0RhPhhyVUNOJZrlMvBPXCGmnHca
	 TPQCQ/pQ8gBzzU8i7eIV9Nu4u2coHnTyjHIp52Lu4c2f666gfiYLl6yc5lQlZSscRw
	 TsBrageyfmL4/X8G1+heTwn8C7S2bO8p7Da1E/d9ekDCUemlYNVKmUSWQ2ClYqplzO
	 wjU7spzKcfH2eTHYOZ/YofzwIUBehz4uRim91daKLAao+WB38Ie7Jv03Gw5Xr1X1F1
	 R8/cIakqQlJh5+Wma83UTGKRjvHGyqK2DrIjVvEJg3JhdCek3uhDZ7s6LpZb5NZr+w
	 pZKpnT/VfUSeQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD70C6089D;
	Tue, 21 Jul 2026 20:19:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id CFC3742A
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:19:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1A34402F5
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:19:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pSBvjIIIanrX for <buildroot@buildroot.org>;
 Tue, 21 Jul 2026 20:19:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 034D440015
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 034D440015
 for <buildroot@buildroot.org>; Tue, 21 Jul 2026 20:19:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B36038913C; Tue, 21 Jul 2026 20:19:07 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Jul 2026 22:14:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a33f4bd9044f49dc52bcdadb4aac54aad0b8acfa
X-Git-Newrev: 4ea73bd6763daaff9c968fd8378e5a4e9d9b7cde
X-Patchwork-Hint: ignore
Message-Id: <20260721201907.B36038913C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/usbutils: update license
 information
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4ea73bd6763daaff9c968fd8378e5a4e9d9b7cde
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

According to the upstream changelog LGPL-2.1+, CC0-1.0, and MIT
licenses were added with v018. Grouping is derived from individual
SPDX-License-Identifier headers in the source files.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usbutils.git/tree/NEWS?id=bd86478bb8d09abd0aba8ead781bc8f4609521e6#n159

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/usbutils/usbutils.hash | 3 +++
 package/usbutils/usbutils.mk   | 9 +++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/usbutils/usbutils.hash b/package/usbutils/usbutils.hash
index 3527d4e30d..e4fbe18070 100644
--- a/package/usbutils/usbutils.hash
+++ b/package/usbutils/usbutils.hash
@@ -1,5 +1,8 @@
 # From https://www.kernel.org/pub/linux/utils/usb/usbutils/sha256sums.asc
 sha256  659f40c440e31ba865c52c818a33d3ba6a97349e3353f8b1985179cb2aa71ec5  usbutils-019.tar.xz
 # Locally calculated
+sha256  1f2fa2e0fac0e224fa84969d0e0b3e6801ecdfb7b9526a4664787e840ad705a2  LICENSES/CC0-1.0.txt
 sha256  91412672119c72352b76c1d48fa1a8b7cdc7f70be7929e468c8805db468e23e4  LICENSES/GPL-2.0-only.txt
 sha256  4631da83311d27f99078d0d102e31bd34a4fcbcc2dae2aa40f1454a5b48125dc  LICENSES/GPL-3.0-only.txt
+sha256  efbaee946ac92a48b89eae36f655844042370d2f0e04eadea1e2998efae24ebd  LICENSES/LGPL-2.1-or-later.txt
+sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/MIT.txt
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index afeb7ded2a..4fbb358dfa 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -8,8 +8,13 @@ USBUTILS_VERSION = 019
 USBUTILS_SOURCE = usbutils-$(USBUTILS_VERSION).tar.xz
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
 USBUTILS_DEPENDENCIES = host-pkgconf libudev libusb
-USBUTILS_LICENSE = GPL-2.0+ (utils) GPL-2.0 or GPL-3.0 (lsusb.py)
-USBUTILS_LICENSE_FILES = LICENSES/GPL-2.0-only.txt LICENSES/GPL-3.0-only.txt
+USBUTILS_LICENSE = GPL-2.0+, GPL-2.0 (utils), LGPL-2.1+ (config/CI), GPL-2.0 or GPL-3.0 (lsusb.py), CC0-1.0, MIT (ccan)
+USBUTILS_LICENSE_FILES = \
+	LICENSES/CC0-1.0.txt \
+	LICENSES/GPL-2.0-only.txt \
+	LICENSES/GPL-3.0-only.txt \
+	LICENSES/LGPL-2.1-or-later.txt \
+	LICENSES/MIT.txt
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 USBUTILS_DEPENDENCIES += libiconv
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
