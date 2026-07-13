Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 359A6C43458
	for <buildroot@archiver.kernel.org>; Mon, 13 Jul 2026 15:17:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEC7440902;
	Mon, 13 Jul 2026 15:17:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0dr3pklhANt2; Mon, 13 Jul 2026 15:17:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8E1934080A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783955825;
	bh=QDYh+otyTqp4DFBLINKxkS07PWNB7wYhAYnr2UsPkbc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Qw4qkYFb760UaO5uonlcwfwbV2WubzrjNNcjZx9yde11K5L06Xxx7L97tnFdQ/KC0
	 Xk5/+1JUHKo5NsJ8xjLL7VbD2Bn94c5vGelUSV7eWcCYSOCor+uto230bbAZMKQdve
	 h7fwbQ+nGdjZErQ5aZvJX2S38eHdwKPS5aUuY7qDS6SUvSM1W/4U9/P0GBaCQ5o4Nv
	 IboB8lsuziB+F0tb/zC4Y3RJ3p69vhFA6DpDuSjIKAuqWDCqYpj421Bur6NtyvgZpD
	 5pmL98ImY8XpfIqfMkryJUilfFCpqkLJbfUdkJpK2s4Koi3l+pFSI2h6xuzmBwqYAC
	 ebkmGy7jRbtJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E1934080A;
	Mon, 13 Jul 2026 15:17:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AADDE128
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 15:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 96FA04080A
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 15:17:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g2QqGMxY82Ec for <buildroot@buildroot.org>;
 Mon, 13 Jul 2026 15:17:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E691040786
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E691040786
 for <buildroot@buildroot.org>; Mon, 13 Jul 2026 15:17:03 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97266887D6; Mon, 13 Jul 2026 15:16:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 13 Jul 2026 17:05:07 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 08c39b39852de9612e0ae9b7d4c5a8cfc6aa461a
X-Git-Newrev: c90e5e3383a4593996e1b688a0b540c3d1956898
X-Patchwork-Hint: ignore
Message-Id: <20260713151629.97266887D6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-click: bump to version 8.4.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c90e5e3383a4593996e1b688a0b540c3d1956898
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

See the release notes here (also including versions 8.4.0 and 8.4.1):
https://click.palletsprojects.com/en/stable/changes/

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-click/python-click.hash | 4 ++--
 package/python-click/python-click.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-click/python-click.hash b/package/python-click/python-click.hash
index f203312073..81fcefa4a9 100644
--- a/package/python-click/python-click.hash
+++ b/package/python-click/python-click.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/click/json
-md5  7ac811bcb2bdd53ae85afe7e7f9224c2  click-8.3.3.tar.gz
-sha256  398329ad4837b2ff7cbe1dd166a4c0f8900c3ca3a218de04466f38f6497f18a2  click-8.3.3.tar.gz
+md5  e35da284dc6420c59c1885ccb22d9879  click-8.4.2.tar.gz
+sha256  9a6cea6e60b17ebe0a44c5cc636d94f09bd66142c1cd7d8b4cd731c4917a15f6  click-8.4.2.tar.gz
 # Locally computed sha256 checksums
 sha256  9a8ad106a394e853bfe21f42f4e72d592819a22805d991b5f3275029292b658d  LICENSE.txt
diff --git a/package/python-click/python-click.mk b/package/python-click/python-click.mk
index 6f63a4df8f..88fc66bc6c 100644
--- a/package/python-click/python-click.mk
+++ b/package/python-click/python-click.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CLICK_VERSION = 8.3.3
+PYTHON_CLICK_VERSION = 8.4.2
 PYTHON_CLICK_SOURCE = click-$(PYTHON_CLICK_VERSION).tar.gz
-PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/bb/63/f9e1ea081ce35720d8b92acde70daaedace594dc93b693c869e0d5910718
+PYTHON_CLICK_SITE = https://files.pythonhosted.org/packages/76/d4/81420972a676e8ffea40450d8c8c92943e7218a78fe9b64359836cc9876b
 PYTHON_CLICK_SETUP_TYPE = flit
 PYTHON_CLICK_LICENSE = BSD-3-Clause
 PYTHON_CLICK_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
