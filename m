Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FBFCCAC597
	for <buildroot@archiver.kernel.org>; Mon, 15 Sep 2025 20:22:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E653C80AAB;
	Mon, 15 Sep 2025 20:22:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9FJ5oUg8DNJ8; Mon, 15 Sep 2025 20:22:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0166880ABB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0166880ABB;
	Mon, 15 Sep 2025 20:22:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id EF49B22F
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 20:22:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E13BD60AF2
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 20:22:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MBWlhGn1JXxc for <buildroot@buildroot.org>;
 Mon, 15 Sep 2025 20:22:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EEA7960AF5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id EEA7960AF5
 for <buildroot@buildroot.org>; Mon, 15 Sep 2025 20:22:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E5D25846F3; Mon, 15 Sep 2025 20:22:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Sep 2025 22:19:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ccbcb0d47854e93b10ee90167da033b250026d97
X-Git-Newrev: cbc3cb2c8deebd362399cc7867dda94709d552e7
X-Patchwork-Hint: ignore
Message-Id: <20250915202217.E5D25846F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-flask-cors: fix PKG_SITE
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

commit: https://git.buildroot.net/buildroot/commit/?id=cbc3cb2c8deebd362399cc7867dda94709d552e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python-flask-cors was security bumped in commit 04cd135b26 [1], however this
commit did not update the _SITE url; which changes with each new release on
pypi. Therefore, downloading python-flask-cors would always fail.

Fixes:
https://autobuild.buildroot.org/results/eeadcb2e416cddaa5d059b31ea5dcc9f766a3cff

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/04cd135b26406dcc31cb66af1480d53fffe81e59

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[Julien: add "Fixes" in commit log, from Yegor Yefremov comment]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-flask-cors/python-flask-cors.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-flask-cors/python-flask-cors.mk b/package/python-flask-cors/python-flask-cors.mk
index d0923d665b..26198e6fb4 100644
--- a/package/python-flask-cors/python-flask-cors.mk
+++ b/package/python-flask-cors/python-flask-cors.mk
@@ -6,7 +6,7 @@
 
 PYTHON_FLASK_CORS_VERSION = 6.0.1
 PYTHON_FLASK_CORS_SOURCE = flask_cors-$(PYTHON_FLASK_CORS_VERSION).tar.gz
-PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/4f/d0/d9e52b154e603b0faccc0b7c2ad36a764d8755ef4036acbf1582a67fb86b
+PYTHON_FLASK_CORS_SITE = https://files.pythonhosted.org/packages/76/37/bcfa6c7d5eec777c4c7cf45ce6b27631cebe5230caf88d85eadd63edd37a
 PYTHON_FLASK_CORS_SETUP_TYPE = setuptools
 PYTHON_FLASK_CORS_LICENSE = MIT
 PYTHON_FLASK_CORS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
