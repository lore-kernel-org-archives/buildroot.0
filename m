Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAF4C433EF
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 12:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8202460F05;
	Mon, 14 Feb 2022 12:05:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ykPBTPaNfWwP; Mon, 14 Feb 2022 12:05:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4F8A60F18;
	Mon, 14 Feb 2022 12:05:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A05901BF2A4
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 12:05:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C1FA8291C
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 12:05:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e15WpfzROAA3 for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 12:05:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 095C48281A
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 12:05:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 9F5D182582; Mon, 14 Feb 2022 11:58:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 13:05:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 81cb8a853bd2e01dbcb67573fe591474b43040a1
X-Git-Newrev: 38b5f2069bbe029c62594095a02f915552dc28c2
X-Patchwork-Hint: ignore
Message-Id: <20220214115800.9F5D182582@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/kodi: add bluetooth dependency
 comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=38b5f2069bbe029c62594095a02f915552dc28c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 43122d64e05a2831a96dabcbf149ba199726767f forgot to add bluetooth
dependency comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/kodi/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index f436a444d3..6896e85e7b 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -135,6 +135,10 @@ config BR2_PACKAGE_KODI_BLUEZ
 	help
 	    Enable bluetooth support
 
+comment "bluetooth support needs a toolchain w/ headers >= 3.4"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
+
 config BR2_PACKAGE_KODI_DBUS
 	bool "dbus"
 	select BR2_PACKAGE_DBUS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
