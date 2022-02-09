Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F2BC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 21:47:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5CE3A60E58;
	Wed,  9 Feb 2022 21:47:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GQ_ClCIi9e0C; Wed,  9 Feb 2022 21:47:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A11D360E45;
	Wed,  9 Feb 2022 21:47:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1CEE81BF9BA
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 156D460E5E
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 21:33:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5k2Epyw_u96F for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 21:33:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 79A9060E64
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 21:33:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7AFCC8323C; Wed,  9 Feb 2022 21:26:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 9 Feb 2022 22:08:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f11a922b3b90e11bb85f9d4c211b487188389790
X-Git-Newrev: f84db1ef5537e27afffce2df9ec60702c013a6e3
X-Patchwork-Hint: ignore
Message-Id: <20220209212600.7AFCC8323C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-bsdiff4: drop python2
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

commit: https://git.buildroot.net/buildroot/commit/?id=f84db1ef5537e27afffce2df9ec60702c013a6e3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-bsdiff4/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/python-bsdiff4/Config.in b/package/python-bsdiff4/Config.in
index a383cda0f5..32070fb9a8 100644
--- a/package/python-bsdiff4/Config.in
+++ b/package/python-bsdiff4/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_BSDIFF4
 	bool "python-bsdiff4"
-	select BR2_PACKAGE_PYTHON_BZIP2 if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_BZIP2 if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON3_BZIP2 # runtime
 	help
 	  binary diff and patch using the BSDIFF4-format.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
