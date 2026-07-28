Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59152C5516F
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC356812A3;
	Fri, 31 Jul 2026 11:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RX9GoxXUjJYO; Fri, 31 Jul 2026 11:58:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1D958129B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499107;
	bh=gDjM55PrGXmvORycZZk2uje0c029tVnPSkPZ9CsyzhM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NyZZevWed8zLoxZKRdsHeDzzGTMs50vY2tYcgIRB1UbnDg7296jORJ4iVhsOY3cuy
	 wMrUyx7MaW5FF9UgVl9L1Bi5HytJ1EkIaEfQ55pQzoTLhIXHc4V6I27aB14JeNPeMX
	 R5R18CLl6agHbxO8vA+TKLhVbkaqwwqvhKMoSOBP0SzzhOEtv5RwyzaFuqdM9Kdwdi
	 /toOadnwtyjkX5W+MkFHpLtC8AuJfTkW1j1rijye287wj4p3OIVVdjQndSDamN0yKI
	 Ft/8EFn8xiG6ZUOl3Pqk4cVBKEniO5mZGVqptJn7PiefygjZPP3PxkieHCvcOxXDxF
	 83SxM9+hrbd/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1D958129B;
	Fri, 31 Jul 2026 11:58:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D3FD2CE
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5BC6E40F85
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id B_7Yd0bAnrk2 for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:58:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E686E40FA6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E686E40FA6
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D7F298B743; Fri, 31 Jul 2026 11:57:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 12:07:15 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 89d60620e413a0024b796811823b311070893427
X-Git-Newrev: a2e883b3eecc686ad7d929c6abc84a0038654f7c
X-Patchwork-Hint: ignore
Message-Id: <20260731115729.D7F298B743@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/usbutils: update
 license information
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a2e883b3eecc686ad7d929c6abc84a0038654f7c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

According to the upstream changelog LGPL-2.1+, CC0-1.0, and MIT
licenses were added with v018. Grouping is derived from individual
SPDX-License-Identifier headers in the source files.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usbutils.git/tree/NEWS?id=bd86478bb8d09abd0aba8ead781bc8f4609521e6#n159

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 4ea73bd6763daaff9c968fd8378e5a4e9d9b7cde)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/usbutils/usbutils.hash | 3 +++
 package/usbutils/usbutils.mk   | 9 +++++++--
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/package/usbutils/usbutils.hash b/package/usbutils/usbutils.hash
index 7527b6e63a..3b0afcded9 100644
--- a/package/usbutils/usbutils.hash
+++ b/package/usbutils/usbutils.hash
@@ -1,5 +1,8 @@
 # From https://www.kernel.org/pub/linux/utils/usb/usbutils/sha256sums.asc
 sha256  83f68b59b58547589c00266e82671864627593ab4362d8c807f50eea923cad93  usbutils-018.tar.xz
 # Locally calculated
+sha256  1f2fa2e0fac0e224fa84969d0e0b3e6801ecdfb7b9526a4664787e840ad705a2  LICENSES/CC0-1.0.txt
 sha256  91412672119c72352b76c1d48fa1a8b7cdc7f70be7929e468c8805db468e23e4  LICENSES/GPL-2.0-only.txt
 sha256  4631da83311d27f99078d0d102e31bd34a4fcbcc2dae2aa40f1454a5b48125dc  LICENSES/GPL-3.0-only.txt
+sha256  efbaee946ac92a48b89eae36f655844042370d2f0e04eadea1e2998efae24ebd  LICENSES/LGPL-2.1-or-later.txt
+sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  LICENSES/MIT.txt
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 1093981360..443448c660 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -8,8 +8,13 @@ USBUTILS_VERSION = 018
 USBUTILS_SOURCE = usbutils-$(USBUTILS_VERSION).tar.xz
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
 USBUTILS_DEPENDENCIES = host-pkgconf libusb udev
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
