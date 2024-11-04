Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4801D1BDF1
	for <buildroot@archiver.kernel.org>; Mon,  4 Nov 2024 20:42:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 27A22810AF;
	Mon,  4 Nov 2024 20:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4daaTdNsZwVS; Mon,  4 Nov 2024 20:42:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 88308810BC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 88308810BC;
	Mon,  4 Nov 2024 20:42:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C1F993B
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8805B8101B
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7QJdZyVKYCrL for <buildroot@buildroot.org>;
 Mon,  4 Nov 2024 20:42:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9006B81024
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9006B81024
 for <buildroot@buildroot.org>; Mon,  4 Nov 2024 20:42:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8CA7884CC9; Mon,  4 Nov 2024 20:42:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 4 Nov 2024 21:39:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52d9a521692140cf53f38ae88f8a8686ba796d16
X-Git-Newrev: 02e859b8d30fd98e366180f9ab2465ca141b0597
X-Patchwork-Hint: ignore
Message-Id: <20241104204205.8CA7884CC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tinyhtml5: new package
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=02e859b8d30fd98e366180f9ab2465ca141b0597
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/Config.in                              |  1 +
 package/python-tinyhtml5/Config.in             |  7 +++++++
 package/python-tinyhtml5/python-tinyhtml5.hash |  5 +++++
 package/python-tinyhtml5/python-tinyhtml5.mk   | 14 ++++++++++++++
 4 files changed, 27 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 876b340a8a..15b35fb55d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1425,6 +1425,7 @@ menu "External python modules"
 	source "package/python-tftpy/Config.in"
 	source "package/python-thrift/Config.in"
 	source "package/python-tinycss2/Config.in"
+	source "package/python-tinyhtml5/Config.in"
 	source "package/python-tinyrpc/Config.in"
 	source "package/python-tomako/Config.in"
 	source "package/python-toml/Config.in"
diff --git a/package/python-tinyhtml5/Config.in b/package/python-tinyhtml5/Config.in
new file mode 100644
index 0000000000..3243d143e7
--- /dev/null
+++ b/package/python-tinyhtml5/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_TINYHTML5
+	bool "python-tinyhtml5"
+	select BR2_PACKAGE_PYTHON_WEBENCODINGS # runtime
+	help
+	  HTML parser based on the WHATWG HTML specification.
+
+	  https://github.com/CourtBouillon/tinyhtml5
diff --git a/package/python-tinyhtml5/python-tinyhtml5.hash b/package/python-tinyhtml5/python-tinyhtml5.hash
new file mode 100644
index 0000000000..55afa09597
--- /dev/null
+++ b/package/python-tinyhtml5/python-tinyhtml5.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/tinyhtml5/json
+md5  c5fa2991d6d1ea65e923279c435b816e  tinyhtml5-2.0.0.tar.gz
+sha256  086f998833da24c300c414d9fe81d9b368fd04cb9d2596a008421cbc705fcfcc  tinyhtml5-2.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  16a39991619e92f18680932da2a9199fdf7d95df3ecaedc52ea06218aabafd6f  LICENSE
diff --git a/package/python-tinyhtml5/python-tinyhtml5.mk b/package/python-tinyhtml5/python-tinyhtml5.mk
new file mode 100644
index 0000000000..373ab8aa54
--- /dev/null
+++ b/package/python-tinyhtml5/python-tinyhtml5.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-tinyhtml5
+#
+################################################################################
+
+PYTHON_TINYHTML5_VERSION = 2.0.0
+PYTHON_TINYHTML5_SOURCE = tinyhtml5-$(PYTHON_TINYHTML5_VERSION).tar.gz
+PYTHON_TINYHTML5_SITE = https://files.pythonhosted.org/packages/fd/03/6111ed99e9bf7dfa1c30baeef0e0fb7e0bd387bd07f8e5b270776fe1de3f
+PYTHON_TINYHTML5_SETUP_TYPE = flit
+PYTHON_TINYHTML5_LICENSE = MIT
+PYTHON_TINYHTML5_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
