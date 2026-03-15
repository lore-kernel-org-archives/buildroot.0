Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB59F3027F
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 135856147E;
	Sun, 15 Mar 2026 22:19:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JfPZ0fvW1jTO; Sun, 15 Mar 2026 22:19:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D3A2061453
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613189;
	bh=VNcTeFHFPDnAstJ5cl361uL+OPUlf9a/owpBZckorws=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EANdlJEvqYPgWomzuk452+v74GOcf0d/ovgMTJqR2iB9NkzsQAIxwwK4MdRxBvpn6
	 5UZdINdJeRjCpUZhKg/nOBaSTvuRvoN2l2ZZmaeDLG7vVwRUxH84UUs+EH5TKBp3Wv
	 KaRQiiDGIBzDuTenoAtUrRepXZpvQObYEc9lgUmdSDUAprWZtZb6NtpRXnhd9lZnpA
	 3n6d/DE0glFZ2VzxXceJ5THcJAwXvWRmIu6f4zF72/iTYnMesuglvo6n3JtAc1xaZs
	 70uZF0W7AzOCF+I0VAND8OrWkmr4qGYyNfV2Opu4KRq4o108UiMeY2AGmHO4QLJmWb
	 CjtmTNvCG1MDA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D3A2061453;
	Sun, 15 Mar 2026 22:19:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 062CF1B2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DF9D040B22
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MDRtq2zS2qS6 for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23F0740B24
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23F0740B24
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 65FB08226F; Sun, 15 Mar 2026 22:18:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 351f4543cb5d9997bd66a1919ebd55e77cd7405e
X-Git-Newrev: 48c3146af2a16480929e81f6e5250ed53c5e971b
X-Patchwork-Hint: ignore
Message-Id: <20260315221805.65FB08226F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-yamllint: bump version to
 1.38.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/48c3146af2a16480929e81f6e5250ed53c5e971b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/adrienverge/yamllint/blob/v1.38.0/CHANGELOG.rst

Tarball hashes were computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-yamllint/python-yamllint.hash | 4 +++-
 package/python-yamllint/python-yamllint.mk   | 4 ++--
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/python-yamllint/python-yamllint.hash b/package/python-yamllint/python-yamllint.hash
index 3287d4f2b2..d087e4906d 100644
--- a/package/python-yamllint/python-yamllint.hash
+++ b/package/python-yamllint/python-yamllint.hash
@@ -1,3 +1,5 @@
+# md5, sha256 from https://pypi.org/pypi/yamllint/json
+md5  dff4ef2d07d5b185c9d74256b42e9122  yamllint-1.38.0.tar.gz
+sha256  09e5f29531daab93366bb061e76019d5e91691ef0a40328f04c927387d1d364d  yamllint-1.38.0.tar.gz
 # Locally computed sha256 checksums
-sha256  81f7c0c5559becc8049470d86046b36e96113637bcbe4753ecef06977c00245d  yamllint-1.37.1.tar.gz
 sha256  3972dc9744f6499f0f9b2dbf76696f2ae7ad8af9b23dde66d6af86c9dfb36986  LICENSE
diff --git a/package/python-yamllint/python-yamllint.mk b/package/python-yamllint/python-yamllint.mk
index 835ee2ffb2..9b79d1766f 100644
--- a/package/python-yamllint/python-yamllint.mk
+++ b/package/python-yamllint/python-yamllint.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_YAMLLINT_VERSION = 1.37.1
+PYTHON_YAMLLINT_VERSION = 1.38.0
 PYTHON_YAMLLINT_SOURCE = yamllint-$(PYTHON_YAMLLINT_VERSION).tar.gz
-PYTHON_YAMLLINT_SITE = https://files.pythonhosted.org/packages/46/f2/cd8b7584a48ee83f0bc94f8a32fea38734cefcdc6f7324c4d3bfc699457b
+PYTHON_YAMLLINT_SITE = https://files.pythonhosted.org/packages/28/a0/8fc2d68e132cf918f18273fdc8a1b8432b60d75ac12fdae4b0ef5c9d2e8d
 PYTHON_YAMLLINT_SETUP_TYPE = setuptools
 PYTHON_YAMLLINT_LICENSE = GPL-3.0
 PYTHON_YAMLLINT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
