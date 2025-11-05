Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 162FBCCFA0D
	for <buildroot@archiver.kernel.org>; Wed,  5 Nov 2025 20:41:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C485884281;
	Wed,  5 Nov 2025 20:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dHTURNMLmAYu; Wed,  5 Nov 2025 20:41:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 547B18429D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 547B18429D;
	Wed,  5 Nov 2025 20:41:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A3E3462
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0FB73411B6
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:41:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MTc9BITQ79Yj for <buildroot@buildroot.org>;
 Wed,  5 Nov 2025 20:41:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 33059411AF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 33059411AF
 for <buildroot@buildroot.org>; Wed,  5 Nov 2025 20:41:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21C8483D53; Wed,  5 Nov 2025 20:41:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 21:39:52 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8136aef01b65db8e2b5b7614956227c9ff97785
X-Git-Newrev: 9f3e222e9927b17409bbc28bb1afaad730ba531d
X-Patchwork-Hint: ignore
Message-Id: <20251105204104.21C8483D53@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask-cors: remove license
 file
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

commit: https://git.buildroot.net/buildroot/commit/?id=9f3e222e9927b17409bbc28bb1afaad730ba531d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Upstream tarball does not contain a license file anymore since version
5.0.1 [1] which causes errors after buildroot commit
04cd135b26406dcc31cb66af1480d53fffe81e59 which bumped the package
version from 5.0.0 to 6.0.1.

Fixes:
https://autobuild.buildroot.net/results/1eb/1eb9d68616793c9241bcb55bc2ea1929608c68bd/

[1] https://github.com/corydolphin/flask-cors/issues/382

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-flask-cors/python-flask-cors.hash | 2 --
 package/python-flask-cors/python-flask-cors.mk   | 1 -
 2 files changed, 3 deletions(-)

diff --git a/package/python-flask-cors/python-flask-cors.hash b/package/python-flask-cors/python-flask-cors.hash
index 7070b5462e..974d4a7a9e 100644
--- a/package/python-flask-cors/python-flask-cors.hash
+++ b/package/python-flask-cors/python-flask-cors.hash
@@ -1,5 +1,3 @@
 # md5, sha256 from https://pypi.org/pypi/flask-cors/json
 md5  2879503d54f25a4cacb62f7060b96e14  flask_cors-6.0.1.tar.gz
 sha256  d81bcb31f07b0985be7f48406247e9243aced229b7747219160a0559edd678db  flask_cors-6.0.1.tar.gz
-# Locally computed sha256 checksums
-sha256  6e1a1bdc54834c1e0740cbce5d5f6f2cae1c846fd2a7f482b11649594fafbd5d  LICENSE
diff --git a/package/python-flask-cors/python-flask-cors.mk b/package/python-flask-cors/python-flask-cors.mk
index 26198e6fb4..c7bc338867 100644
--- a/package/python-flask-cors/python-flask-cors.mk
+++ b/package/python-flask-cors/python-flask-cors.mk
@@ -9,7 +9,6 @@ PYTHON_FLASK_CORS_SOURCE = flask_cors-$(PYTHON_FLASK_CORS_VERSION).tar.gz
 PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/76/37/bcfa6c7d5eec777c4c7cf45ce6b27631cebe5230caf88d85eadd63edd37a
 PYTHON_FLASK_CORS_SETUP_TYPE = setuptools
 PYTHON_FLASK_CORS_LICENSE = MIT
-PYTHON_FLASK_CORS_LICENSE_FILES = LICENSE
 PYTHON_FLASK_CORS_CPE_ID_VENDOR = flask-cors_project
 PYTHON_FLASK_CORS_CPE_ID_PRODUCT = flask-cors
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
