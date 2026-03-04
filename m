Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BC6DEFCE4D
	for <buildroot@archiver.kernel.org>; Wed,  4 Mar 2026 21:24:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6B5F040940;
	Wed,  4 Mar 2026 21:24:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYKSeuq9swFk; Wed,  4 Mar 2026 21:24:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9361B40996
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772659492;
	bh=hWBG/7Ud8Ft+k1pC2TvOR1xY9DklwQs8tW8KlTfrsBs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gMriAOCkU2NszUfRua8AytUgMOleNQ9kZawSnlRa++qrXJAweE/JdheCTzpgwTyG2
	 1NGkwgbnNlB8UU2Rak4CNGZzLUJd9BntszNLYYCbBLjTP6XQMxGIr7KnT5fCJi6kDa
	 3a9CQ6Pdo2q71cMB1216Kz0+fNBi1pSNSIQ5weuhqaXUoewvFCJgn2zBoPeYNhZTnz
	 i7gBwUtiZ7cbK17ZYf+OXqRQGt/EbJ/HvzMqhyxj+x+rZYV6fCAgjA3eBG+V6vDW6Y
	 eFt89v5AlaIPXCta5UUEv2CXdzNeP2D2NkQsrH5G7Nt+NJFj0fmpKq3BkjOnDcg20A
	 4I2xcoZuSAArg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9361B40996;
	Wed,  4 Mar 2026 21:24:52 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 35C1E223
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:24:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1B92040B14
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:24:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C-0Fp7B0PA29 for <buildroot@buildroot.org>;
 Wed,  4 Mar 2026 21:24:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6574E40694
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6574E40694
 for <buildroot@buildroot.org>; Wed,  4 Mar 2026 21:24:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6145D86210; Wed,  4 Mar 2026 21:24:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Mar 2026 22:22:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 1a9998e511ca6aea86a166511c4e3cb8456afb06
X-Git-Newrev: 6c3933d14bc6b8622733f1ada788c168ba9f8775
X-Patchwork-Hint: ignore
Message-Id: <20260304212450.6145D86210@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/freetype: security bump version to
 2.14.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6c3933d14bc6b8622733f1ada788c168ba9f8775
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Release notes:
https://sourceforge.net/projects/freetype/files/freetype2/2.14.2/

Fixes CVE-2026-23865: https://seclists.org/oss-sec/2026/q1/253

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/freetype/freetype.hash | 6 +++---
 package/freetype/freetype.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/freetype/freetype.hash b/package/freetype/freetype.hash
index 2c6ab20e19..520e6c2bcf 100644
--- a/package/freetype/freetype.hash
+++ b/package/freetype/freetype.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/freetype/files/freetype2/2.14.1/
-sha1  20f7a9a3e2996aab82b0648e82d49a78e8813bab  freetype-2.14.1.tar.xz
-sha256  32427e8c471ac095853212a37aef816c60b42052d4d9e48230bab3bdf2936ccc  freetype-2.14.1.tar.xz
+# From https://sourceforge.net/projects/freetype/files/freetype2/2.14.2/
+sha1  28200b8f8df5a524f476bdacb20f05da1c33280c  freetype-2.14.2.tar.xz
+sha256  4b62dcab4c920a1a860369933221814362e699e26f55792516d671e6ff55b5e1  freetype-2.14.2.tar.xz
 
 # Locally calculated
 sha256  bd36c8b474855fa294c2ec5c184544478ef3720aad37d65a6296a4f264fd2d3b  LICENSE.TXT
diff --git a/package/freetype/freetype.mk b/package/freetype/freetype.mk
index 00743fe358..fbf9d13235 100644
--- a/package/freetype/freetype.mk
+++ b/package/freetype/freetype.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FREETYPE_VERSION = 2.14.1
+FREETYPE_VERSION = 2.14.2
 FREETYPE_SOURCE = freetype-$(FREETYPE_VERSION).tar.xz
 FREETYPE_SITE = https://download.savannah.gnu.org/releases/freetype
 FREETYPE_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
