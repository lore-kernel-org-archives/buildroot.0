Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FEA3D66BBB
	for <buildroot@archiver.kernel.org>; Wed, 17 Dec 2025 21:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E18A76116C;
	Wed, 17 Dec 2025 21:45:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 76GPYOt9WbqJ; Wed, 17 Dec 2025 21:45:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ABE74611D5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766007923;
	bh=U3i+GB2ADJlvf3HmNHNbmuz5eiKj0FUw6fDu2CvYQLs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mdDXJ0iOiUu4mHW4o8ZHA97QbM1k0F/lBZNEq4aMPp06wHt5SysaNJPbQwrpo38Ru
	 0TH5TjUT3Lu1n5H848kQv98hR2WqUrw+EQ1WELZ9gQnRsTJ3XK5ksKcG1/yB/4uZkk
	 Udb5w6fuwaMatfL3JtYhAbHmyyCR+smpV30q0AUe/NF9JkPpc4oSkQQsZEr5TuERJk
	 EcX3zAucwo7BbB8RdWJdwpODJaSxhCFoSjBX0WNZ00utWsFYGE1PuF3YPXtx/o1ZZR
	 Tf5WiCaZYK6PCn/Jd/UTOuuGgNfBD5m+hFsSMvT+kqHJwQmy7J493Pe+lTy0TwltHf
	 hTHvZpBHqVkyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id ABE74611D5;
	Wed, 17 Dec 2025 21:45:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 01B29361
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7EC5440F89
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XgMhyrt5Ev1P for <buildroot@buildroot.org>;
 Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87A2D40F84
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 87A2D40F84
 for <buildroot@buildroot.org>; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85BF38120D; Wed, 17 Dec 2025 21:44:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 17 Dec 2025 22:08:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 027a8d3d398487523fc453a16b6c30b9dbfbeca8
X-Git-Newrev: 06e60c15de5195c6bfc6e166979d4d7efaa6325f
X-Patchwork-Hint: ignore
Message-Id: <20251217214458.85BF38120D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-webargs: bump version to
 8.7.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=06e60c15de5195c6bfc6e166979d4d7efaa6325f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/marshmallow-code/webargs/blob/8.7.1/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-webargs/python-webargs.hash | 4 ++--
 package/python-webargs/python-webargs.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-webargs/python-webargs.hash b/package/python-webargs/python-webargs.hash
index 3416a441dd..a774781ea3 100644
--- a/package/python-webargs/python-webargs.hash
+++ b/package/python-webargs/python-webargs.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/webargs/json
-md5  bb65a1f2964f24f77650b8a14ddfbdb1  webargs-8.6.0.tar.gz
-sha256  b8d098ab92bd74c659eca705afa31d681475f218cb15c1e57271fa2103c0547a  webargs-8.6.0.tar.gz
+md5  2c62d994f03da6ff81454c186bdbc808  webargs-8.7.1.tar.gz
+sha256  799bf9039c76c23fd8dc1951107a75a9e561203c15d6ae8f89c1e46e234636c1  webargs-8.7.1.tar.gz
 # Locally computed sha256 checksums
 sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
diff --git a/package/python-webargs/python-webargs.mk b/package/python-webargs/python-webargs.mk
index 9edca07a15..f77eedcd21 100644
--- a/package/python-webargs/python-webargs.mk
+++ b/package/python-webargs/python-webargs.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBARGS_VERSION = 8.6.0
+PYTHON_WEBARGS_VERSION = 8.7.1
 PYTHON_WEBARGS_SOURCE = webargs-$(PYTHON_WEBARGS_VERSION).tar.gz
-PYTHON_WEBARGS_SITE = https://files.pythonhosted.org/packages/8c/51/e9ee5d8315864adf65e92f858f826514538e30db542d4782dd94c2418464
+PYTHON_WEBARGS_SITE = https://files.pythonhosted.org/packages/37/64/17afc4e6f47eef154a553c6e56adcc9f1ac3003305c7df978d11aa62937e
 PYTHON_WEBARGS_SETUP_TYPE = flit
 PYTHON_WEBARGS_LICENSE = MIT
 PYTHON_WEBARGS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
