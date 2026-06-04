Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE06FCD8C82
	for <buildroot@archiver.kernel.org>; Fri,  5 Jun 2026 12:39:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 792288208E;
	Fri,  5 Jun 2026 12:39:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KgsIW36K1MUx; Fri,  5 Jun 2026 12:39:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6B4881F13
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780663155;
	bh=0nmrzIp2fb4UcQAU5Y1pqBWKumhpzePxIJFzfxLbz1M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=YZWADCCRxJIjZIUiM1BC4jzN4RkPu2L38nvRNasNtnmflhCPwD0rBJduatyzVplNs
	 frwd177owkJ55Xq+rAsbArHy9GQgt4NUOx4h13kshzpwOeCV9iVDPNDNjaZHK1ocXr
	 RL34Di2l6v+s6y5AnnNw+M8BlnagtjlISs2LnKk2y+JdN1T3beLMdEZmnDiA78d9T5
	 4LICv/2dV8Kr9K4K9z/Lzt5cQlo8bUKRTBIKfOm0dBMbrSbBX8ZDJV24Swt9UuCOEE
	 HTIoe5nkqb0Hbl3IlwFfQANqmxWqW33K4RQ2tp+o17nLPGUsGY/jq2wAYf5PsxlYsa
	 JPXPxk2ip49Kw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6B4881F13;
	Fri,  5 Jun 2026 12:39:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 21119388
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 12C7A60B93
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 02eW92Mc5GNe for <buildroot@buildroot.org>;
 Fri,  5 Jun 2026 12:38:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A2A0760B8B
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A2A0760B8B
 for <buildroot@buildroot.org>; Fri,  5 Jun 2026 12:38:49 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CB70087B3B; Fri,  5 Jun 2026 12:38:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 4 Jun 2026 10:21:47 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 3e66f293f32d525febf370a32da08c7d05303f3e
X-Git-Newrev: 7ce09a9a71b52e01aca84977e1862e6a53104b62
X-Patchwork-Hint: ignore
Message-Id: <20260605123833.CB70087B3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] package/nginx: security
 bump version to 1.30.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/7ce09a9a71b52e01aca84977e1862e6a53104b62
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

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
(cherry picked from commit 0455e2571d35b642115e9122159ace0ce803fceb)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
