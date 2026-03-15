Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 376B9F3028A
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 22:20:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D86C41712;
	Sun, 15 Mar 2026 22:20:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwRQv1JjPZsb; Sun, 15 Mar 2026 22:20:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C6504170B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773613205;
	bh=ReOpjd49+GGSDuquSygzlLxO40DW0fRH2wy3d3k04B4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GgOHEdGQ/kuMBhcnZAWY9BCyXKSf1qiyZlu2q0nXtLU4R05N4yUYm5QQeLkGKOeht
	 JfkEaJXPEehf6rfadGSPGBv35XfiFvXshVta1XLg6WQGeckpAd8WBoFnbtq0Op8U7U
	 gYAWlds3js+RTAihSO6dStTtxUo8uazDEwQNxtF3bi4C1/s/yJ/Tk0fngKVf9jNXdP
	 IvJXP5xbsNsAmhyhfYr/pv1PyRvSMF7s1cVhtEfnr1OpPi2a185/jojl4EXKUCkRkp
	 FUhbpTwPHpWg0RUnfkCnLWZ/noIlT28KF/QRaPOUkRNnH6OBH7V6qRjllFGj3GG6sT
	 mpv2Iwb+sibeA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C6504170B;
	Sun, 15 Mar 2026 22:20:05 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0E2131B2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10A40610A2
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Q_sWqZeG5DVN for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 22:18:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 17D8E6112E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 17D8E6112E
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 22:18:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 597BE82642; Sun, 15 Mar 2026 22:18:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 21:34:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6ebadc0d9486e8855dac9e2513d2ce894ed449a9
X-Git-Newrev: 351f4543cb5d9997bd66a1919ebd55e77cd7405e
X-Patchwork-Hint: ignore
Message-Id: <20260315221805.597BE82642@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-xmltodict: bump version to
 1.0.4
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/351f4543cb5d9997bd66a1919ebd55e77cd7405e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/martinblech/xmltodict/blob/v1.0.4/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-xmltodict/python-xmltodict.hash | 4 ++--
 package/python-xmltodict/python-xmltodict.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-xmltodict/python-xmltodict.hash b/package/python-xmltodict/python-xmltodict.hash
index a61b1aabf1..2abcaff9d6 100644
--- a/package/python-xmltodict/python-xmltodict.hash
+++ b/package/python-xmltodict/python-xmltodict.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/xmltodict/json
-md5  82d8cb5a934a057e6a8a3449b1d87cce  xmltodict-1.0.2.tar.gz
-sha256  54306780b7c2175a3967cad1db92f218207e5bc1aba697d887807c0fb68b7649  xmltodict-1.0.2.tar.gz
+md5  f0a83032fc31c918a8cd9e60cdb46cb1  xmltodict-1.0.4.tar.gz
+sha256  6d94c9f834dd9e44514162799d344d815a3a4faec913717a9ecbfa5be1bb8e61  xmltodict-1.0.4.tar.gz
 # Locally computed sha256 checksums
 sha256  d66d5eb8f83a0ba21d3dd04318b8817588e8764daabea852d1035e3f07ffda55  LICENSE
diff --git a/package/python-xmltodict/python-xmltodict.mk b/package/python-xmltodict/python-xmltodict.mk
index fe320dd799..583996459e 100644
--- a/package/python-xmltodict/python-xmltodict.mk
+++ b/package/python-xmltodict/python-xmltodict.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XMLTODICT_VERSION = 1.0.2
+PYTHON_XMLTODICT_VERSION = 1.0.4
 PYTHON_XMLTODICT_SOURCE = xmltodict-$(PYTHON_XMLTODICT_VERSION).tar.gz
-PYTHON_XMLTODICT_SITE = https://files.pythonhosted.org/packages/6a/aa/917ceeed4dbb80d2f04dbd0c784b7ee7bba8ae5a54837ef0e5e062cd3cfb
+PYTHON_XMLTODICT_SITE = https://files.pythonhosted.org/packages/19/70/80f3b7c10d2630aa66414bf23d210386700aa390547278c789afa994fd7e
 PYTHON_XMLTODICT_SETUP_TYPE = setuptools
 PYTHON_XMLTODICT_LICENSE = MIT
 PYTHON_XMLTODICT_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
