Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C858CC433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 20:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DF2F84245;
	Thu,  9 Jun 2022 20:44:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ehiD6YeqKjr6; Thu,  9 Jun 2022 20:44:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A58718426F;
	Thu,  9 Jun 2022 20:44:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 755B01BF2F0
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:43:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4060582681
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 20:43:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 476RZsshoCdv for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 20:43:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 60EB1826D5
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 20:43:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 97A3B86F1C; Thu,  9 Jun 2022 20:31:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Jun 2022 22:43:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 44fa5be2745e0444cfb451701f7bf1a273a1d737
X-Git-Newrev: 637437b1d5215717463454a17abc1b578b2e5778
X-Patchwork-Hint: ignore
Message-Id: <20220609203153.97A3B86F1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/json-c: bump to version 0.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=637437b1d5215717463454a17abc1b578b2e5778
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set DISABLE_EXTRA_LIBS=ON to avoid adding an optional dependency on
libbsd (added by
https://github.com/json-c/json-c/commit/0f61f6921b2e4395d1e354ad356137e44d6a7e11
https://github.com/json-c/json-c/commit/041cef434afe0d0c6da8b6ac1d1fa26087246dda)

https://github.com/json-c/json-c/blob/json-c-0.16-20220414/ChangeLog

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/json-c/json-c.hash | 2 +-
 package/json-c/json-c.mk   | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/json-c/json-c.hash b/package/json-c/json-c.hash
index a20d370eb0..44d068a8b4 100644
--- a/package/json-c/json-c.hash
+++ b/package/json-c/json-c.hash
@@ -1,4 +1,4 @@
 # From https://github.com/json-c/json-c/wiki
-sha256  b8d80a1ddb718b3ba7492916237bbf86609e9709fb007e7f7d4322f02341a4c6  json-c-0.15.tar.gz
+sha256  8e45ac8f96ec7791eaf3bb7ee50e9c2100bbbc87b8d0f1d030c5ba8a0288d96b  json-c-0.16.tar.gz
 # Locally calculated
 sha256  74c1e6ca5eba76b54d0ad00d4815c8315c1b3bc45ff99de61d103dc92486284c  COPYING
diff --git a/package/json-c/json-c.mk b/package/json-c/json-c.mk
index 3639bad25a..9af7f9a83e 100644
--- a/package/json-c/json-c.mk
+++ b/package/json-c/json-c.mk
@@ -4,12 +4,13 @@
 #
 ################################################################################
 
-JSON_C_VERSION = 0.15
+JSON_C_VERSION = 0.16
 JSON_C_SITE = https://s3.amazonaws.com/json-c_releases/releases
 JSON_C_INSTALL_STAGING = YES
 JSON_C_LICENSE = MIT
 JSON_C_LICENSE_FILES = COPYING
 JSON_C_CPE_ID_VENDOR = json-c_project
+JSON_C_CONF_OPTS = -DDISABLE_EXTRA_LIBS=ON
 
 $(eval $(cmake-package))
 $(eval $(host-cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
