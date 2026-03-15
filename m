Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEF72F3028A
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8BE0F6127A;
	Sun, 15 Mar 2026 22:18:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zAWTcJMa0yo8; Sun, 15 Mar 2026 22:18:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6BFC61290
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613118;
	bh=LloxiNfsGbUJFYvGPpje7UfNE0kcBMxY7m5qIaBdol0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=muuChhpoOB9g8aGvH+lsd1bcK3fUn1mVJ0ues1ncBkGbYNpL6dYUHMm3DCIRrz1tn
	 Yi0MXo0U+0zdjwgrUkVGRE/5Iu11QQYlbBOwVu6PK9lK85BsuWr6vrWuUdn8SymAbj
	 CAMBx7de47RoQRqF/KnUFWDFT4uVN4k71hAwM/pb/RGV7TcZcY52q3+rznIM0WWn/q
	 nYCX6L93G1PtBuuLUxslYGycytrupRyYnhLuYdCpk1lfVM82HQ8Hslh/X0my6knZcm
	 5PJ7aDHmG0VZn7ddo50ghmvkp1zRq7wx7aY4kYF+324DIQoHmt5GalgL7xdVl5FJa3
	 /IrVjlHSuT3pA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A6BFC61290;
	Sun, 15 Mar 2026 22:18:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 15F82357
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE366409FD
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VUI0_grgZvSZ for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86316409DF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86316409DF
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C8AE485C3A; Sun, 15 Mar 2026 22:18:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:33:04 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0b33ca109cca138b330498df3b12caf32819d9f5
X-Git-Newrev: de96f9aefed303b1af822d17c964b537d77b511d
X-Patchwork-Hint: ignore
Message-Id: <20260315221801.C8AE485C3A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-httplib2: bump version to
 0.31.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/de96f9aefed303b1af822d17c964b537d77b511d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/httplib2/httplib2/blob/v0.31.2/CHANGELOG

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-httplib2/python-httplib2.hash | 4 ++--
 package/python-httplib2/python-httplib2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httplib2/python-httplib2.hash b/package/python-httplib2/python-httplib2.hash
index 5d18967a6d..ffcf5cbd63 100644
--- a/package/python-httplib2/python-httplib2.hash
+++ b/package/python-httplib2/python-httplib2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httplib2/json
-md5  b413de41724354a543f3cd33c0e75361  httplib2-0.31.0.tar.gz
-sha256  ac7ab497c50975147d4f7b1ade44becc7df2f8954d42b38b3d69c515f531135c  httplib2-0.31.0.tar.gz
+md5  957581afb1aa862ea8efbca88e13bd45  httplib2-0.31.2.tar.gz
+sha256  385e0869d7397484f4eab426197a4c020b606edd43372492337c0b4010ae5d24  httplib2-0.31.2.tar.gz
 # Locally computed sha256 checksums
 sha256  589eec38f72df2be203711d3b8cbece9b908c5e7ff00bc3cab7f63bae9e366b4  LICENSE
diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
index 5609a25a54..ea5b8e0008 100644
--- a/package/python-httplib2/python-httplib2.mk
+++ b/package/python-httplib2/python-httplib2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPLIB2_VERSION = 0.31.0
+PYTHON_HTTPLIB2_VERSION = 0.31.2
 PYTHON_HTTPLIB2_SOURCE = httplib2-$(PYTHON_HTTPLIB2_VERSION).tar.gz
-PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/52/77/6653db69c1f7ecfe5e3f9726fdadc981794656fcd7d98c4209fecfea9993
+PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/c1/1f/e86365613582c027dda5ddb64e1010e57a3d53e99ab8a72093fa13d565ec
 PYTHON_HTTPLIB2_SETUP_TYPE = setuptools
 PYTHON_HTTPLIB2_LICENSE = MIT
 PYTHON_HTTPLIB2_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
