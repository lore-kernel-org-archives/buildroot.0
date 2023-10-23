Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 212F0C25B46
	for <buildroot@archiver.kernel.org>; Mon, 23 Oct 2023 17:27:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBA54423F2;
	Mon, 23 Oct 2023 17:27:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBA54423F2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eH2HFWwvFeeo; Mon, 23 Oct 2023 17:27:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0944742274;
	Mon, 23 Oct 2023 17:27:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0944742274
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4E2621BF95C
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 17:27:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2634A612BA
 for <buildroot@lists.busybox.net>; Mon, 23 Oct 2023 17:27:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2634A612BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BP9tkK8bOFVc for <buildroot@lists.busybox.net>;
 Mon, 23 Oct 2023 17:27:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 48CF2612B7
 for <buildroot@buildroot.org>; Mon, 23 Oct 2023 17:27:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 48CF2612B7
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3505A85E89; Mon, 23 Oct 2023 17:27:17 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 23 Oct 2023 19:18:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d9ba8c3f765cc5a04cd0d6a1b4a9efd453c5d85
X-Git-Newrev: 00583e1c16a5ee6297535307c6a5e6e7e8f38378
X-Patchwork-Hint: ignore
Message-Id: <20231023172717.3505A85E89@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/opkg: add bzip2 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=00583e1c16a5ee6297535307c6a5e6e7e8f38378
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
[yann.morin.1998@free.fr: drop option, use package as condition]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/opkg/opkg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/opkg/opkg.mk b/package/opkg/opkg.mk
index 53221ac31b..3d46adb59a 100644
--- a/package/opkg/opkg.mk
+++ b/package/opkg/opkg.mk
@@ -22,6 +22,13 @@ else
 OPKG_CONF_OPTS += --disable-gpg
 endif
 
+ifeq ($(BR2_PACKAGE_BZIP2),y)
+OPKG_DEPENDENCIES += bzip2
+OPKG_CONF_OPTS += --enable-bzip2
+else
+OPKG_CONF_OPTS += --disable-bzip2
+endif
+
 ifeq ($(BR2_PACKAGE_LZ4),y)
 OPKG_DEPENDENCIES += lz4
 OPKG_CONF_OPTS += --enable-lz4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
