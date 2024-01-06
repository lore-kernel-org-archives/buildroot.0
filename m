Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F31C47074
	for <buildroot@archiver.kernel.org>; Sat,  6 Jan 2024 09:56:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F8D88437D;
	Sat,  6 Jan 2024 09:56:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8F8D88437D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uNgrBSFYDnEy; Sat,  6 Jan 2024 09:56:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D762C84047;
	Sat,  6 Jan 2024 09:56:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D762C84047
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 402D31BF863
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:55:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0799C83DD6
 for <buildroot@lists.busybox.net>; Sat,  6 Jan 2024 09:55:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0799C83DD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JzB38a4F2KNN for <buildroot@lists.busybox.net>;
 Sat,  6 Jan 2024 09:55:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 36D3783F71
 for <buildroot@buildroot.org>; Sat,  6 Jan 2024 09:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 36D3783F71
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 25F4A84689; Sat,  6 Jan 2024 09:55:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 6 Jan 2024 10:52:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3ebd3bf15ee1570b68cf8defe951f3574f3cda86
X-Git-Newrev: 36743d61756ec4c8bdf1963a8cfea01724ba78ef
X-Patchwork-Hint: ignore
Message-Id: <20240106095524.25F4A84689@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/cups: fix avahi handling
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

commit: https://git.buildroot.net/buildroot/commit/?id=36743d61756ec4c8bdf1963a8cfea01724ba78ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--{dis,en}able-avahi is unrecognized since bump to version 2.3.3op2 in
commit 8cf034ab0f686d0a3891b6fe5bb5a2d1bdf381d5 (which switched upstream
location from apple to openprinting):

configure: WARNING: unrecognized options: --disable-gtk-doc, --disable-gtk-doc-html, --disable-doc, --disable-docs, --disable-documentation, --with-xmlto, --with-fop, --disable-dependency-tracking, --enable-ipv6, --disable-nls, --disable-systemd, --disable-avahi

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/cups/cups.mk | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/cups/cups.mk b/package/cups/cups.mk
index 119a81aa68..a5098b50e9 100644
--- a/package/cups/cups.mk
+++ b/package/cups/cups.mk
@@ -65,11 +65,11 @@ else
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
