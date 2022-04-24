Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D88BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 24 Apr 2022 15:53:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 064C640156;
	Sun, 24 Apr 2022 15:53:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2rCs_on36jUE; Sun, 24 Apr 2022 15:53:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 142AE4018F;
	Sun, 24 Apr 2022 15:53:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E7B121BF962
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 15:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D1DF460B78
 for <buildroot@lists.busybox.net>; Sun, 24 Apr 2022 15:53:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YK-_ihwdSBRG for <buildroot@lists.busybox.net>;
 Sun, 24 Apr 2022 15:53:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D198F60B77
 for <buildroot@buildroot.org>; Sun, 24 Apr 2022 15:53:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 4BF838421A; Sun, 24 Apr 2022 15:43:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 24 Apr 2022 16:53:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dfb42ab91b7b1f58bc89362403321ed7063dda9f
X-Git-Newrev: 5a8ad464b328dcff95e89052abfc8196e6ade996
X-Patchwork-Hint: ignore
Message-Id: <20220424154321.4BF838421A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/quazip: force libzlib
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

commit: https://git.buildroot.net/buildroot/commit/?id=5a8ad464b328dcff95e89052abfc8196e6ade996
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Force libzlib instead of depending on it

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/quazip/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/quazip/Config.in b/package/quazip/Config.in
index a670ed458c..bba5eddf3d 100644
--- a/package/quazip/Config.in
+++ b/package/quazip/Config.in
@@ -1,13 +1,11 @@
 config BR2_PACKAGE_QUAZIP
 	bool "quazip"
-	depends on BR2_PACKAGE_LIBZLIB
 	depends on BR2_PACKAGE_QT5
+	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_ZLIB_FORCE_LIBZLIB
 	help
 	  QuaZIP is a simple C++ wrapper over Gilles Vollant's
 	  ZIP/UNZIP package that can be used to access ZIP
 	  archives. It uses the Qt toolkit.
 
 	  http://quazip.sourceforge.net
-
-comment "quazip needs libzlib"
-	depends on !BR2_PACKAGE_LIBZLIB
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
