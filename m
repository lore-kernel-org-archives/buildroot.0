Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960BFC433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 07:20:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 476454031D;
	Mon, 10 Jan 2022 07:20:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TLjoI9jgWKvf; Mon, 10 Jan 2022 07:20:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1813640396;
	Mon, 10 Jan 2022 07:20:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E13551BF334
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:19:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF75C824E2
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:19:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zqiBEFfrJ4t1 for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 07:19:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id EAA6F81465
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 07:19:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id AEA1682DFB; Mon, 10 Jan 2022 07:13:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 08:17:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 27cbd680cb6386a2326a3a95f41de80deba440b1
X-Git-Newrev: d01f3401320077c6d572135e47ffc4ae218a6ef5
X-Patchwork-Hint: ignore
Message-Id: <20220110071316.AEA1682DFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-distro: new package
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d01f3401320077c6d572135e47ffc4ae218a6ef5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-distro provides information about the OS distribution it runs on,
such as a reliable machine-readable ID, or version information.

It is the recommended replacement for Python's original
platform.linux_distribution function (removed in Python 3.8). It also
provides much more functionality which isn't necessarily Python bound,
like a command-line interface.

https://github.com/nir0s/distro

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/python-distro/Config.in          | 13 +++++++++++++
 package/python-distro/python-distro.hash |  3 +++
 package/python-distro/python-distro.mk   | 14 ++++++++++++++
 5 files changed, 32 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 55f37dfe62..cd0b54b041 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1594,6 +1594,7 @@ F:	package/fluid-soundfont/
 F:	package/fluidsynth/
 F:	package/glslsandbox-player/
 F:	package/ptm2human/
+F:	package/python-distro/
 F:	package/python-pyalsa/
 
 N:	Julien Viard de Galbert <julien@vdg.name>
diff --git a/package/Config.in b/package/Config.in
index a1924f96df..3a2ad30df9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1001,6 +1001,7 @@ menu "External python modules"
 	source "package/python-dialog/Config.in"
 	source "package/python-dialog3/Config.in"
 	source "package/python-dicttoxml/Config.in"
+	source "package/python-distro/Config.in"
 	source "package/python-django/Config.in"
 	source "package/python-django-enumfields/Config.in"
 	source "package/python-dnspython/Config.in"
diff --git a/package/python-distro/Config.in b/package/python-distro/Config.in
new file mode 100644
index 0000000000..bb4151541e
--- /dev/null
+++ b/package/python-distro/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_PYTHON_DISTRO
+	bool "python distro"
+	help
+	  distro provides information about the OS distribution it
+	  runs on, such as a reliable machine-readable ID, or version
+	  information.
+
+	  It is the recommended replacement for Python's original
+	  platform.linux_distribution function (removed in Python
+	  3.8). It also provides much more functionality which isn't
+	  necessarily Python bound, like a command-line interface.
+
+	  https://github.com/nir0s/distro
diff --git a/package/python-distro/python-distro.hash b/package/python-distro/python-distro.hash
new file mode 100644
index 0000000000..e2b3c0a444
--- /dev/null
+++ b/package/python-distro/python-distro.hash
@@ -0,0 +1,3 @@
+# Locally computed
+sha256  83f5e5a09f9c5f68f60173de572930effbcc0287bb84fdc4426cb4168c088424  distro-1.6.0.tar.gz
+sha256  cb5e8e7e5f4a3988e1063c142c60dc2df75605f4c46515e776e3aca6df976e14  LICENSE
diff --git a/package/python-distro/python-distro.mk b/package/python-distro/python-distro.mk
new file mode 100644
index 0000000000..753e74d020
--- /dev/null
+++ b/package/python-distro/python-distro.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-distro
+#
+################################################################################
+
+PYTHON_DISTRO_VERSION = 1.6.0
+PYTHON_DISTRO_SITE = https://files.pythonhosted.org/packages/a5/26/256fa167fe1bf8b97130b4609464be20331af8a3af190fb636a8a7efd7a2
+PYTHON_DISTRO_SOURCE = distro-$(PYTHON_DISTRO_VERSION).tar.gz
+PYTHON_DISTRO_LICENSE = Apache-2.0
+PYTHON_DISTRO_LICENSE_FILES = LICENSE
+PYTHON_DISTRO_SETUP_TYPE = setuptools
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
