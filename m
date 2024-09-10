Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F47BEDE9BF
	for <buildroot@archiver.kernel.org>; Tue, 10 Sep 2024 20:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE5A46112F;
	Tue, 10 Sep 2024 20:53:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UThmR4Do_dZD; Tue, 10 Sep 2024 20:53:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 468EE6112D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 468EE6112D;
	Tue, 10 Sep 2024 20:53:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 29BDC1BF4D8
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CB5940905
 for <buildroot@lists.busybox.net>; Tue, 10 Sep 2024 20:51:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3X1RWZl57fVA for <buildroot@lists.busybox.net>;
 Tue, 10 Sep 2024 20:51:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 91F9C40B4F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91F9C40B4F
 for <buildroot@buildroot.org>; Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8D18B86F5F; Tue, 10 Sep 2024 20:51:31 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 10 Sep 2024 22:49:47 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae471a7d3dc291ea07652b82c7239bc4b2a83284
X-Git-Newrev: 05b18efb7ba4b3d17ed4b4f46525768477630016
X-Patchwork-Hint: ignore
Message-Id: <20240910205131.8D18B86F5F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/fcgiwrap: fix explicitly typo
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

commit: https://git.buildroot.net/buildroot/commit/?id=05b18efb7ba4b3d17ed4b4f46525768477630016
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/fcgiwrap/0001-use-LIBS-from-configure.patch | 2 +-
 package/fcgiwrap/fcgiwrap.mk                        | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/fcgiwrap/0001-use-LIBS-from-configure.patch b/package/fcgiwrap/0001-use-LIBS-from-configure.patch
index 12563c4275..3f8606945f 100644
--- a/package/fcgiwrap/0001-use-LIBS-from-configure.patch
+++ b/package/fcgiwrap/0001-use-LIBS-from-configure.patch
@@ -1,7 +1,7 @@
 Makefile.in: Use LIBS from configure rather than specifying -lfcgi manually.
 
 libfcgi needs libm and fcgiwrap does not use libtool or pkgconf to
-detect libfcgi, so we need to add -lm explicitely when using static
+detect libfcgi, so we need to add -lm explicitly when using static
 libs.  Buildroot does this by providing LIBS=-lm to configure when
 needed.  However fcgiwrap does not use Automake and its Makefile.in
 ignores LIBS from configure.  Fix it with this patch.
diff --git a/package/fcgiwrap/fcgiwrap.mk b/package/fcgiwrap/fcgiwrap.mk
index 62c4c1369d..4845f013fa 100644
--- a/package/fcgiwrap/fcgiwrap.mk
+++ b/package/fcgiwrap/fcgiwrap.mk
@@ -20,7 +20,7 @@ FCGIWRAP_CONF_OPTS += --without-systemd
 endif
 
 # libfcgi needs libm and fcgiwrap does not use libtool or pkgconf to
-# detect libfcgi, so we need to add -lm explicitely when using static
+# detect libfcgi, so we need to add -lm explicitly when using static
 # libs.
 ifeq ($(BR2_STATIC_LIBS),y)
 FCGIWRAP_CONF_OPTS += LIBS=-lm
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
