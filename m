Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17958C4332F
	for <buildroot@archiver.kernel.org>; Wed,  1 Nov 2023 17:53:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C601483963;
	Wed,  1 Nov 2023 17:53:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C601483963
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pFWSdoqkeAsR; Wed,  1 Nov 2023 17:53:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3D70984CBE;
	Wed,  1 Nov 2023 17:53:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3D70984CBE
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B4E501BF280
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:53:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8E90D84CA7
 for <buildroot@lists.busybox.net>; Wed,  1 Nov 2023 17:53:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E90D84CA7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uq2L9QHq3b_8 for <buildroot@lists.busybox.net>;
 Wed,  1 Nov 2023 17:53:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CCA3983963
 for <buildroot@buildroot.org>; Wed,  1 Nov 2023 17:53:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CCA3983963
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B48DA863F2; Wed,  1 Nov 2023 17:53:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 1 Nov 2023 18:52:47 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5e10a0678196a708eeb99b4a87006798bfab1572
X-Git-Newrev: 5b6dd17b864cfb9133d3e2d78b9a15fed877b15b
X-Patchwork-Hint: ignore
Message-Id: <20231101175339.B48DA863F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgdiplus: bump to version 6.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b6dd17b864cfb9133d3e2d78b9a15fed877b15b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- bump to version 6.1
- updated makefile to download source from
  https://download.mono-project.com/sources/libgdiplus/
  instead of github to avoid submodule build error
  from ./update_submodules.sh

Signed-off-by: Kalpesh Panchal <kalpesh.panchal2@collins.com>
Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libgdiplus/libgdiplus.hash | 2 +-
 package/libgdiplus/libgdiplus.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgdiplus/libgdiplus.hash b/package/libgdiplus/libgdiplus.hash
index 11cacc13f6..f6a9b5eaf7 100644
--- a/package/libgdiplus/libgdiplus.hash
+++ b/package/libgdiplus/libgdiplus.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  1fd034f4b636214cc24e94c563cd10b3f3444d9f0660927b60e63fd4131d97fa  libgdiplus-6.0.5.tar.gz
+sha256  97d5a83d6d6d8f96c27fb7626f4ae11d3b38bc88a1726b4466aeb91451f3255b  libgdiplus-6.1.tar.gz
 sha256  81317bf837e02a116dc20b032fa1d0cbf9ec357621f141ff2c2daf26c17cbb5d  LICENSE
diff --git a/package/libgdiplus/libgdiplus.mk b/package/libgdiplus/libgdiplus.mk
index 97cb595c71..128270e0d7 100644
--- a/package/libgdiplus/libgdiplus.mk
+++ b/package/libgdiplus/libgdiplus.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBGDIPLUS_VERSION = 6.0.5
-LIBGDIPLUS_SITE = $(call github,mono,libgdiplus,$(LIBGDIPLUS_VERSION))
+LIBGDIPLUS_VERSION = 6.1
+LIBGDIPLUS_SITE = https://download.mono-project.com/sources/libgdiplus
 
 LIBGDIPLUS_LICENSE = MIT
 LIBGDIPLUS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
