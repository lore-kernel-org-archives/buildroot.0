Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74BADCD6E4C
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 08:25:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3669883AB8;
	Fri, 29 May 2026 08:25:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id j0Ui4QX5Rugk; Fri, 29 May 2026 08:25:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A25C83ADF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780043126;
	bh=nIxJB/yQ4Fpjn51JhQaGZ0SgXFZ0aw0/7/6hP9kVA1o=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=iSGnnYidcCnuo9G6sN6sitB8pfnuigH4kVlhAySt3XI4Nh5KiECJ6tEtE3qDqf0vz
	 iu6Y5cFYq811ujsvNSK2oDpRJxYl+6vSg5wyxXiu9zg+95CCItG2gDMSyzo0DsaUbX
	 zDcNxTzH1Qwsg1YgYWmvDvr+W+pyf85a1gdV2RlNK0B/dUSmBDhyxqDS4lFD1y9aB7
	 fjP1vIsxT0zm90X9Iy7c2tAmc7Q2ywW7m942T0WU1+QM9KcMyEllIAvHXmjw+ktUrT
	 bDgerY1V+9kONYdvJjIPEH5iztVpZDRZuar/vMvyG2nJZ2IJb4exOFslmffahCKuST
	 GW/gBkt020uyQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A25C83ADF;
	Fri, 29 May 2026 08:25:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7FA702E9
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6DE0483A9D
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 07QhPlJKKPeM for <buildroot@buildroot.org>;
 Fri, 29 May 2026 08:25:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D5F683A7C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6D5F683A7C
 for <buildroot@buildroot.org>; Fri, 29 May 2026 08:25:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F2EA6870C6; Fri, 29 May 2026 08:25:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 28 May 2026 10:18:59 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f85a7df189f0e3fc2060c8e8ebd89a6791e6bc1d
X-Git-Newrev: 1d5d7d47c10692195166dfb70d57bb4d75ec75ff
X-Patchwork-Hint: ignore
Message-Id: <20260529082505.F2EA6870C6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libgpg-error:
 bump version to 1.56
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1d5d7d47c10692195166dfb70d57bb4d75ec75ff
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Release notes:
https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=blob;f=NEWS;hb=b3b68bde07b02dd2b6d78356ac90baa652a309fa

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 409ec3dc497c69e67b9bdc4c2073c7fdfa79c6ac)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libgpg-error/libgpg-error.hash | 4 ++--
 package/libgpg-error/libgpg-error.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index 957f96edcf..d02983d1ca 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  0a9386ff70a5d1f771771bf0b8db2b956e292f13  libgpg-error-1.51.tar.bz2
-sha256  be0f1b2db6b93eed55369cdf79f19f72750c8c7c39fc20b577e724545427e6b2  libgpg-error-1.51.tar.bz2
+sha1  6db7c51778e424c928993e1d49ccf6ad6866b185  libgpg-error-1.56.tar.bz2
+sha256  82c3d2deb4ad96ad3925d6f9f124fe7205716055ab50e291116ef27975d169c0  libgpg-error-1.56.tar.bz2
 
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 3f327e3054..1fb1076ef3 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.51
+LIBGPG_ERROR_VERSION = 1.56
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
