Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56CB5F3D601
	for <buildroot@archiver.kernel.org>; Sun, 29 Mar 2026 11:06:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63F3560A73;
	Sun, 29 Mar 2026 11:06:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HRUnhezf_-2d; Sun, 29 Mar 2026 11:06:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70B3760A74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774782403;
	bh=Aw6Ut+qhEs0m/DyuFVXackvk73tDpW8sQAcjGHcy5i0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IG7DT2peqeNgYblNg3qIsEsT2djHOHFzqm9oy9UXbKVcpLnEC+M0EAKO25mWy+1iu
	 xhtMXfR0maExNZFLw6Nmv093n/Y88AxsvJYxRIfAnFmqmva2Y8Pt2HzH/T4YR0bTVV
	 2Je/j2ITQaNOENBPC7BhBKWb6kZV5mn5uee/fXmPW2EHkq4gr3akn//SvTJlmM9Di4
	 U5722XpE230GJhOgNey7fxfQGzzlzKHNcwk+3xVh/VUgOm7veq0qk0Au6/b3S4fpUm
	 sDIYE77xEod/855BhxXB+MIi6rUYJbYC/Wz7IjYcmonxQ4ia2567s/+yMrZxd28vFp
	 0EfhQbk6mAoFg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70B3760A74;
	Sun, 29 Mar 2026 11:06:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 663022EB
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 11:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 551EB608F0
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 11:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OAvuFiAfkab5 for <buildroot@buildroot.org>;
 Sun, 29 Mar 2026 11:06:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4475660770
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4475660770
 for <buildroot@buildroot.org>; Sun, 29 Mar 2026 11:06:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 969F57FDB9; Sun, 29 Mar 2026 11:06:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 29 Mar 2026 12:03:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6c0ceb48b3d6561315e4e5c66329fa635ba89dd1
X-Git-Newrev: fb53371286f912fc3e4dfe9a61b6e5fcb2935c90
X-Patchwork-Hint: ignore
Message-Id: <20260329110635.969F57FDB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gymnasium: new package
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/fb53371286f912fc3e4dfe9a61b6e5fcb2935c90
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Add support for the python-gymnasium package, which provides a
standard API for reinforcement learning and a broad suite of
reference environments. Gymnasium is the maintained successor
to OpenAI Gym, developed by the Farama Foundation.

Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 DEVELOPERS                                     |  1 +
 package/Config.in                              |  1 +
 package/python-gymnasium/Config.in             | 11 +++++++++++
 package/python-gymnasium/python-gymnasium.hash |  5 +++++
 package/python-gymnasium/python-gymnasium.mk   | 14 ++++++++++++++
 5 files changed, 32 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index a4d5d37eff..b2d3305db6 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -3482,6 +3482,7 @@ F:	configs/ti_am64x_sk_defconfig
 N:	Xukai Wang <kingxukai@zohomail.com>
 F:	package/python-cloudpickle/
 F:	package/python-farama-notifications/
+F:	package/python-gymnasium/
 
 N:	Yair Ben Avraham <yairba@protonmail.com>
 F:	package/casync/
diff --git a/package/Config.in b/package/Config.in
index a9a2785102..50cfbfccc1 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1145,6 +1145,7 @@ menu "External python modules"
 	source "package/python-grpcio-reflection/Config.in"
 	source "package/python-grpclib/Config.in"
 	source "package/python-gunicorn/Config.in"
+	source "package/python-gymnasium/Config.in"
 	source "package/python-h11/Config.in"
 	source "package/python-h2/Config.in"
 	source "package/python-hid/Config.in"
diff --git a/package/python-gymnasium/Config.in b/package/python-gymnasium/Config.in
new file mode 100644
index 0000000000..19185f267c
--- /dev/null
+++ b/package/python-gymnasium/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_PYTHON_GYMNASIUM
+	bool "python-gymnasium"
+	select BR2_PACKAGE_PYTHON_CLOUDPICKLE # runtime
+	select BR2_PACKAGE_PYTHON_FARAMA_NOTIFICATIONS # runtime
+	select BR2_PACKAGE_PYTHON_NUMPY # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	help
+	  A standard API for reinforcement learning and a diverse set
+	  of reference environments (formerly Gym).
+
+	  https://farama.org
diff --git a/package/python-gymnasium/python-gymnasium.hash b/package/python-gymnasium/python-gymnasium.hash
new file mode 100644
index 0000000000..b76e0a5710
--- /dev/null
+++ b/package/python-gymnasium/python-gymnasium.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/gymnasium/json
+md5  b67cd4243af164eb11888fe731c91e11  gymnasium-1.2.3.tar.gz
+sha256  2b2cb5b5fbbbdf3afb9f38ca952cc48aa6aa3e26561400d940747fda3ad42509  gymnasium-1.2.3.tar.gz
+# Locally computed sha256 checksums
+sha256  7dacaa9772e856aee6943b32ef663d3634d91d72ec7bbc74d136943673f91e18  LICENSE
diff --git a/package/python-gymnasium/python-gymnasium.mk b/package/python-gymnasium/python-gymnasium.mk
new file mode 100644
index 0000000000..1cf79a0baf
--- /dev/null
+++ b/package/python-gymnasium/python-gymnasium.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-gymnasium
+#
+################################################################################
+
+PYTHON_GYMNASIUM_VERSION = 1.2.3
+PYTHON_GYMNASIUM_SOURCE = gymnasium-$(PYTHON_GYMNASIUM_VERSION).tar.gz
+PYTHON_GYMNASIUM_SITE = https://files.pythonhosted.org/packages/76/59/653a9417d98ed3e29ef9734ba52c3495f6c6823b8d5c0c75369f25111708
+PYTHON_GYMNASIUM_SETUP_TYPE = setuptools
+PYTHON_GYMNASIUM_LICENSE = MIT
+PYTHON_GYMNASIUM_LICENSE_FILES = LICENSE
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
