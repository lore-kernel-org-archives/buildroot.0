Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D84E668A5
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 22:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E0CE4083B;
	Fri, 19 Dec 2025 22:58:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A88peBX3pXBG; Fri, 19 Dec 2025 22:58:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8FEA4407C1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766185115;
	bh=6tx55JFWkcKOr/ZidGzdVbS9h1bGoOi/XJr2eYW/0NA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ep8Y/fN5lV9GtcffXy7boO0u52k1QO6sk3r99cBc+0ynLSNrF2wbJRtxKOc8SZl8A
	 psjpEH7Jor033w1FIIl2WFWTz6YbAFRqruQSFxVD/FyRi4UJ9ItODpTMXbxqqNrK5u
	 aQpX8Tp2ltu0YAVebQKtcBDaHnFlXhbFnxojSYdC8h6jXN+q9UcNWnFOu//+Esk93L
	 Avf6bU4RZl5ia9xBERty7zKR+TGXrkAPR5RHzby8wZnbuKHzgJauA/Aba/G4uc+Zlr
	 FVCMwfwwQqfoZbrGIf1yVTFHMW+9r1YwQ2z2wU9Mb7VpkXSmVa4cg8CTDEg+mFurtu
	 VBbeHgyP5CuEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8FEA4407C1;
	Fri, 19 Dec 2025 22:58:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9FE3D119
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:58:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8646A60D89
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:58:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SJzd8bYCA6x6 for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 22:58:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4579C60BEB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4579C60BEB
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:58:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 321108744F; Fri, 19 Dec 2025 22:58:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 19 Dec 2025 23:52:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f7fdac73ec3b67d5d3fb31170b2c9028e99c0e4f
X-Git-Newrev: a87bfa1183c0b4073a188f13a692b133b92a339c
X-Patchwork-Hint: ignore
Message-Id: <20251219225833.321108744F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libgpg-error: bump version to 1.58
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

commit: https://git.buildroot.net/buildroot/commit/?id=a87bfa1183c0b4073a188f13a692b133b92a339c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=blob;f=NEWS;h=c60ad85d84da2a1721e6bb8c4ae95e645be1b201;hb=e880193c55f0321bbefc16be3194fdbb7a48078f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libgpg-error/libgpg-error.hash | 4 ++--
 package/libgpg-error/libgpg-error.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libgpg-error/libgpg-error.hash b/package/libgpg-error/libgpg-error.hash
index d02983d1ca..ede1a2113e 100644
--- a/package/libgpg-error/libgpg-error.hash
+++ b/package/libgpg-error/libgpg-error.hash
@@ -1,6 +1,6 @@
 # From https://www.gnupg.org/download/integrity_check.html
-sha1  6db7c51778e424c928993e1d49ccf6ad6866b185  libgpg-error-1.56.tar.bz2
-sha256  82c3d2deb4ad96ad3925d6f9f124fe7205716055ab50e291116ef27975d169c0  libgpg-error-1.56.tar.bz2
+sha1  a9876a9e4cb54298960bd4202baf891642060428  libgpg-error-1.58.tar.bz2
+sha256  f943aea9a830a8bd938e5124b579efaece24a3225ff4c3d27611a80ce1260c27  libgpg-error-1.58.tar.bz2
 
 # Locally calculated
 sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/libgpg-error/libgpg-error.mk b/package/libgpg-error/libgpg-error.mk
index 1fb1076ef3..5207d926df 100644
--- a/package/libgpg-error/libgpg-error.mk
+++ b/package/libgpg-error/libgpg-error.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBGPG_ERROR_VERSION = 1.56
+LIBGPG_ERROR_VERSION = 1.58
 LIBGPG_ERROR_SITE = https://www.gnupg.org/ftp/gcrypt/libgpg-error
 LIBGPG_ERROR_SOURCE = libgpg-error-$(LIBGPG_ERROR_VERSION).tar.bz2
 LIBGPG_ERROR_LICENSE = GPL-2.0+, LGPL-2.1+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
