Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5922E668B8
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 19:21:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76F8140366;
	Sat, 20 Dec 2025 19:21:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e0wiDciTifvZ; Sat, 20 Dec 2025 19:21:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A3C83403DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766258461;
	bh=neRIfla3hozlCygAfjqjvkhUPO/1QSrflA4TqHWMJjE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=bz2nUt0jyzNmqr3lG9ZbT5aK6Fm24MX1GRARXAEI5tEchlusbnfJrZdGoHU8IP510
	 sawbfPtIaYovD2KqDjss4FlZvTvO4tqaOug0BwTVXj6MN0w39zW+u50CuEGyaA0Lup
	 wCM1WwjITcwR92CF3vcTHvO9GwLG2GMcLxN7dpdGvzeJpJrOFUe9poZNyZBGVe6fKD
	 mDUg1J2xJphxm+eZnhqZ/AP7UhIKJC2o+oa7tHSNyVhmGxUt0jxapdZNWSncAZlQdA
	 yjQ8xs0kMpVawQSS0pLf7dqz9XdqQrQgvo1SMppxoK4f3rHEd1wIqvLUFBxpOh8SRy
	 0N1iXFPr+lFag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id A3C83403DF;
	Sat, 20 Dec 2025 19:21:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0367D119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 19:20:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 017F840425
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 19:20:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yee30D_qkQ19 for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 19:20:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34CE840465
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34CE840465
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 19:20:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 265688755D; Sat, 20 Dec 2025 19:20:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 20:11:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 21ba521c5e9f83df9cdc46d97f9a905b1afbcc03
X-Git-Newrev: 828d2288cd4b69cd23ad3c7e1699edbd51b1dce1
X-Patchwork-Hint: ignore
Message-Id: <20251220192058.265688755D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-anyio: bump to 4.12.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=828d2288cd4b69cd23ad3c7e1699edbd51b1dce1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop dependency on python-sniffio, that's no longer required.

Release Notes https://github.com/agronholm/anyio/releases/tag/4.12.0

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-anyio/Config.in         | 1 -
 package/python-anyio/python-anyio.hash | 4 ++--
 package/python-anyio/python-anyio.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-anyio/Config.in b/package/python-anyio/Config.in
index d843f37af0..e06dc8fc4f 100644
--- a/package/python-anyio/Config.in
+++ b/package/python-anyio/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_ANYIO
 	bool "python-anyio"
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
-	select BR2_PACKAGE_PYTHON_SNIFFIO # runtime
 	help
 	  High level compatibility layer for multiple asynchronous
 	  event loop implementations.
diff --git a/package/python-anyio/python-anyio.hash b/package/python-anyio/python-anyio.hash
index f93986fb9d..2a02bc9d37 100644
--- a/package/python-anyio/python-anyio.hash
+++ b/package/python-anyio/python-anyio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/anyio/json
-md5  9bbd9262979f576a9023389e48204037  anyio-4.11.0.tar.gz
-sha256  82a8d0b81e318cc5ce71a5f1f8b5c4e63619620b63141ef8c995fa0db95a57c4  anyio-4.11.0.tar.gz
+md5  a026af4a3b485699718761b1b44ad1df  anyio-4.12.0.tar.gz
+sha256  73c693b567b0c55130c104d0b43a9baf3aa6a31fc6110116509f27bf75e21ec0  anyio-4.12.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  LICENSE
diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
index 431eb5f286..035e2298e8 100644
--- a/package/python-anyio/python-anyio.mk
+++ b/package/python-anyio/python-anyio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANYIO_VERSION = 4.11.0
+PYTHON_ANYIO_VERSION = 4.12.0
 PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
-PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/c6/78/7d432127c41b50bccba979505f272c16cbcadcc33645d5fa3a738110ae75
+PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/16/ce/8a777047513153587e5434fd752e89334ac33e379aa3497db860eeb60377
 PYTHON_ANYIO_SETUP_TYPE = setuptools
 PYTHON_ANYIO_LICENSE = MIT
 PYTHON_ANYIO_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
