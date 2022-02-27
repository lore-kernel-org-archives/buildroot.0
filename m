Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27E23C433EF
	for <buildroot@archiver.kernel.org>; Sun, 27 Feb 2022 20:27:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6A6481836;
	Sun, 27 Feb 2022 20:27:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oMlz8LXfpiEQ; Sun, 27 Feb 2022 20:27:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1F035817EB;
	Sun, 27 Feb 2022 20:27:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4CC971BF2AA
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 20:27:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3BE1F607EC
 for <buildroot@lists.busybox.net>; Sun, 27 Feb 2022 20:27:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oBEvjmv0SU8n for <buildroot@lists.busybox.net>;
 Sun, 27 Feb 2022 20:27:03 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9F739607C0
 for <buildroot@buildroot.org>; Sun, 27 Feb 2022 20:27:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 29601826D4; Sun, 27 Feb 2022 20:18:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 27 Feb 2022 21:21:03 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 1eb88d25b1ee3ca890da9965fa15ec4e473144cf
X-Git-Newrev: 73c19ff97adcd7166bf8658928608104503dff5c
X-Patchwork-Hint: ignore
Message-Id: <20220227201858.29601826D4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] package/kodi: add
 bluetooth dependency comment
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

commit: https://git.buildroot.net/buildroot/commit/?id=73c19ff97adcd7166bf8658928608104503dff5c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

Commit 43122d64e05a2831a96dabcbf149ba199726767f forgot to add bluetooth
dependency comment

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 38b5f2069bbe029c62594095a02f915552dc28c2)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 72cdbabf89..b7fd85ab33 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -140,6 +140,10 @@ config BR2_PACKAGE_KODI_BLUEZ
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
