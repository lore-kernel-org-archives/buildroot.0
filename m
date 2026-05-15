Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9809CCD4F25
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 09:56:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6CC0861503;
	Fri, 15 May 2026 09:56:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 24I3bLno2arv; Fri, 15 May 2026 09:56:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7C3316150E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778839007;
	bh=oKCcZgmscYZlIedR3zarDJykOsziwGgieOGuuP/5bq8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=P6KL0AvBCQKzzAOmtzZvkzPnslw+5Iz6hE1PM94C6pGH6eAr1+uVcZZYcxQGckgyw
	 rWH0GIGrIiB00Szok1h8ZwqzA+DUnKkggmZvWnAaV3e4C38Pqj9mK1reMV95Elb5cc
	 tB6TKT2BwWeHprAJ3tH2eOVetdWm8o1BMawujar5gOsGE5luBVsnDP4c8/5I8SPc1D
	 b7JXRfirccbaPsVWS1Bmw28muIC9jUN1C5GXSvcTFZs4s6Pl999pBtawSRA01gEPhz
	 Ku03Z3rYfsVke6eCKyESXDsKNjen9Lhaedl4d1/SKjOAHlN5DNZEr6Y32DD7Qe42k6
	 4PZ00LhkQ4/BQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7C3316150E;
	Fri, 15 May 2026 09:56:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3428D36E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:56:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 298A183E8A
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:56:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fYvsW85uyKkL for <buildroot@buildroot.org>;
 Fri, 15 May 2026 09:56:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 420A783E0A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 420A783E0A
 for <buildroot@buildroot.org>; Fri, 15 May 2026 09:56:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A63B98632D; Fri, 15 May 2026 09:56:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 11:39:43 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: b77485f2016908b14e4e6f9721801abcf57c2bf4
X-Git-Newrev: c522110685426cd9dc8bf246998abfb7d8b7b86a
X-Patchwork-Hint: ignore
Message-Id: <20260515095633.A63B98632D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libssh: bump version
 to 0.12.0
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c522110685426cd9dc8bf246998abfb7d8b7b86a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://gitlab.com/libssh/libssh-mirror/-/tags/libssh-0.12.0
https://www.libssh.org/2026/02/10/libssh-0-12-0-and-0-11-4-security-releases/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libssh/libssh.hash | 4 ++--
 package/libssh/libssh.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libssh/libssh.hash b/package/libssh/libssh.hash
index 5a103eb593..8c40dea2e5 100644
--- a/package/libssh/libssh.hash
+++ b/package/libssh/libssh.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.libssh.org/files/0.11/libssh-0.11.4.tar.xz.asc
+# https://www.libssh.org/files/0.12/libssh-0.12.0.tar.xz.asc
 # with key 88A228D89B07C2C77D0C780903D5DF8CFDD3E8E7
-sha256  002ac320e3d66c9e100ec6576e3e84aa0c48949efde3bf5b40a2802992297701  libssh-0.11.4.tar.xz
+sha256  1a6af424d8327e5eedef4e5fe7f5b924226dd617ac9f3de80f217d82a36a7121  libssh-0.12.0.tar.xz
 sha256  1656186e951db1c010a8485481fa94587f7e53a26d24976bef97945ad0c4df5a  COPYING
diff --git a/package/libssh/libssh.mk b/package/libssh/libssh.mk
index 56de66d6ea..017ff2c197 100644
--- a/package/libssh/libssh.mk
+++ b/package/libssh/libssh.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-LIBSSH_VERSION_MAJOR = 0.11
-LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).4
+LIBSSH_VERSION_MAJOR = 0.12
+LIBSSH_VERSION = $(LIBSSH_VERSION_MAJOR).0
 LIBSSH_SOURCE = libssh-$(LIBSSH_VERSION).tar.xz
 LIBSSH_SITE = https://www.libssh.org/files/$(LIBSSH_VERSION_MAJOR)
 LIBSSH_LICENSE = LGPL-2.1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
