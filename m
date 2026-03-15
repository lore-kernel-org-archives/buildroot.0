Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101ACF3028A
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BB1936135F;
	Sun, 15 Mar 2026 22:19:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6cVqlelwlxUD; Sun, 15 Mar 2026 22:19:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8DCB61350
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613151;
	bh=Srir5GmIGpCPfsnB00TOTIJk9s9MCA0gIStQ5N2uoWc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iKHZXf/lTj73C+mJdBfnIhlfHnR3MeCT4O/TzX20WF/9aMmPeJggWSp7InPmvjFl2
	 IGP5kcFYXAUpMu/WNJ+P+ySl5k5ClT/f3tV8v8U/NVbm0SO75IsdNeG7aHyaEmxeKX
	 yLbkOXSS867G6LNu8/x9vCZr+vo8hUwe7qasr0MWGr16A3NGLvrOFBiaKV1zgr+Y2Y
	 4B/LKu9+LhR9SYiNDCRMnL8IX5mnZzTTIKErqJJuCDSsE18L7UskvqGcJH88jIUgfd
	 tDhiQcgoEWRobA6VOBN4KDN2BpByYRu4fYrCi4AlO5sYSfBRMYc/OEF7v0Ax4B5/23
	 82M9lTKJwTUnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A8DCB61350;
	Sun, 15 Mar 2026 22:19:11 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 102F31B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05176610A4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LRC_mKSiPmn8 for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EAD736108D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EAD736108D
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 391C783F4D; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 16:21:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b0a90c10c03c66109b4bfcf64eb6461ecfd64b3
X-Git-Newrev: 8d0906b77f224a988a49109902be6565d829e2c6
X-Patchwork-Hint: ignore
Message-Id: <20260315221801.391C783F4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cssselect2: bump version to
 0.9.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8d0906b77f224a988a49109902be6565d829e2c6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/Kozea/cssselect2/releases/tag/0.9.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-cssselect2/python-cssselect2.hash | 4 ++--
 package/python-cssselect2/python-cssselect2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cssselect2/python-cssselect2.hash b/package/python-cssselect2/python-cssselect2.hash
index 214be0a5fb..65319e4ac8 100644
--- a/package/python-cssselect2/python-cssselect2.hash
+++ b/package/python-cssselect2/python-cssselect2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssselect2/json
-md5  45b5f89f2934fbcb52490483367c3997  cssselect2-0.8.0.tar.gz
-sha256  7674ffb954a3b46162392aee2a3a0aedb2e14ecf99fcc28644900f4e6e3e9d3a  cssselect2-0.8.0.tar.gz
+md5  2aa3610000b7aeabe8da9cad3c390078  cssselect2-0.9.0.tar.gz
+sha256  759aa22c216326356f65e62e791d66160a0f9c91d1424e8d8adc5e74dddfc6fb  cssselect2-0.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6fd97229a1d1b0f6a8b41e109f413426dbc0874b1e03746d66cc33282601c2c2  LICENSE
diff --git a/package/python-cssselect2/python-cssselect2.mk b/package/python-cssselect2/python-cssselect2.mk
index 7a4e2a2342..3644bdca18 100644
--- a/package/python-cssselect2/python-cssselect2.mk
+++ b/package/python-cssselect2/python-cssselect2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CSSSELECT2_VERSION = 0.8.0
+PYTHON_CSSSELECT2_VERSION = 0.9.0
 PYTHON_CSSSELECT2_SOURCE = cssselect2-$(PYTHON_CSSSELECT2_VERSION).tar.gz
-PYTHON_CSSSELECT2_SITE = https://files.pythonhosted.org/packages/9f/86/fd7f58fc498b3166f3a7e8e0cddb6e620fe1da35b02248b1bd59e95dbaaa
+PYTHON_CSSSELECT2_SITE = https://files.pythonhosted.org/packages/e0/20/92eaa6b0aec7189fa4b75c890640e076e9e793095721db69c5c81142c2e1
 PYTHON_CSSSELECT2_SETUP_TYPE = flit
 PYTHON_CSSSELECT2_LICENSE = BSD-3-Clause
 PYTHON_CSSSELECT2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
