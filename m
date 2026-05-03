Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA05BCD3426
	for <buildroot@archiver.kernel.org>; Sun,  3 May 2026 14:51:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7DE3B61546;
	Sun,  3 May 2026 14:51:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sj0c0bMrzfDF; Sun,  3 May 2026 14:51:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4488061531
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777819878;
	bh=LaRGZ3jC0qhp3asBr9kgqZDC+vzxdK4vfn8mT9LyrbI=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=BWHDFknP+UhvypTP2znqTRIB3zv9U8IwXz0UWT89ro34pI81nwXKDGRwijcBwQia2
	 7v5AmtfDA/dX1qQBY02fbpwqEsQ5cgu/NEvfcEfnZoGxEAWO84E+u5WfYB23L64A59
	 W0NZ1OHxOLEtvu3esv1HKeMJBfdRnt/1/sKkq/jEFgPUNHJ7QT6AEWTUmAStobW2Yh
	 aXVpxd5uJd+zzH3ttXLUvAIofRkwPgv++W5fRYS89wYKLaD1oVgMctaxTMVnxA5N84
	 BnpTez+V6sTleWkw0ilsxLgt4QI1a3pzyLLEATqCD/NHdL0QfZglqlpv8YZ5xkA4oh
	 7kvTdDrR5B/4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4488061531;
	Sun,  3 May 2026 14:51:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D42C8392
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAEF140C85
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8CtrPIg8lOk7 for <buildroot@buildroot.org>;
 Sun,  3 May 2026 14:50:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1CC6B40BFA
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1CC6B40BFA
 for <buildroot@buildroot.org>; Sun,  3 May 2026 14:50:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CE4A483FC0; Sun,  3 May 2026 14:50:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 3 May 2026 16:48:24 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb26e15fe7fcc04bf4404f23481023e3a24c4cb7
X-Git-Newrev: 1158746eaf35fce6e9560cc8331f82b772e5fdb4
X-Patchwork-Hint: ignore
Message-Id: <20260503145043.CE4A483FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-regex: bump version to
 2026.4.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1158746eaf35fce6e9560cc8331f82b772e5fdb4
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/mrabarnett/mrab-regex/blob/2026.4.4/changelog.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-regex/python-regex.hash | 4 ++--
 package/python-regex/python-regex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-regex/python-regex.hash b/package/python-regex/python-regex.hash
index 3251993d45..c99fc9dd62 100644
--- a/package/python-regex/python-regex.hash
+++ b/package/python-regex/python-regex.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/regex/json
-md5  d0ce2a36afe1d6fe7b6e188963db1b22  regex-2026.2.28.tar.gz
-sha256  a729e47d418ea11d03469f321aaf67cdee8954cde3ff2cf8403ab87951ad10f2  regex-2026.2.28.tar.gz
+md5  b9f15f11cde393d1959851ee9775fcda  regex-2026.4.4.tar.gz
+sha256  e08270659717f6973523ce3afbafa53515c4dc5dcad637dc215b6fd50f689423  regex-2026.4.4.tar.gz
 # Locally computed sha256 checksums
 sha256  bff55ef4cdcc8c14ce259f8e8ab60e264418440d6335f4dc138273fbd506144d  LICENSE.txt
diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
index 281a0e83a1..44c12789bf 100644
--- a/package/python-regex/python-regex.mk
+++ b/package/python-regex/python-regex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REGEX_VERSION = 2026.2.28
+PYTHON_REGEX_VERSION = 2026.4.4
 PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
-PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/8b/71/41455aa99a5a5ac1eaf311f5d8efd9ce6433c03ac1e0962de163350d0d97
+PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/cb/0e/3a246dbf05666918bd3664d9d787f84a9108f6f43cc953a077e4a7dfdb7e
 PYTHON_REGEX_SETUP_TYPE = setuptools
 PYTHON_REGEX_LICENSE = Apache-2.0
 PYTHON_REGEX_LICENSE_FILES = LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
