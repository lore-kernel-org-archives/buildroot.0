Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6900AC4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 13:52:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 142BF41846;
	Sat, 13 Jan 2024 13:52:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 142BF41846
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j3klgi2GldhG; Sat, 13 Jan 2024 13:52:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 65D0541847;
	Sat, 13 Jan 2024 13:52:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 65D0541847
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 05AB31BF867
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DFDC9833AF
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFDC9833AF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2AU4pQVUMopo for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 13:52:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 025A7826BB
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 13:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 025A7826BB
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4ECC85FD4; Sat, 13 Jan 2024 13:51:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 11:30:01 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: 533376412e4eee06b9cac5d770f09bc2b0e0fb54
X-Git-Newrev: acaf6162fdb0a446175685e44ccfeb9e3afc1b10
X-Patchwork-Hint: ignore
Message-Id: <20240113135159.E4ECC85FD4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/cups: fix avahi
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

commit: https://git.buildroot.net/buildroot/commit/?id=acaf6162fdb0a446175685e44ccfeb9e3afc1b10
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
