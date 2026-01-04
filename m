Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A927AC2A06C
	for <buildroot@archiver.kernel.org>; Sun,  4 Jan 2026 10:31:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3ADC660774;
	Sun,  4 Jan 2026 10:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kzG_kTY3WfB5; Sun,  4 Jan 2026 10:31:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 466CE607ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767522692;
	bh=xtUTKB9ZiV7Zefy93C2U0tFAc5kOYHWpviUPSorPXDw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=j9zUmWOyf7pPPsoUBdGBSN5mUvEpzBzsbB7JGOg+lySSVpc1uj2IgxMp9LorMxJy/
	 pMBvNx/QGP/9BghagSr3cmqFsKY7pK3Xb77eZiKN7JQIYtMlFkW/byNFvK3TGZ45vO
	 yYb4siuoAkz+6CdIxsfe1iF5CNqg1PkP4Lx0uuPZkUzg/4btH9fQZN+XmQNxxQPSu6
	 RRyRD5ES/rieaI8beC6mRzeUjsP0T4ATMKNwV3yFM5JoBA6BmTqkprh+H2+mTHzWtD
	 AnItTXPL5O6EnrvkEaOTwDGGnRnOEUtsqXsAGD9QAFYwYxXl/F5oxOU+tFTuMsKt3q
	 Uw/Vx6eWxGomQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 466CE607ED;
	Sun,  4 Jan 2026 10:31:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id E59C572C
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:31:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D81F84011C
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:31:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pOXlojVqy6KV for <buildroot@buildroot.org>;
 Sun,  4 Jan 2026 10:31:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE5464008E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id CE5464008E
 for <buildroot@buildroot.org>; Sun,  4 Jan 2026 10:31:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BAF6E88181; Sun,  4 Jan 2026 10:31:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 4 Jan 2026 11:21:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bfb545d502f19a86481c75f96b0233780da2a17c
X-Git-Newrev: 2dbe5b22f36a57d4a4c3aab5a2bbcf8b1f2ed350
X-Patchwork-Hint: ignore
Message-Id: <20260104103126.BAF6E88181@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-markdown-it-py: bump to
 version 4.0.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=2dbe5b22f36a57d4a4c3aab5a2bbcf8b1f2ed350
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-markdown-it-py/python-markdown-it-py.hash | 4 ++--
 package/python-markdown-it-py/python-markdown-it-py.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-markdown-it-py/python-markdown-it-py.hash b/package/python-markdown-it-py/python-markdown-it-py.hash
index bc28feea7d..c1c6881ee1 100644
--- a/package/python-markdown-it-py/python-markdown-it-py.hash
+++ b/package/python-markdown-it-py/python-markdown-it-py.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/markdown-it-py/json
-md5  a00d59ed2704f6590fdde0e9bad04c7c  markdown-it-py-3.0.0.tar.gz
-sha256  e3f60a94fa066dc52ec76661e37c851cb232d92f9886b15cb560aaada2df8feb  markdown-it-py-3.0.0.tar.gz
+md5  175fe39a7fbec21878606db1947bc9ea  markdown_it_py-4.0.0.tar.gz
+sha256  cb0a2b4aa34f932c007117b194e945bd74e0ec24133ceb5bac59009cda1cb9f3  markdown_it_py-4.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4a2260d6e2cd0f5a151a1e86dbfe7d3ed552b1e2beabf9941c1ba5c49cbce484  LICENSE
 sha256  792c48c5a849a15fdf9e37e8bcf9e6d1dd13b32b46c642a748a0a46a9919d473  LICENSE.markdown-it
diff --git a/package/python-markdown-it-py/python-markdown-it-py.mk b/package/python-markdown-it-py/python-markdown-it-py.mk
index aac0845185..0b2666cc03 100644
--- a/package/python-markdown-it-py/python-markdown-it-py.mk
+++ b/package/python-markdown-it-py/python-markdown-it-py.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN_IT_PY_VERSION = 3.0.0
-PYTHON_MARKDOWN_IT_PY_SOURCE = markdown-it-py-$(PYTHON_MARKDOWN_IT_PY_VERSION).tar.gz
-PYTHON_MARKDOWN_IT_PY_SITE = https://files.pythonhosted.org/packages/38/71/3b932df36c1a044d397a1f92d1cf91ee0a503d91e470cbd670aa66b07ed0
+PYTHON_MARKDOWN_IT_PY_VERSION = 4.0.0
+PYTHON_MARKDOWN_IT_PY_SOURCE = markdown_it_py-$(PYTHON_MARKDOWN_IT_PY_VERSION).tar.gz
+PYTHON_MARKDOWN_IT_PY_SITE = https://files.pythonhosted.org/packages/5b/f5/4ec618ed16cc4f8fb3b701563655a69816155e79e24a17b651541804721d
 PYTHON_MARKDOWN_IT_PY_SETUP_TYPE = flit
 PYTHON_MARKDOWN_IT_PY_LICENSE = MIT
 PYTHON_MARKDOWN_IT_PY_LICENSE_FILES = LICENSE LICENSE.markdown-it
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
