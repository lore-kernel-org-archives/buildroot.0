Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 460C9D5B16E
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 21:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1CEF8406D7;
	Sun, 14 Dec 2025 21:21:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N_iBWmGf3quM; Sun, 14 Dec 2025 21:21:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43CBB406CE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765747312;
	bh=ZDOcFEkwsobz1KsKGJafOfmP42rue9iExI7CdNZIiFA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=r5I10RjDwk7h7xea3UaN2ibeIj5E3kTKkiuOdew790CXHw32oxnB7v9f+wU5dMoD3
	 ZUaQhnrWhaSdplnAmdzt9erFhqpTeZN1VeW8zXFE64wI5L32DSPSIgVZSKqjhdgAfD
	 6cq8xAzU/3dEvNl+GTbIH+tg3GPF9b0vsHvhiHYGdHcch1DNYqAJee8Kq59Cz/+1L/
	 skA7sPtkIPDfbdomvjB4ZTP2g0G/gkHcZZaxMntRA6lHAmrmS0Vq4x7yel0UOoEZpq
	 F8UkhQnpqgONipy2sTRuGIWGq/cqOMb9xXnCkv5DNcuUxbHcLnj2EGNrB4g4rOLQhN
	 wFK72mY2SgC1w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43CBB406CE;
	Sun, 14 Dec 2025 21:21:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2DA8D2D0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC01640643
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4z-yzMzMqF4Y for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 21:21:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D9D8F40644
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D9D8F40644
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D55ED86EC9; Sun, 14 Dec 2025 21:21:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 22:20:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 17b4876f9bd36e6bb4a0ffadb5e7ea12756627ad
X-Git-Newrev: dc2321bb50076f585b7a9a0f1858c381d13a2051
X-Patchwork-Hint: ignore
Message-Id: <20251214212139.D55ED86EC9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-docutils: bump version to
 0.22.3
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

commit: https://git.buildroot.net/buildroot/commit/?id=dc2321bb50076f585b7a9a0f1858c381d13a2051
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://docutils.sourceforge.io/RELEASE-NOTES.html#release-0-22-3-2025-11-06

The license file was update:
- Renamed from COPYING.txt to COPYING.rst in:
  https://sourceforge.net/p/docutils/code/9906/
- The ZPL was removed in:
  https://sourceforge.net/p/docutils/code/9977/

This commit updates _LICENSE and _LICENSE_FILES accordingly.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: fix license hash]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-docutils/python-docutils.hash | 6 +++---
 package/python-docutils/python-docutils.mk   | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-docutils/python-docutils.hash b/package/python-docutils/python-docutils.hash
index f79d418efa..b435135f15 100644
--- a/package/python-docutils/python-docutils.hash
+++ b/package/python-docutils/python-docutils.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/docutils/json
-md5  c4064e1e0e3cd142951fd2b95b830874  docutils-0.21.2.tar.gz
-sha256  3a6b18732edf182daa3cd12775bbb338cf5691468f91eeeb109deff6ebfa986f  docutils-0.21.2.tar.gz
+md5  98a6168e7f4719c9fd90184e88157656  docutils-0.22.3.tar.gz
+sha256  21486ae730e4ca9f622677b1412b879af1791efcfba517e4c6f60be543fc8cdd  docutils-0.22.3.tar.gz
 # Locally computed sha256 checksums
-sha256  534edf7641abde69fc500f228c09751812c0589815eef0c082bc6ba317d646ac  COPYING.txt
+sha256  6ab4f27c76c74f96e5e692da5944a6f82968f3bddaac5660a4aa723e70eb5d8f  COPYING.rst
diff --git a/package/python-docutils/python-docutils.mk b/package/python-docutils/python-docutils.mk
index 1f1e043c15..20773fae91 100644
--- a/package/python-docutils/python-docutils.mk
+++ b/package/python-docutils/python-docutils.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_DOCUTILS_VERSION = 0.21.2
+PYTHON_DOCUTILS_VERSION = 0.22.3
 PYTHON_DOCUTILS_SOURCE = docutils-$(PYTHON_DOCUTILS_VERSION).tar.gz
-PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/ae/ed/aefcc8cd0ba62a0560c3c18c33925362d46c6075480bfa4df87b28e169a9
-PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2-Clause, BSD-3-Clause, ZPL-2.1, GPL-3.0+ (emacs mode)
-PYTHON_DOCUTILS_LICENSE_FILES = COPYING.txt
+PYTHON_DOCUTILS_SITE = https://files.pythonhosted.org/packages/d9/02/111134bfeb6e6c7ac4c74594e39a59f6c0195dc4846afbeac3cba60f1927
+PYTHON_DOCUTILS_LICENSE = Public Domain, BSD-2-Clause, BSD-3-Clause, GPL-3.0+ (emacs mode)
+PYTHON_DOCUTILS_LICENSE_FILES = COPYING.rst
 PYTHON_DOCUTILS_SETUP_TYPE = flit
 
 $(eval $(python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
