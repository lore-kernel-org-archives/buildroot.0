Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0957CC46CD2
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 09:56:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AE99183A42;
	Sat,  6 Jan 2024 09:56:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AE99183A42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wLFqD_HqSQ9e; Sat,  6 Jan 2024 09:56:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E3528401E;
	Sat,  6 Jan 2024 09:56:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1E3528401E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 16E461BF863
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:55:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E289442175
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E289442175
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kXTQ3gFOxtSl for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 09:55:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13F4142178
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 09:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13F4142178
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1230F84688; Sat,  6 Jan 2024 09:55:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 6 Jan 2024 10:52:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8332fa63d665d69f6f07524f1b320f589e1f23c
X-Git-Newrev: 3ebd3bf15ee1570b68cf8defe951f3574f3cda86
X-Patchwork-Hint: ignore
Message-Id: <20240106095524.1230F84688@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cups: fix systemd handling
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=3ebd3bf15ee1570b68cf8defe951f3574f3cda86
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--{dis,en}able-systemd is unrecognized since bump to version 2.4.0 in
commit 07230bfcbc4b3c760a1d96a2595e3557c5e7278b and
https://github.com/OpenPrinting/cups/commit/796bd7cf235b1f738e54ccdcab150ee97827ec23:

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --disable-dependency-tracking, --enable-ipv6, --disable-nls, --disable-systemd, --disable-avahi

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cups/cups.mk | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 620b61d748..119a81aa68 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -37,10 +37,8 @@ CUPS_DEPENDENCIES = \
 
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
