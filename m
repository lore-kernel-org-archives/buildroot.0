Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B4BAC5AC7A
	for <buildroot@archiver.kernel.org>; Fri,  7 Aug 2026 09:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0FE9C8111C;
	Fri,  7 Aug 2026 09:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0COO7v7JWJKc; Fri,  7 Aug 2026 09:35:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3518481283
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786095356;
	bh=tCI8F0v2hxN8CsQkLXQrkgfAlywNnSDZWfswXJ6/AnM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TbK5uTiUgsTWkm7Q8lBQF+0sM1+xWLUdYEtDrcTDGtpsvnB3Mq9ZSwPEPv4FJabgN
	 Qg/hPVRtkQkOvVfBp+LyZp0t6CdHXVjet2jXuDzYwcxdMGiwDTJZQuI1+1u7EesI/J
	 l+/CJJEJcyU4uyaIM6zQF5C1BNGpqKSoNrlYQQhZLMQpayorBScdkrUGu0iY7KuRSb
	 7JI7qKYDD+JUo2MyeUyeGChgHxUqzGERt97O+Pl7vdkqQzzUuUem0Igoi1kDWuj7Us
	 75dX0EReSAdUjf5aH/hx04nKRfu3pohYAEbQjyaJjopjfdsXExyQkFKXWj6TumrBVA
	 vSeDhcLGsIT9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3518481283;
	Fri,  7 Aug 2026 09:35:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C59E0397
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B7EEE409FC
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qFcxWYTMWOj0 for <buildroot@buildroot.org>;
 Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0BCED40A22
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0BCED40A22
 for <buildroot@buildroot.org>; Fri,  7 Aug 2026 09:35:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95A308CA3F; Fri,  7 Aug 2026 09:34:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 7 Aug 2026 11:12:42 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: faaa3a4b31754ba0b65e7769b0fdb0cceb1a135f
X-Git-Newrev: 156a50683a8cf4dfeb159cd31273d8bdc04f3e8a
X-Patchwork-Hint: ignore
Message-Id: <20260807093442.95A308CA3F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/argparse: remove
 package
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/156a50683a8cf4dfeb159cd31273d8bdc04f3e8a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

Duplicate of lua-argparse.

Note: the argparse package was introduced in Buildroot commit [1].
lua-argparse was introduced in [2]. For consistency with other Lua
packages which has the "lua-" prefix, this commit removes the package
without the prefix.

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/169d1632d59bc0ddf32e5e5b538c8f5099467064
[2] https://gitlab.com/buildroot.org/buildroot/-/commit/e70abe9716109068b7c9176dced5396719f64c24

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 59f9c25d705aaadeb36db42320ff25b04ddbaf22)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 Config.in.legacy               |  9 +++++++++
 DEVELOPERS                     |  2 +-
 package/Config.in              |  1 -
 package/argparse/Config.in     | 10 ----------
 package/argparse/argparse.hash |  3 ---
 package/argparse/argparse.mk   | 11 -----------
 6 files changed, 10 insertions(+), 26 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a36e331593..96fab167ef 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,15 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2026.05.2"
+
+config BR2_PACKAGE_ARGPARSE
+	bool "argparse has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_LUA_ARGPARSE
+	help
+	  Package argparse duplicates the package lua-argparse.
+
 comment "Legacy options removed in 2026.05"
 
 config BR2_PACKAGE_PTPD2
diff --git a/DEVELOPERS b/DEVELOPERS
index 90fb5968eb..d0484cd84d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2238,10 +2238,10 @@ F:	board/orangepi/orangepi-zero3/
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
index 630662477b..31e958bcdc 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -699,7 +699,6 @@ menu "Lua libraries/modules"
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
