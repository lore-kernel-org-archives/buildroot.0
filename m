Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EC4CEEF312
	for <buildroot@archiver.kernel.org>; Thu,  5 Mar 2026 08:02:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8D4B4084A;
	Thu,  5 Mar 2026 08:02:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id p1ZyCLbX9kot; Thu,  5 Mar 2026 08:02:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EAF2940987
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772697769;
	bh=KvUzw0uDwQIXoANa5Qqg+sEM0xTcsNB804OyQ2D+v/I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=LlqZ73YRxv01TiNyft1mszIZmSo8pA9xbxlHFuc1koJSi62H2JE+4kH2dF9GWiFzf
	 zdJHEXlLP3YNxQKxYO8cQip5D2nDOgr0yrhOFV54rI+gw0bvajQONBwAG0i+8vJsdE
	 znEKkX7HNbquX/AAaw2l807N0bQdz+9klAgENtTFMb1ORRg+JfxcvlVo+Xi4w0fLw4
	 RV8iXuRbLo4dUIiCzEqW0BIdg9DYZ2fqIafssaSlFhetlvws3u9HnA2r3Xhcdb4JRP
	 nwy4j4aSECV65z3fSZMSZZA33ltu360FFzbBN9YP//3mkECTrk4n5cF+oMGLhlNtEZ
	 xfWH1ZJxXVYhQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAF2940987;
	Thu,  5 Mar 2026 08:02:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11FDF34F
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B67E6060C
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dGpN3bY8THKw for <buildroot@buildroot.org>;
 Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1A6FD6079F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1A6FD6079F
 for <buildroot@buildroot.org>; Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 26DDD863DF; Thu,  5 Mar 2026 08:02:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Mar 2026 21:18:56 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e555590b94532097c1319b9450ac84fab06b758b
X-Git-Newrev: aee709bd45d90fb12577530d1e37ace4e198c778
X-Patchwork-Hint: ignore
Message-Id: <20260305080209.26DDD863DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/iniparser: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/aee709bd45d90fb12577530d1e37ace4e198c778
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The iniparser is a simple C library offering ini file parsing services.

ndctl[1] requires it.

[1] https://github.com/pmem/ndctl

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                |  1 +
 package/iniparser/Config.in      |  7 +++++++
 package/iniparser/iniparser.hash |  3 +++
 package/iniparser/iniparser.mk   | 14 ++++++++++++++
 4 files changed, 25 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 371a1c33e1..5c7ab57101 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -2305,6 +2305,7 @@ menu "Text and terminal handling"
 	source "package/fstrcmp/Config.in"
 	source "package/icu/Config.in"
 	source "package/inih/Config.in"
+	source "package/iniparser/Config.in"
 	source "package/libcli/Config.in"
 	source "package/libecoli/Config.in"
 	source "package/libedit/Config.in"
diff --git a/package/iniparser/Config.in b/package/iniparser/Config.in
new file mode 100644
index 0000000000..56764c04e6
--- /dev/null
+++ b/package/iniparser/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_INIPARSER
+	bool "iniparser"
+	help
+	  iniparser is a simple C library offering ini file
+	  parsing services.
+
+	  https://gitlab.com/iniparser/iniparser
diff --git a/package/iniparser/iniparser.hash b/package/iniparser/iniparser.hash
new file mode 100644
index 0000000000..27a5fa81aa
--- /dev/null
+++ b/package/iniparser/iniparser.hash
@@ -0,0 +1,3 @@
+# locally computed
+sha256  67575ed032a544d5359610e5f697af786371bbc3eb01311218ef8adfd3e5e329  iniparser-v4.2.6.tar.gz
+sha256  da809b67f3cc571433b7b97d4253ae1f9d8817770aa859aad202df6bde1d5fde  LICENSE
diff --git a/package/iniparser/iniparser.mk b/package/iniparser/iniparser.mk
new file mode 100644
index 0000000000..d5e4601d2b
--- /dev/null
+++ b/package/iniparser/iniparser.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# iniparser
+#
+################################################################################
+
+INIPARSER_VERSION = 4.2.6
+INIPARSER_SITE = https://gitlab.com/iniparser/iniparser/-/archive/v$(INIPARSER_VERSION)
+INIPARSER_SOURCE = iniparser-v$(INIPARSER_VERSION).tar.gz
+INIPARSER_INSTALL_STAGING = YES
+INIPARSER_LICENSE = MIT
+INIPARSER_LICENSE_FILES = LICENSE
+
+$(eval $(cmake-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
