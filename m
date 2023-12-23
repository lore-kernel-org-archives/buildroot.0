Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F16C3DA6E
	for <buildroot@archiver.kernel.org>; Sat, 23 Dec 2023 17:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 13B3D4090C;
	Sat, 23 Dec 2023 17:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13B3D4090C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sV_UPfzC79s0; Sat, 23 Dec 2023 17:09:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21E2241751;
	Sat, 23 Dec 2023 17:09:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21E2241751
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F4C21BF2C2
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:09:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D8A5A41751
 for <buildroot@lists.busybox.net>; Sat, 23 Dec 2023 17:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8A5A41751
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Azsxj2B7GEyv for <buildroot@lists.busybox.net>;
 Sat, 23 Dec 2023 17:09:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0840E4090C
 for <buildroot@buildroot.org>; Sat, 23 Dec 2023 17:09:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0840E4090C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E91B187D6A; Sat, 23 Dec 2023 17:09:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 23 Dec 2023 18:05:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fbf939b03a5d21144eb84e488ed9db8baad54c23
X-Git-Newrev: e70abe9716109068b7c9176dced5396719f64c24
X-Patchwork-Hint: ignore
Message-Id: <20231223170912.E91B187D6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-argparse: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=e70abe9716109068b7c9176dced5396719f64c24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                      |  1 +
 package/lua-argparse/Config.in         |  6 ++++++
 package/lua-argparse/lua-argparse.hash |  3 +++
 package/lua-argparse/lua-argparse.mk   | 12 ++++++++++++
 4 files changed, 22 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 083372131c..73d286a861 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -717,6 +717,7 @@ menu "Lua libraries/modules"
 	source "package/lsqlite3/Config.in"
 	source "package/lua-ansicolors/Config.in"
 	source "package/lua-argon2/Config.in"
+	source "package/lua-argparse/Config.in"
 	source "package/lua-augeas/Config.in"
 	source "package/lua-basexx/Config.in"
 	source "package/lua-binaryheap/Config.in"
diff --git a/package/lua-argparse/Config.in b/package/lua-argparse/Config.in
new file mode 100644
index 0000000000..503a001c99
--- /dev/null
+++ b/package/lua-argparse/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LUA_ARGPARSE
+	bool "lua-argparse"
+	help
+	  A feature-rich command-line argument parser.
+
+	  https://github.com/luarocks/argparse
diff --git a/package/lua-argparse/lua-argparse.hash b/package/lua-argparse/lua-argparse.hash
new file mode 100644
index 0000000000..c573ba5796
--- /dev/null
+++ b/package/lua-argparse/lua-argparse.hash
@@ -0,0 +1,3 @@
+# computed by luarocks/buildroot
+sha256  ea30d0643586a20aeb6349ca8cb7db63aefc21d9aa007c7b7168a7c564817879  argparse-0.7.1-1.src.rock
+sha256  9a918f21485b2a4529c901491d9101392f03586d65ad5b024a4445ebc1dc37b4  argparse-0.7.1/LICENSE
diff --git a/package/lua-argparse/lua-argparse.mk b/package/lua-argparse/lua-argparse.mk
new file mode 100644
index 0000000000..77f6550fac
--- /dev/null
+++ b/package/lua-argparse/lua-argparse.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# lua-argparse
+#
+################################################################################
+
+LUA_ARGPARSE_VERSION = 0.7.1-1
+LUA_ARGPARSE_NAME_UPSTREAM = argparse
+LUA_ARGPARSE_LICENSE = MIT
+LUA_ARGPARSE_LICENSE_FILES = $(LUA_ARGPARSE_SUBDIR)/LICENSE
+
+$(eval $(luarocks-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
