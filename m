Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601A5C28B30
	for <buildroot@archiver.kernel.org>; Thu, 20 Mar 2025 22:16:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 276EE8346C;
	Thu, 20 Mar 2025 22:16:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dQYPZZ-pLQPe; Thu, 20 Mar 2025 22:16:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48BF483089
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48BF483089;
	Thu, 20 Mar 2025 22:16:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 7B4481A4
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:16:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6DB7D60F07
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:16:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id whgYsxdskqxl for <buildroot@buildroot.org>;
 Thu, 20 Mar 2025 22:16:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D1A960F06
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D1A960F06
 for <buildroot@buildroot.org>; Thu, 20 Mar 2025 22:16:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8711188236; Thu, 20 Mar 2025 22:16:37 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Thu, 20 Mar 2025 22:58:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3a03cb2ad61e78544e5aa1ee64790e356c692713
X-Git-Newrev: 6f02f7b2929577444c9d43770e36a513b47bc5f2
X-Patchwork-Hint: ignore
Message-Id: <20250320221637.8711188236@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-simple-pid: new package
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6f02f7b2929577444c9d43770e36a513b47bc5f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/Config.in                                |  1 +
 package/python-simple-pid/Config.in              |  6 ++++++
 package/python-simple-pid/python-simple-pid.hash |  5 +++++
 package/python-simple-pid/python-simple-pid.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 8a5c992626..5c6e334a75 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1389,6 +1389,7 @@ menu "External python modules"
 	source "package/python-setuptools/Config.in"
 	source "package/python-sh/Config.in"
 	source "package/python-shutilwhich/Config.in"
+	source "package/python-simple-pid/Config.in"
 	source "package/python-simple-websocket/Config.in"
 	source "package/python-simpleaudio/Config.in"
 	source "package/python-simplegeneric/Config.in"
diff --git a/package/python-simple-pid/Config.in b/package/python-simple-pid/Config.in
new file mode 100644
index 0000000000..d3985efe73
--- /dev/null
+++ b/package/python-simple-pid/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_SIMPLE_PID
+	bool "python-simple-pid"
+	help
+	  A simple, easy to use PID controller.
+
+	  https://github.com/m-lundberg/simple-pid
diff --git a/package/python-simple-pid/python-simple-pid.hash b/package/python-simple-pid/python-simple-pid.hash
new file mode 100644
index 0000000000..1e36ace439
--- /dev/null
+++ b/package/python-simple-pid/python-simple-pid.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/simple-pid/json
+md5  79fc6af22bb66553674026a3e4b7cf74  simple_pid-2.0.1.tar.gz
+sha256  5771761c54541c900e597d6c2e4ea93fd2cc98f4e48cb9eca265fba2e65be99e  simple_pid-2.0.1.tar.gz
+# Locally computed sha256 checksums
+sha256  a065b200f76a198209b41194d4f620f50e06181d275cbd58146a9632bbcc183a  LICENSE.md
diff --git a/package/python-simple-pid/python-simple-pid.mk b/package/python-simple-pid/python-simple-pid.mk
new file mode 100644
index 0000000000..ed3bbb329f
--- /dev/null
+++ b/package/python-simple-pid/python-simple-pid.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-simple-pid
+#
+################################################################################
+
+PYTHON_SIMPLE_PID_VERSION = 2.0.1
+PYTHON_SIMPLE_PID_SOURCE = simple_pid-$(PYTHON_SIMPLE_PID_VERSION).tar.gz
+PYTHON_SIMPLE_PID_SITE = https://files.pythonhosted.org/packages/78/0a/c670a4f4dea4b21c0b074b193c54698e5e047479e688c8d5495d264c9921
+PYTHON_SIMPLE_PID_SETUP_TYPE = setuptools
+PYTHON_SIMPLE_PID_LICENSE = MIT
+PYTHON_SIMPLE_PID_LICENSE_FILES = LICENSE.md
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
