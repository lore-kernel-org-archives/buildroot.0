Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A052C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 19:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BF720404B7;
	Sun, 20 Feb 2022 19:23:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BfRFbuhROwH5; Sun, 20 Feb 2022 19:23:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C8B5404B2;
	Sun, 20 Feb 2022 19:23:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 924281BF476
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 19:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D3CA8174F
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 19:23:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YvnYNp7sdZVq for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 19:23:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id D0E5181448
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 19:23:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 37DE582BCF; Sun, 20 Feb 2022 19:15:24 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Feb 2022 20:22:11 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20c5569f9c2415364a1d873bc5089dc0ff0f8a35
X-Git-Newrev: 25fc617963b4ae28b20e9bc07863500f62c0862d
X-Patchwork-Hint: ignore
Message-Id: <20220220191524.37DE582BCF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/luasyslog: bump to version 2.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=25fc617963b4ae28b20e9bc07863500f62c0862d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump contains a single commit which fixes the following build
failure with Lua 5.4 raised since commit
4f9a5659023c66fc166de28fd39a6c97a9490667:

In file included from lsyslog.c:11:
compat-5.3.h:402:4: error: #error "unsupported Lua version (i.e. not Lua 5.1, 5.2, or 5.3)"
  402 | #  error "unsupported Lua version (i.e. not Lua 5.1, 5.2, or 5.3)"
      |    ^~~~~

Also update indentation in hash file (two spaces)

Fixes:
 - http://autobuild.buildroot.org/results/df2aabcf2ae07cad66b869ec4ac76702d2c32dc5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Romain Naour <romain.naour@gmail.com>
Tested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/luasyslog/luasyslog.hash | 4 ++--
 package/luasyslog/luasyslog.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/luasyslog/luasyslog.hash b/package/luasyslog/luasyslog.hash
index bcb6a7e025..1e2a5ddec5 100644
--- a/package/luasyslog/luasyslog.hash
+++ b/package/luasyslog/luasyslog.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 7f7dad64117407f2484ff5b53e90804f923a99fcbde5872e54f6aba53f482da0  luasyslog-2.2.0.tar.gz
-sha256 833457938f5155e65dabda12a5c9d4b6fd7fb92dd7ead584c1c30cfb0c84adf4  COPYING
+sha256  b1b19ca142130f93c3f8f2e85303ff50cc6f4ed4aa52b8569176ae56e3dc3f43  luasyslog-2.2.1.tar.gz
+sha256  833457938f5155e65dabda12a5c9d4b6fd7fb92dd7ead584c1c30cfb0c84adf4  COPYING
diff --git a/package/luasyslog/luasyslog.mk b/package/luasyslog/luasyslog.mk
index 049e068a13..972d4c5a7d 100644
--- a/package/luasyslog/luasyslog.mk
+++ b/package/luasyslog/luasyslog.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUASYSLOG_VERSION = 2.2.0
+LUASYSLOG_VERSION = 2.2.1
 LUASYSLOG_SITE = $(call github,ntd,luasyslog,$(LUASYSLOG_VERSION))
 LUASYSLOG_DEPENDENCIES = host-luarocks luainterpreter
 LUASYSLOG_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
