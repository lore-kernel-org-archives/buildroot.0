Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5934110F2862
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 18:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB16583B86;
	Fri, 27 Mar 2026 18:25:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UntgeTnqrKJf; Fri, 27 Mar 2026 18:25:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 46ADA835DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774635933;
	bh=P6S3vvb5jhr4F39RzChWfyL68ImPoQ6xIeGRICXxA5U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Fgn26PRr1FFcdhzdi26ZD+RUJUgREoQ4DO9GAJxstYkg7UUmxwWUwGaHkNHjJPNV3
	 8Ic1inQr4s+saGpLff42ak2gECX0OKIJxgu4d3CjYyqGkPlOpkUqWkbxX9o5KAc8//
	 su3M4hGMdAJY2Ley6bOMupYxnFMc0jcU8oZjrFts5bYTWaw3k5YVY0AtHyiZqbE384
	 Eqek0h3D/ezzYvDOTaJIbbBzX0XPAz65MCcpCwghtOnTqB50eDhnvcg0K1dV3cvRB/
	 Yzbhzloj89HmdQ8WxGVJlCL28/V2Yn7/QKaTPOpSCDVhh+XB5jAJXVN7XyKA9gkX/v
	 HbkFdZ/zWohtg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 46ADA835DF;
	Fri, 27 Mar 2026 18:25:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 287522AA
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:25:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0E11C60FE3
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:25:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ddrz8peA_G9y for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 18:25:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 336C560FDC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 336C560FDC
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 18:25:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 783A67FBE7; Fri, 27 Mar 2026 18:25:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 27 Mar 2026 19:23:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f359f665bec3300bf0f1efdaed95a1384f63b588
X-Git-Newrev: a9a4d0a7a568412193f5232904b51836759e0b3e
X-Patchwork-Hint: ignore
Message-Id: <20260327182529.783A67FBE7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freetype: security bump version to
 2.14.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/a9a4d0a7a568412193f5232904b51836759e0b3e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://sourceforge.net/projects/freetype/files/freetype2/2.14.3/
"- A bunch of potential security problems have been found.  All users
 should update."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
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
