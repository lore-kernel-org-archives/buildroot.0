Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CADCDC433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Jul 2022 21:19:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6F859404DD;
	Wed,  6 Jul 2022 21:19:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F859404DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Mc4gZLY0O29m; Wed,  6 Jul 2022 21:19:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 795A040C3F;
	Wed,  6 Jul 2022 21:19:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 795A040C3F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 26F801BF401
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8247A404DD
 for <buildroot@lists.busybox.net>; Wed,  6 Jul 2022 21:19:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8247A404DD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZXhRkhpPSZCT for <buildroot@lists.busybox.net>;
 Wed,  6 Jul 2022 21:19:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9D158403E2
 for <buildroot@buildroot.org>; Wed,  6 Jul 2022 21:19:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9D158403E2
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C270D82A91; Wed,  6 Jul 2022 21:06:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 6 Jul 2022 23:19:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e186b4d89dcd3eb9fae557959181d7176e7c873c
X-Git-Newrev: 9b4914cc4ccdc30e239cd3e2e0e61b8ca5d24bab
X-Patchwork-Hint: ignore
Message-Id: <20220706210635.C270D82A91@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/unixodbc: bump version to 2.3.11
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

commit: https://git.buildroot.net/buildroot/commit/?id=9b4914cc4ccdc30e239cd3e2e0e61b8ca5d24bab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed unsecure md5 hash, upstream does not provide other hashes so we
keep our sha256 hash. Switched _SITE to http.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/unixodbc/unixodbc.hash | 4 +---
 package/unixodbc/unixodbc.mk   | 4 ++--
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/package/unixodbc/unixodbc.hash b/package/unixodbc/unixodbc.hash
index ba094f7627..9e5401c2b3 100644
--- a/package/unixodbc/unixodbc.hash
+++ b/package/unixodbc/unixodbc.hash
@@ -1,6 +1,4 @@
-# From ftp://ftp.unixodbc.org/pub/unixODBC/unixODBC-2.3.9.tar.gz.md5
-md5  06f76e034bb41df5233554abe961a16f  unixODBC-2.3.9.tar.gz
 # Locally computed
-sha256  52833eac3d681c8b0c9a5a65f2ebd745b3a964f208fc748f977e44015a31b207  unixODBC-2.3.9.tar.gz
+sha256  d9e55c8e7118347e3c66c87338856dad1516b490fb7c756c1562a2c267c73b5c  unixODBC-2.3.11.tar.gz
 sha256  a6b9aa1e9bfade121164c06fd975e9b913a8e38bf33d25ff967dfa3ed07d12f8  COPYING
 sha256  1e594f4c7fd6d099eca4bd1340b39d871ce0298331d8ebd4b68935548ee45cf4  exe/COPYING
diff --git a/package/unixodbc/unixodbc.mk b/package/unixodbc/unixodbc.mk
index b447cf5ff0..650e3b3b36 100644
--- a/package/unixodbc/unixodbc.mk
+++ b/package/unixodbc/unixodbc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-UNIXODBC_VERSION = 2.3.9
+UNIXODBC_VERSION = 2.3.11
 UNIXODBC_SOURCE = unixODBC-$(UNIXODBC_VERSION).tar.gz
-UNIXODBC_SITE = ftp://ftp.unixodbc.org/pub/unixODBC
+UNIXODBC_SITE = http://www.unixodbc.org
 UNIXODBC_INSTALL_STAGING = YES
 UNIXODBC_LICENSE = LGPL-2.1+ (library), GPL-2.0+ (programs)
 UNIXODBC_LICENSE_FILES = COPYING exe/COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
