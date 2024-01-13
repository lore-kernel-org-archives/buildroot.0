Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB5ECC4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 13:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ED0C40967;
	Sat, 13 Jan 2024 13:34:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6ED0C40967
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CTb3epBBsqOq; Sat, 13 Jan 2024 13:34:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD38240969;
	Sat, 13 Jan 2024 13:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BD38240969
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CFD5D1BF325
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A87EA40E46
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:34:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A87EA40E46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yVHpbs_bJ1-7 for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 13:34:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E808240963
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 13:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E808240963
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D25E984BCB; Sat, 13 Jan 2024 13:34:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 11:30:16 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: fede7aecf802dd95aa4d31730895777268a885cf
X-Git-Newrev: d59600235378e04b392290880c74ddd4958b405c
X-Patchwork-Hint: ignore
Message-Id: <20240113133411.D25E984BCB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/cups: fix avahi
 handling
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d59600235378e04b392290880c74ddd4958b405c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

--{dis,en}able-avahi is unrecognized since bump to version 2.3.3op2 in
commit 8cf034ab0f686d0a3891b6fe5bb5a2d1bdf381d5 (which switched upstream
location from apple to openprinting):

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --disable-dependency-tracking, --enable-ipv6, --disable-nls, --disable-systemd, --disable-avahi

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 36743d61756ec4c8bdf1963a8cfea01724ba78ef)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups/cups.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 344e21e02b..855328a7e7 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -68,11 +68,11 @@ else
 CUPS_CONF_OPTS += --disable-libusb
 endif
 
-ifeq ($(BR2_PACKAGE_AVAHI),y)
+ifeq ($(BR2_PACKAGE_AVAHI_LIBAVAHI_CLIENT),y)
 CUPS_DEPENDENCIES += avahi
-CUPS_CONF_OPTS += --enable-avahi
+CUPS_CONF_OPTS += --with-dnssd=avahi
 else
-CUPS_CONF_OPTS += --disable-avahi
+CUPS_CONF_OPTS += --with-dnssd=no
 endif
 
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
