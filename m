Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1036EC5DF74
	for <buildroot@archiver.kernel.org>; Sun, 16 Aug 2026 22:20:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB68F4068A;
	Sun, 16 Aug 2026 22:20:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1IaqIXi7zpgc; Sun, 16 Aug 2026 22:20:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C033440687
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786918835;
	bh=xYfXLyOAZpEICTc5zru3zr3VD908A6Ok/jlcEewW4J0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=sfcZqsTq6P8P1CSdWZlb9MIDTszXPlBhZ5iAprkr3CfHzO6n1o/ZulzaYpD6yqbD+
	 7i+XXN1iqufYTJRAbkErGHrZc8reW+vTkYGgns0bKeRJQ6nEY90h9b26eu5oSb9F4z
	 AAP1RKnlQU0yYK284aGbgTsiXg7Oa7S6jrIldnZf1FV+Ey/6NVq8OuFAN3jmc5JQ4E
	 a/lnPYd1PYkH6xrx//zqj7Tlu6OYvzqRaJmKqggDn/WuH5iyLHCLCltkNz+RT4D7Fo
	 R8lQLJ5NgX81JIP/7poNkJOT04dpsxEOEBhqY6nClPsp5q6fAkk+D9zG9HGWMW79t+
	 qYYej6cNdm6Yg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C033440687;
	Sun, 16 Aug 2026 22:20:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8BA5223F
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D5BE6061A
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJY033Z3W0ct for <buildroot@buildroot.org>;
 Sun, 16 Aug 2026 22:20:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB48F60623
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id BB48F60623
 for <buildroot@buildroot.org>; Sun, 16 Aug 2026 22:20:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8B2038DAD6; Sun, 16 Aug 2026 22:19:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 17 Aug 2026 00:09:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 64aa4f2db3126de5c3b7f46a434cf1af9603886c
X-Git-Newrev: b9376a0655a3796b20868477dbcbf0f5883523b7
X-Patchwork-Hint: ignore
Message-Id: <20260816221939.8B2038DAD6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-compose: bump to version
 2.40.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b9376a0655a3796b20868477dbcbf0f5883523b7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

For release notes since version 2.38.2, see:
https://github.com/docker/compose/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/docker-compose/docker-compose.hash | 2 +-
 package/docker-compose/docker-compose.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-compose/docker-compose.hash b/package/docker-compose/docker-compose.hash
index a2ffadd31c..fd715c3591 100644
--- a/package/docker-compose/docker-compose.hash
+++ b/package/docker-compose/docker-compose.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0c0453729b7a37badcf530fc140b1b8b907cbdcecfdb6be6413f410c86665c70  docker-compose-2.38.2-go2.tar.gz
+sha256  cdf70334f2c6afe8fcf1c5d6b4065cd9e8d26dc6317811ce5aabe0f8a0e95951  docker-compose-2.40.3-go2.tar.gz
 sha256  58d1e17ffe5109a7ae296caafcadfdbe6a7d176f0bc4ab01e12a689b0499d8bd  LICENSE
diff --git a/package/docker-compose/docker-compose.mk b/package/docker-compose/docker-compose.mk
index f70cf725df..17390e6577 100644
--- a/package/docker-compose/docker-compose.mk
+++ b/package/docker-compose/docker-compose.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_COMPOSE_VERSION = 2.38.2
+DOCKER_COMPOSE_VERSION = 2.40.3
 DOCKER_COMPOSE_SITE = $(call github,docker,compose,v$(DOCKER_COMPOSE_VERSION))
 DOCKER_COMPOSE_LICENSE = Apache-2.0
 DOCKER_COMPOSE_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
