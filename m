Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146F6CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 08:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D23740600;
	Sun,  7 Apr 2024 08:52:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sfFXWwnBr4pQ; Sun,  7 Apr 2024 08:52:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B10440610
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4B10440610;
	Sun,  7 Apr 2024 08:52:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 173521BF94D
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:52:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D27F040534
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 08:52:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKJpt8dfudpf for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 08:52:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AB0C404A0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AB0C404A0
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 08:52:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7DA7684BCC; Sun,  7 Apr 2024 08:52:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 10:51:36 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 25ff4015b97b4bb0516a9d8d030dcf0e7cde2a50
X-Git-Newrev: a1858231b29661cb3a81d0f5c1569530e09da6a6
X-Patchwork-Hint: ignore
Message-Id: <20240407085210.7DA7684BCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dante: add libxcrypt optional
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=a1858231b29661cb3a81d0f5c1569530e09da6a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-5/output-1/per-package/dante/host/bin/../lib/gcc/sparc64-buildroot-linux-gnu/12.3.0/../../../../sparc64-buildroot-linux-gnu/bin/ld: auth_password.o: in function `passwordcheck':
/home/autobuild/autobuild/instance-5/output-1/build/dante-1.4.3/sockd/auth_password.c:126:(.text+0xc4): undefined reference to `crypt'

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/c817caa1e9ad91a1c0f61d92f24d35612cc3a5d5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/dante/Config.in | 1 +
 package/dante/dante.mk  | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/dante/Config.in b/package/dante/Config.in
index 41a89990d2..bd0ddb236d 100644
--- a/package/dante/Config.in
+++ b/package/dante/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_DANTE
 	bool "dante"
 	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Dante is a product developed by Inferno Nettverk A/S. It
 	  consists of a SOCKS server and a SOCKS client, implementing
diff --git a/package/dante/dante.mk b/package/dante/dante.mk
index ae60252bed..bae46c5a71 100644
--- a/package/dante/dante.mk
+++ b/package/dante/dante.mk
@@ -22,6 +22,10 @@ else
 DANTE_CONF_OPTS += --without-upnp
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+DANTE_DEPENDENCIES += libxcrypt
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
 DANTE_DEPENDENCIES += linux-pam
 DANTE_CONF_OPTS += --with-pam
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
