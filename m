Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E579C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:10:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6E18819D1;
	Fri, 28 Feb 2025 17:09:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WsRLxoTe43JN; Fri, 28 Feb 2025 17:09:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A61A18176A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A61A18176A;
	Fri, 28 Feb 2025 17:09:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15ACF68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0CEE8402B5
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yIYHQuBTefku for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0C060419AD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C060419AD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0384487A92; Fri, 28 Feb 2025 16:30:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 23:41:42 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 648456ac096d6a7b21f9372a43db08ce8376c91c
X-Git-Newrev: 998e8ccb1ffa77fcc5e70f361322682714db4f7c
X-Patchwork-Hint: ignore
Message-Id: <20250228163028.0384487A92@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/netopeer2: fix
 shellcheck warnings
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=998e8ccb1ffa77fcc5e70f361322682714db4f7c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The init script S52netopeer2 has to be renamed to S52netopeer2-server to
match the daemon name. The step to install the init script now uses the
NETOPEER2_PKGDIR variable to reference the directory instead of
explicitly using the "package/netopeer2/" path.

The init script now is removed from the .checkpackageignore file.

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .checkpackageignore                                     | 1 -
 package/netopeer2/{S52netopeer2 => S52netopeer2-server} | 2 +-
 package/netopeer2/netopeer2.mk                          | 4 ++--
 3 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 68ad366d79..7ebfdd0499 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -861,7 +861,6 @@ package/neard/S53neard Shellcheck lib_sysv.Indent lib_sysv.Variables
 package/neardal/0001-lib-neardal.h-fix-build-with-gcc-10.patch lib_patch.Upstream
 package/netatalk/S50netatalk lib_sysv.EmptyLastLine lib_sysv.Indent lib_sysv.Variables
 package/netcat/0001-signed-bit-counting.patch lib_patch.Sob lib_patch.Upstream
-package/netopeer2/S52netopeer2 Shellcheck lib_sysv.Variables
 package/netperf/0001-src-nettest_omni.c-fix-compilation-with-GCC10.patch lib_patch.Upstream
 package/netplug/0001-makefile-flags.patch lib_patch.Sob lib_patch.Upstream
 package/netplug/0002-add-missing-time-include.patch lib_patch.Upstream
diff --git a/package/netopeer2/S52netopeer2 b/package/netopeer2/S52netopeer2-server
similarity index 92%
rename from package/netopeer2/S52netopeer2
rename to package/netopeer2/S52netopeer2-server
index cadd6b9feb..3fd993b578 100644
--- a/package/netopeer2/S52netopeer2
+++ b/package/netopeer2/S52netopeer2-server
@@ -7,7 +7,7 @@ NETOPEER2_SERVER_ARGS=""
 
 start() {
 	printf 'Starting %s: ' "$DAEMON"
-
+	# shellcheck disable=SC2086 # we need the word splitting
 	start-stop-daemon -S -q -p $PIDFILE -x "/usr/sbin/$DAEMON" \
 		-- $NETOPEER2_SERVER_ARGS
 	status=$?
diff --git a/package/netopeer2/netopeer2.mk b/package/netopeer2/netopeer2.mk
index 47fcd31acd..4853e5d176 100644
--- a/package/netopeer2/netopeer2.mk
+++ b/package/netopeer2/netopeer2.mk
@@ -29,8 +29,8 @@ NETOPEER2_MAKE_ENV = \
 	SYSREPO_SHM_PREFIX=$(NETOPEER2_SYSREPO_SHM_PREFIX)
 
 define NETOPEER2_INSTALL_INIT_SYSV
-	$(INSTALL) -m 755 -D package/netopeer2/S52netopeer2 \
-		$(TARGET_DIR)/etc/init.d/S52netopeer2
+	$(INSTALL) -m 755 -D $(NETOPEER2_PKGDIR)/S52netopeer2-server \
+		$(TARGET_DIR)/etc/init.d/S52netopeer2-server
 endef
 
 # The host sysrepo used to install the netopeer2 modules will leave
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
