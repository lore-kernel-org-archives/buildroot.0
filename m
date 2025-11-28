Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E103D43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:56:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9D6F783CB4;
	Fri, 12 Dec 2025 07:56:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m8amkoi3gb44; Fri, 12 Dec 2025 07:56:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7ADC183B51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526205;
	bh=XGhU6egHbOiMm+HrZyPRp1kXM30X8YB79q4LSqksBV8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=RDUppn0n5FzYTeQ/yXC5ga0EDTd9BdiQbwVyzXZlFXoJvZy2b0aTZxreNtbcqOpO3
	 D+OGcoz2YEQJ+vLbbTBNJCCUFZzqt6RXJOoq+gZ3heWXtknA41BXctHeGsoeF+m1qE
	 OyIBp64wVtktdBYW04rl7+izcjnV6CHnkoPAvpodrca/gTNuucRW8gT0oguKQg/kcH
	 Umrvx91jhF9V0vfMzeH8t+qN0YXX/jeoc4LJ56j2qZmf9u2BWI30faIKKp+1M7CnmJ
	 J9URI6UHduXjCsbGxB5fQA7aE//2KByyZ55L+Z97BCkP4nV+RoBUlseHb2ypLbilgC
	 /aUgDipljae1A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7ADC183B51;
	Fri, 12 Dec 2025 07:56:45 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C323E2C1
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F01FD4113E
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X9y7xCcTig5A for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 509BB41131
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 509BB41131
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F21786C93; Fri, 12 Dec 2025 07:55:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 28 Nov 2025 19:32:40 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e37bde990acb7622f807222958bce1652694a0c4
X-Git-Newrev: f3e0c424c59e37478de47fe4b98f2f8fe373003d
X-Patchwork-Hint: ignore
Message-Id: <20251212075535.4F21786C93@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-dotenv: bump to 1.2.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=f3e0c424c59e37478de47fe4b98f2f8fe373003d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Changes:
* https://github.com/theskumar/python-dotenv/releases/tag/v1.2.0
* https://github.com/theskumar/python-dotenv/releases/tag/v1.2.1

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-dotenv/python-dotenv.hash | 4 ++--
 package/python-dotenv/python-dotenv.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-dotenv/python-dotenv.hash b/package/python-dotenv/python-dotenv.hash
index 5b4be41206..53ab12e11c 100644
--- a/package/python-dotenv/python-dotenv.hash
+++ b/package/python-dotenv/python-dotenv.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/python-dotenv/json
-md5  b3e9652d1974f8c7574c43f719799f3a  python_dotenv-1.1.1.tar.gz
-sha256  a8a6399716257f45be6a007360200409fce5cda2661e3dec71d23dc15f6189ab  python_dotenv-1.1.1.tar.gz
+md5  72b43685c14b492ced7ed6fb1e3f1d63  python_dotenv-1.2.1.tar.gz
+sha256  42667e897e16ab0d66954af0e60a9caa94f0fd4ecf3aaf6d2d260eec1aa36ad6  python_dotenv-1.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  80619b7049f08c81683ad0e01f08f257a840652dd71ee83146d36658c7d2c2b9  LICENSE
diff --git a/package/python-dotenv/python-dotenv.mk b/package/python-dotenv/python-dotenv.mk
index 8f11c5de8d..6ebc4f6c8c 100644
--- a/package/python-dotenv/python-dotenv.mk
+++ b/package/python-dotenv/python-dotenv.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOTENV_VERSION = 1.1.1
+PYTHON_DOTENV_VERSION = 1.2.1
 PYTHON_DOTENV_SOURCE = python_dotenv-$(PYTHON_DOTENV_VERSION).tar.gz
-PYTHON_DOTENV_SITE = https://files.pythonhosted.org/packages/f6/b0/4bc07ccd3572a2f9df7e6782f52b0c6c90dcbb803ac4a167702d7d0dfe1e
+PYTHON_DOTENV_SITE = https://files.pythonhosted.org/packages/f0/26/19cadc79a718c5edbec86fd4919a6b6d3f681039a2f6d66d14be94e75fb9
 PYTHON_DOTENV_SETUP_TYPE = setuptools
 PYTHON_DOTENV_LICENSE = BSD-3-Clause
 PYTHON_DOTENV_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
