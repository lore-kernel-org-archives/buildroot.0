Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83159FC6179
	for <buildroot@archiver.kernel.org>; Sat,  3 Jan 2026 12:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7232480D9C;
	Sat,  3 Jan 2026 12:11:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xZglZetCm-k4; Sat,  3 Jan 2026 12:11:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8096480C8B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767442261;
	bh=gRh8QfYFMW9MSWIpuR1GxoDxOdaTlsx9b0pYeF7R+vw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XxcqpbQT+vKQj7joZkwoAIQcsvoUM+TdYX0iSUuwh3IAWffEP18AjRbbk5Z+Wmzpw
	 AuHUHbWAoun6WnQueWV34skyID7hZ42RkZENhb30Ah3o3Cct2JyNhmDdsdpW196Am2
	 c25OmYrQbost5V2msqOV5wzAgLQyIqPKcAg43vQMrZdSEv98f7kR3nt9XF1bMpfLum
	 Z1UKr3CPHaiEbY8OiyVF5Cx5oSXv2GyXWgNBzyqPLJa+uU7JxTefJKbupx9osNjbkW
	 0g9LxXBwzbTHnrftmBkVWvhJ5T2H2dP7l2CmmynUWfnV+BXPSXokZxhMO32YZ7BeXY
	 SBj3qCV8JpXKA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8096480C8B;
	Sat,  3 Jan 2026 12:11:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 00EAB249
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 12:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F338540263
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 12:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Exq4LzMAA1Qd for <buildroot@buildroot.org>;
 Sat,  3 Jan 2026 12:10:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 418A24024D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 418A24024D
 for <buildroot@buildroot.org>; Sat,  3 Jan 2026 12:10:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 160958810F; Sat,  3 Jan 2026 12:10:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Jan 2026 13:04:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a336746832ef24c22f4f37b322f4e5b378c3c0cd
X-Git-Newrev: a8d1065a86f6e4120f0e196c5cd70b9af71134f4
X-Patchwork-Hint: ignore
Message-Id: <20260103121058.160958810F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-grpcio: bump to version
 1.76.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=a8d1065a86f6e4120f0e196c5cd70b9af71134f4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-typing-extensions runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-grpcio/Config.in          | 1 +
 package/python-grpcio/python-grpcio.hash | 4 ++--
 package/python-grpcio/python-grpcio.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-grpcio/Config.in b/package/python-grpcio/Config.in
index 9657ccb6ed..6119991c7e 100644
--- a/package/python-grpcio/Config.in
+++ b/package/python-grpcio/Config.in
@@ -11,6 +11,7 @@ config BR2_PACKAGE_PYTHON_GRPCIO
 	bool "python-grpcio"
 	depends on BR2_PACKAGE_PYTHON_GRPCIO_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  HTTP/2-based RPC framework.
 
diff --git a/package/python-grpcio/python-grpcio.hash b/package/python-grpcio/python-grpcio.hash
index c57ece77ca..9441d89389 100644
--- a/package/python-grpcio/python-grpcio.hash
+++ b/package/python-grpcio/python-grpcio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/grpcio/json
-md5  ad83dd7166a99b20c0e004b538eb5ad9  grpcio-1.70.0.tar.gz
-sha256  8d1584a68d5922330025881e63a6c1b54cc8117291d382e4fa69339b6d914c56  grpcio-1.70.0.tar.gz
+md5  b2b6afdac225e749c4c97284a0c1113f  grpcio-1.76.0.tar.gz
+sha256  7be78388d6da1a25c0d5ec506523db58b18be22d9c37d8d3a32c08be4987bd73  grpcio-1.76.0.tar.gz
 # Locally computed sha256 checksums
 sha256  590198e3f305f2c347fde64d637c65492bbef554db6c8364e149cd375e3797ee  LICENSE
diff --git a/package/python-grpcio/python-grpcio.mk b/package/python-grpcio/python-grpcio.mk
index 24c0a08cae..af9817a0ef 100644
--- a/package/python-grpcio/python-grpcio.mk
+++ b/package/python-grpcio/python-grpcio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GRPCIO_VERSION = 1.70.0
+PYTHON_GRPCIO_VERSION = 1.76.0
 PYTHON_GRPCIO_SOURCE = grpcio-$(PYTHON_GRPCIO_VERSION).tar.gz
-PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/69/e1/4b21b5017c33f3600dcc32b802bb48fe44a4d36d6c066f52650c7c2690fa
+PYTHON_GRPCIO_SITE = https://files.pythonhosted.org/packages/b6/e0/318c1ce3ae5a17894d5791e87aea147587c9e702f24122cc7a5c8bbaeeb1
 PYTHON_GRPCIO_SETUP_TYPE = setuptools
 PYTHON_GRPCIO_LICENSE = Apache-2.0
 PYTHON_GRPCIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
