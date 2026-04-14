Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8063DF9D0EC
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 17:57:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 51661404F9;
	Tue, 14 Apr 2026 17:57:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lrjM78uR92OX; Tue, 14 Apr 2026 17:57:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 71ABB42C79
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776189478;
	bh=VItZc/jDGTlIsltbspGTsREliFnqseLdhooLylEXmB8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=MVzZzi6I96AWDmjm+prua7nJ1mrxv0a0tF2YoqZV/hEmn32vRMWTxBRk8mjOVTG36
	 FE9KPau7jiRIRDePVNWO5HwVqz5EllH3COVzB1OOOWnUTEEqUn4Yy3Hfzrqt6VC6hQ
	 bnIR3dV+JPu2Q3tXoPXWx6L3DvuQJk22pBV7ErNSQXdEqg7YJceh5NE+c/kz0vDWpx
	 X1xma46gDBqIRAOfPGc3Lq+3afSgVkSljYsEvHq6YdtzxGEeC+XWyhdoi7UhCWJwlc
	 9vjBv3KuoK7BuEaoXq2f2zFTLz+4RFbhWeSb3Inu6dkYZgJL4Qb7v7RvoxDUHRUsBr
	 Lissus5N0ichg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71ABB42C79;
	Tue, 14 Apr 2026 17:57:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E179E375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:57:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C769A42C79
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:57:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCd14NOk9DHa for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 17:57:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E7063404F9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id E7063404F9
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 17:57:55 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7C89C7FF22; Tue, 14 Apr 2026 17:57:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 14 Apr 2026 19:56:14 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: cdbe16042abccf7a1089e210b6643517f5fabfe5
X-Git-Newrev: 4264a174b0450e0d966d479c79c979c7d8dab761
X-Patchwork-Hint: ignore
Message-Id: <20260414175755.7C89C7FF22@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libplacebo: bump version to 7.360.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/4264a174b0450e0d966d479c79c979c7d8dab761
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://code.videolan.org/videolan/libplacebo/-/tags/v7.360.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/libplacebo/libplacebo.hash | 2 +-
 package/libplacebo/libplacebo.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libplacebo/libplacebo.hash b/package/libplacebo/libplacebo.hash
index a8d34c3fd2..ef6d5bdd10 100644
--- a/package/libplacebo/libplacebo.hash
+++ b/package/libplacebo/libplacebo.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  0d4adc5cbe7b3691c2c77fed1b9e94a00fcd2c2637a301aa2b522c093139e5c0  libplacebo-v7.360.0-git4.tar.gz
+sha256  8fb4d54ad9339e3530446f13b6a670b3819a00e295a55f675f0515d9dd94f52a  libplacebo-v7.360.1-git4.tar.gz
 sha256  b3aa400aca6d2ba1f0bd03bd98d03d1fe7489a3bbb26969d72016360af8a5c9d  LICENSE
diff --git a/package/libplacebo/libplacebo.mk b/package/libplacebo/libplacebo.mk
index cb53248624..e03f224971 100644
--- a/package/libplacebo/libplacebo.mk
+++ b/package/libplacebo/libplacebo.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPLACEBO_VERSION = v7.360.0
+LIBPLACEBO_VERSION = v7.360.1
 LIBPLACEBO_SITE = https://code.videolan.org/videolan/libplacebo.git
 LIBPLACEBO_SITE_METHOD = git
 LIBPLACEBO_GIT_SUBMODULES = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
