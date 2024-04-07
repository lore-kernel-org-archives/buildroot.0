Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CDDFCD11C2
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 15:37:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCB2940810;
	Sun,  7 Apr 2024 15:37:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N58ynczCugoX; Sun,  7 Apr 2024 15:37:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 83E994083D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 83E994083D;
	Sun,  7 Apr 2024 15:37:14 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B29C51BF2CC
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:36:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9E38881DF7
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 15:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PshpSRPyj8j1 for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 15:36:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAF9981DFE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAF9981DFE
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 15:36:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C331885615; Sun,  7 Apr 2024 15:36:56 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 17:34:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8dd367b82cb4eb9f974c3fd683de79f01be85c80
X-Git-Newrev: 0a9164adeecabf77a6a811dcc0e629d3d37a35f8
X-Patchwork-Hint: ignore
Message-Id: <20240407153656.C331885615@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freeradius-client: add libxcrypt
 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=0a9164adeecabf77a6a811dcc0e629d3d37a35f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-13/output-1/host/lib/gcc/riscv32-buildroot-linux-gnu/12.3.0/../../../../riscv32-buildroot-linux-gnu/bin/ld: local.o: in function `auth_local':
local.c:(.text+0xe8): undefined reference to `crypt'

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/207bba3df700108839382007020be56c4629ef75

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/freeradius-client/Config.in            | 1 +
 package/freeradius-client/freeradius-client.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/freeradius-client/Config.in b/package/freeradius-client/Config.in
index 773adb8a09..36a74c3a6d 100644
--- a/package/freeradius-client/Config.in
+++ b/package/freeradius-client/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_FREERADIUS_CLIENT
 	bool "freeradius-client"
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  FreeRADIUS Client is a framework and library for
 	  writing RADIUS Clients.
diff --git a/package/freeradius-client/freeradius-client.mk b/package/freeradius-client/freeradius-client.mk
index 981ed163e0..b113643415 100644
--- a/package/freeradius-client/freeradius-client.mk
+++ b/package/freeradius-client/freeradius-client.mk
@@ -12,6 +12,10 @@ FREERADIUS_CLIENT_INSTALL_STAGING = YES
 
 FREERADIUS_CLIENT_DEPENDENCIES = host-pkgconf
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+FREERADIUS_CLIENT_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_NETTLE),y)
 FREERADIUS_CLIENT_DEPENDENCIES += nettle
 FREERADIUS_CLIENT_CONF_OPTS += --with-nettle=yes
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
