Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 045ABECAAD4
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 16:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 786FB40C66;
	Fri, 26 Aug 2022 16:01:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 786FB40C66
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ivSpzaAk4gVi; Fri, 26 Aug 2022 16:01:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B81640C5C;
	Fri, 26 Aug 2022 16:01:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B81640C5C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8117C1BF333
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 16:00:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5AC0641A00
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 16:00:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5AC0641A00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ggcPNwsqaUbY for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 16:00:57 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B3C6419B5
Received: from m12-13.163.com (m12-13.163.com [220.181.12.13])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B3C6419B5
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 16:00:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [123.185.180.94])
 by smtp9 (Coremail) with SMTP id DcCowADHveIk7ghjKs9Mbg--.54813S2;
 Sat, 27 Aug 2022 00:00:39 +0800 (CST)
From: TIAN Yuanhao <tianyuanhao3@163.com>
To: buildroot@buildroot.org
Date: Fri, 26 Aug 2022 08:59:34 -0700
Message-Id: <20220826155934.12677-1-tianyuanhao3@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: DcCowADHveIk7ghjKs9Mbg--.54813S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7CryfJryDGr1rAw1xJryxXwb_yoW8WrW3pr
 98Ja48GrWjg3sYvrW8Gw1fW3W5uFsakr1UWw42k3Wvvr45Ww1DWas29Fs8Zw17WryayayY
 y3y2yrW5Jr1DZr7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUksqJUUUUU=
X-Originating-IP: [123.185.180.94]
X-CM-SenderInfo: xwld05xxdqxtjrt6il2tof0z/xtbBdgBpjWDkoYCU5wAAsE
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=163.com; 
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=qxvzr
 j1+b5VD/3E4aVvAtkG77yck6lJ1oA1ktUiK7+U=; b=BTnk1x/j82+ArutjrbKT3
 rCTnhvh3Qx6bS1YsNsPe8Zc6blbzVU1NzXmiguAEaH9dFJP7tWxP/ADIXACgmPxu
 Wp0jY2sM/HleyZvPEWDYLCEkf6crESY7w60oKG+x0OEU5ZOqrdOhnCggFWEbdyx5
 uAwtl91W8A/8kInAhRRQ4s=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=163.com header.i=@163.com
 header.a=rsa-sha256 header.s=s110527 header.b=BTnk1x/j
Subject: [Buildroot] [PATCH 1/1] package/network-manager: needs host-libxslt
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
Cc: TIAN Yuanhao <tianyuanhao3@163.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Besides, order depends alphabetically.

Fixes:
output/build/network-manager-1.36.4/meson.build:89:0: ERROR: Program 'xsltproc' not found or not executable

See:
http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb?h=kirkstone#n13

Cc: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>
---
 package/network-manager/network-manager.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index d782370082..391baaafde 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -9,8 +9,8 @@ NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).4
 NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
 NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
 NETWORK_MANAGER_INSTALL_STAGING = YES
-NETWORK_MANAGER_DEPENDENCIES = host-pkgconf dbus udev gnutls libglib2 \
-	host-intltool libndp util-linux
+NETWORK_MANAGER_DEPENDENCIES = host-intltool host-libxslt host-pkgconf \
+	dbus gnutls libglib2 libndp udev util-linux
 NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
 NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING.md
 NETWORK_MANAGER_CPE_ID_VENDOR = gnome
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
