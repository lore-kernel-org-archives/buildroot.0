Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D419FC433F5
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8A0FD405F6;
	Wed,  9 Feb 2022 21:47:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x-fRKQdUFqro; Wed,  9 Feb 2022 21:47:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91BA34027F;
	Wed,  9 Feb 2022 21:47:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 24EEF1BF2F0
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 13DF960E62
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nqk5e14vwyuc for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9A1646009C
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id AB68780196; Wed,  9 Feb 2022 21:26:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:09:05 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a0544dab33b8ca5b5f8d2f46ded5106ceb636e5f
X-Git-Newrev: 9dc598a7e6f56b46cf3f6c16d13286bf82aab870
X-Patchwork-Hint: ignore
Message-Id: <20220209212600.AB68780196@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-esptool: drop python2
 support
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

commit: https://git.buildroot.net/buildroot/commit/?id=9dc598a7e6f56b46cf3f6c16d13286bf82aab870
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-esptool/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-esptool/Config.in b/package/python-esptool/Config.in
index 570f9aa42f..b21ccd72d5 100644
--- a/package/python-esptool/Config.in
+++ b/package/python-esptool/Config.in
@@ -3,8 +3,7 @@ config BR2_PACKAGE_PYTHON_ESPTOOL
 	select BR2_PACKAGE_PYTHON_ECDSA # runtime
 	select BR2_PACKAGE_PYTHON_PYAES # runtime
 	select BR2_PACKAGE_PYTHON_SERIAL # runtime
-	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_ZLIB
 	help
 	  A serial utility to communicate & flash code to Espressif
 	  ESP8266 & ESP32 chips.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
