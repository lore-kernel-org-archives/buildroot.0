Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36F84C05027
	for <buildroot@archiver.kernel.org>; Fri, 10 Feb 2023 15:54:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0E094161E;
	Fri, 10 Feb 2023 15:54:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0E094161E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DEqNusnCkmJl; Fri, 10 Feb 2023 15:54:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9E3DF41687;
	Fri, 10 Feb 2023 15:54:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9E3DF41687
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5A9811BF2B0
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 15:54:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4205981E49
 for <buildroot@lists.busybox.net>; Fri, 10 Feb 2023 15:54:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4205981E49
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7tXfdVXnP7e8 for <buildroot@lists.busybox.net>;
 Fri, 10 Feb 2023 15:54:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 020C081F8D
 for <buildroot@buildroot.org>; Fri, 10 Feb 2023 15:54:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 020C081F8D
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5F0A84F7B; Fri, 10 Feb 2023 15:54:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 16:53:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1613273542554776b089b3df2b6b71c1af2cc0da
X-Git-Newrev: 406698de03a9c9e4ded5a50070de2249398380ff
X-Patchwork-Hint: ignore
Message-Id: <20230210155405.E5F0A84F7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/elixir: drop package
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

commit: https://git.buildroot.net/buildroot/commit/?id=406698de03a9c9e4ded5a50070de2249398380ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Elixir was a dependency of rabbitmq-server which got dropped in
89815bad0a531d01ee2733dd9c17576a7647e1d9. It is a host package with no other
users, hence it is no longer required. Additionally, newer versions require
Erlang 23+.

Signed-off-by: Frank Vanbever <frank.vanbever@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                 |  1 -
 package/elixir/elixir.hash |  3 ---
 package/elixir/elixir.mk   | 21 ---------------------
 3 files changed, 25 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 32c6e54919..e8e0671709 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1089,7 +1089,6 @@ F:	package/upx/
 F:	package/zxing-cpp/
 
 N:	Frank Vanbever <frank.vanbever@mind.be>
-F: 	package/elixir/
 F:	package/libmodsecurity/
 F:	package/nginx-modsecurity/
 
diff --git a/package/elixir/elixir.hash b/package/elixir/elixir.hash
deleted file mode 100644
index 6d083e72de..0000000000
--- a/package/elixir/elixir.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Computed locally
-sha256  f3465d8a8e386f3e74831bf9594ee39e6dfde6aa430fe9260844cfe46aa10139  elixir-1.9.4.tar.gz
-sha256  a6cba85bc92e0cff7a450b1d873c0eaa2e9fc96bf472df0247a26bec77bf3ff9  LICENSE
diff --git a/package/elixir/elixir.mk b/package/elixir/elixir.mk
deleted file mode 100644
index 6d935516f4..0000000000
--- a/package/elixir/elixir.mk
+++ /dev/null
@@ -1,21 +0,0 @@
-################################################################################
-#
-# elixir
-#
-################################################################################
-
-ELIXIR_VERSION = 1.9.4
-ELIXIR_SITE = $(call github,elixir-lang,elixir,v$(ELIXIR_VERSION))
-ELIXIR_LICENSE = Apache-2.0
-ELIXIR_LICENSE_FILES = LICENSE
-HOST_ELIXIR_DEPENDENCIES = host-erlang
-
-define HOST_ELIXIR_BUILD_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) compile
-endef
-
-define HOST_ELIXIR_INSTALL_CMDS
-	$(HOST_MAKE_ENV) $(HOST_CONFIGURE_OPTS) $(MAKE) PREFIX="$(HOST_DIR)" -C $(@D) install
-endef
-
-$(eval $(host-generic-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
