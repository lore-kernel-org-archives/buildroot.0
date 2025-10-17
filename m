Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06598CCD199
	for <buildroot@archiver.kernel.org>; Fri, 17 Oct 2025 16:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35B5180A81;
	Fri, 17 Oct 2025 16:38:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oTR_WvLoqWgq; Fri, 17 Oct 2025 16:38:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 890F880B6A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 890F880B6A;
	Fri, 17 Oct 2025 16:38:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 29784D8
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:38:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BAB7403A0
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:38:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TTvBnXt4qAWI for <buildroot@buildroot.org>;
 Fri, 17 Oct 2025 16:38:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 673C4400E9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 673C4400E9
 for <buildroot@buildroot.org>; Fri, 17 Oct 2025 16:38:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6086C8740C; Fri, 17 Oct 2025 16:38:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 17 Oct 2025 18:37:45 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4c433d3884ba7d7bb9759011c39f2f078cfa283
X-Git-Newrev: e089a1c048148d83f060f042c7d2ecaa3a03f998
X-Patchwork-Hint: ignore
Message-Id: <20251017163855.6086C8740C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-charset-normalizer: bump to
 3.4.4
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

commit: https://git.buildroot.net/buildroot/commit/?id=e089a1c048148d83f060f042c7d2ecaa3a03f998
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changelog:
https://github.com/jawah/charset_normalizer/blob/master/CHANGELOG.md#changelog

Upstream setuptools-scm build dependency. Also the upper bound of
mypy(c) is currently high enough that we can remove the
--skip-dependency-check hack.

mypy(c) is now also optional if CHARSET_NORMALIZER_USE_MYPYC isn't set
to one. As we don't really care about the performance optimization in
the host package we can skip the mypyc step and remove the dependency on
mypyc for the host package.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../python-charset-normalizer/python-charset-normalizer.hash  |  4 ++--
 .../python-charset-normalizer/python-charset-normalizer.mk    | 11 +++--------
 2 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.hash b/package/python-charset-normalizer/python-charset-normalizer.hash
index 0518440057..dd10c11e73 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.hash
+++ b/package/python-charset-normalizer/python-charset-normalizer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/charset-normalizer/json
-md5  1d808eb9efaf70bf0ec3b800f3c7dca8  charset_normalizer-3.4.1.tar.gz
-sha256  44251f18cd68a75b56585dd00dae26183e102cd5e0f9f1466e6df5da2ed64ea3  charset_normalizer-3.4.1.tar.gz
+md5  3c73a3c5c05a896c1169d8b5298dc4e5  charset_normalizer-3.4.4.tar.gz
+sha256  94537985111c35f28720e43603b8e7b43a6ecfb2ce1d3058bbe955b73404e21a  charset_normalizer-3.4.4.tar.gz
 # Locally computed sha256 checksums
 sha256  6d0d41bfe170ac6c7dc248c9a63e254d0fb45a60d50a8257d0af92c6e249b887  LICENSE
diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index 64a82dd016..8b9c954bce 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -4,19 +4,14 @@
 #
 ################################################################################
 
-PYTHON_CHARSET_NORMALIZER_VERSION = 3.4.1
+PYTHON_CHARSET_NORMALIZER_VERSION = 3.4.4
 PYTHON_CHARSET_NORMALIZER_SOURCE = charset_normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
-PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/16/b0/572805e227f01586461c80e0fd25d65a2115599cc9dad142fee4b747c357
+PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/13/69/33ddede1939fdd074bce5434295f38fae7136463422fe4fd3e0e89b98062
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
-PYTHON_CHARSET_NORMALIZER_DEPENDENCIES = host-python-mypy host-python-setuptools-scm
-PYTHON_CHARSET_NORMALIZER_BUILD_OPTS = --skip-dependency-check
+PYTHON_CHARSET_NORMALIZER_DEPENDENCIES = host-python-mypy
 PYTHON_CHARSET_NORMALIZER_ENV = CHARSET_NORMALIZER_USE_MYPYC=1
 
-HOST_PYTHON_CHARSET_NORMALIZER_DEPENDENCIES = host-python-mypy host-python-setuptools-scm
-HOST_PYTHON_CHARSET_NORMALIZER_BUILD_OPTS = --skip-dependency-check
-HOST_PYTHON_CHARSET_NORMALIZER_ENV = CHARSET_NORMALIZER_USE_MYPYC=1
-
 $(eval $(python-package))
 $(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
