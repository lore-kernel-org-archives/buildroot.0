Return-Path: <SRS0=enEc=PC=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DF6C433EF
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:09:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C948361040
	for <buildroot@archiver.kernel.org>; Thu, 14 Oct 2021 21:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C948361040
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A25A740241;
	Thu, 14 Oct 2021 21:09:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BJq_iZcrvy5X; Thu, 14 Oct 2021 21:09:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 26D75401B7;
	Thu, 14 Oct 2021 21:09:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 37D5F1BF9B9
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:08:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B20B140139
 for <buildroot@lists.busybox.net>; Thu, 14 Oct 2021 21:08:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kOUbUdDLbsdp for <buildroot@lists.busybox.net>;
 Thu, 14 Oct 2021 21:08:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id F042E40160
 for <buildroot@buildroot.org>; Thu, 14 Oct 2021 21:08:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id D6B3694EAD; Thu, 14 Oct 2021 21:05:41 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 14 Oct 2021 22:58:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8276645532e82ee860831b1dd25a2541a53c2269
X-Git-Newrev: 21a56f9edbca8dd8b19567be6be2b32e44ebb860
X-Patchwork-Hint: ignore
Message-Id: <20211014210541.D6B3694EAD@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: Add bzip2 option to host
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

commit: https://git.buildroot.net/buildroot/commit/?id=21a56f9edbca8dd8b19567be6be2b32e44ebb860
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The bzip2 module is needed to build the host variant of NodeJS 14.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/python3/Config.in      | 1 -
 package/python3/Config.in.host | 6 ++++++
 package/python3/python3.mk     | 6 ++++++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index efc4dbb3d4..18b6d6367b 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -54,7 +54,6 @@ config BR2_PACKAGE_PYTHON3_BERKELEYDB
 
 config BR2_PACKAGE_PYTHON3_BZIP2
 	bool "bz2 module"
-	select BR2_PACKAGE_BZIP2
 	help
 	  bzip2 module for Python3
 
diff --git a/package/python3/Config.in.host b/package/python3/Config.in.host
index 70b5dacdde..65a8df0754 100644
--- a/package/python3/Config.in.host
+++ b/package/python3/Config.in.host
@@ -7,6 +7,12 @@ config BR2_PACKAGE_HOST_PYTHON3
 
 if BR2_PACKAGE_HOST_PYTHON3
 
+config BR2_PACKAGE_HOST_PYTHON3_BZIP2
+	bool "bzip2"
+	select BR2_PACKAGE_HOST_BZIP2
+	help
+	  bz2 module for host Python3.
+
 config BR2_PACKAGE_HOST_PYTHON3_SSL
 	bool "ssl"
 	select BR2_PACKAGE_HOST_OPENSSL
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 3e88bc0ff4..779f6dcb6c 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -43,6 +43,12 @@ PYTHON3_DEPENDENCIES = host-python3 libffi
 
 HOST_PYTHON3_DEPENDENCIES = host-autoconf-archive host-expat host-zlib host-libffi
 
+ifeq ($(BR2_PACKAGE_HOST_PYTHON3_BZIP2),y)
+HOST_PYTHON3_DEPENDENCIES += host-bzip2
+else
+HOST_PYTHON3_CONF_OPTS += --disable-bzip2
+endif
+
 ifeq ($(BR2_PACKAGE_HOST_PYTHON3_SSL),y)
 HOST_PYTHON3_DEPENDENCIES += host-openssl
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
