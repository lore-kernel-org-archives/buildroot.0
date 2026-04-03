Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3F74E7E363
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 10:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7AA0481B3E;
	Fri,  3 Apr 2026 10:29:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3yKSz2Qrd08F; Fri,  3 Apr 2026 10:29:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8952F821B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775212140;
	bh=0J71jge20n2rndL65KHbOi0bfNAMqY6u3+u3b7Va4dU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WNb5D7wvBWxHT1rghu8kyMZEPzZwkdAH6NH1DnXhE51f2EjTCm8WIu7wqenzDROed
	 RSJ4W24ZEX8eu8NkIhXULRyT4CkuJvUivJnD8DxZuMm5gZBQThdKec5SXUaq9P6BeH
	 DuF74wFtxkPeIsqLqy5T+/SHRU/xUI3z/lZvYS8/meGyvuSmoxHAl6zbO4Pm2vosLu
	 4KH4Wp33AWJKPLbAiJquPryDNsowEIa3LZRc7fGV487zxDBOz+iZRoNrB56+pRaCz2
	 5ej2BCDQHsqhb2Meua4zUyl8d4NtQrobotn16JCv2iUxQiRj63a61DipfCCC602rwD
	 t0mGY1cqkJRVg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8952F821B9;
	Fri,  3 Apr 2026 10:29:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 018B02CC
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4185881C38
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o-XrHo1qFP-w for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 305AE81DE6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 305AE81DE6
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 10:28:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AE56B7FFAA; Fri,  3 Apr 2026 10:28:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 11:53:09 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 220744c3aa3960c39bc864990cbdd267700b6836
X-Git-Newrev: 6cb5e52b34a6e5ed8a542d7ad54c70a20741f9f6
X-Patchwork-Hint: ignore
Message-Id: <20260403102836.AE56B7FFAA@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/freetype:
 security bump version to 2.14.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6cb5e52b34a6e5ed8a542d7ad54c70a20741f9f6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

https://sourceforge.net/projects/freetype/files/freetype2/2.14.3/
"- A bunch of potential security problems have been found.  All users
 should update."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit a9a4d0a7a568412193f5232904b51836759e0b3e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/freetype/freetype.hash | 6 +++---
 package/freetype/freetype.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index 520e6c2bcf..9bd01d3ad6 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.14.2/
-sha1  28200b8f8df5a524f476bdacb20f05da1c33280c  freetype-2.14.2.tar.xz
-sha256  4b62dcab4c920a1a860369933221814362e699e26f55792516d671e6ff55b5e1  freetype-2.14.2.tar.xz
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.14.3/
+sha1  62e26b89a057ad4f1e28af977945d5c1975a8e67  freetype-2.14.3.tar.xz
+sha256  36bc4f1cc413335368ee656c42afca65c5a3987e8768cc28cf11ba775e785a5f  freetype-2.14.3.tar.xz
 
 # Locally calculated
 sha256  bd36c8b474855fa294c2ec5c184544478ef3720aad37d65a6296a4f264fd2d3b  LICENSE.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index fbf9d13235..634d9107fe 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.14.2
+FREETYPE_VERSION = 2.14.3
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
 FREETYPE_SITE = https://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
