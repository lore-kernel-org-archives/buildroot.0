Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD74BC43458
	for <buildroot@archiver.kernel.org>; Fri, 10 Jul 2026 13:43:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EC686068F;
	Fri, 10 Jul 2026 13:43:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 04-7LXrxAznh; Fri, 10 Jul 2026 13:43:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AACFA606C9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1783690987;
	bh=gmksIFhaS7xvJckvKA0ak2jeErJ7yduOYvHgEKFqcrs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=La8dgMD54UAhAtIcRi6wFeKqSeLgTbW2CX8G907wny5uCSPjaFZXnMmAVqLFfEzE+
	 ArHM8sILTQxcuxFLhz72uPln55d+U7RJ+ScknEFSsKOVTI76D5M9MaNoN76Cg/Uoic
	 g1KhsO+TfKmTQS44MoMV5L9vnnyllyf8m4vUN50wVuYvHkXS0ghTtFCV9rn9lObUs4
	 33PBG+ZM0/4zCbdKPlz85UIRgMJ65RMFIwTy5c7+X6YS7GImKV/2qA9QA1j67Z+Ztc
	 9mhn61ktYkKQiK8FAfqnJcF1s5LUM8iZ2f4Nx/50tA1uVqNlc8Reibz5orz1pdBC6l
	 GNOAEAflf5b9Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AACFA606C9;
	Fri, 10 Jul 2026 13:43:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 479C2FD1
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2DC5C810B8
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0CGO2GFHe8Gy for <buildroot@buildroot.org>;
 Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5522C810BB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5522C810BB
 for <buildroot@buildroot.org>; Fri, 10 Jul 2026 13:42:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 8A4898867C; Fri, 10 Jul 2026 13:42:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 8 Jul 2026 14:31:22 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 634b2da1f72f42ac75cd5aec0c8a741991b18561
X-Git-Newrev: 61d5a09e9933e2ce2670df5b0f7ad0ec467c219f
X-Patchwork-Hint: ignore
Message-Id: <20260710134217.8A4898867C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/nginx: security
 bump to 1.30.3
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/61d5a09e9933e2ce2670df5b0f7ad0ec467c219f
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Changes with nginx 1.30.3

    *) Security: a heap memory buffer overflow might occur in a worker
       process when using a configuration with "ignore_invalid_headers off;"
       and "large_client_header_buffers" with large configured values when
       proxying a specially crafted request to HTTP/2 or gRPC backend,
       allowing an attacker to cause worker process memory corruption or
       segmentation fault in a worker process (CVE-2026-42055).
       Thanks to Mufeed VH of Winfunc Research.

    *) Security: a heap memory buffer overread might occur in a worker
       process while handling a specially sent response with decoding from
       UTF-8 via the "charset_map" directive, allowing an attacker to cause
       a limited disclosure of worker process memory or segmentation fault
       in a worker process (CVE-2026-48142).
       Thanks to Han Yan of Xiaomi and p4p3r of CYBERONE.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 9b8c65a6c1f2329d5d7dacc6b559023ef2bcafc1)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/nginx/nginx.hash | 2 +-
 package/nginx/nginx.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/nginx/nginx.hash b/package/nginx/nginx.hash
index 5055b4bd57..6c3afa889d 100644
--- a/package/nginx/nginx.hash
+++ b/package/nginx/nginx.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-sha256  7df3090907fca3cc0e456d6dc00ceb230da74ea88026ceff0affc29dbbd9ac4c  nginx-1.30.2.tar.gz
+sha256  e5823dc6f45610993def93ebf6cfce68264af4958c77e874b7d20f3709001b8f  nginx-1.30.3.tar.gz
 # License files, locally calculated
 sha256  08845fe39e06b51dad7685c28140ab49577a86e947523e16b536a46caf89ad5c  LICENSE
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 3f6aecebef..ad61ef6140 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NGINX_VERSION = 1.30.2
+NGINX_VERSION = 1.30.3
 NGINX_SITE = https://nginx.org/download
 NGINX_LICENSE = BSD-2-Clause
 NGINX_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
