Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F61C3DA7F
	for <buildroot@archiver.kernel.org>; Wed,  7 Aug 2024 20:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 356B560900;
	Wed,  7 Aug 2024 20:56:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RfSM5w1AhTEM; Wed,  7 Aug 2024 20:56:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B36C5608D5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B36C5608D5;
	Wed,  7 Aug 2024 20:56:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F08771BF308
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 20:56:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DE60C400FB
 for <buildroot@lists.busybox.net>; Wed,  7 Aug 2024 20:56:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DnWqfKU9w8Ge for <buildroot@lists.busybox.net>;
 Wed,  7 Aug 2024 20:56:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C540400D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2C540400D1
 for <buildroot@buildroot.org>; Wed,  7 Aug 2024 20:56:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 17D51846E1; Wed,  7 Aug 2024 20:56:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 7 Aug 2024 22:54:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e506946347430e8bc721b55248e625d6668f4c72
X-Git-Newrev: 9dff7ad7da4e31d09450a049371ac12f1ebd146f
X-Patchwork-Hint: ignore
Message-Id: <20240807205604.17D51846E1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tomli-w: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=9dff7ad7da4e31d09450a049371ac12f1ebd146f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                          |  1 +
 package/python-tomli-w/Config.in           |  6 ++++++
 package/python-tomli-w/python-tomli-w.hash |  5 +++++
 package/python-tomli-w/python-tomli-w.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 0472ec2daf..f2c63ffb6e 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1408,6 +1408,7 @@ menu "External python modules"
 	source "package/python-tomako/Config.in"
 	source "package/python-toml/Config.in"
 	source "package/python-tomli/Config.in"
+	source "package/python-tomli-w/Config.in"
 	source "package/python-tomlkit/Config.in"
 	source "package/python-tornado/Config.in"
 	source "package/python-tortoise-orm/Config.in"
diff --git a/package/python-tomli-w/Config.in b/package/python-tomli-w/Config.in
new file mode 100644
index 0000000000..83fe937eba
--- /dev/null
+++ b/package/python-tomli-w/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_TOMLI_W
+	bool "python-tomli-w"
+	help
+	  A lil' TOML writer.
+
+	  https://github.com/hukkin/tomli-w
diff --git a/package/python-tomli-w/python-tomli-w.hash b/package/python-tomli-w/python-tomli-w.hash
new file mode 100644
index 0000000000..778c22583a
--- /dev/null
+++ b/package/python-tomli-w/python-tomli-w.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/tomli-w/json
+md5  2c050134d4842b449ec4129c97d51e62  tomli_w-1.0.0.tar.gz
+sha256  f463434305e0336248cac9c2dc8076b707d8a12d019dd349f5c1e382dd1ae1b9  tomli_w-1.0.0.tar.gz
+# Locally computed sha256 checksums
+sha256  b80816b0d530b8accb4c2211783790984a6e3b61922c2b5ee92f3372ab2742fe  LICENSE
diff --git a/package/python-tomli-w/python-tomli-w.mk b/package/python-tomli-w/python-tomli-w.mk
new file mode 100644
index 0000000000..d5d7ab9f2c
--- /dev/null
+++ b/package/python-tomli-w/python-tomli-w.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-tomli-w
+#
+################################################################################
+
+PYTHON_TOMLI_W_VERSION = 1.0.0
+PYTHON_TOMLI_W_SOURCE = tomli_w-$(PYTHON_TOMLI_W_VERSION).tar.gz
+PYTHON_TOMLI_W_SITE = https://files.pythonhosted.org/packages/49/05/6bf21838623186b91aedbda06248ad18f03487dc56fbc20e4db384abde6c
+PYTHON_TOMLI_W_SETUP_TYPE = flit
+PYTHON_TOMLI_W_LICENSE = MIT
+PYTHON_TOMLI_W_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
