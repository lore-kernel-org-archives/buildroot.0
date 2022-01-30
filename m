Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B38CC433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 17:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 041E760DFE;
	Sun, 30 Jan 2022 17:19:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7svC-3LmkuS9; Sun, 30 Jan 2022 17:19:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 378D560C22;
	Sun, 30 Jan 2022 17:19:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 883191BF57B
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 17:19:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 759D7405E2
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 17:19:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H4a4SpIPXr6I for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 17:19:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 87DAC40194
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 17:19:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 94A0B81933; Sun, 30 Jan 2022 17:12:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 18:19:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87ee52a205ec0a250cd448ab6c12f40a7c85a272
X-Git-Newrev: 75bea7b215675da9e097f9105d9b97aa4fc4f5b1
X-Patchwork-Hint: ignore
Message-Id: <20220130171212.94A0B81933@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/midori: drop select of
 libsoup-gnome
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

commit: https://git.buildroot.net/buildroot/commit/?id=75bea7b215675da9e097f9105d9b97aa4fc4f5b1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

libsoup-gnome is not used by midori since bump to version 9.0 in commit
42f19d49fb2da891be9266a2f843292d24847f18 and
https://github.com/midori-browser/core/commit/0c2d8f0ea61f20476542e861bc1772a878a54d32

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/midori/Config.in | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/midori/Config.in b/package/midori/Config.in
index d98d7cb161..715295e5a6 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -41,7 +41,6 @@ config BR2_PACKAGE_MIDORI
 	select BR2_PACKAGE_LIBPEAS
 	select BR2_PACKAGE_LIBPEAS_WIDGETS
 	select BR2_PACKAGE_LIBSOUP
-	select BR2_PACKAGE_LIBSOUP_GNOME
 	select BR2_PACKAGE_LIBXML2
 	select BR2_PACKAGE_PYTHON3 # gobject-introspection
 	select BR2_PACKAGE_SQLITE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
