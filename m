Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5774CD4F39
	for <buildroot@archiver.kernel.org>; Thu, 14 May 2026 15:02:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0C75340F77;
	Thu, 14 May 2026 15:02:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 18cEviQ7JYJL; Thu, 14 May 2026 15:02:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E221D40F63
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778770931;
	bh=Qvj3dh1Fg6+5zGtpTVRuNQ7sdeKWCNztU2wCY2iZuNY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XwyGMi6pV6e8uA5k7PPuNkHP0oZuTvDkxeUrSgHF39aXFkzwIx0qpCxPGHTDdPFhv
	 HhHb8FtMsyxBSmoMZw02r7wU3LkINRQaHAInFn5ljMpAXsVK1Zfm8Zj0u4Y8otSLw7
	 P3X2c4fuN0wxshXbxXtHhDkhWLi5MbBQuNACBhNNip0pEMObx6wx1DUZxXWwSt1WD2
	 fa3E6bjCejr2hcUZbwNlJD/T+AaFRC9m3j5bgJJj2wSixkAnSOk0GQCf1N6n6GNVNY
	 SbwePd/3O1jUa9oLDnG1QpT9rIAFYFkkf1B3lN0+1ZztfOQEPtEOXa1Z5YiE8UlvfL
	 PC3ov8U4iW2bw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E221D40F63;
	Thu, 14 May 2026 15:02:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 87DD842B
 for <buildroot@buildroot.org>; Thu, 14 May 2026 15:02:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6B20940714
 for <buildroot@buildroot.org>; Thu, 14 May 2026 15:02:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PbzCoWzKk3IQ for <buildroot@buildroot.org>;
 Thu, 14 May 2026 15:02:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A6FDD40713
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A6FDD40713
 for <buildroot@buildroot.org>; Thu, 14 May 2026 15:02:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 668E88622A; Thu, 14 May 2026 15:02:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 14 May 2026 15:44:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9f8505151975a69b721ab7a75af8f7aa2125c22d
X-Git-Newrev: 54ddc1e991df300f71ec059d7f04e6818f3f7856
X-Patchwork-Hint: ignore
Message-Id: <20260514150201.668E88622A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/libsepol: bump version
 to 3.10
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/54ddc1e991df300f71ec059d7f04e6818f3f7856
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/next

https://github.com/SELinuxProject/selinux/releases/download/3.10/RELEASE-3.10.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libsepol/libsepol.hash | 2 +-
 package/libsepol/libsepol.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libsepol/libsepol.hash b/package/libsepol/libsepol.hash
index 08a1bf0cc2..9c0be9c902 100644
--- a/package/libsepol/libsepol.hash
+++ b/package/libsepol/libsepol.hash
@@ -1,5 +1,5 @@
 # From: https://github.com/SELinuxProject/selinux/wiki/Releases
-sha256  ba630b59e50c5fbf9e9dd45eb3734f373cf78d689d8c10c537114c9bd769fa2e  libsepol-3.9.tar.gz
+sha256  d555586797fa9f38344496d2a7ec1147b6caaf3fcc44c42d8d5173edd7a79a71  libsepol-3.10.tar.gz
 
 # Hash for license file
 sha256  6095e9ffa777dd22839f7801aa845b31c9ed07f3d6bf8a26dc5d2dec8ccc0ef3  LICENSE
diff --git a/package/libsepol/libsepol.mk b/package/libsepol/libsepol.mk
index 3e1a275808..52f07b4df7 100644
--- a/package/libsepol/libsepol.mk
+++ b/package/libsepol/libsepol.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBSEPOL_VERSION = 3.9
+LIBSEPOL_VERSION = 3.10
 LIBSEPOL_SITE = https://github.com/SELinuxProject/selinux/releases/download/$(LIBSEPOL_VERSION)
 LIBSEPOL_LICENSE = LGPL-2.1+
 LIBSEPOL_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
