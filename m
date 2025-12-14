Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9A7D5B16E
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 21:21:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DFAA60DDB;
	Sun, 14 Dec 2025 21:21:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VgvkiCjxw45g; Sun, 14 Dec 2025 21:21:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4A6DB60DD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765747309;
	bh=frETrI9rH67yDuUtjJDWOSbxLOLI/cR7lUJDUngBsxc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AzDdCv3QKZKMxNW/Ijc+EVPXyBqJ3scqlC3leKILQdC1mN3CYE0pLUQCDO29YdSFK
	 Njvrz/d5By9mqbZ9ngvApp6nx/fUFgKqLzHvUEJU5j2wRxZtA2BhMTLtZUV9kXYbA3
	 /YhU7BR3tyo6pVpGrlphcNK8HdHO6crVaJoMvzBT12YH4raAE+OF9Zyb6vnvCPhK4E
	 J3EO9iw5a9MOeeDlSDipNbyv+OYdx4OWNHdiI+lVgSzng9J5H4YZS+Iwf48BJVHgh1
	 TX6wjr6g8AuRaSPmu17XpDewLc/T6aPgSVNv6AMUClX/knd9M3YPghTuzAhyBumSvc
	 RBw+MJe7ARxDw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4A6DB60DD4;
	Sun, 14 Dec 2025 21:21:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0881A2ED
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6527D40649
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xBjslGLu9KIu for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 21:21:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCBF540643
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CCBF540643
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B1D2C86E74; Sun, 14 Dec 2025 21:21:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 22:20:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 880668faf7eaea8f73671c47f634852be45c0617
X-Git-Newrev: 7d4fad11e4eabcdd066e0cb9cee0fcccc560bd65
X-Patchwork-Hint: ignore
Message-Id: <20251214212139.B1D2C86E74@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dbus-fast: bump version to
 3.1.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=7d4fad11e4eabcdd066e0cb9cee0fcccc560bd65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/Bluetooth-Devices/dbus-fast/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-dbus-fast/python-dbus-fast.hash | 4 ++--
 package/python-dbus-fast/python-dbus-fast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dbus-fast/python-dbus-fast.hash b/package/python-dbus-fast/python-dbus-fast.hash
index 7ff243ebda..1fac0c0396 100644
--- a/package/python-dbus-fast/python-dbus-fast.hash
+++ b/package/python-dbus-fast/python-dbus-fast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dbus-fast/json
-md5  ea8420ccd0c90ea8f3dda3df5b0a7a01  dbus_fast-2.44.3.tar.gz
-sha256  962b36abbe885159e31135c57a7d9659997c61a13d55ecb070a61dc502dbd87e  dbus_fast-2.44.3.tar.gz
+md5  605c7ca53ec797a9513c742d705f8494  dbus_fast-3.1.2.tar.gz
+sha256  6c9e1b45e4b5e7df0c021bf1bf3f27649374e47c3de1afdba6d00a7d7bba4b3a  dbus_fast-3.1.2.tar.gz
 # Locally computed sha256 checksums
 sha256  c37e9c75110e01d1f0c5360dc7d7776a30ac5f70d2440db214423e4b7a77a6af  LICENSE
diff --git a/package/python-dbus-fast/python-dbus-fast.mk b/package/python-dbus-fast/python-dbus-fast.mk
index 6f629c0cc6..7d98581eeb 100644
--- a/package/python-dbus-fast/python-dbus-fast.mk
+++ b/package/python-dbus-fast/python-dbus-fast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DBUS_FAST_VERSION = 2.44.3
+PYTHON_DBUS_FAST_VERSION = 3.1.2
 PYTHON_DBUS_FAST_SOURCE = dbus_fast-$(PYTHON_DBUS_FAST_VERSION).tar.gz
-PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/00/f2/8a3f2345452f4aa8e9899544ba6dfdf699cef39ecfb04238fdad381451c8
+PYTHON_DBUS_FAST_SITE = https://files.pythonhosted.org/packages/16/a4/e54607cf8b0a696beba591f1a543cff5b6a9e4b4f842fd55f7ba741d678d
 PYTHON_DBUS_FAST_SETUP_TYPE = poetry
 PYTHON_DBUS_FAST_LICENSE = MIT
 PYTHON_DBUS_FAST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
