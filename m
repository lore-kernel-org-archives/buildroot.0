Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05BA5D2502E
	for <buildroot@archiver.kernel.org>; Sun, 11 Jan 2026 21:21:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3E2B96082E;
	Sun, 11 Jan 2026 21:21:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3Pvd_Xcj_MYv; Sun, 11 Jan 2026 21:21:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C5C97606D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768166481;
	bh=wQvrnJWp3inI0WCp/z3ytbWSMbIXnBXccutj/eJMXrU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MYjAgTI20oVJYkvnirNbsurVfe/4ZZkNPeDc16+bhJD2afEhCmCAoaSTM3OXX/NLI
	 YAr3Tgl2veesMnuGa15gB87fz5AlnTVLueeY93Lf3x5QFCeEmRnLkmdwQ6anEvzaHc
	 BTq2PwK+VbIjNvHsKRwp/mKUfMvnUMAhYwRWJfmTf2AQILK3qAr8fQKQFmZeb0awPC
	 dqpKTgcKDZy/F9D5yjs2gx/WDerOKyn2bFRz9BhrKJwKLGqIGzuJYcTDH68TqsR3+f
	 sOTuDJI63cItSGxF8zo/KEuetZZJdTllbZV9Nf9mUHO2ysJWCo4pNDRcIenC9t8ekP
	 bdqTGRXCqyr0A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5C97606D3;
	Sun, 11 Jan 2026 21:21:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C78841CC
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 21:21:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B664240223
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 21:21:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rYx3_hPCUlP2 for <buildroot@buildroot.org>;
 Sun, 11 Jan 2026 21:21:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 130474020F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 130474020F
 for <buildroot@buildroot.org>; Sun, 11 Jan 2026 21:21:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 02C82884BB; Sun, 11 Jan 2026 21:21:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 11 Jan 2026 22:00:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5eac154044c4976fc504d7202d766817d0a1d48a
X-Git-Newrev: 58111696d72828c1658750dfb5cf13a32e117f5f
X-Patchwork-Hint: ignore
Message-Id: <20260111212119.02C82884BB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lcms2: bump version to 2.18
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=58111696d72828c1658750dfb5cf13a32e117f5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/mm2/Little-CMS/releases/tag/lcms2.18

Added sha256 tarball hash from github.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/lcms2/lcms2.hash | 7 ++++---
 package/lcms2/lcms2.mk   | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/lcms2/lcms2.hash b/package/lcms2/lcms2.hash
index eef8229eef..e2277ba610 100644
--- a/package/lcms2/lcms2.hash
+++ b/package/lcms2/lcms2.hash
@@ -1,5 +1,6 @@
-# From https://sourceforge.net/projects/lcms/files/lcms/2.17
-sha1  213382ca260cf761f264f185407f75bb1c6e2ce8  lcms2-2.17.tar.gz
+# From https://sourceforge.net/projects/lcms/files/lcms/2.18
+sha1  3917db04b8d19b62ea6c9d8f4ff0404d145aca4a  lcms2-2.18.tar.gz
+# From https://github.com/mm2/Little-CMS/releases/tag/lcms2.18
+sha256  ee67be3566f459362c1ee094fde2c159d33fa0390aa4ed5f5af676f9e5004347  lcms2-2.18.tar.gz
 # Locally computed:
-sha256  d11af569e42a1baa1650d20ad61d12e41af4fead4aa7964a01f93b08b53ab074  lcms2-2.17.tar.gz
 sha256  6dbd60437f8ef91d8de1f08ad75882547fd4931bfcc3566a0735f28db1484d31  LICENSE
diff --git a/package/lcms2/lcms2.mk b/package/lcms2/lcms2.mk
index 5137c7ea20..4ffad41014 100644
--- a/package/lcms2/lcms2.mk
+++ b/package/lcms2/lcms2.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LCMS2_VERSION = 2.17
+LCMS2_VERSION = 2.18
 LCMS2_SITE = https://downloads.sourceforge.net/project/lcms/lcms/$(LCMS2_VERSION)
 LCMS2_LICENSE = MIT
 LCMS2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
