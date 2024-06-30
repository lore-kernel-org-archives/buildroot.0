Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73A13C27C4F
	for <buildroot@archiver.kernel.org>; Sun, 30 Jun 2024 14:57:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 112708133A;
	Sun, 30 Jun 2024 14:57:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lS3RShDYcZyn; Sun, 30 Jun 2024 14:57:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4BDFE81441
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BDFE81441;
	Sun, 30 Jun 2024 14:57:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 139DB1BF976
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:57:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F371181228
 for <buildroot@lists.busybox.net>; Sun, 30 Jun 2024 14:57:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eCVi7vuGZVb6 for <buildroot@lists.busybox.net>;
 Sun, 30 Jun 2024 14:57:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CBE688133A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id CBE688133A
 for <buildroot@buildroot.org>; Sun, 30 Jun 2024 14:57:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C32C783713; Sun, 30 Jun 2024 14:57:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 30 Jun 2024 16:50:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b4d69001b25124e2fe8262f6088ae32d542245e1
X-Git-Newrev: 7630cc8759a926e3ce098bd9a76e4ef8004cfb38
X-Patchwork-Hint: ignore
Message-Id: <20240630145713.C32C783713@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-docker: bump version to
 7.1.0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7630cc8759a926e3ce098bd9a76e4ef8004cfb38
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Important upstream changes:

* Support for Python 3.12 has been added (in 7.0.0).

* Websocket support is no longer included by default, and thus the
  dependency on "websocket-client" (since 7.0.0).

* Build has been switched to hatchling and hatch-vcs (in 7.1.0), so
  Buildroot needs to use pep517 build.

* Dependency on "packaging" has been removed (in 7.1.0).

Upstream changelogs:
https://github.com/docker/docker-py/releases/tag/7.0.0
https://github.com/docker/docker-py/releases/tag/7.1.0

Signed-off-by: Fiona Klute <fiona.klute+wiwa@gmx.de>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/python-docker/Config.in          | 2 --
 package/python-docker/python-docker.hash | 4 ++--
 package/python-docker/python-docker.mk   | 8 ++++----
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/python-docker/Config.in b/package/python-docker/Config.in
index 944992f251..669b9e3433 100644
--- a/package/python-docker/Config.in
+++ b/package/python-docker/Config.in
@@ -2,10 +2,8 @@ config BR2_PACKAGE_PYTHON_DOCKER
 	bool "python-docker"
 	# docker-engine may be running on another host, so no other dependency
 	select BR2_PACKAGE_PYTHON3_SSL # runtime
-	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
-	select BR2_PACKAGE_PYTHON_WEBSOCKET_CLIENT # runtime
 	help
 	  A Python library for the Docker Engine API.
 
diff --git a/package/python-docker/python-docker.hash b/package/python-docker/python-docker.hash
index 8e561e93a7..c8f8e7501a 100644
--- a/package/python-docker/python-docker.hash
+++ b/package/python-docker/python-docker.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/docker/json
-md5  c319e75054a226776f32797e56ec82da  docker-6.1.3.tar.gz
-sha256  aa6d17830045ba5ef0168d5eaa34d37beeb113948c413affe1d5991fc11f9a20  docker-6.1.3.tar.gz
+md5  04e92a7b6dc8b88dde3c7cca6850b277  docker-7.1.0.tar.gz
+sha256  ad8c70e6e3f8926cb8a92619b832b4ea5299e2831c14284663184e200546fa6c  docker-7.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  f2f0b07fa5e492c11d27aa0d2f3f1a0e64b9d17f32d8aa489ae2af9609af33b2  LICENSE
diff --git a/package/python-docker/python-docker.mk b/package/python-docker/python-docker.mk
index ab03ac6af0..55ba405f7c 100644
--- a/package/python-docker/python-docker.mk
+++ b/package/python-docker/python-docker.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-PYTHON_DOCKER_VERSION = 6.1.3
+PYTHON_DOCKER_VERSION = 7.1.0
 PYTHON_DOCKER_SOURCE = docker-$(PYTHON_DOCKER_VERSION).tar.gz
-PYTHON_DOCKER_SITE = https://files.pythonhosted.org/packages/f0/73/f7c9a14e88e769f38cb7fb45aa88dfd795faa8e18aea11bababf6e068d5e
-PYTHON_DOCKER_SETUP_TYPE = setuptools
+PYTHON_DOCKER_SITE = https://files.pythonhosted.org/packages/91/9b/4a2ea29aeba62471211598dac5d96825bb49348fa07e906ea930394a83ce
+PYTHON_DOCKER_SETUP_TYPE = pep517
 PYTHON_DOCKER_LICENSE = Apache-2.0
 PYTHON_DOCKER_LICENSE_FILES = LICENSE
 PYTHON_DOCKER_CPE_ID_VENDOR = docker
 PYTHON_DOCKER_CPE_ID_PRODUCT = docker-py
-PYTHON_DOCKER_DEPENDENCIES = host-python-setuptools-scm
+PYTHON_DOCKER_DEPENDENCIES = host-python-hatchling host-python-hatch-vcs
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
