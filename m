Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03328CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C263581C58;
	Sun, 22 Sep 2024 10:36:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g3xAyIdxKfLP; Sun, 22 Sep 2024 10:36:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61F2781E55
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61F2781E55;
	Sun, 22 Sep 2024 10:36:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 269161BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0EDDC404C7
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2tyzVrj-73bS for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 11ABB400AC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 11ABB400AC
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0EC56811F3; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 12:30:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f8abb592997c30b77307dcd2fd50aaf11ad3fb01
X-Git-Newrev: d55a14085a3120fd668bce6450e6235554ecedf3
X-Patchwork-Hint: ignore
Message-Id: <20240922103442.0EC56811F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-urwid: bump to version
 2.6.15
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

commit: https://git.buildroot.net/buildroot/commit/?id=d55a14085a3120fd668bce6450e6235554ecedf3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-typing-extensions runtime dependency.

Add new python-wcwidth runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-urwid/Config.in         | 2 ++
 package/python-urwid/python-urwid.hash | 4 ++--
 package/python-urwid/python-urwid.mk   | 4 ++--
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-urwid/Config.in b/package/python-urwid/Config.in
index f584a9258d..573d71f1c9 100644
--- a/package/python-urwid/Config.in
+++ b/package/python-urwid/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_URWID
 	bool "python-urwid"
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
+	select BR2_PACKAGE_PYTHON_WCWIDTH # runtime
 	help
 	  Urwid is a console user interface library for Python
 
diff --git a/package/python-urwid/python-urwid.hash b/package/python-urwid/python-urwid.hash
index aad6f6f672..4804555b22 100644
--- a/package/python-urwid/python-urwid.hash
+++ b/package/python-urwid/python-urwid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urwid/json
-md5  324cf0f877a5bc7b7d2de7d7f36b13ee  urwid-2.6.10.tar.gz
-sha256  ae33355c414c13214e541d3634f3c8a0bfb373914e62ffbcf2fa863527706321  urwid-2.6.10.tar.gz
+md5  73e4171e00a673afbc1eb32eaf7d31e0  urwid-2.6.15.tar.gz
+sha256  9ecc57330d88c8d9663ffd7092a681674c03ff794b6330ccfef479af7aa9671b  urwid-2.6.15.tar.gz
 # Locally computed sha256 checksums
 sha256  36b6d3fa47916943fd5fec313c584784946047ec1337a78b440e5992cb595f89  COPYING
diff --git a/package/python-urwid/python-urwid.mk b/package/python-urwid/python-urwid.mk
index d7943a8b5c..66b067a20c 100644
--- a/package/python-urwid/python-urwid.mk
+++ b/package/python-urwid/python-urwid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URWID_VERSION = 2.6.10
+PYTHON_URWID_VERSION = 2.6.15
 PYTHON_URWID_SOURCE = urwid-$(PYTHON_URWID_VERSION).tar.gz
-PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/8e/74/8c2082f2b07a72ff5d2438447c13a70f0cbede73584e0a262c166a30785c
+PYTHON_URWID_SITE = https://files.pythonhosted.org/packages/85/b7/516b0bbb7dd9fc313c6443b35d86b6f91b3baa83d2c4016e4d8e0df5a5e3
 PYTHON_URWID_LICENSE = LGPL-2.1+
 PYTHON_URWID_LICENSE_FILES = COPYING
 PYTHON_URWID_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
