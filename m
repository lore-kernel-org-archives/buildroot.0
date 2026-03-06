Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0CD0FCC066
	for <buildroot@archiver.kernel.org>; Fri,  6 Mar 2026 19:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F0AF613BB;
	Fri,  6 Mar 2026 19:19:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JsOuBzQBPVvN; Fri,  6 Mar 2026 19:19:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AFC93611DF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1772824785;
	bh=pjnex0VV2qDy62lXMVxlf8xDQqTVupKeDRg76U4qDRc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UGRhIo1LFocd7xN3WTIhCqVMOJH0BfUi2pyxEXH62wVS2olJlKxfAXB/V8w8P1hU9
	 YeH/y4DG1yD5ifk/x2BRVqlBoS2O/S7iFqdWVj7XVIkaO55B4RQLnEXxSCjjqRAwZr
	 sauS1Raq+tKFWlslytl++ir/fNap/4yGyA/6XriguGGNMP+zCq/LB6Js/zndnhgvi/
	 r3ZtMMWTdFcled5I+JQpgGlTV4/0S9+8P1G6GZKPVrGnIyJKSEgi2B2NQPxCyAn7Lv
	 m2G5pQ7NnzegI+XS/ps+ziinF+DnJGfcQhmRCplCitf00DoXanrXUeD2ercZ+qdomH
	 7XWfNFZ0gCV2g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFC93611DF;
	Fri,  6 Mar 2026 19:19:45 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C1A71223
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:19:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B18BD404EB
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:19:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GFTlzZLtyHXi for <buildroot@buildroot.org>;
 Fri,  6 Mar 2026 19:19:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 074FB4008A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 074FB4008A
 for <buildroot@buildroot.org>; Fri,  6 Mar 2026 19:19:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0AC8F867CB; Fri,  6 Mar 2026 19:19:42 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 6 Mar 2026 20:08:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b9a88acd9b1257965e091ac9ae04a210eb7260f7
X-Git-Newrev: d62b605c1aac355c6aae79a13d75f0ba8ce7ecd7
X-Patchwork-Hint: ignore
Message-Id: <20260306191942.0AC8F867CB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgresql: bump version to 18.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/d62b605c1aac355c6aae79a13d75f0ba8ce7ecd7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://www.postgresql.org/about/news/postgresql-183-179-1613-1517-and-1422-released-3246/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 8d47db5b7f..58eab8e548 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v18.2/postgresql-18.2.tar.bz2.sha256
-sha256  5245bd1b79700d55b8e0575be0325ef61e7bbef627e6a616e4cf36ad4687be36  postgresql-18.2.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v18.3/postgresql-18.3.tar.bz2.sha256
+sha256  d95663fbbf3a80f81a9d98d895266bdcb74ba274bcc04ef6d76630a72dee016f  postgresql-18.3.tar.bz2
 # License file, Locally calculated
 sha256  3d6af92ff8a4c2cdf69afb1cf44edea727922f5cd0cf8b5f72b11cdecac8fdfd  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index 542fe05264..fed3887ef5 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 18.2
+POSTGRESQL_VERSION = 18.3
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
