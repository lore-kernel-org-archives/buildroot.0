Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A9B5E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:12:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 444F8817A3;
	Sun, 21 Dec 2025 22:12:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nvNXYh8SeSyQ; Sun, 21 Dec 2025 22:12:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 685BB81854
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766355161;
	bh=DbWdqxw/OI4+Vi/69cUtC9H+H3hm1/KPUYwn81IT8hI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=sFhbUX24878j8nbaxhyDnDLQDAsLX/0llUXKmVhxYXMXcWIWldq1jpD65DtLBp0tB
	 VIDYCePWmH4jrDzuD+FKDFOaypGqE2gyiGHE7yiKE3uiZUjjDvkgF2AeZ+8xvxREgW
	 Du6RdFUB6d2OFAKYe6apyuFBT799STZZqeMAaoWUwUPeTnSTxCl0xb8Ssc75v8Zopt
	 HVbk/Lg29VAwSllFZAl1U0K23i7I0puUIm9n4WckTOniPy0XBnJFjgapTph8VTNZiS
	 28MRoNNXMHMgIQtLbgpnFphoTc5C/SxnSqxWVY8vlpNITuq3ESzAjZfiZLZhuQydZT
	 A3rQubJCZFFuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 685BB81854;
	Sun, 21 Dec 2025 22:12:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BABFF195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3093A60756
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id z_QhUrQNIiO4 for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B59260810
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4B59260810
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3DA83874A8; Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 22:58:35 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dede411c7efd31afc0f8e0cbd37781eaade38f36
X-Git-Newrev: 9fe8f09e74a09f6cffed020af58f2c0a02b46e8e
X-Patchwork-Hint: ignore
Message-Id: <20251221221227.3DA83874A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-crontab: bump version to
 3.3.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=9fe8f09e74a09f6cffed020af58f2c0a02b46e8e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://gitlab.com/doctormo/python-crontab/-/tags/v3.3.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-crontab/python-crontab.hash | 4 ++--
 package/python-crontab/python-crontab.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-crontab/python-crontab.hash b/package/python-crontab/python-crontab.hash
index 141d075851..5533d82a7a 100644
--- a/package/python-crontab/python-crontab.hash
+++ b/package/python-crontab/python-crontab.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-crontab/json
-md5  7ff9f13749104faa73f353a0d4ae9087  python_crontab-3.2.0.tar.gz
-sha256  40067d1dd39ade3460b2ad8557c7651514cd3851deffff61c5c60e1227c5c36b  python_crontab-3.2.0.tar.gz
+md5  9edf7e8e5d9fbea6aa8a9c045bee93b6  python_crontab-3.3.0.tar.gz
+sha256  007c8aee68dddf3e04ec4dce0fac124b93bd68be7470fc95d2a9617a15de291b  python_crontab-3.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING
diff --git a/package/python-crontab/python-crontab.mk b/package/python-crontab/python-crontab.mk
index 7946f56829..248ffca405 100644
--- a/package/python-crontab/python-crontab.mk
+++ b/package/python-crontab/python-crontab.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CRONTAB_VERSION = 3.2.0
+PYTHON_CRONTAB_VERSION = 3.3.0
 PYTHON_CRONTAB_SOURCE = python_crontab-$(PYTHON_CRONTAB_VERSION).tar.gz
-PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/e2/f0/25775565c133d4e29eeb607bf9ddba0075f3af36041a1844dd207881047f
+PYTHON_CRONTAB_SITE = https://files.pythonhosted.org/packages/99/7f/c54fb7e70b59844526aa4ae321e927a167678660ab51dda979955eafb89a
 PYTHON_CRONTAB_SETUP_TYPE = setuptools
 PYTHON_CRONTAB_LICENSE = LGPL-3.0+
 PYTHON_CRONTAB_LICENSE_FILES = COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
