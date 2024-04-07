Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B2E2CD128A
	for <buildroot@archiver.kernel.org>; Sun,  7 Apr 2024 12:18:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8D34600C6;
	Sun,  7 Apr 2024 12:18:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCnk8J6jFcsm; Sun,  7 Apr 2024 12:18:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E81C960598
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E81C960598;
	Sun,  7 Apr 2024 12:18:39 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2A0DE1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:18:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 172BE6069A
 for <buildroot@lists.busybox.net>; Sun,  7 Apr 2024 12:18:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nM86RWjwYqvz for <buildroot@lists.busybox.net>;
 Sun,  7 Apr 2024 12:18:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 695DB600C6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 695DB600C6
 for <buildroot@buildroot.org>; Sun,  7 Apr 2024 12:18:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 547EF84C92; Sun,  7 Apr 2024 12:18:37 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 7 Apr 2024 14:09:01 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c7a1ee8f10728fcaab1ab85e93b584d4f3109354
X-Git-Newrev: 0f708344c7108ad8b10e7525a13649a252b39330
X-Patchwork-Hint: ignore
Message-Id: <20240407121837.547EF84C92@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcli: add libxcrypt optional
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f708344c7108ad8b10e7525a13649a252b39330
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump of glibc to version
2.39 in commit b5680f53d60acf8ff6010082f873438a39bd5d97:

/home/autobuild/autobuild/instance-10/output-1/host/lib/gcc/nios2-buildroot-linux-gnu/12.3.0/../../../../nios2-buildroot-linux-gnu/bin/ld: cannot find -lcrypt: No such file or directory

Fixes: b5680f53d60acf8ff6010082f873438a39bd5d97
 - http://autobuild.buildroot.org/results/3a5cc2a90d58f39a6c9f27ad87e0d54e705f0c84

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/libcli/Config.in | 1 +
 package/libcli/libcli.mk | 4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/libcli/Config.in b/package/libcli/Config.in
index b2829cad3f..a5a8872d41 100644
--- a/package/libcli/Config.in
+++ b/package/libcli/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBCLI
 	bool "libcli"
+	select BR2_PACKAGE_LIBXCRYPT if BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Libcli provides a shared library for including a Cisco-like
 	  command-line interface into other software. It's a telnet
diff --git a/package/libcli/libcli.mk b/package/libcli/libcli.mk
index a18daa911c..f3f68f780a 100644
--- a/package/libcli/libcli.mk
+++ b/package/libcli/libcli.mk
@@ -26,6 +26,10 @@ ifeq ($(BR2_STATIC_LIBS),y)
 LIBCLI_MAKE_ARGS += DYNAMIC_LIB=
 endif
 
+ifeq ($(BR2_PACKAGE_LIBXCRYPT),y)
+LIBCLI_DEPENDENCIES += libxcrypt
+endif
+
 define LIBCLI_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) \
 		$(LIBCLI_MAKE_ARGS)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
