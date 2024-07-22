Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F43C3DA59
	for <buildroot@archiver.kernel.org>; Mon, 22 Jul 2024 16:18:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0313C402D8;
	Mon, 22 Jul 2024 16:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wEVM5YgdYQQg; Mon, 22 Jul 2024 16:18:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2C0A4033D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2C0A4033D;
	Mon, 22 Jul 2024 16:18:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3E7AE1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B82A40320
 for <buildroot@lists.busybox.net>; Mon, 22 Jul 2024 16:17:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TVJJufFs1YPb for <buildroot@lists.busybox.net>;
 Mon, 22 Jul 2024 16:17:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 006FD4023C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 006FD4023C
 for <buildroot@buildroot.org>; Mon, 22 Jul 2024 16:17:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E034987098; Mon, 22 Jul 2024 16:17:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Jul 2024 18:16:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 42e46a5f1348573ab778584b0dfd35c546eda359
X-Git-Newrev: ec052de2fb744ebfa3de700b0d7a900e509cd660
X-Patchwork-Hint: ignore
Message-Id: <20240722161748.E034987098@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-setuptools: bump to version
 71.0.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=ec052de2fb744ebfa3de700b0d7a900e509cd660
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Rebase add executable patch.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-setuptools/0001-add-executable.patch | 18 +++++++++---------
 package/python-setuptools/python-setuptools.hash    |  4 ++--
 package/python-setuptools/python-setuptools.mk      |  4 ++--
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/package/python-setuptools/0001-add-executable.patch b/package/python-setuptools/0001-add-executable.patch
index d93298e118..da1bc68b39 100644
--- a/package/python-setuptools/0001-add-executable.patch
+++ b/package/python-setuptools/0001-add-executable.patch
@@ -1,4 +1,4 @@
-From 975379e84ae3229fac94cd0499fd4ba7baa574ba Mon Sep 17 00:00:00 2001
+From a35dffe950d7bb0f7988d78ec4a963c5ce67e3c8 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>
 Date: Mon, 7 Dec 2015 01:14:33 +0100
 Subject: [PATCH] add executable
@@ -22,10 +22,10 @@ Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
  2 files changed, 11 insertions(+)
 
 diff --git a/setuptools/command/install.py b/setuptools/command/install.py
-index 606cce9d8..f158e1b51 100644
+index c49fcda93..851950522 100644
 --- a/setuptools/command/install.py
 +++ b/setuptools/command/install.py
-@@ -16,6 +16,7 @@ class install(orig.install):
+@@ -18,6 +18,7 @@ class install(orig.install):
      """Use easy_install to install the package, w/dependencies"""
  
      user_options = orig.install.user_options + [
@@ -33,19 +33,19 @@ index 606cce9d8..f158e1b51 100644
          ('old-and-unmanageable', None, "Try not to use this!"),
          (
              'single-version-externally-managed',
-@@ -48,6 +49,7 @@ class install(orig.install):
+@@ -50,6 +51,7 @@ class install(orig.install):
          )
  
-         orig.install.initialize_options(self)
+         super().initialize_options()
 +        self.executable = None
          self.old_and_unmanageable = None
          self.single_version_externally_managed = None
  
 diff --git a/setuptools/command/install_scripts.py b/setuptools/command/install_scripts.py
-index 72b2e45cb..146a0bb58 100644
+index f44281b49..9e91cad87 100644
 --- a/setuptools/command/install_scripts.py
 +++ b/setuptools/command/install_scripts.py
-@@ -12,6 +12,13 @@ class install_scripts(orig.install_scripts):
+@@ -14,6 +14,13 @@ class install_scripts(orig.install_scripts):
      def initialize_options(self):
          orig.install_scripts.initialize_options(self)
          self.no_ep = False
@@ -57,9 +57,9 @@ index 72b2e45cb..146a0bb58 100644
 +                ('executable','executable')
 +        )
  
-     def run(self):
+     def run(self) -> None:
          self.run_command("egg_info")
-@@ -38,6 +45,8 @@ class install_scripts(orig.install_scripts):
+@@ -40,6 +47,8 @@ class install_scripts(orig.install_scripts):
          )
          bs_cmd = self.get_finalized_command('build_scripts')
          exec_param = getattr(bs_cmd, 'executable', None)
diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index 123c9a1455..29237427a0 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools/json
-md5  940ffdb3a2ce4f6a5ee80032aa115fc7  setuptools-69.2.0.tar.gz
-sha256  0ff4183f8f42cd8fa3acea16c45205521a4ef28f73c6391d8a25e92893134f2e  setuptools-69.2.0.tar.gz
+md5  f404be507829989fcff7a8b63d92f357  setuptools-71.0.3.tar.gz
+sha256  3d8531791a27056f4a38cd3e54084d8b1c4228ff9cf3f2d7dd075ec99f9fd70d  setuptools-71.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index afc7348eb2..cf7016ecff 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 69.2.0
+PYTHON_SETUPTOOLS_VERSION = 71.0.3
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/4d/5b/dc575711b6b8f2f866131a40d053e30e962e633b332acf7cd2c24843d83d
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/d1/8e/1d0b941ce1151009c6d98a0a590a608f346d4d272ce95ca09ee2bbb592cd
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
