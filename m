Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F95C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 16:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00CFE40AE0;
	Fri, 13 May 2022 16:55:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gwjzczC-dU4m; Fri, 13 May 2022 16:55:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 07EA740AC6;
	Fri, 13 May 2022 16:55:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B5AF91BF86B
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 16:54:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A3F3E408F9
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 16:54:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z1q0nrgwRMV0 for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 16:54:28 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 04AE8408FF
 for <buildroot@buildroot.org>; Fri, 13 May 2022 16:54:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 46CC085DF9; Fri, 13 May 2022 16:43:33 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 18:53:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8e02f50f1d1f4f89d9cde0b10d8b1c2c4dd3affd
X-Git-Newrev: ac4186db91410fba01eab2fe6c370b059c3f7e18
X-Patchwork-Hint: ignore
Message-Id: <20220513164333.46CC085DF9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/netopeer2: bump version to 2.1.16
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

commit: https://git.buildroot.net/buildroot/commit/?id=ac4186db91410fba01eab2fe6c370b059c3f7e18
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a dependency to sytemd if enabled so cmake can find libsystemd
and install the systemd service file.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/netopeer2/netopeer2.hash | 2 +-
 package/netopeer2/netopeer2.mk   | 6 +++++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/package/netopeer2/netopeer2.hash b/package/netopeer2/netopeer2.hash
index 2895bc51d0..0145a9cc78 100644
--- a/package/netopeer2/netopeer2.hash
+++ b/package/netopeer2/netopeer2.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  dedae40419cfddd09c1be7bb536b3a762ec8dcd568c2bfe803c0f6789a5ca834  netopeer2-2.0.35.tar.gz
+sha256  1e4b46f2e4889f5a8203f36f9faed6dff82093dd783bb6e3c4f14b73b7e16871  netopeer2-2.1.16.tar.gz
 sha256  b46f161fbdcf127d3ef22602e15958c3092fe3294f71a2dc8cdf8f6689cba95b  LICENSE
diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index 43f22b7e4c..fe6e0caf55 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -4,13 +4,17 @@
 #
 ################################################################################
 
-NETOPEER2_VERSION = 2.0.35
+NETOPEER2_VERSION = 2.1.16
 NETOPEER2_SITE = $(call github,CESNET,Netopeer2,v$(NETOPEER2_VERSION))
 NETOPEER2_DL_SUBDIR = netopeer2
 NETOPEER2_LICENSE = BSD-3-Clause
 NETOPEER2_LICENSE_FILES = LICENSE
 NETOPEER2_DEPENDENCIES = libnetconf2 libyang sysrepo host-sysrepo
 
+ifeq ($(BR2_INIT_SYSTEMD),y)
+NETOPEER2_DEPENDENCIES += systemd
+endif
+
 NETOPEER2_CONF_OPTS = \
 	-DBUILD_CLI=$(if $(BR2_PACKAGE_NETOPEER2_CLI),ON,OFF) \
 	-DENABLE_TESTS=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
