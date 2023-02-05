Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94061C636CD
	for <buildroot@archiver.kernel.org>; Sun,  5 Feb 2023 23:02:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 39681400D8;
	Sun,  5 Feb 2023 23:02:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39681400D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cgiIKgAe3ssX; Sun,  5 Feb 2023 23:02:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FC0040201;
	Sun,  5 Feb 2023 23:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FC0040201
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B40F31BF39C
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 23:02:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A413409A7
 for <buildroot@lists.busybox.net>; Sun,  5 Feb 2023 23:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8A413409A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5QF3bbJqw1FE for <buildroot@lists.busybox.net>;
 Sun,  5 Feb 2023 23:02:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5847F415F4
 for <buildroot@buildroot.org>; Sun,  5 Feb 2023 23:02:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5847F415F4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46236838F5; Sun,  5 Feb 2023 23:02:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 6 Feb 2023 00:01:10 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 4631f48fe79aa83d352fb5eb254f39ea54926ba6
X-Git-Newrev: 14e35225d8e314c4ded7799843fb80de8e182e28
X-Patchwork-Hint: ignore
Message-Id: <20230205230241.46236838F5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/python-future:
 security bump to version 0.18.3
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=14e35225d8e314c4ded7799843fb80de8e182e28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

Fix CVE-2022-40899: An issue discovered in Python Charmers Future 0.18.2
and earlier allows remote attackers to cause a denial of service via
crafted Set-Cookie header from malicious web server.

https://github.com/PythonCharmers/python-future/releases/tag/v0.18.3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 51eb81ddcf340457cff13286fd1aa04082c4903a)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-future/python-future.hash | 6 +++---
 package/python-future/python-future.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-future/python-future.hash b/package/python-future/python-future.hash
index 4fb5d2a2d7..3b2bbb0212 100644
--- a/package/python-future/python-future.hash
+++ b/package/python-future/python-future.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.python.org/pypi/future/json
-md5  e4579c836b9c025872efe230f6270349  future-0.18.2.tar.gz
-sha256  b1bead90b70cf6ec3f0710ae53a525360fa360d306a86583adc6bf83a4db537d  future-0.18.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/future/json
+md5  dedcb70d14b23388670d54145aab8be4  future-0.18.3.tar.gz
+sha256  34a17436ed1e96697a86f9de3d15a3b0be01d8bc8de9c1dffd59fb8234ed5307  future-0.18.3.tar.gz
 # Locally computed sha256 checksums
 sha256  916e561392d48471b9c23437f56e2652f320cb3b119ceaa162edf41016f746b9  LICENSE.txt
diff --git a/package/python-future/python-future.mk b/package/python-future/python-future.mk
index 76f32180ac..57bf13d83b 100644
--- a/package/python-future/python-future.mk
+++ b/package/python-future/python-future.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FUTURE_VERSION = 0.18.2
+PYTHON_FUTURE_VERSION = 0.18.3
 PYTHON_FUTURE_SOURCE = future-$(PYTHON_FUTURE_VERSION).tar.gz
-PYTHON_FUTURE_SITE = https://files.pythonhosted.org/packages/45/0b/38b06fd9b92dc2b68d58b75f900e97884c45bedd2ff83203d933cf5851c9
+PYTHON_FUTURE_SITE = https://files.pythonhosted.org/packages/8f/2e/cf6accf7415237d6faeeebdc7832023c90e0282aa16fd3263db0eb4715ec
 PYTHON_FUTURE_SETUP_TYPE = setuptools
 PYTHON_FUTURE_LICENSE = MIT
 PYTHON_FUTURE_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
