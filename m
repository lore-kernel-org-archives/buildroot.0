Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E59C0E937EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Apr 2026 17:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 748028445E;
	Sun, 12 Apr 2026 17:01:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tVXjXZf4dKMx; Sun, 12 Apr 2026 17:01:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47091844B7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776013276;
	bh=XoV8epIQBfLXeSPU9QGy8sQJabCzNAx8+G74On+dNfc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GaCGYfCYw/q+pdSs1FABnlFzgA57WYIkE/J7h7HAVTHc+YfZoIMGKqjl9dHeuaKz2
	 6WKZ+iqIBpJGgyraITyRf8HCV1YzzvwY+KhQVjR4AVTENixJ8riVdR94jppNgK1bvr
	 OGbmMZDEBw1ayejtYOIrmu2WL8eJOpvA9lIhLbB1QD+oQCQt5FBpgNo+wx6HQCvu+7
	 z2wzzZpjA9g4NfuvOmsQNN3NcbN6QAhnDXr+uryViNoOVx4QrU0cz5tFC+q7ivcAYu
	 sKOEcljslQSACt9cYgru6tvJRAvf6yusMPT2t3OLVzhbFDdI2GFL5+le5ecsiuPwo4
	 Jp17eLjDWgfPA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 47091844B7;
	Sun, 12 Apr 2026 17:01:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1C32A237
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:01:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1A133844B7
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:01:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SmTgx4zNVgBr for <buildroot@buildroot.org>;
 Sun, 12 Apr 2026 17:01:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 490318445E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 490318445E
 for <buildroot@buildroot.org>; Sun, 12 Apr 2026 17:01:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B476281192; Sun, 12 Apr 2026 17:01:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 12 Apr 2026 18:54:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ac53518a0ceb0611ee08adef500fc8d2994d21a
X-Git-Newrev: 8b965c2665aec8ac82d1d32c554d70cd8ffb45b0
X-Patchwork-Hint: ignore
Message-Id: <20260412170113.B476281192@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gpiod: security bump to
 2.4.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8b965c2665aec8ac82d1d32c554d70cd8ffb45b0
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update for libgpiod v2.2.4.
Contains the following security fix:
https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?h=python-v2.4.x&id=c3655b5f641b87656c11da3ac708608d2c0e05ee

The package now contains a proper LICENSE file in the sdist since:
https://git.kernel.org/pub/scm/libs/libgpiod/libgpiod.git/commit/?h=python-v2.4.x&id=51ee19fe1ec8a94b5ecfdc7627b0c574c7874a1b

Note: this commit is marked as "security" update because it contains
security related bugfixes, but no CVE or advisory are published at
the time of this commit.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
[Julien: add note in the commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-gpiod/python-gpiod.hash | 6 +++---
 package/python-gpiod/python-gpiod.mk   | 7 +++----
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/python-gpiod/python-gpiod.hash b/package/python-gpiod/python-gpiod.hash
index dfaafd4d4c..d3277c5a20 100644
--- a/package/python-gpiod/python-gpiod.hash
+++ b/package/python-gpiod/python-gpiod.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gpiod/json
-md5  62cf044aa3214d0ebee6aef78db2aa52  gpiod-2.4.0.tar.gz
-sha256  9243a1a59d084ec749d1df4a1e2f238ffb9d94515b0d9f5335460175143c3aa1  gpiod-2.4.0.tar.gz
+md5  c9c2fb67d78204896d85a7945314356f  gpiod-2.4.2.tar.gz
+sha256  602aae17ff365bb8e2a30ce65c6bbf2d8e7a7e64bf016e82e4fd4c730ef69ab7  gpiod-2.4.2.tar.gz
 # Locally computed sha256 checksums
-sha256  a2b24e2158144b22a77a6a404fc5a05911612c5b99d7ab6d0e2addcaeb7514a3  pyproject.toml
+sha256  592987e8510228d546540b84a22444bde98e48d03078d3b2eefcd889bec5ce8c  LICENSE
diff --git a/package/python-gpiod/python-gpiod.mk b/package/python-gpiod/python-gpiod.mk
index 8ab901972e..6881f0df43 100644
--- a/package/python-gpiod/python-gpiod.mk
+++ b/package/python-gpiod/python-gpiod.mk
@@ -4,13 +4,12 @@
 #
 ################################################################################
 
-PYTHON_GPIOD_VERSION = 2.4.0
+PYTHON_GPIOD_VERSION = 2.4.2
 PYTHON_GPIOD_SOURCE = gpiod-$(PYTHON_GPIOD_VERSION).tar.gz
-PYTHON_GPIOD_SITE = https://files.pythonhosted.org/packages/0c/dc/5a6bd309345bd9cfa7e098174ab7e65367e408539b6c1998e4f267c673cd
+PYTHON_GPIOD_SITE = https://files.pythonhosted.org/packages/13/ca/b3bd043091b4462d6c5561f86581f553df102d8990c37938ddbff2823016
 PYTHON_GPIOD_SETUP_TYPE = setuptools
 PYTHON_GPIOD_LICENSE = LGPL-2.1+
-# The package license follows libgpiod's license but doesn't include the LICENSE text in the pypi distrobuted package again
-PYTHON_GPIOD_LICENSE_FILES = pyproject.toml
+PYTHON_GPIOD_LICENSE_FILES = LICENSE
 PYTHON_GPIOD_DEPENDENCIES = libgpiod2
 PYTHON_GPIOD_ENV = LINK_SYSTEM_LIBGPIOD=1
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
