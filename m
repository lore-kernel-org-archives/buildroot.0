Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F0CBCD8CAA
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:01:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0103E8566F;
	Tue,  9 Jun 2026 13:01:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d_SOQajoJeda; Tue,  9 Jun 2026 13:01:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4FDAB85648
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010109;
	bh=+a7AzVFR5rVbmg7gZo76S0X795lMPychvpHahggN8bY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XNGiQka+UIMPxEkSahjkJ8ruCXZMrJ/CYryQctIFKrGBCzD4ikawnRKwti9Rmfgib
	 fnhAf5IBr01xGoJqUw9mthGk45w3TVDS0BxcV+01aPCwj3UPZQlNBvbdA0YBx+t62+
	 IF02Ghri2IXM3b7KGyiNP1LAZ3+8zzCVkLkDOq9eH24jCnyvxM3sqWV+828Tim7ct6
	 r5QBnHGMRiLNiK5klnW3ZzOrUDCKUf+Za4h6DENR3Z3b/awFw9WbewLe+BwULyyg5u
	 2FkYR8AOVsKYWMPChD/3ZNComOcFnRPaa0EvptkJTRVrXHMXfKF6LvMe4Fxbs8/u7H
	 YqFsSH5rKwyIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4FDAB85648;
	Tue,  9 Jun 2026 13:01:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E419324
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 035B4423C1
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hNQvU7mJI2Rg for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E1E77423C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1E77423C0
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1D5B987E8D; Tue,  9 Jun 2026 13:01:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 15 May 2026 11:39:43 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20275000f3ef1546328b595d46c3e81ec5711345
X-Git-Newrev: 4f92439320ed1da7c6ab1285adbc1e16cf80af8d
X-Patchwork-Hint: ignore
Message-Id: <20260609130109.1D5B987E8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libdecor: bump version to 0.2.5
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4f92439320ed1da7c6ab1285adbc1e16cf80af8d
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://gitlab.freedesktop.org/libdecor/libdecor/-/commits/0.2.5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libdecor/libdecor.hash | 4 ++--
 package/libdecor/libdecor.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libdecor/libdecor.hash b/package/libdecor/libdecor.hash
index 69163f3227..d2b74878f9 100644
--- a/package/libdecor/libdecor.hash
+++ b/package/libdecor/libdecor.hash
@@ -1,4 +1,4 @@
-# From https://gitlab.freedesktop.org/libdecor/libdecor/-/releases/0.2.4/downloads/libdecor-0.2.4.tar.xz.sha256sum
-sha256  b17cf420e8dcb526bf82da5d36f8443a91fad0777083fa4ec5c1df8ee877416f  libdecor-0.2.4.tar.xz
+# From https://gitlab.freedesktop.org/libdecor/libdecor/-/releases/0.2.5/downloads/libdecor-0.2.5.tar.xz.sha256sum
+sha256  7fd50f780a4fee90a03f7b2c09055033e488654cbaff4a0c4bbae616bac9cd1c  libdecor-0.2.5.tar.xz
 # Locally calculated
 sha256  508a77d2e7b51d98adeed32648ad124b7b30241a8e70b2e72c99f92d8e5874d1  LICENSE
diff --git a/package/libdecor/libdecor.mk b/package/libdecor/libdecor.mk
index 26f4be40a6..e92c8a8040 100644
--- a/package/libdecor/libdecor.mk
+++ b/package/libdecor/libdecor.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBDECOR_VERSION = 0.2.4
+LIBDECOR_VERSION = 0.2.5
 LIBDECOR_SOURCE = libdecor-$(LIBDECOR_VERSION).tar.xz
 LIBDECOR_SITE = https://gitlab.freedesktop.org/libdecor/libdecor/-/releases/$(LIBDECOR_VERSION)/downloads
 LIBDECOR_LICENSE = MIT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
