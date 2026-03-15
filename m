Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A057F3028C
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3AB54161C;
	Sun, 15 Mar 2026 22:19:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4BgtCONI7_Sn; Sun, 15 Mar 2026 22:19:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04C61414C0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613181;
	bh=eav3Y1bEUo8EfU5CHVvNBhIF5CKEN2ZSFZrQ4EAZONk=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RyhEkcwNfxByc8dNPialp2FiKrgpcnRhQQhpyp/lpRzad0LGN6wpD+SCDgkJU+g6Y
	 QXiLt7XpVYBC5R/SX1yf1pU4tLlKlYCT+Bhb4V+pgm4Un39P6U0oNQU0z1O0OMU8nV
	 E2Hf0yrv/ym7h1kx3/s7S/guykYooziyUxN1NAVXZpmMovNa/IuH4sWBJqbWWdvSWT
	 ywK459dB4ntIRpwGQs6ynXB4vnJVJ8vCHs9xyxrOnGq9oVB1RzmWRsXumU7HULpWpp
	 4c7px3qmF5T13/GNNmrPwwBnriC0Fc8jnOOkDXDrCCyk5hHmCR4zpK0s16hAjakTfs
	 5DLGVPK9BfQ5A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04C61414C0;
	Sun, 15 Mar 2026 22:19:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0446B357
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5DAEA40AF1
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UbOdc5sKptll for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 446A74095B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 446A74095B
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85F5285BFF; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 256359467cc43999cb47a7ffbdb3db573d581e46
X-Git-Newrev: 4326be19baf1b9fd997ee3a0bd4d4d66c04c1215
X-Patchwork-Hint: ignore
Message-Id: <20260315221802.85F5285BFF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pip: bump version to 26.0.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4326be19baf1b9fd997ee3a0bd4d4d66c04c1215
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/pypa/pip/blob/26.0.1/NEWS.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-pip/python-pip.hash | 4 ++--
 package/python-pip/python-pip.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pip/python-pip.hash b/package/python-pip/python-pip.hash
index 24d731d9e8..39a15696c3 100644
--- a/package/python-pip/python-pip.hash
+++ b/package/python-pip/python-pip.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pip/json
-md5  31f52f428372020b80cd7518862fbbee  pip-25.3.tar.gz
-sha256  8d0538dbbd7babbd207f261ed969c65de439f6bc9e5dbd3b3b9a77f25d95f343  pip-25.3.tar.gz
+md5  566bd094e3a0c382ba2705349c83d55e  pip-26.0.1.tar.gz
+sha256  c4037d8a277c89b320abe636d59f91e6d0922d08a05b60e85e53b296613346d8  pip-26.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  634300a669d49aeae65b12c6c48c924c51a4cdf3d1ff086dc3456dc8bcaa2104  LICENSE.txt
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index 95bdb64963..aa02a216d6 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PIP_VERSION = 25.3
+PYTHON_PIP_VERSION = 26.0.1
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/fe/6e/74a3f0179a4a73a53d66ce57fdb4de0080a8baa1de0063de206d6167acc2
+PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/48/83/0d7d4e9efe3344b8e2fe25d93be44f64b65364d3c8d7bc6dc90198d5422e
 PYTHON_PIP_SETUP_TYPE = flit
 PYTHON_PIP_LICENSE = MIT
 PYTHON_PIP_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
