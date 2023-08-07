Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79D2CEE49A8
	for <buildroot@archiver.kernel.org>; Mon, 21 Aug 2023 20:10:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 35D5B40B80;
	Mon, 21 Aug 2023 20:10:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 35D5B40B80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wm3Xkky6QeZJ; Mon, 21 Aug 2023 20:10:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4DB1140B87;
	Mon, 21 Aug 2023 20:10:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4DB1140B87
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 59E671BF8B4
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 227D0409FB
 for <buildroot@lists.busybox.net>; Mon, 21 Aug 2023 20:01:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 227D0409FB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id db7O39hYJI9p for <buildroot@lists.busybox.net>;
 Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E0F5410D5
 for <buildroot@buildroot.org>; Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E0F5410D5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0BD2686023; Mon, 21 Aug 2023 20:01:24 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Aug 2023 22:15:29 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: fd17b3dd44363b8d47f2394cc5320b271229982c
X-Git-Newrev: 9fa3799dfaa0cc08ff787a09e1f5b68e9bd4eef2
X-Patchwork-Hint: ignore
Message-Id: <20230821200124.0BD2686023@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/python-docker: bump to
 version 6.1.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=9fa3799dfaa0cc08ff787a09e1f5b68e9bd4eef2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Remove no longer required six runtime dependency.

Add new explicit urllib3 runtime dependency.

When we bumped urllib3 in 074bc42971181ee71d8ff5bd57641b7b7eb7580f
we broke compatibility with python-docker.

This compatibility error was fixed upstream in python-docker 6.1.0:
https://github.com/docker/docker-py/commit/3178c8d48b7e7414d1f864ba1fe77139f4e923eb

Fixes:
 - https://gitlab.com/buildroot.org/buildroot/-/jobs/4811724555

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-docker/Config.in          | 2 +-
 package/python-docker/python-docker.hash | 4 ++--
 package/python-docker/python-docker.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-docker/Config.in b/package/python-docker/Config.in
index ae5a7a5181..944992f251 100644
--- a/package/python-docker/Config.in
+++ b/package/python-docker/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_PYTHON_DOCKER
 	select BR2_PACKAGE_PYTHON3_SSL # runtime
 	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
+	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
 	select BR2_PACKAGE_PYTHON_WEBSOCKET_CLIENT # runtime
 	help
 	  A Python library for the Docker Engine API.
diff --git a/package/python-docker/python-docker.hash b/package/python-docker/python-docker.hash
index 3fc3c4f0f4..8e561e93a7 100644
--- a/package/python-docker/python-docker.hash
+++ b/package/python-docker/python-docker.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/docker/json
-md5  8e85e23ed30a3d07129e197d35e56eb4  docker-6.0.1.tar.gz
-sha256  896c4282e5c7af5c45e8b683b0b0c33932974fe6e50fc6906a0a83616ab3da97  docker-6.0.1.tar.gz
+md5  c319e75054a226776f32797e56ec82da  docker-6.1.3.tar.gz
+sha256  aa6d17830045ba5ef0168d5eaa34d37beeb113948c413affe1d5991fc11f9a20  docker-6.1.3.tar.gz
 # Locally computed sha256 checksums
 sha256  f2f0b07fa5e492c11d27aa0d2f3f1a0e64b9d17f32d8aa489ae2af9609af33b2  LICENSE
diff --git a/package/python-docker/python-docker.mk b/package/python-docker/python-docker.mk
index 4da972e017..ab03ac6af0 100644
--- a/package/python-docker/python-docker.mk
+++ b/package/python-docker/python-docker.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOCKER_VERSION = 6.0.1
+PYTHON_DOCKER_VERSION = 6.1.3
 PYTHON_DOCKER_SOURCE = docker-$(PYTHON_DOCKER_VERSION).tar.gz
-PYTHON_DOCKER_SITE = https://files.pythonhosted.org/packages/79/26/6609b51ecb418e12d1534d00b888ce7e108f38b47dc6cd589598d5c6aaa2
+PYTHON_DOCKER_SITE = https://files.pythonhosted.org/packages/f0/73/f7c9a14e88e769f38cb7fb45aa88dfd795faa8e18aea11bababf6e068d5e
 PYTHON_DOCKER_SETUP_TYPE = setuptools
 PYTHON_DOCKER_LICENSE = Apache-2.0
 PYTHON_DOCKER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
