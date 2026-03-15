Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B05F3028D
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4FC8F61306;
	Sun, 15 Mar 2026 22:19:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FlVfK7uRwQ9R; Sun, 15 Mar 2026 22:19:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF4AA61310
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613142;
	bh=LjGp0pQZTFhHhFWx77H2S+ItZcdNEzoW4+pIZ2Ph8NU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=I2pdI1JoIjGPdMUxKZdX7EZWUhftjr5NEZ2OL7kHnvUjf/JbvBohpGO5b8FvACVEV
	 Vlb6uR2l/8p+xQZA/4hU5/NERlvWQVN7FQsEU5wmmhnQWyHoxAjA8/4s/q5CRoCaZE
	 aORiww5tdAu5Mf5CB+Mlj9QmroWvCuaoX67ppjxSZVu3tulStmO1sYaUDu97a1Qz0N
	 FXJBPIttI74xgqk69L7L7fxyNnQE/cHIvyWMgpXbx/1Nf6tuvw74nDaLHcwo+ASXJJ
	 buI1wp48jaL2zSVj5Dy5XpIkPYEa8yBBaKk6PrSMvqISgnkR8gaNNhys8Re4tJVMkx
	 YKq562HE1qH3A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF4AA61310;
	Sun, 15 Mar 2026 22:19:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0F69F357
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7741E6115C
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eolRvxkgNdKr for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 18152610A2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 18152610A2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5A3ED85D38; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ddaf4d98b67da6ed31a3cc9b06083dcd0f0452dc
X-Git-Newrev: 9733007b726bdd36eea14dfe338a3663cf4d0fe1
X-Patchwork-Hint: ignore
Message-Id: <20260315221802.5A3ED85D38@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-parso: bump version to 0.8.6
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9733007b726bdd36eea14dfe338a3663cf4d0fe1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/davidhalter/parso/blob/v0.8.6/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-parso/python-parso.hash | 4 ++--
 package/python-parso/python-parso.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-parso/python-parso.hash b/package/python-parso/python-parso.hash
index d0c8b3861a..17e3cbe4b1 100644
--- a/package/python-parso/python-parso.hash
+++ b/package/python-parso/python-parso.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/parso/json
-md5  e0b327d04ff11e429737465f2716c232  parso-0.8.5.tar.gz
-sha256  034d7354a9a018bdce352f48b2a8a450f05e9d6ee85db84764e9b6bd96dafe5a  parso-0.8.5.tar.gz
+md5  10fb3883e4c595ec7333b722e3ad30b5  parso-0.8.6.tar.gz
+sha256  2b9a0332696df97d454fa67b81618fd69c35a7b90327cbe6ba5c92d2c68a7bfd  parso-0.8.6.tar.gz
 # Locally computed sha256 checksums
 sha256  fa67973073753d17624caf8684d5ee816d70c89d912c5bca7ca0f08e7b150edb  LICENSE.txt
 sha256  9c1e620a5cf8e74fe81c1fd4c55e9cc0b189fc04e677cfc7ef915de746c3f59e  docs/_themes/flask/LICENSE
diff --git a/package/python-parso/python-parso.mk b/package/python-parso/python-parso.mk
index 1cbc1f1e89..9457fcde6d 100644
--- a/package/python-parso/python-parso.mk
+++ b/package/python-parso/python-parso.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PARSO_VERSION = 0.8.5
+PYTHON_PARSO_VERSION = 0.8.6
 PYTHON_PARSO_SOURCE = parso-$(PYTHON_PARSO_VERSION).tar.gz
-PYTHON_PARSO_SITE = https://files.pythonhosted.org/packages/d4/de/53e0bcf53d13e005bd8c92e7855142494f41171b34c2536b86187474184d
+PYTHON_PARSO_SITE = https://files.pythonhosted.org/packages/81/76/a1e769043c0c0c9fe391b702539d594731a4362334cdf4dc25d0c09761e7
 PYTHON_PARSO_SETUP_TYPE = setuptools
 PYTHON_PARSO_LICENSE = MIT, Python-2.0, BSD-3-Clause (flask theme)
 PYTHON_PARSO_LICENSE_FILES = LICENSE.txt docs/_themes/flask/LICENSE test/normalizer_issue_files/LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
