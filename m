Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E93F3028C
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:18:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5ADCF612DA;
	Sun, 15 Mar 2026 22:18:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tbi4_66RFBFl; Sun, 15 Mar 2026 22:18:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D01B610AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613132;
	bh=D8ARLBFeQ06O7sDy1BzQ9hD+CYeRxBhcdR7bQVWBpfc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=F5VWVtdbDw+gjVyFEYbU8CS2e5q6uyd4/Fj63MhwpUvok7wwfR+vEXBFQStsGtmQw
	 t1we+3RJuKmymgw2ayvXd2J1gkIvryHVaiOqbcJUH7TAxXqqFp1KAQLZqmYZFywTrp
	 lsuEl7oUftZBWjCbJEvAv+uu9U1En0AsPsgOg6UQhmYVDP7IgqqpamdddmnR4wo/r6
	 2OWFGE3utoQ8oN0aI2aXFpxxQq3wzfC3Q1HT+7bqV9InceBgneC3prB6tySSPZ4iuU
	 CcYF50MkjctUVy1bTTUG3d+6K3dNyhkprmUjH0GiwfdIX667GnQMSTRshatmuPknTp
	 8qD/00IolJhWw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D01B610AC;
	Sun, 15 Mar 2026 22:18:52 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0290D1B2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 69546610E0
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P0UywP6h6-lj for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8FBA56108A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8FBA56108A
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D275283F4D; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:33:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: de96f9aefed303b1af822d17c964b537d77b511d
X-Git-Newrev: d5d17fc404bc04a0f4af5d217412bac740193efa
X-Patchwork-Hint: ignore
Message-Id: <20260315221801.D275283F4D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-immutabledict: bump version
 to 4.3.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d5d17fc404bc04a0f4af5d217412bac740193efa
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/corenting/immutabledict/blob/v4.3.1/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-immutabledict/python-immutabledict.hash | 4 ++--
 package/python-immutabledict/python-immutabledict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-immutabledict/python-immutabledict.hash b/package/python-immutabledict/python-immutabledict.hash
index f917e43702..b7182a48a7 100644
--- a/package/python-immutabledict/python-immutabledict.hash
+++ b/package/python-immutabledict/python-immutabledict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/immutabledict/json
-md5  2ddeb671f200618365b11b997d50368f  immutabledict-4.2.2.tar.gz
-sha256  cb6ed3090df593148f94cb407d218ca526fd2639694afdb553dc4f50ce6feeca  immutabledict-4.2.2.tar.gz
+md5  8ed06e3692bae4d1df1a8818d9013ba2  immutabledict-4.3.1.tar.gz
+sha256  f844a669106cfdc73f47b1a9da003782fb17dc955a54c80972e0d93d1c63c514  immutabledict-4.3.1.tar.gz
 # Locally computed sha256 checksums
 sha256  347f918d37d4e0556a0695d34b9fb87fa9bbe808d54949851789c6c1fc91c61f  LICENSE
diff --git a/package/python-immutabledict/python-immutabledict.mk b/package/python-immutabledict/python-immutabledict.mk
index 4a886b1607..1e8cbd7e7b 100644
--- a/package/python-immutabledict/python-immutabledict.mk
+++ b/package/python-immutabledict/python-immutabledict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IMMUTABLEDICT_VERSION = 4.2.2
+PYTHON_IMMUTABLEDICT_VERSION = 4.3.1
 PYTHON_IMMUTABLEDICT_SOURCE = immutabledict-$(PYTHON_IMMUTABLEDICT_VERSION).tar.gz
-PYTHON_IMMUTABLEDICT_SITE = https://files.pythonhosted.org/packages/ce/12/1da8e1a9050d0603ba65fb1796ed8860a705b906701c96e77f85cc7490be
+PYTHON_IMMUTABLEDICT_SITE = https://files.pythonhosted.org/packages/1d/e6/718471048fea0366c3e3d1df3acfd914ca66d571cdffcf6d37bbcd725708
 PYTHON_IMMUTABLEDICT_SETUP_TYPE = poetry
 PYTHON_IMMUTABLEDICT_LICENSE = MIT
 PYTHON_IMMUTABLEDICT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
