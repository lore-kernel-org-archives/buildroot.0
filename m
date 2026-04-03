Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73AFBE85388
	for <buildroot@archiver.kernel.org>; Fri,  3 Apr 2026 17:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3EEF141204;
	Fri,  3 Apr 2026 17:39:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kbHQcBdJUhcJ; Fri,  3 Apr 2026 17:39:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A33641201
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775237952;
	bh=n1vT8i71uR0NVz2q2U2CKaQxsz+EEEj+bjSh5iXidGo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y9ilBcNcjOVwPuA0++jf7SctEAN7MUj3EWDtmvMEE5IHLqlR7R8KSCwXBj3c+tSHA
	 KHDxA4Luw3HZn8ae1fnysjyCj7PoPPS+jyn1RYeflZ4NaRaqPhYZBrUBc2Ha8BvCpP
	 GYn5O+cniiMAbrLhSQ58qD3JYoBry8m/l34RGwfdTs0zVHHrULX9q2YjCz3jYuDzYH
	 k5QvP5UfnkFs5T4mPuc53K9fM0CnjcVMvD+HfrAhKkbGUESMF9DpzFHzDY7WETKNEK
	 QzTxU8M6WODncgbZCVFQHhkRCaEw00CUt9ik6CBeXJmWPiwXeZq9p2TRDD4MlGKXM5
	 0pZ4OthobbCoA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A33641201;
	Fri,  3 Apr 2026 17:39:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C146D1AF
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:39:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B313040226
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:39:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OdvwdWlJCi1T for <buildroot@buildroot.org>;
 Fri,  3 Apr 2026 17:39:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2DAE40202
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D2DAE40202
 for <buildroot@buildroot.org>; Fri,  3 Apr 2026 17:39:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4F1FF8013A; Fri,  3 Apr 2026 17:39:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 3 Apr 2026 19:37:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2b2246517d089b15baef288c23bed026576b866
X-Git-Newrev: 82186898102ea15b23b011ba39ddffe0ca4b4c20
X-Patchwork-Hint: ignore
Message-Id: <20260403173909.4F1FF8013A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libmicrohttpd: bump version to
 1.0.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/82186898102ea15b23b011ba39ddffe0ca4b4c20
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://lists.gnu.org/archive/html/info-gnu/2026-04/msg00000.html

Switched project URL to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libmicrohttpd/Config.in          | 2 +-
 package/libmicrohttpd/libmicrohttpd.hash | 2 +-
 package/libmicrohttpd/libmicrohttpd.mk   | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libmicrohttpd/Config.in b/package/libmicrohttpd/Config.in
index 8477ef6668..4ce089bf6b 100644
--- a/package/libmicrohttpd/Config.in
+++ b/package/libmicrohttpd/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_LIBMICROHTTPD
 	  GNU libmicrohttpd is a small C library that makes it easy to
 	  run an HTTP server as part of another application.
 
-	  http://www.gnu.org/software/libmicrohttpd/
+	  https://www.gnu.org/software/libmicrohttpd/
 
 if BR2_PACKAGE_LIBMICROHTTPD
 
diff --git a/package/libmicrohttpd/libmicrohttpd.hash b/package/libmicrohttpd/libmicrohttpd.hash
index 59c87a738d..bd5d0b3e8b 100644
--- a/package/libmicrohttpd/libmicrohttpd.hash
+++ b/package/libmicrohttpd/libmicrohttpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  df324fcd0834175dab07483133902d9774a605bfa298025f69883288fd20a8c7  libmicrohttpd-1.0.2.tar.gz
+sha256  7816b57aae199cf5c3645e8770e1be5f0a4dfafbcb24b3772173dc4ee634126a  libmicrohttpd-1.0.3.tar.gz
 sha256  7399547209438c93f9b90297954698773d4846cea44cde5ca982c84c45952a3b  COPYING
diff --git a/package/libmicrohttpd/libmicrohttpd.mk b/package/libmicrohttpd/libmicrohttpd.mk
index 335234c14b..b74a7a1338 100644
--- a/package/libmicrohttpd/libmicrohttpd.mk
+++ b/package/libmicrohttpd/libmicrohttpd.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBMICROHTTPD_VERSION = 1.0.2
+LIBMICROHTTPD_VERSION = 1.0.3
 LIBMICROHTTPD_SITE = $(BR2_GNU_MIRROR)/libmicrohttpd
 LIBMICROHTTPD_LICENSE_FILES = COPYING
 LIBMICROHTTPD_CPE_ID_VENDOR = gnu
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
