Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE6F8C55177
	for <buildroot@archiver.kernel.org>; Sun,  2 Aug 2026 16:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7923F60675;
	Sun,  2 Aug 2026 16:46:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id V5On0kGu0Nba; Sun,  2 Aug 2026 16:46:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 74D066061A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785689161;
	bh=RM4k20sj74WCdQUk0nFYTJofN6y2/3V6X3V/Ce/adLk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W4jwyLWsdiI80FYp+4OKfkRlTGpJ7xFMZboP7cb7UVEqFcZq48gRpRR6C01+JtVRO
	 NwlLv0J/NDyIKf8aYjut9u64E8jXYOn8HHmdhWantpE9ukE1k6IgfkUkOqCddN+1T2
	 klgoe0UqSumBKNIvZrmpqkt/2qEiNk5Q+7NU5VDjDwOUz8pz69+f1usJ2kAOsQrNOt
	 P6fQAlyMSgyDeKEiVWw6nswkcMxdGbNg8/W7MopvpjjlJ/AWIghhLX7r0wCPX45qmq
	 X/uyd5Azh3ZD9h5CTdzCVB1hUnOoBh8VtAnNDJRuQtB+Ei/LK2uOaTOhWg6J25/Rmp
	 F0NNFYETfrpTg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 74D066061A;
	Sun,  2 Aug 2026 16:46:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B7D072CE
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 16:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AA8416061A
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 16:45:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id utZECqux16WG for <buildroot@buildroot.org>;
 Sun,  2 Aug 2026 16:45:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B335605F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B335605F4
 for <buildroot@buildroot.org>; Sun,  2 Aug 2026 16:45:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6972F8B82A; Sun,  2 Aug 2026 16:45:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 2 Aug 2026 18:35:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dd7ec89b7eaf1b9e1893ea8fb5d2c9600b88ef02
X-Git-Newrev: 59f9c25d705aaadeb36db42320ff25b04ddbaf22
X-Patchwork-Hint: ignore
Message-Id: <20260802164513.6972F8B82A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/argparse: remove package
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/59f9c25d705aaadeb36db42320ff25b04ddbaf22
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Duplicate of lua-argparse.

Note: the argparse package was introduced in Buildroot commit [1].
lua-argparse was introduced in [2]. For consistency with other Lua
packages which has the "lua-" prefix, this commit removes the package
without the prefix.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/169d1632d59bc0ddf32e5e5b538c8f5099467064
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/e70abe9716109068b7c9176dced5396719f64c24

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy               |  7 +++++++
 DEVELOPERS                     |  2 +-
 package/Config.in              |  1 -
 package/argparse/Config.in     | 10 ----------
 package/argparse/argparse.hash |  3 ---
 package/argparse/argparse.mk   | 11 -----------
 6 files changed, 8 insertions(+), 26 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 4894fe7065..9a6c417f03 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.08"
 
+config BR2_PACKAGE_ARGPARSE
+	bool "argparse has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LUA_ARGPARSE
+	help
+	  Package argparse duplicates the package lua-argparse.
+
 config BR2_KERNEL_HEADERS_7_0
 	bool "kernel headers version 7.0.x are no longer supported"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index b4ca50a10e..f0ae9e3407 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2250,10 +2250,10 @@ F:	board/orangepi/orangepi-zero3/
 F:	configs/grinn_*
 F:	configs/orangepi_zero_plus_defconfig
 F:	configs/orangepi_zero3_defconfig
-F:	package/argparse/
 F:	package/dt-utils/
 F:	package/easydbus/
 F:	package/gitlab-runner/
+F:	package/lua-argparse/
 F:	package/lua-flu/
 F:	package/lua-stdlib/
 F:	package/luaossl/
diff --git a/package/Config.in b/package/Config.in
index cdf996fe24..ee0aadbec1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -702,7 +702,6 @@ menu "Lua libraries/modules"
 # upstream package is "luafoo", call it "luafoo" in Buildroot; if the upstream
 # package is "foo", call it "lua-foo". Many packages currently don't follow
 # this convention, but that's historical accident.
-	source "package/argparse/Config.in"
 	source "package/cgilua/Config.in"
 	source "package/copas/Config.in"
 	source "package/coxpcall/Config.in"
diff --git a/package/argparse/Config.in b/package/argparse/Config.in
deleted file mode 100644
index d02b191254..0000000000
--- a/package/argparse/Config.in
+++ /dev/null
@@ -1,10 +0,0 @@
-config BR2_PACKAGE_ARGPARSE
-	bool "argparse"
-	help
-	  Argparse is a feature-rich command line parser for Lua
-	  inspired by argparse for Python. Argparse supports
-	  positional arguments, options, flags, optional arguments,
-	  subcommands and more. Argparse automatically generates
-	  usage, help and error messages.
-
-	  https://github.com/luarocks/argparse
diff --git a/package/argparse/argparse.hash b/package/argparse/argparse.hash
deleted file mode 100644
index c573ba5796..0000000000
--- a/package/argparse/argparse.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# computed by luarocks/buildroot
-sha256  ea30d0643586a20aeb6349ca8cb7db63aefc21d9aa007c7b7168a7c564817879  argparse-0.7.1-1.src.rock
-sha256  9a918f21485b2a4529c901491d9101392f03586d65ad5b024a4445ebc1dc37b4  argparse-0.7.1/LICENSE
diff --git a/package/argparse/argparse.mk b/package/argparse/argparse.mk
deleted file mode 100644
index d719e67d83..0000000000
--- a/package/argparse/argparse.mk
+++ /dev/null
@@ -1,11 +0,0 @@
-################################################################################
-#
-# argparse
-#
-################################################################################
-
-ARGPARSE_VERSION = 0.7.1-1
-ARGPARSE_LICENSE = MIT
-ARGPARSE_LICENSE_FILES = $(ARGPARSE_SUBDIR)/LICENSE
-
-$(eval $(luarocks-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
