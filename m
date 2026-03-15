Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7377F3027F
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9038415DA;
	Sun, 15 Mar 2026 22:19:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IEAyYRYrZ3cs; Sun, 15 Mar 2026 22:19:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5816415E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613177;
	bh=KjPEi2QLRjVwAWf9nPSf0NkFLD+4gemnXKdSAPmS93k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ExX2x8sflbgPbtXJkzKeMsUbdNASmVf0jf5il+h2D+t8n8SPmCShOMqwJ0MY36Smi
	 xxVnnzLw0W3XxsW7p4XmnQ9p0OqrwRg1zmqniDXt82VganqtaPw1CVAgknZ5/MkCfI
	 sokuPv1Zdd6eu78l2+bMTzGT1h4l/UdJ485yU1YUWr2jSLGayxm75pACvyBnJwXmPX
	 ye1jqtxboVfxKn1p5DyOsdyxUe1RFuyCOBbNi+q9fZ8A8V6TDAO68H2CSzxAGXhMnX
	 yFCEyJaQReDC9IDngH36sQYigxpbXVq/LPZuuvHhwGwMYIRJ6QcAs/bx9f76lBoxpH
	 hq4t02PKRPTvQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A5816415E2;
	Sun, 15 Mar 2026 22:19:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D1611B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7E1C161192
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9o9KZl3fYKqX for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A87DC61102
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A87DC61102
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA66C82642; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d26060f11033a24552a9adea1d594cdbc3a99e48
X-Git-Newrev: c479ac460172be6203b543de30c83f98055aa54b
X-Patchwork-Hint: ignore
Message-Id: <20260315221804.EA66C82642@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-ujson: bump version to
 5.12.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c479ac460172be6203b543de30c83f98055aa54b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/ultrajson/ultrajson/releases/tag/5.12.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-ujson/python-ujson.hash | 4 ++--
 package/python-ujson/python-ujson.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ujson/python-ujson.hash b/package/python-ujson/python-ujson.hash
index b4b0a4906e..58fa1b611f 100644
--- a/package/python-ujson/python-ujson.hash
+++ b/package/python-ujson/python-ujson.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ujson/json
-md5  dfe38201fc1cdbb6f9e0bdf135173a6a  ujson-5.11.0.tar.gz
-sha256  e204ae6f909f099ba6b6b942131cee359ddda2b6e4ea39c12eb8b991fe2010e0  ujson-5.11.0.tar.gz
+md5  a1104b826ed8414130553e4482bd714d  ujson-5.12.0.tar.gz
+sha256  14b2e1eb528d77bc0f4c5bd1a7ebc05e02b5b41beefb7e8567c9675b8b13bcf4  ujson-5.12.0.tar.gz
 # Locally computed sha256 checksums
 sha256  36866344f0a486541bd9800f1a407a056c0c214a82c658f059694daf3dc394d2  LICENSE.txt
diff --git a/package/python-ujson/python-ujson.mk b/package/python-ujson/python-ujson.mk
index 88e6c736b9..3893a205c8 100644
--- a/package/python-ujson/python-ujson.mk
+++ b/package/python-ujson/python-ujson.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_UJSON_VERSION = 5.11.0
+PYTHON_UJSON_VERSION = 5.12.0
 PYTHON_UJSON_SOURCE = ujson-$(PYTHON_UJSON_VERSION).tar.gz
-PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/43/d9/3f17e3c5773fb4941c68d9a37a47b1a79c9649d6c56aefbed87cc409d18a
+PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/cb/3e/c35530c5ffc25b71c59ae0cd7b8f99df37313daa162ce1e2f7925f7c2877
 PYTHON_UJSON_SETUP_TYPE = setuptools
 PYTHON_UJSON_LICENSE = BSD-3-Clause, TCL
 PYTHON_UJSON_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
