Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51B3FE67482
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:12:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 262EE407A1;
	Sun, 21 Dec 2025 22:12:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SAgIVusemHvj; Sun, 21 Dec 2025 22:12:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81B52407EE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766355163;
	bh=YwAGzQqVhzpuCWUJKouDJ3LryY8WE34la1cbecaA6Qo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=OsyLkkbxp3Wn3bjaXg9IcJBJbRZxmI46ZBd/5PqyAhCiM/zzx/VLWRYYgrKd+SIx8
	 jWVNNMHveAjnE3Whd5ecUmu8OJMb0Z+ay7GCUmi2gqmwarodFQXvt8aWgiBNnbsIuK
	 4i+W80QlqYZd5De6MvFmIDZW1K7o0hyRycTjgSP+J8i6A53n7Oz36HrWyIt4nJsZvY
	 BaBrjhor9Yv5TgCza4sum2z8ISXbNiMhBDno6CwwPqKu8Vk98MtSdVAnvicZJ/0mG+
	 q06ka5QSqpIttxcxq0oSfh6oKERcs+6RBBMfcrVENO34y3UBLZNpKCklBs6JGQo0qz
	 a1mO3bQbIH9WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 81B52407EE;
	Sun, 21 Dec 2025 22:12:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 85659119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F3D8540095
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9QwrpHoxh3W8 for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6858B40089
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6858B40089
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66888874A8; Sun, 21 Dec 2025 22:12:27 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 22:58:36 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d9c1379d1f7651951d00ce59b588d74aad049573
X-Git-Newrev: 5357be31e82bc9b0f2e16c9aadc660f50301b2ee
X-Patchwork-Hint: ignore
Message-Id: <20251221221227.66888874A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask-jsonrpc: bump version
 to 4.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5357be31e82bc9b0f2e16c9aadc660f50301b2ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/cenobites/flask-jsonrpc/releases/tag/v4.0

Switched setup type to hatch and updated license file:
https://github.com/cenobites/flask-jsonrpc/commit/a4031daaaf54b67f002b62de162a904f3f34cee4

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-flask-jsonrpc/python-flask-jsonrpc.hash |  7 +++----
 package/python-flask-jsonrpc/python-flask-jsonrpc.mk   | 10 +++++-----
 2 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/package/python-flask-jsonrpc/python-flask-jsonrpc.hash b/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
index ad1564caab..c8027aced6 100644
--- a/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
+++ b/package/python-flask-jsonrpc/python-flask-jsonrpc.hash
@@ -1,6 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-jsonrpc/json
-md5  29ca67027f53912cb146d9305ea3e810  Flask-JSONRPC-3.0.1.tar.gz
-sha256  110295be39c6d6a110063630c050e3f8a4f79c50281898b3f1cb8a18fb3cb84a  Flask-JSONRPC-3.0.1.tar.gz
+md5  f5c5a0364fc189e185ac6ddfd700bf0c  flask_jsonrpc-4.0.0.tar.gz
+sha256  468018215a1363f44e519d9f50248bfd4f3e1f6a7c6e709ac4039fa43be327ce  flask_jsonrpc-4.0.0.tar.gz
 # Locally computed sha256 checksums
-sha256  5e6175926ba7dde28c7d292a8b0350aa82c40a8c5691a878fe02b0c9c6b43b39  LICENSE
-sha256  5e6175926ba7dde28c7d292a8b0350aa82c40a8c5691a878fe02b0c9c6b43b39  COPYING
+sha256  fffebf4325dbab265f334f5040718822f7784c4d047b20124d3cfc1680f9b96a  LICENSE.txt
diff --git a/package/python-flask-jsonrpc/python-flask-jsonrpc.mk b/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
index 2a60d73d42..34e7b7ad98 100644
--- a/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
+++ b/package/python-flask-jsonrpc/python-flask-jsonrpc.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_FLASK_JSONRPC_VERSION = 3.0.1
-PYTHON_FLASK_JSONRPC_SOURCE = Flask-JSONRPC-$(PYTHON_FLASK_JSONRPC_VERSION).tar.gz
-PYTHON_FLASK_JSONRPC_SITE = https://files.pythonhosted.org/packages/7e/9d/637a0620802e4c496bd5d48e3766c3a4fd6a03f815f9bcb183bc7a17a5bb
+PYTHON_FLASK_JSONRPC_VERSION = 4.0.0
+PYTHON_FLASK_JSONRPC_SOURCE = flask_jsonrpc-$(PYTHON_FLASK_JSONRPC_VERSION).tar.gz
+PYTHON_FLASK_JSONRPC_SITE = https://files.pythonhosted.org/packages/b9/2e/74dcb729aa2f5b49d4731cfaab5cb5fbfd867906ba7a0a6e32c66779dbb6
 PYTHON_FLASK_JSONRPC_LICENSE = BSD-3-Clause
-PYTHON_FLASK_JSONRPC_LICENSE_FILES = LICENSE COPYING
-PYTHON_FLASK_JSONRPC_SETUP_TYPE = setuptools
+PYTHON_FLASK_JSONRPC_LICENSE_FILES = LICENSE.txt
+PYTHON_FLASK_JSONRPC_SETUP_TYPE = hatch
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
