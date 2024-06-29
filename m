Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EB2DC27C4F
	for <buildroot@archiver.kernel.org>; Sat, 29 Jun 2024 12:55:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA1D060628;
	Sat, 29 Jun 2024 12:55:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9pR5QQoCJz2O; Sat, 29 Jun 2024 12:55:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFDE760657
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CFDE760657;
	Sat, 29 Jun 2024 12:55:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1275C1BF487
 for <buildroot@lists.busybox.net>; Sat, 29 Jun 2024 12:55:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3CE8401B2
 for <buildroot@lists.busybox.net>; Sat, 29 Jun 2024 12:55:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EmBzsXCDvdLZ for <buildroot@lists.busybox.net>;
 Sat, 29 Jun 2024 12:55:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0EFBB40018
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EFBB40018
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0EFBB40018
 for <buildroot@buildroot.org>; Sat, 29 Jun 2024 12:55:27 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.lan ([85.22.124.183]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1McY8d-1rs3sH16hJ-00oUdl; Sat, 29
 Jun 2024 14:55:24 +0200
To: buildroot@buildroot.org
Date: Sat, 29 Jun 2024 14:55:21 +0200
Message-ID: <20240629125521.976475-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:NWn6NwVyxpv5Mzfo1eB5aB7bXyZSneT+oOKJ9Ql286Nk1LvZnZk
 XSRKnq0ysqSpuuzHNS+eZB6fgZUQgJtJPq7wxGETC9nWFIBBL+TCUtONZQtMnljSgNUssrr
 WmWnXCKElfjBX3E5/7KbhJigCF+/ruzenoG7jDEMHqK2h1+UgwGjaQzf0KWy37WbV5skTYS
 xuqZUn9Cs3RsTqb09FNzg==
UI-OutboundReport: notjunk:1;M01:P0:ULTb/WreM9s=;6JtQm832AWFkdmPBs9bPRBveHrP
 /EheaZKecOcqtwsVRsfyKI/ebcn2acLSS1kQ2vArBIkR5HrUShaYyzlg1CMRqI2WpGxoFv9Uo
 5+nl1LoTdM9QUbIPBRXxvsF5Wc5KYGrTnQvfK1um+q4PS9y1vBNdUYu0BRpM5g7/Ole4Xhqz7
 w9gReFvJ/+Cmqjip1MjYcKYGGWzexj8ud9RpXJzN2o0kdnzimHZ/h0Qbv3FFcqm7dQl1GGa4V
 Rz2cEousmq50CJQ4cqBF2pixAlsvrt/U2/YM5ghA+nmA6f9u1bQ8uWnQl2XsnG6R/2VIqN+5N
 4MeZjcrczAlASs8DisfKWuTY/bSmtNT4hIoTgS1XJ+jSNmw77ZPRMglAzcb0/GF9vIDWmJ6s1
 Jj7nENnErNldON6sBe7oH3Mwl3TZZGHXyYGYTeUL0ZpZae31iDOCcnNE0SY+jLAw6hj9y8fpT
 8BA4nU7mXUdSni0+LucT5iliAAdTCfjyIeBtzbncK3q3YsI8A/NJDsW/kyKRfZ+977VoHWJuT
 Jnhb/pb0ZBpfGLPugBeR/mcbMuefa63a+EqD3FI/2PCMkuwXWVhT+pSnFhYI2zseVhxLK/qaS
 z4rTJTdBsVtLPQB2RCFhy7yYFnbZqvISGNAL176x9Ss6KA6EXetdNpOX0PbzMfzulwlv4wmn6
 lYAsapZTczZ0NM8i7e4o0ZpJ3VEOvYXBSxsE6dxviM5paOIZSVlwjNHWDsyxNvLyGfqATpzMy
 u+SgdWH70EOG5ZrOhUolr0N4WabpLE7+BEPXxf7oaRDWFJrlV5h0EHKs1lxvHWKUs09usPGx/
 8Tc79AkZBTNwV+hN2xty4r03w8HNkamzyIIgJnrMKoGYs=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1719665724; x=1720270524; i=fiona.klute@gmx.de;
 bh=xZKGGaPeoqi+Q+5IH6YGVtKT+AGABg+OTjS6ZXVeY4w=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=AIG7fAQ4++tYqj7z+ydsl1/HxC0r4Ruaa2i/Hnt9P9ik50oncMsMsNYvfGzhWX2C
 JBGJaKOHXdTD8vS4t4yLLSIw+IQxm9OKquAk5fzDePriSdOlrhq99uamDdm25miut
 O/URSZjoH2LIWBJuFZaBWEy6IEw2r6LK7aKj3dKipM7wxTHG3K5lWBkTuSACcZNyB
 fbg3vviWZwp4NxybyDFugCFsz40TSxq3/ZJ4EWm/UOfGnZwOmoROxh39PU8jWlU+a
 wfXqvJBW+3L4tYyMQCEO8VeJ1xuzJOeCQVfYbYck3YYMYwNSqyJr4PVIBHJ2cGcoz
 Rp1Epa7Fmf+ospEZ1g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=AIG7fAQ4
Subject: [Buildroot] [PATCH 1/1] package/python-docker: bump version to 7.1.0
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
I've gone along with upstream here on removing the websocket
support. If it's desirable to keep in Buildroot please let me know how
to enable an optional Python package feature in the build system and
I'll update the patch.

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
--
2.45.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
