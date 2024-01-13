Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC587C4706C
	for <buildroot@archiver.kernel.org>; Sat, 13 Jan 2024 13:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A66C41817;
	Sat, 13 Jan 2024 13:52:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A66C41817
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cUkrPKrK7R3W; Sat, 13 Jan 2024 13:52:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C811041834;
	Sat, 13 Jan 2024 13:52:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C811041834
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 019991BF2EB
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DC40441880
 for <buildroot@lists.busybox.net>; Sat, 13 Jan 2024 13:52:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC40441880
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eFX_xx2Z58L6 for <buildroot@lists.busybox.net>;
 Sat, 13 Jan 2024 13:52:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F0EC641817
 for <buildroot@buildroot.org>; Sat, 13 Jan 2024 13:51:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F0EC641817
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC7C785FD1; Sat, 13 Jan 2024 13:51:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 13 Jan 2024 11:29:42 +0100
X-Git-Refname: refs/heads/2023.11.x
X-Git-Oldrev: cbc2ba71f1bbc7fcbc728f81e6db98de68124bee
X-Git-Newrev: 533376412e4eee06b9cac5d770f09bc2b0e0fb54
X-Patchwork-Hint: ignore
Message-Id: <20240113135159.DC7C785FD1@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.11.x] package/cups: fix systemd
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

commit: https://git.buildroot.net/buildroot/commit/?id=533376412e4eee06b9cac5d770f09bc2b0e0fb54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.11.x

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
