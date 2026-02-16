Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51540E7BDA5
	for <buildroot@archiver.kernel.org>; Mon, 16 Feb 2026 11:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5EC1D83896;
	Mon, 16 Feb 2026 11:48:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Wn0QyX9wIjFp; Mon, 16 Feb 2026 11:48:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6487183705
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771242510;
	bh=1ebElhhy+od4lGzpKUo5hqMRw3j27O2A5GU1B7bQxk8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=qWiLbOp6/xGUwV4r8epSGwjLmTOoG10I7mzohxtAbT14gCHjNvt22YlK75XBaT5kd
	 9GYaTpkbMNm++O21Q2CokGPMEo6IEgAGjqoK7r2EzNoJG7eVrKITtF4ieWRsu631kL
	 WEb4uUXTYIu8C3MKZUu5FWTmgFCKjO1Y5rmbigOJKkpX8uJSbJF646rsW2MaJJrSao
	 4GhnTel2OZaRLmBK87x2Y7A3dTxeOVUdLtNmVljQ8R5MWwuP9TmV9Y8J5Abjc8FRJu
	 3Q1HXxC/KHEHhSZ0fu8eW7iCiJA0Mter/XWQhg41q43B4hWen/7MxthcahtmQAFHm4
	 rX8B0rE5viINQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6487183705;
	Mon, 16 Feb 2026 11:48:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 84A431EB
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 11:48:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5EE4883438
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 11:48:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FQ3Td-P7XW7y for <buildroot@buildroot.org>;
 Mon, 16 Feb 2026 11:48:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3B161833CD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B161833CD
 for <buildroot@buildroot.org>; Mon, 16 Feb 2026 11:48:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1472386ED1; Mon, 16 Feb 2026 11:48:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 16 Feb 2026 11:49:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6f1842ad2dd696378505ea381a1885ea18200fe8
X-Git-Newrev: 4142783e10fbf7225088cb26494e99dab8dd542a
X-Patchwork-Hint: ignore
Message-Id: <20260216114823.1472386ED1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-rich: bump to version 14.3.2
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4142783e10fbf7225088cb26494e99dab8dd542a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changes:
https://github.com/Textualize/rich/releases/tag/v14.2.0
https://github.com/Textualize/rich/releases/tag/v14.3.0
https://github.com/Textualize/rich/releases/tag/v14.3.1
https://github.com/Textualize/rich/releases/tag/v14.3.2

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-rich/python-rich.hash | 4 ++--
 package/python-rich/python-rich.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-rich/python-rich.hash b/package/python-rich/python-rich.hash
index 87c58f42e3..a4939b3c10 100644
--- a/package/python-rich/python-rich.hash
+++ b/package/python-rich/python-rich.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/rich/json
-md5  38baf395e7860be314c6c29fcac8637d  rich-14.1.0.tar.gz
-sha256  e497a48b844b0320d45007cdebfeaeed8db2a4f4bcf49f15e455cfc4af11eaa8  rich-14.1.0.tar.gz
+md5  4eb0893c8103200d58ad1980de396d57  rich-14.3.2.tar.gz
+sha256  e712f11c1a562a11843306f5ed999475f09ac31ffb64281f73ab29ffdda8b3b8  rich-14.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  deed7c17a4318158190a3ea239cc879a5a50271cebb98ae7025f48fbe58dca15  LICENSE
diff --git a/package/python-rich/python-rich.mk b/package/python-rich/python-rich.mk
index e6564347a5..2dab5e574b 100644
--- a/package/python-rich/python-rich.mk
+++ b/package/python-rich/python-rich.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RICH_VERSION = 14.1.0
+PYTHON_RICH_VERSION = 14.3.2
 PYTHON_RICH_SOURCE = rich-$(PYTHON_RICH_VERSION).tar.gz
-PYTHON_RICH_SITE = https://files.pythonhosted.org/packages/fe/75/af448d8e52bf1d8fa6a9d089ca6c07ff4453d86c65c145d0a300bb073b9b
+PYTHON_RICH_SITE = https://files.pythonhosted.org/packages/74/99/a4cab2acbb884f80e558b0771e97e21e939c5dfb460f488d19df485e8298
 PYTHON_RICH_SETUP_TYPE = poetry
 PYTHON_RICH_LICENSE = MIT
 PYTHON_RICH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
