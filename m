Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71745C001DC
	for <buildroot@archiver.kernel.org>; Sun, 30 Jul 2023 21:56:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 193C46103C;
	Sun, 30 Jul 2023 21:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 193C46103C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Buzrp78aKJ7T; Sun, 30 Jul 2023 21:56:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 701706104F;
	Sun, 30 Jul 2023 21:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 701706104F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7C32C1BF401
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:55:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 53CDD404B0
 for <buildroot@lists.busybox.net>; Sun, 30 Jul 2023 21:55:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 53CDD404B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UmSQFVE_mS67 for <buildroot@lists.busybox.net>;
 Sun, 30 Jul 2023 21:55:45 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 28A3540B11
 for <buildroot@buildroot.org>; Sun, 30 Jul 2023 21:55:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 28A3540B11
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1754583D59; Sun, 30 Jul 2023 21:55:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jul 2023 23:54:02 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: baff13d0799e840ccffe0751c07172ecf206de96
X-Git-Newrev: 9163dd1321360a7ac265837c75632bc00f3b3a13
X-Patchwork-Hint: ignore
Message-Id: <20230730215545.1754583D59@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lua-dkjson: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=9163dd1321360a7ac265837c75632bc00f3b3a13
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                  |  1 +
 package/lua-dkjson/Config.in       |  9 +++++++++
 package/lua-dkjson/lua-dkjson.hash |  5 +++++
 package/lua-dkjson/lua-dkjson.mk   | 12 ++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 43c38d7d99..a60a1a8858 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -718,6 +718,7 @@ menu "Lua libraries/modules"
 	source "package/lua-csnappy/Config.in"
 	source "package/lua-curl/Config.in"
 	source "package/lua-datafile/Config.in"
+	source "package/lua-dkjson/Config.in"
 	source "package/lua-ev/Config.in"
 	source "package/lua-fifo/Config.in"
 	source "package/lua-flu/Config.in"
diff --git a/package/lua-dkjson/Config.in b/package/lua-dkjson/Config.in
new file mode 100644
index 0000000000..9c5dff1928
--- /dev/null
+++ b/package/lua-dkjson/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LUA_DKJSON
+	bool "lua-dkjson"
+	help
+	  David Kolf's JSON module for Lua.
+
+	  dkjson is written in Lua without any dependencies, but
+	  when LPeg is available dkjson can use it to speed up decoding.
+
+	  http://dkolf.de/src/dkjson-lua.fsl/
diff --git a/package/lua-dkjson/lua-dkjson.hash b/package/lua-dkjson/lua-dkjson.hash
new file mode 100644
index 0000000000..8f1a6f6a2f
--- /dev/null
+++ b/package/lua-dkjson/lua-dkjson.hash
@@ -0,0 +1,5 @@
+# computed by luarocks/buildroot
+sha256  e4ba15f2a85f84ffc7f628157a4ad16b2b04ba05eb44a2e5956fa46bd104125e  dkjson-2.6-1.src.rock
+
+# locally computed
+sha256  7fd6585e9776c1cf2930e8ce660b3116c8a9b4b676929d45078870a42f16aa65  dkjson-2.6/readme.txt
diff --git a/package/lua-dkjson/lua-dkjson.mk b/package/lua-dkjson/lua-dkjson.mk
new file mode 100644
index 0000000000..718c47f50e
--- /dev/null
+++ b/package/lua-dkjson/lua-dkjson.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# lua-dkjson
+#
+################################################################################
+
+LUA_DKJSON_VERSION = 2.6-1
+LUA_DKJSON_NAME_UPSTREAM = dkjson
+LUA_DKJSON_LICENSE = MIT
+LUA_DKJSON_LICENSE_FILES = $(LUA_DKJSON_SUBDIR)/readme.txt
+
+$(eval $(luarocks-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
