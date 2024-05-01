Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B82C4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 20:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F35C641774;
	Wed,  1 May 2024 20:18:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZnbqRgYADMZJ; Wed,  1 May 2024 20:18:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 519CA41795
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 519CA41795;
	Wed,  1 May 2024 20:18:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BE0FF1BF3D6
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:18:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AAD6E404D6
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 20:18:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kE26eKdb7wGc for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 20:18:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFA8D4030C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFA8D4030C
 for <buildroot@buildroot.org>; Wed,  1 May 2024 20:18:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9D1A98649C; Wed,  1 May 2024 20:18:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 1 May 2024 22:16:11 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: cd6e65ff1e9b441dda86daf800be3a7978e70653
X-Git-Newrev: 3909492646dbd69a771c24808474f3c7fae4b90d
X-Patchwork-Hint: ignore
Message-Id: <20240501201812.9D1A98649C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/libnpth: bump to
 version 1.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=3909492646dbd69a771c24808474f3c7fae4b90d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 3ef4d24192b20bd1eb5e34c9fa2a6aa5bde91f91)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libnpth/libnpth.hash | 7 +++----
 package/libnpth/libnpth.mk   | 2 +-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/libnpth/libnpth.hash b/package/libnpth/libnpth.hash
index b9f72e0770..a140a23f64 100644
--- a/package/libnpth/libnpth.hash
+++ b/package/libnpth/libnpth.hash
@@ -1,7 +1,6 @@
-# Locally calculated after checking signature
-# https://gnupg.org/ftp/gcrypt/npth/npth-1.6.tar.bz2.sig
-# using key D8692123C4065DEA5E0F3AB5249B39D24F25E3B6
-sha256  1393abd9adcf0762d34798dc34fdcf4d0d22a8410721e76f1e3afcd1daa4e2d1  npth-1.6.tar.bz2
+# From https://www.gnupg.org/download/integrity_check.html
+sha1  a9f7adc1b1f6707071d29bfb3338c28b995ca1ce  npth-1.7.tar.bz2
+sha256  8589f56937b75ce33b28d312fccbf302b3b71ec3f3945fde6aaa74027914ad05  npth-1.7.tar.bz2
 
 # Hash for license file:
 sha256  ce64d5f7b49ea6d80fdb6d4cdee6839d1a94274f7493dc797c3b55b65ec8e9ed  COPYING.LIB
diff --git a/package/libnpth/libnpth.mk b/package/libnpth/libnpth.mk
index ecfef863f4..dc603b607f 100644
--- a/package/libnpth/libnpth.mk
+++ b/package/libnpth/libnpth.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNPTH_VERSION = 1.6
+LIBNPTH_VERSION = 1.7
 LIBNPTH_SOURCE = npth-$(LIBNPTH_VERSION).tar.bz2
 LIBNPTH_SITE = https://www.gnupg.org/ftp/gcrypt/npth
 LIBNPTH_LICENSE = LGPL-2.0+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
