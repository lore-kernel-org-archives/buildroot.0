Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00A77D33990
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 14:41:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC038605A8;
	Mon, 28 Oct 2024 14:41:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KFiGY6Jb08HN; Mon, 28 Oct 2024 14:41:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F29E60677
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9F29E60677;
	Mon, 28 Oct 2024 14:41:51 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 771D94EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:41:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C0A3A40966
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ZzZTskByEnm for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 14:40:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1071B4094B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1071B4094B
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 14:40:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0D6F184300; Mon, 28 Oct 2024 14:40:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 14:48:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 52ed5993486ba0a8a5e165954b789f21b0e2169c
X-Git-Newrev: 8b0ecdcb823010694a113ed56990ada54d879449
X-Patchwork-Hint: ignore
Message-Id: <20241028144053.0D6F184300@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-webob: bump to version 1.8.9
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=8b0ecdcb823010694a113ed56990ada54d879449
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add new python-legacy-cgi runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-webob/Config.in         | 1 +
 package/python-webob/python-webob.hash | 4 ++--
 package/python-webob/python-webob.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-webob/Config.in b/package/python-webob/Config.in
index d3397587a1..d4b24d3d87 100644
--- a/package/python-webob/Config.in
+++ b/package/python-webob/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_WEBOB
 	bool "python-webob"
+	select BR2_PACKAGE_PYTHON_LEGACY_CGI # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  WSGI request and response object.
diff --git a/package/python-webob/python-webob.hash b/package/python-webob/python-webob.hash
index 065a878d41..8f9c7a1fe2 100644
--- a/package/python-webob/python-webob.hash
+++ b/package/python-webob/python-webob.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/webob/json
-md5  2372b45cf0e0a3970daaa901fc9d0f64  webob-1.8.8.tar.gz
-sha256  2abc1555e118fc251e705fc6dc66c7f5353bb9fbfab6d20e22f1c02b4b71bcee  webob-1.8.8.tar.gz
+md5  4167b16880e0d4c22aadee8ec3cc6c26  webob-1.8.9.tar.gz
+sha256  ad6078e2edb6766d1334ec3dee072ac6a7f95b1e32ce10def8ff7f0f02d56589  webob-1.8.9.tar.gz
 # Locally computed sha256 checksums
 sha256  27bc4919e7e9e6b6cda40644517ca74d32203e32fba89ef832aba1ed93e457b3  docs/license.txt
diff --git a/package/python-webob/python-webob.mk b/package/python-webob/python-webob.mk
index 0240d3a456..1e58d590d1 100644
--- a/package/python-webob/python-webob.mk
+++ b/package/python-webob/python-webob.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBOB_VERSION = 1.8.8
+PYTHON_WEBOB_VERSION = 1.8.9
 PYTHON_WEBOB_SOURCE = webob-$(PYTHON_WEBOB_VERSION).tar.gz
-PYTHON_WEBOB_SITE = https://files.pythonhosted.org/packages/a2/7a/ac5b1ab5636cc3bfc9bab1ed54ff4e8fdeb6367edd911f7337be2248b8ab
+PYTHON_WEBOB_SITE = https://files.pythonhosted.org/packages/85/0b/1732085540b01f65e4e7999e15864fe14cd18b12a95731a43fd6fd11b26a
 PYTHON_WEBOB_SETUP_TYPE = setuptools
 PYTHON_WEBOB_LICENSE = MIT
 PYTHON_WEBOB_LICENSE_FILES = docs/license.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
