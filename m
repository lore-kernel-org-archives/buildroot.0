Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B99F506DA
	for <buildroot@archiver.kernel.org>; Mon, 16 Mar 2026 22:29:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3B46E83A8B;
	Mon, 16 Mar 2026 22:29:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sd5d2OuJiaXJ; Mon, 16 Mar 2026 22:29:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 077E283A73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773700162;
	bh=SxwSWf9bTFNqDmlv2aCaYoDjB+NxKTC0TnaMwYbV72s=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=M8qu4kCj5KABA71cMqpALB9ft9aYD+UmXkYCDU6U/Dtr7TyBeSX7UPs2DVy4Skb34
	 RPEyytJvlXLxBfv3MdKiyLPOe1BfKj43/GbZG6/OTd+8s9YM5v2jU6OTj4qooYfycG
	 YcwAMbuM+BDHjreWbCWj3gvobWWg60ipG6FImgxSnhP1+Sbcv3zwmTwc8IWaz21wjV
	 pI/N5PMTAI4WI9U89ZdYuS2l15+21YjK9qM3O5j2XWfrE6jIA20QhRu+H+CntGi+Xu
	 g7Gs1N50jrMZJtFicOrSUfhKndz04aSX6QAQIAK8OeQi51+9YV9u4THG59db/c1p86
	 q6p4xykVqH9IQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 077E283A73;
	Mon, 16 Mar 2026 22:29:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 75106D3
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 22:29:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 66A0D409B9
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 22:29:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3nqw13-5rz1L for <buildroot@buildroot.org>;
 Mon, 16 Mar 2026 22:29:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BA8D40087
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BA8D40087
 for <buildroot@buildroot.org>; Mon, 16 Mar 2026 22:29:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C2CCD8739A; Mon, 16 Mar 2026 22:29:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 16 Mar 2026 23:28:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e190962f3e7d27e6831e3c2e5e81d66fb4e55b40
X-Git-Newrev: 09bc5515fc6ef50c9071bc113225e9756b03ce5e
X-Patchwork-Hint: ignore
Message-Id: <20260316222919.C2CCD8739A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-rich: bump to version 14.3.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/09bc5515fc6ef50c9071bc113225e9756b03ce5e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://github.com/Textualize/rich/releases/tag/v14.3.3

Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>
Reviewed-by: Fiona Klute <fiona.klute@gmx.de>
[Julien: add link to release notes]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-rich/python-rich.hash | 4 ++--
 package/python-rich/python-rich.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-rich/python-rich.hash b/package/python-rich/python-rich.hash
index a4939b3c10..21fab25498 100644
--- a/package/python-rich/python-rich.hash
+++ b/package/python-rich/python-rich.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/rich/json
-md5  4eb0893c8103200d58ad1980de396d57  rich-14.3.2.tar.gz
-sha256  e712f11c1a562a11843306f5ed999475f09ac31ffb64281f73ab29ffdda8b3b8  rich-14.3.2.tar.gz
+md5  0d1b254b0743669f2112332a08081809  rich-14.3.3.tar.gz
+sha256  b8daa0b9e4eef54dd8cf7c86c03713f53241884e814f4e2f5fb342fe520f639b  rich-14.3.3.tar.gz
 # Locally computed sha256 checksums
 sha256  deed7c17a4318158190a3ea239cc879a5a50271cebb98ae7025f48fbe58dca15  LICENSE
diff --git a/package/python-rich/python-rich.mk b/package/python-rich/python-rich.mk
index 2dab5e574b..aabc3ea442 100644
--- a/package/python-rich/python-rich.mk
+++ b/package/python-rich/python-rich.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_RICH_VERSION = 14.3.2
+PYTHON_RICH_VERSION = 14.3.3
 PYTHON_RICH_SOURCE = rich-$(PYTHON_RICH_VERSION).tar.gz
-PYTHON_RICH_SITE = https://files.pythonhosted.org/packages/74/99/a4cab2acbb884f80e558b0771e97e21e939c5dfb460f488d19df485e8298
+PYTHON_RICH_SITE = https://files.pythonhosted.org/packages/b3/c6/f3b320c27991c46f43ee9d856302c70dc2d0fb2dba4842ff739d5f46b393
 PYTHON_RICH_SETUP_TYPE = poetry
 PYTHON_RICH_LICENSE = MIT
 PYTHON_RICH_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
