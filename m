Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB31CF9C6C
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 10:36:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2AD39815CC;
	Sun, 22 Sep 2024 10:36:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b76pYCNAr_dj; Sun, 22 Sep 2024 10:36:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DA1781DF7
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DA1781DF7;
	Sun, 22 Sep 2024 10:36:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 236B11BF47A
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E22F840022
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 10:34:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NcfFNWNeEnti for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 32B3640165
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 32B3640165
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2B46980FD8; Sun, 22 Sep 2024 10:34:41 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 11:38:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 085aabdfb15b05678d0b68c5fae8f20765e475c0
X-Git-Newrev: b612a5e25c58ed9269d2ab94fc0e2186c68202e6
X-Patchwork-Hint: ignore
Message-Id: <20240922103441.2B46980FD8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-tinyrpc: bump to version
 1.1.7
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

commit: https://git.buildroot.net/buildroot/commit/?id=b612a5e25c58ed9269d2ab94fc0e2186c68202e6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove no longer required python-six runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/python-tinyrpc/Config.in           | 1 -
 package/python-tinyrpc/python-tinyrpc.hash | 4 ++--
 package/python-tinyrpc/python-tinyrpc.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-tinyrpc/Config.in b/package/python-tinyrpc/Config.in
index 3c643c754a..e8f0f9ea0c 100644
--- a/package/python-tinyrpc/Config.in
+++ b/package/python-tinyrpc/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_TINYRPC
 	bool "python-tinyrpc"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  A small, modular, transport and protocol neutral RPC
 	  library that, among other things, supports JSON-RPC and
diff --git a/package/python-tinyrpc/python-tinyrpc.hash b/package/python-tinyrpc/python-tinyrpc.hash
index d4bd348e61..f1b2781ee3 100644
--- a/package/python-tinyrpc/python-tinyrpc.hash
+++ b/package/python-tinyrpc/python-tinyrpc.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tinyrpc/json
-md5  cc7e62891eee806dfbbafb6e3875825e  tinyrpc-1.1.4.tar.gz
-sha256  c99f412e5d9849c2deb468ea37fee2faf12fbc95bdd3616ae5c276ea195ed6bd  tinyrpc-1.1.4.tar.gz
+md5  b5079a23bbd8c41a33fe15c7486acf3e  tinyrpc-1.1.7.tar.gz
+sha256  15a8f41838e7b8be274467de59ad5c571e4cb5a2fe93bc2940b1d103bce4c6e5  tinyrpc-1.1.7.tar.gz
 # Locally computed sha256 checksums
 sha256  587f1ea174824613f4a7e0d7fb95fda000a7f58ca17df12416e014c9ee82e619  LICENSE
diff --git a/package/python-tinyrpc/python-tinyrpc.mk b/package/python-tinyrpc/python-tinyrpc.mk
index e976778fa2..1b3e4a83ed 100644
--- a/package/python-tinyrpc/python-tinyrpc.mk
+++ b/package/python-tinyrpc/python-tinyrpc.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TINYRPC_VERSION = 1.1.4
+PYTHON_TINYRPC_VERSION = 1.1.7
 PYTHON_TINYRPC_SOURCE = tinyrpc-$(PYTHON_TINYRPC_VERSION).tar.gz
-PYTHON_TINYRPC_SITE = https://files.pythonhosted.org/packages/d2/86/2741f0c74cc339416c9803b6393eaf230254ecf36ffd839614799e15a202
+PYTHON_TINYRPC_SITE = https://files.pythonhosted.org/packages/6a/31/b0d0403cafda7965fab0741bcb7c63b26eab7fcfb605d4ece31a6f7b034d
 PYTHON_TINYRPC_SETUP_TYPE = setuptools
 PYTHON_TINYRPC_LICENSE = MIT
 PYTHON_TINYRPC_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
