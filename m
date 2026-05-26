Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F9D6CD5BD0
	for <buildroot@archiver.kernel.org>; Tue, 26 May 2026 11:25:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D195440E31;
	Tue, 26 May 2026 11:25:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Scoz0-YFPaEz; Tue, 26 May 2026 11:25:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E33440E73
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1779794734;
	bh=zLhk3dT7nV6jO+2srFTyJe1Uy3VXnttk+RTrdLau5bo=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=Kjl9qWCDyanxO37om8BpBDMGTbt2jMynZRhk/iZYa+2qpConc4xGmjIAZBFA4nWNh
	 JGbP8SL7MST0KDjdwcYunujx3bqZxpA6SWZlsmrHY97rFHT7ccjUn/zALrCXO0knLz
	 tx1ZdXk14LE3KS5Uyc349peQGrAIMFr+17/oEnySTfTy9n0yDOux1pu8p/mneAfdu8
	 AwC8Kf0Dh5VcaLWAAlVmy0mOp+qa19N2A10NhmCVKU8uO47oUjBGBOIoJW0Mp7tqx0
	 PCPnJwnbdL1RndKLLRnWuViMbXr8dAM2oxkS7/CKRMxuX0UzqTrhdorlr8ev4HfwEz
	 7Md63xy71fiBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0E33440E73;
	Tue, 26 May 2026 11:25:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8A16E21F
 for <buildroot@buildroot.org>; Tue, 26 May 2026 11:25:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 872D260EC1
 for <buildroot@buildroot.org>; Tue, 26 May 2026 11:25:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Luah9fY0vYmf for <buildroot@buildroot.org>;
 Tue, 26 May 2026 11:25:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CE3A460EE7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE3A460EE7
 for <buildroot@buildroot.org>; Tue, 26 May 2026 11:25:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CD24286F12; Tue, 26 May 2026 11:25:21 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 26 May 2026 13:20:13 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 74aed5e8619cd4674e12659ce16798851486e7ff
X-Git-Newrev: 0455e2571d35b642115e9122159ace0ce803fceb
X-Patchwork-Hint: ignore
Message-Id: <20260526112521.CD24286F12@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nginx: security bump version to
 1.30.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/0455e2571d35b642115e9122159ace0ce803fceb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://nginx.org/en/CHANGES-1.30

https://nginx.org/en/security_advisories.html

1.30.2: Fixes CVE-2026-9256
1.30.1: Fixes CVE-2026-42926 (only from 1.29.4), CVE-2026-42945,
CVE-2026-42946, CVE-2026-42934, CVE-2026-40460 & CVE-2026-40701.

Updated license hash due to copyright year bump:
https://github.com/nginx/nginx/commit/7fa941a55e211ebd57f512fbfb24d59dbb97940d

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Peter: clarify CVE-2026-42926]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/nginx/nginx.hash | 4 ++--
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 1d11937987..5055b4bd57 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  2c96a946bfb0882a21744ed429770a2123ae1828c7c48665092993ddee91a918  nginx-1.28.3.tar.gz
+sha256  7df3090907fca3cc0e456d6dc00ceb230da74ea88026ceff0affc29dbbd9ac4c  nginx-1.30.2.tar.gz
 # License files, locally calculated
-sha256  77c01620abf36ed747b7eca4bd271e49023fe3a8e2b3525bcf4b09c8e3aa28e4  LICENSE
+sha256  08845fe39e06b51dad7685c28140ab49577a86e947523e16b536a46caf89ad5c  LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index a8b7ee7319..3f6aecebef 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.28.3
+NGINX_VERSION = 1.30.2
 NGINX_SITE = https://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
