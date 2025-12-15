Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CEAAD5B870
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 21:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E78EA60F17;
	Mon, 15 Dec 2025 21:10:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ljkp03xb3TJn; Mon, 15 Dec 2025 21:10:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 017A560F21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765833010;
	bh=ToinoV6jpCrigg2zhJ+IVyYnbvUlA+XBKJRbgnb/94I=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pSIGN31MT+02SZNWF27NgSKyovvyXo9po+S+t3wY7e8y0HJhHal6DTHRB422KZsEw
	 oQTqlxtgvSTyLA12K0DWjZVDGHOkfXBIfBpJM5cB5TFVnglD+VXQbi7dxXVNj0MC3d
	 Txm9KBbzmGAZcj+9pTzD7feBL+JCAwtOnceH9y6ZL9L7RQl4sInKaCZebP0OBm2QOR
	 XZE6FA4es+3m4wLU5CcwrjAGT31rH2PRkJ7EA1jPTH0HXIOcVFJFaAwUvZVZgOUDX6
	 mOm5Jj5nb2dnOuThSwr3qPSm7x9atGPVWQmWJkB94gXNl+WN1+XTKIPuCaNbAeTuP1
	 6Ic6spwMG7yqQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 017A560F21;
	Mon, 15 Dec 2025 21:10:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 03491255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2F8D060F0A
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rvahaYoDsfrb for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 21:10:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D23A360F08
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D23A360F08
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D204386FB5; Mon, 15 Dec 2025 21:10:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:50:44 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 53f80e645586f04e2a5fbe34760211614a1a1495
X-Git-Newrev: 285097051d4a7dd821f01d15c705867f7e26c635
X-Patchwork-Hint: ignore
Message-Id: <20251215211000.D204386FB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pip: bumpp version to 25.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=285097051d4a7dd821f01d15c705867f7e26c635
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/pypa/pip/blob/25.3/NEWS.rst
"Building pip itself from source now uses flit-core instead of
 setuptools."

Switched build system to flit.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index ad70f0da7b..24d731d9e8 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  6d109857fa69274dacfc1d6528471eb5  pip-25.2.tar.gz
-sha256  578283f006390f85bb6282dffb876454593d637f5d1be494b5202ce4877e71f2  pip-25.2.tar.gz
+md5  31f52f428372020b80cd7518862fbbee  pip-25.3.tar.gz
+sha256  8d0538dbbd7babbd207f261ed969c65de439f6bc9e5dbd3b3b9a77f25d95f343  pip-25.3.tar.gz
 # Locally computed sha256 checksums
 sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 02d7da6fe9..95bdb64963 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 25.2
+PYTHON_PIP_VERSION = 25.3
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/20/16/650289cd3f43d5a2fadfd98c68bd1e1e7f2550a1a5326768cddfbcedb2c5
-PYTHON_PIP_SETUP_TYPE = setuptools
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/fe/6e/74a3f0179a4a73a53d66ce57fdb4de0080a8baa1de0063de206d6167acc2
+PYTHON_PIP_SETUP_TYPE = flit
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
 PYTHON_PIP_CPE_ID_VENDOR = pypa
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
