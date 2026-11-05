Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0DCF606A31B
	for <buildroot@archiver.kernel.org>; Thu,  5 Nov 2026 23:42:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=HMglMMKa
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7AF7960890;
	Thu,  5 Nov 2026 23:42:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rxiXLBJO57rz; Thu,  5 Nov 2026 23:42:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 7FC1A6085B
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793922138;
	b=URCPI1IO2jmM04C1YXSoJJR3ALzEu81IolS3KypK1SmKkP63cExERhrbZJTcGEhG6J3z
	 H7w9ZnJmP2SmjM+amZ5exu5RiQcvWCOzp+KajqcAlSFteYl1Wg73oc73ZFepbKDD494ay
	 h6ecnMYF9EC4GC6As6FFkbscX6O2y9msc7EZ+SNQr2KAgiz7BH/PSGinsGla+CBvJz4C4
	 WJtJItdx8cWLf2QZI9SeCWgBBoOS3FEGfBrVuHbZL0hh8wdsSOQg0x3XW11rEzc0iRFbo
	 CsS8ghGYrl4hq76yxuuM5sXJQzHib3GOLV/oDTJzmdYG26nZyHf1K0ofP1gexEYVSTQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793922138;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=dJrM57QSVZIOuAdMYFypuouK9x7YzbJQbbFvakunxDE=;
	b=SptGojyY0UPqU2s6XabiA/7Z7dHSsvMoR8oZ6YMVrcoJWd55+Whdmnz7KrmeGMmM7Mbx
	 BDR3A3j3grHq6ycgYuWmFZomIHodptcGrpSGWhnNxQhdcoIyA8YeF5gYr3fHRJ0T1TRqf
	 1S+P53fVWiBduyW7ANlFd44m+I4ll+dxLzKmZu3IR6V0zVvYT+HU9NPGJ4PwQ3Bi9d30t
	 pSe1/vfFidpUyNtcXEoMHQGKMIbpEZ4QM6yylS6i7ZfWUQUusTiCUoOXCeKbMglwoKgJs
	 eoAZugkrRlWZxjIM6A56pd7xccssw/1vFSVgirslLRzQ1Q9a6/FdwckvY5IkXTbRGCQ==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793922138;
	bh=dJrM57QSVZIOuAdMYFypuouK9x7YzbJQbbFvakunxDE=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=HMglMMKaSOHfW0RoIMZk7REWK+IPMd6eVPLWW0CXwPYcX9gXJ2l+cxbf/JzYNg0Hy
	 oFW3Qppb1kTFPCNknI5XFCgwCJKEolSXLxnnCIkj8ADNBiU+dlVNEiJBib8ydyrCqK
	 kC8LblabP9X5nNUB0kNdYGeY50wJOhrs59Le2C5CxOGBszbvtC/L6OzLVJJjur2pRf
	 c9mMbQnyGyWtoMVt1DTZvMlVkQOT7sp2s+uWj/brUlsqRRjX9nFgUHidEpD4XUvByM
	 QCw8X2RgypYenW/obLvcEX5qnOkhI9I8cJs9I4XDdKNda7WDM7HwxIO2DkHwgKdQon
	 Crb7wYdRQ8eLg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FC1A6085B;
	Thu,  5 Nov 2026 23:42:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C45CA95F
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:42:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA09440817
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:42:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZdaExptsp2zF for <buildroot@buildroot.org>;
 Thu,  5 Nov 2026 23:42:17 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 034B240815
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 034B240815
 for <buildroot@buildroot.org>; Thu,  5 Nov 2026 23:42:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 80E869D461; Thu,  5 Nov 2026 23:40:45 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Nov 2026 00:23:13 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2a7f1cd07a0412d28324c59c2d65b6eafc2abd89
X-Git-Newrev: 6bd8b009c1f201d28eedf17dd1fb5671b1a62797
X-Patchwork-Hint: ignore
Message-Id: <20261105234045.80E869D461@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{glibc,
 localedef}: bump version to 2.44-70-g21442dba0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6bd8b009c1f201d28eedf17dd1fb5671b1a62797
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 2 +-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 51e29673c3..9deb97a267 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  902d628994c2f3b30af4a7f507835079852cc8ed21d8a7f340e45dc5dae148bf  glibc-2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746-git4.tar.gz
+sha256  5e09d1c1717d779862645ee5ad4a0a3665f2a185dc0832b1daa7b9f593f195e0  glibc-2.44-70-g21442dba0d0be00d8b875349ba9fc71daa1639ce-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 435a97361b..2c202b1ce8 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746
+GLIBC_VERSION = 2.44-70-g21442dba0d0be00d8b875349ba9fc71daa1639ce
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index becbdfae7f..8cef67f2c4 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE, and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746
+LOCALEDEF_VERSION = 2.44-70-g21442dba0d0be00d8b875349ba9fc71daa1639ce
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
