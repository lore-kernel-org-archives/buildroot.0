Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22809C4707B
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 13:36:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD62F40969;
	Sat, 13 Jan 2024 13:36:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CD62F40969
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lakrN8svFRGt; Sat, 13 Jan 2024 13:36:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 204A141F80;
	Sat, 13 Jan 2024 13:36:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 204A141F80
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9B6C01BF867
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:34:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E099F40979
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:34:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E099F40979
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5NNJehbJVGMJ for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 13:34:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E67F640959
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 13:34:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E67F640959
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C353885E29; Sat, 13 Jan 2024 13:34:11 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 11:30:12 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d76820414a19508ae15b859c1ac306a9c2a82b65
X-Git-Newrev: fede7aecf802dd95aa4d31730895777268a885cf
X-Patchwork-Hint: ignore
Message-Id: <20240113133411.C353885E29@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/cups: fix systemd
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

commit: https://git.buildroot.net/buildroot/commit/?id=fede7aecf802dd95aa4d31730895777268a885cf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

--{dis,en}able-systemd is unrecognized since bump to version 2.4.0 in
commit 07230bfcbc4b3c760a1d96a2595e3557c5e7278b and
https://github.com/OpenPrinting/cups/commit/796bd7cf235b1f738e54ccdcab150ee97827ec23:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --disable-dependency-tracking, --enable-ipv6, --disable-nls, --disable-systemd, --disable-avahi

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3ebd3bf15ee1570b68cf8defe951f3574f3cda86)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/cups/cups.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 3a7c5f1e85..344e21e02b 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -40,10 +40,8 @@ CUPS_DEPENDENCIES = \
 
 ifeq ($(BR2_PACKAGE_SYSTEMD),y)
 CUPS_CONF_OPTS += --with-systemd=/usr/lib/systemd/system \
-	--enable-systemd
+	--with-ondemand=systemd
 CUPS_DEPENDENCIES += systemd
-else
-CUPS_CONF_OPTS += --disable-systemd
 endif
 
 ifeq ($(BR2_PACKAGE_DBUS),y)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
