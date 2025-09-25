Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C67DCAC5BB
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 55F2B61585;
	Thu, 25 Sep 2025 20:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kcnUfpOLVgFk; Thu, 25 Sep 2025 20:19:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1B7861547
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1B7861547;
	Thu, 25 Sep 2025 20:19:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 93F6B12D
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4EDE3814D4
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6h6z2U_C4S5c for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:19:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D6E4814D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D6E4814D5
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:41 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DC6086443; Thu, 25 Sep 2025 20:19:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:07:05 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2d5f170e019814ca66d6f2e4f8a0bfc22c9e4fec
X-Git-Newrev: bcf4081ea6bc090e091ecb3aa58f1892bfaa2779
X-Patchwork-Hint: ignore
Message-Id: <20250925201941.6DC6086443@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/python-flask-cors: fix PKG_SITE
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bcf4081ea6bc090e091ecb3aa58f1892bfaa2779
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

python-flask-cors was security bumped in commit 04cd135b26 [1], however this
commit did not update the _SITE url; which changes with each new release on
pypi. Therefore, downloading python-flask-cors would always fail.

Fixes:
https://autobuild.buildroot.org/results/eeadcb2e416cddaa5d059b31ea5dcc9f766a3cff

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/04cd135b26406dcc31cb66af1480d53fffe81e59

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
[Julien: add "Fixes" in commit log, from Yegor Yefremov comment]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit cbc3cb2c8deebd362399cc7867dda94709d552e7)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
