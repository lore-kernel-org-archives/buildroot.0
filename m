Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33C54CD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 17:46:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 913D78469A;
	Fri, 15 May 2026 17:46:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jVACrP91WTEc; Fri, 15 May 2026 17:46:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81AF58468C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778867216;
	bh=S7Ki/QoWJ1ezebVXaNP9FQHgDMmrf0P4ipXbCYJdJyM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=haz4gekGceiuqx/A/MX148enzgPkrV4nFTAytFJ4rWbikuIUN8xWwMTc+BwhMXAhq
	 WdtqR+5rnyoxZzq6jwZw5N4H/4vPqMLL94XQU6TxAoouBLNF0ZjNktywl7wjckmM+h
	 iYjR97+1f4N6vx5zTOOmUBs20WCL5QpxEjjtrI0KSzIGh8QoY61SFkuQnaiVgEylDY
	 KZmDD8Yoz03r2xaEvlNFrcxV94EdJ/psUmAgALsfl9zU1/+mxZhfVlIVIafgbd4uNH
	 3SyCG6CWpqWlPpwEg9pMKTU+S/gKPZeETlzp2lyKDEj2UHaDF7GpAooOdGgNI1DX6r
	 /+qQj361OuLXw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81AF58468C;
	Fri, 15 May 2026 17:46:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 31B7245B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 23C1940FB1
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xFylJ1ZdJCAL for <buildroot@buildroot.org>;
 Fri, 15 May 2026 17:46:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 444044027F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 444044027F
 for <buildroot@buildroot.org>; Fri, 15 May 2026 17:46:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6DD0E863D7; Fri, 15 May 2026 17:46:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 16:16:22 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 4d173cc6e393b3055084c6a70f37a45c784e87cb
X-Git-Newrev: 5b6a0d9c6be3b99ea82663e154c59f84a4b61916
X-Patchwork-Hint: ignore
Message-Id: <20260515174639.6DD0E863D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/haproxy: bump
 version to 2.6.25
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/5b6a0d9c6be3b99ea82663e154c59f84a4b61916
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

http://www.haproxy.org/download/2.6/src/CHANGELOG

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 85f1e9cf0b9de205352ab013c4fe303b2f52b828)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/haproxy/haproxy.hash | 4 ++--
 package/haproxy/haproxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/haproxy/haproxy.hash b/package/haproxy/haproxy.hash
index ce5dae17e7..5c644356a6 100644
--- a/package/haproxy/haproxy.hash
+++ b/package/haproxy/haproxy.hash
@@ -1,5 +1,5 @@
-# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.23.tar.gz.sha256
-sha256  1281d57f25e98456a042c81f32801a106a293c1340b0c06debb2a87d6a7b3611  haproxy-2.6.23.tar.gz
+# From: http://www.haproxy.org/download/2.6/src/haproxy-2.6.25.tar.gz.sha256
+sha256  d861cacbe2ed51ae8ad5fa9ee5165b4e5e2bccaa5b9e04324711761d7d946be9  haproxy-2.6.25.tar.gz
 # Locally computed:
 sha256  0717ca51fceaa25ac9e5ccc62e0c727dcf27796057201fb5fded56a25ff6ca28  LICENSE
 sha256  5df07007198989c622f5d41de8d703e7bef3d0e79d62e24332ee739a452af62a  doc/lgpl.txt
diff --git a/package/haproxy/haproxy.mk b/package/haproxy/haproxy.mk
index 51878e754f..805cf4c4d9 100644
--- a/package/haproxy/haproxy.mk
+++ b/package/haproxy/haproxy.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 HAPROXY_VERSION_MAJOR = 2.6
-HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).23
+HAPROXY_VERSION = $(HAPROXY_VERSION_MAJOR).25
 HAPROXY_SITE = http://www.haproxy.org/download/$(HAPROXY_VERSION_MAJOR)/src
 HAPROXY_LICENSE = GPL-2.0+ and LGPL-2.1+ with exceptions
 HAPROXY_LICENSE_FILES = LICENSE doc/lgpl.txt doc/gpl.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
