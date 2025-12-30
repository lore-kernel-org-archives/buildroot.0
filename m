Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1630DE95A86
	for <buildroot@archiver.kernel.org>; Tue, 30 Dec 2025 13:00:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D95E56065A;
	Tue, 30 Dec 2025 13:00:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PjAzB_u6rzRN; Tue, 30 Dec 2025 13:00:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A224607DA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767099632;
	bh=QnsdAr0wMdJ1Uk9RgI6oGcZnvZt7NUkQArU9vYQ0daA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=PWmDtzFdKGkYL5DPmURugnx3q2v67RWdtRc7yYEEHE3UhAAFjcH6ixdT14xtHuKVn
	 BDNfqSANnZ8eCBZjKfhOq90Ynv58IJkBWZ0Qtz2S27tdYlIE2W9gMe2vJGHH7FBnxL
	 OGCq4EKAymvm/9h9lMVs8R6oLFG6/L8k2fZjcRb+TwdjeHxcDAX702zJxBa9ZCoAbz
	 2NWzxOqeNUvWn6+D33z5rY7XCZRAqV4y26TSKMRxhQEHlXke2wTKv/ogM/a4Z2p7um
	 zvW5eZ1d5EsQZJGNWcm3xM5I/0QWpGhXJwfNyy7HG8NCJ+1LDfaKGn9GkFEL44V8zR
	 6QJKfXJodR0Tg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A224607DA;
	Tue, 30 Dec 2025 13:00:32 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 13574177
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05CCF60B55
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JWhjiBecEx3y for <buildroot@buildroot.org>;
 Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 55C7E6065A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 55C7E6065A
 for <buildroot@buildroot.org>; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 477C187A6A; Tue, 30 Dec 2025 13:00:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Dec 2025 13:44:19 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 37015b15cdc8ef57fca73f84d966a0da72f26570
X-Git-Newrev: eb29acc9f22ad632b7af139bbdc2352cf08ca7e2
X-Patchwork-Hint: ignore
Message-Id: <20251230130026.477C187A6A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-base58: new package
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

commit: https://git.buildroot.net/buildroot/commit/?id=eb29acc9f22ad632b7af139bbdc2352cf08ca7e2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/Config.in                        |  1 +
 package/python-base58/Config.in          |  6 ++++++
 package/python-base58/python-base58.hash |  5 +++++
 package/python-base58/python-base58.mk   | 14 ++++++++++++++
 4 files changed, 26 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 7a7f80f37b..cd13bb307c 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1021,6 +1021,7 @@ menu "External python modules"
 	source "package/python-avro/Config.in"
 	source "package/python-babel/Config.in"
 	source "package/python-backcall/Config.in"
+	source "package/python-base58/Config.in"
 	source "package/python-bcrypt/Config.in"
 	source "package/python-beautifulsoup4/Config.in"
 	source "package/python-betterproto/Config.in"
diff --git a/package/python-base58/Config.in b/package/python-base58/Config.in
new file mode 100644
index 0000000000..27eff77c44
--- /dev/null
+++ b/package/python-base58/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PYTHON_BASE58
+	bool "python-base58"
+	help
+	  Base58 and Base58Check implementation.
+
+	  https://github.com/keis/base58
diff --git a/package/python-base58/python-base58.hash b/package/python-base58/python-base58.hash
new file mode 100644
index 0000000000..fa24123851
--- /dev/null
+++ b/package/python-base58/python-base58.hash
@@ -0,0 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/base58/json
+md5  3595b886f6d57b947fa8d38d4c92e5b3  base58-2.1.1.tar.gz
+sha256  c5d0cb3f5b6e81e8e35da5754388ddcc6d0d14b6c6a132cb93d69ed580a7278c  base58-2.1.1.tar.gz
+# Locally computed sha256 checksums
+sha256  cf4694f040b7a31cd8ec3dbcd0b583a601c0d4c37de016be7aa0a06e3a6a3a54  COPYING
diff --git a/package/python-base58/python-base58.mk b/package/python-base58/python-base58.mk
new file mode 100644
index 0000000000..59822c62d7
--- /dev/null
+++ b/package/python-base58/python-base58.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# python-base58
+#
+################################################################################
+
+PYTHON_BASE58_VERSION = 2.1.1
+PYTHON_BASE58_SOURCE = base58-$(PYTHON_BASE58_VERSION).tar.gz
+PYTHON_BASE58_SITE = https://files.pythonhosted.org/packages/7f/45/8ae61209bb9015f516102fa559a2914178da1d5868428bd86a1b4421141d
+PYTHON_BASE58_SETUP_TYPE = setuptools
+PYTHON_BASE58_LICENSE = MIT
+PYTHON_BASE58_LICENSE_FILES = COPYING
+
+$(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
