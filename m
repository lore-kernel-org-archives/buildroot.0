Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC903C3ABB2
	for <buildroot@archiver.kernel.org>; Mon, 16 Sep 2024 11:55:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D55460868;
	Mon, 16 Sep 2024 11:55:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OqEMCMXy1e68; Mon, 16 Sep 2024 11:55:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D4A060A54
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9D4A060A54;
	Mon, 16 Sep 2024 11:55:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D28BA1BF2B5
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 11:55:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C145960A54
 for <buildroot@lists.busybox.net>; Mon, 16 Sep 2024 11:55:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wnaHGwJMEL-7 for <buildroot@lists.busybox.net>;
 Mon, 16 Sep 2024 11:55:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DE8EC60868
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id DE8EC60868
 for <buildroot@buildroot.org>; Mon, 16 Sep 2024 11:55:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C904B838FA; Mon, 16 Sep 2024 11:55:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Mon, 16 Sep 2024 13:54:56 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 095cdb5fcd947592a726dc0a82efd4bd2fb2004f
X-Git-Newrev: 648bd52b4a4ddb6f77dccd42e1733af90d9d9c24
X-Patchwork-Hint: ignore
Message-Id: <20240916115532.C904B838FA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-libconf: add package to
 target
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
Content-Type: multipart/mixed; boundary="===============1108589781748709999=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1108589781748709999==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=648bd52b4a4ddb6f77dccd42e1733af90d9d9c24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This package is similar to python-libconfig, but since it is available
in pypi, python developers usually find it more familiar

Signed-off-by: Flávio Tapajós <flavio.tapajos@newtesc.com.br>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/Config.in                        | 1 +
 package/python-libconf/Config.in         | 7 +++++++
 package/python-libconf/python-libconf.mk | 1 +
 3 files changed, 9 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 4c01f44641..2200f16520 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1189,6 +1189,7 @@ menu "External python modules"
 	source "package/python-kiwisolver/Config.in"
 	source "package/python-kmod/Config.in"
 	source "package/python-lark/Config.in"
+	source "package/python-libconf/Config.in"
 	source "package/python-libconfig/Config.in"
 	source "package/python-libevdev/Config.in"
 	source "package/python-libusb1/Config.in"
diff --git a/package/python-libconf/Config.in b/package/python-libconf/Config.in
new file mode 100644
index 0000000000..f5cecec8c6
--- /dev/null
+++ b/package/python-libconf/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_PYTHON_LIBCONF
+	bool "python-libconf"
+	help
+	  libconf is a pure-Python reader/writer for configuration files
+	  in libconfig format, which is often used in C/C++ projects.
+
+	  https://github.com/ChrisAichinger/python-libconf/
diff --git a/package/python-libconf/python-libconf.mk b/package/python-libconf/python-libconf.mk
index b349e3e60e..65bdee8619 100644
--- a/package/python-libconf/python-libconf.mk
+++ b/package/python-libconf/python-libconf.mk
@@ -10,4 +10,5 @@ PYTHON_LIBCONF_SETUP_TYPE = setuptools
 PYTHON_LIBCONF_LICENSE = MIT
 PYTHON_LIBCONF_LICENSE_FILES = LICENSE
 
+$(eval $(python-package))
 $(eval $(host-python-package))

--===============1108589781748709999==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1108589781748709999==--
