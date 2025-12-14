Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC707D5B16C
	for <buildroot@archiver.kernel.org>; Sun, 14 Dec 2025 21:22:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B46C440768;
	Sun, 14 Dec 2025 21:22:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LORPf-6asXll; Sun, 14 Dec 2025 21:22:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C672E40778
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765747326;
	bh=0FWYKNJzEPHqlplU068jsghSbIKaJ75ZpbCm0I1duC4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=N0ghf/Q+iSArfojOpZxmCTXy2bBp74Ebfo+ncjjnVZFXcNoFJvJPQogA4PGj/FG4p
	 Bop3fX8DiyYkfnLCfqHWlnp/t0167nkF7P14b/QsAdX5cToddAFsz2pevAd7UR0LnU
	 VqsNDYDa9oqAZW9AMBdXHBC4Nh+TUFKs7hfZI6yxMdKamuOKpSlBJZH3gz/hncI7PA
	 HAQOvl0gSKJh/vYBnXuaiULP8vFLoeQbN9vkv67YYOyLpzPqjbk/WqS7BmAkOEsL0b
	 Es7629+WBHvOTzsqGat/1VVql1QOchxu/e7WWiAQyireGu4SsGdMiRQj8qSLimCEVC
	 UvltX/lCk5b6A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C672E40778;
	Sun, 14 Dec 2025 21:22:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1498E2D0
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 047C14065D
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oxLUTUX6voTw for <buildroot@buildroot.org>;
 Sun, 14 Dec 2025 21:21:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 569664066E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 569664066E
 for <buildroot@buildroot.org>; Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 53C548355B; Sun, 14 Dec 2025 21:21:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 14 Dec 2025 22:20:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 587256fdb7a2710c62eec3158e3d79a0853d6961
X-Git-Newrev: 5ebf7e537998f8a1f44f3d373661cb0da83ea2a4
X-Patchwork-Hint: ignore
Message-Id: <20251214212140.53C548355B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-gast: bump version to 0.7.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ebf7e537998f8a1f44f3d373661cb0da83ea2a4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://github.com/serge-sans-paille/gast/compare/0.6.0...0.7.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-gast/python-gast.hash | 4 ++--
 package/python-gast/python-gast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gast/python-gast.hash b/package/python-gast/python-gast.hash
index 4071a07919..11f38c6824 100644
--- a/package/python-gast/python-gast.hash
+++ b/package/python-gast/python-gast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gast/json
-md5  4a088eca6fd6bae16bc2fd2ff828de51  gast-0.6.0.tar.gz
-sha256  88fc5300d32c7ac6ca7b515310862f71e6fdf2c029bbec7c66c0f5dd47b6b1fb  gast-0.6.0.tar.gz
+md5  786783d275172090375b8202c1fbf309  gast-0.7.0.tar.gz
+sha256  0bb14cd1b806722e91ddbab6fb86bba148c22b40e7ff11e248974e04c8adfdae  gast-0.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6a04bbabd9b48bea6bf7c0bd3f3a062e1476b3c403a746448fd69b0d902e148f  LICENSE
diff --git a/package/python-gast/python-gast.mk b/package/python-gast/python-gast.mk
index 771d7a4be4..e40e5a7f05 100644
--- a/package/python-gast/python-gast.mk
+++ b/package/python-gast/python-gast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GAST_VERSION = 0.6.0
+PYTHON_GAST_VERSION = 0.7.0
 PYTHON_GAST_SOURCE = gast-$(PYTHON_GAST_VERSION).tar.gz
-PYTHON_GAST_SITE = https://files.pythonhosted.org/packages/3c/14/c566f5ca00c115db7725263408ff952b8ae6d6a4e792ef9c84e77d9af7a1
+PYTHON_GAST_SITE = https://files.pythonhosted.org/packages/91/f6/e73969782a2ecec280f8a176f2476149dd9dba69d5f8779ec6108a7721e6
 PYTHON_GAST_SETUP_TYPE = setuptools
 PYTHON_GAST_LICENSE = BSD-3-Clause
 PYTHON_GAST_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
