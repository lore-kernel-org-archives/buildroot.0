Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9870C2D0CD
	for <buildroot@archiver.kernel.org>; Sat, 17 May 2025 19:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6589481F0D;
	Sat, 17 May 2025 19:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tue1Uw3FSKrk; Sat, 17 May 2025 19:28:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 80EE381F0F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 80EE381F0F;
	Sat, 17 May 2025 19:28:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 74FD5204
 for <buildroot@buildroot.org>; Sat, 17 May 2025 19:28:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5B17A608A3
 for <buildroot@buildroot.org>; Sat, 17 May 2025 19:28:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0Lgw5RUyhhVo for <buildroot@buildroot.org>;
 Sat, 17 May 2025 19:28:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9250660AC0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9250660AC0
 for <buildroot@buildroot.org>; Sat, 17 May 2025 19:28:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A49D8704A; Sat, 17 May 2025 19:28:45 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sat, 17 May 2025 21:07:20 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9869bae0f9cb662db96eb9a5a683a13123d201c1
X-Git-Newrev: a8f53a907ba314addd1bc05ffd49346ab1bc85af
X-Patchwork-Hint: ignore
Message-Id: <20250517192845.7A49D8704A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/postgresql: security bump to
 version 17.5
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a8f53a907ba314addd1bc05ffd49346ab1bc85af
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following security issue:

CVE-2025-4207: PostgreSQL GB18030 encoding validation can read one byte past
end of allocation for text that fails validation

A buffer over-read in PostgreSQL GB18030 encoding validation allows a
database input provider to achieve temporary denial of service on platforms
where a 1-byte over-read can elicit process termination.  This affects the
database server and also libpq.

https://www.postgresql.org/about/news/postgresql-175-169-1513-1418-and-1321-released-3072/

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/postgresql/postgresql.hash | 4 ++--
 package/postgresql/postgresql.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/postgresql/postgresql.hash b/package/postgresql/postgresql.hash
index 1c77119207..f17d4ca3ce 100644
--- a/package/postgresql/postgresql.hash
+++ b/package/postgresql/postgresql.hash
@@ -1,4 +1,4 @@
-# From https://ftp.postgresql.org/pub/source/v17.4/postgresql-17.4.tar.bz2.sha256
-sha256  c4605b73fea11963406699f949b966e5d173a7ee0ccaef8938dec0ca8a995fe7  postgresql-17.4.tar.bz2
+# From https://ftp.postgresql.org/pub/source/v17.5/postgresql-17.5.tar.bz2.sha256
+sha256  fcb7ab38e23b264d1902cb25e6adafb4525a6ebcbd015434aeef9eda80f528d8  postgresql-17.5.tar.bz2
 # License file, Locally calculated
 sha256  e3822c4797fadcab31a3fc73f75c28ac20c73d72b565da91e9974cf9398ef4d2  COPYRIGHT
diff --git a/package/postgresql/postgresql.mk b/package/postgresql/postgresql.mk
index bffa544a5a..671bd30347 100644
--- a/package/postgresql/postgresql.mk
+++ b/package/postgresql/postgresql.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-POSTGRESQL_VERSION = 17.4
+POSTGRESQL_VERSION = 17.5
 POSTGRESQL_SOURCE = postgresql-$(POSTGRESQL_VERSION).tar.bz2
 POSTGRESQL_SITE = https://ftp.postgresql.org/pub/source/v$(POSTGRESQL_VERSION)
 POSTGRESQL_LICENSE = PostgreSQL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
