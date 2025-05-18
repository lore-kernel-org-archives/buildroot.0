Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0E3EC3ABC9
	for <buildroot@archiver.kernel.org>; Sun, 18 May 2025 14:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8F68281F05;
	Sun, 18 May 2025 14:47:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gEE42bVWeRT7; Sun, 18 May 2025 14:47:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5D68E81975
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5D68E81975;
	Sun, 18 May 2025 14:47:21 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32FC2223
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E29C9403E1
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mfeN9A2OcH_g for <buildroot@buildroot.org>;
 Sun, 18 May 2025 14:47:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 39F1A403F3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 39F1A403F3
 for <buildroot@buildroot.org>; Sun, 18 May 2025 14:47:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3597087142; Sun, 18 May 2025 14:47:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 14:56:33 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: c41e4b3dd9e28283ed7563c7f30a92e4e81b4535
X-Git-Newrev: 7fc6421be3dc344467ec1ccbf0c8089513e3f8f8
X-Patchwork-Hint: ignore
Message-Id: <20250518144710.3597087142@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/python-flask:
 security bump to version 3.1.1
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=7fc6421be3dc344467ec1ccbf0c8089513e3f8f8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Fixes the following security issues:

- CVE-2025-47278: In Flask 3.1.0, the way fallback key configuration was
    handled resulted in the last fallback key being used for signing,
    rather than the current signing key.

For more information, see:
  - https://nvd.nist.gov/vuln/detail/CVE-2025-47278
  - https://github.com/pallets/flask/commit/73d6504063bfa00666a92b07a28aaf906c532f09

For more details on the version bump, see the release notes:
  - https://github.com/pallets/flask/releases/tag/3.1.1

Signed-off-by: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 45439ae262aeb0cf720815c5a7b541467a39a60c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python-flask/python-flask.hash | 4 ++--
 package/python-flask/python-flask.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask/python-flask.hash b/package/python-flask/python-flask.hash
index 97982f99d5..17564e8587 100644
--- a/package/python-flask/python-flask.hash
+++ b/package/python-flask/python-flask.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/flask/json
-md5  c95d81666442bf04f7de7db7edbe2aff  flask-3.1.0.tar.gz
-sha256  5f873c5184c897c8d9d1b05df1e3d01b14910ce69607a117bd3277098a5836ac  flask-3.1.0.tar.gz
+md5  59dc1b0772bab098aff83e8008e97af6  flask-3.1.1.tar.gz
+sha256  284c7b8f2f58cb737f0cf1c30fd7eaf0ccfcde196099d24ecede3fc2005aa59e  flask-3.1.1.tar.gz
 # Locally computed sha256 checksums
 sha256  489a8e1108509ed98a37bb983e11e0f7e1d31f0bd8f99a79c8448e7ff37d07ea  LICENSE.txt
 sha256  1e07e9c25f2618a040560b70e63f42259eab24e558d0f3532e6163d751cb4eea  docs/license.rst
diff --git a/package/python-flask/python-flask.mk b/package/python-flask/python-flask.mk
index d44c2e68ef..2269b05d29 100644
--- a/package/python-flask/python-flask.mk
+++ b/package/python-flask/python-flask.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_VERSION = 3.1.0
+PYTHON_FLASK_VERSION = 3.1.1
 PYTHON_FLASK_SOURCE = flask-$(PYTHON_FLASK_VERSION).tar.gz
-PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/89/50/dff6380f1c7f84135484e176e0cac8690af72fa90e932ad2a0a60e28c69b
+PYTHON_FLASK_SITE = https://files.pythonhosted.org/packages/c0/de/e47735752347f4128bcf354e0da07ef311a78244eba9e3dc1d4a5ab21a98
 PYTHON_FLASK_SETUP_TYPE = flit
 PYTHON_FLASK_LICENSE = BSD-3-Clause
 PYTHON_FLASK_LICENSE_FILES = LICENSE.txt docs/license.rst
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
