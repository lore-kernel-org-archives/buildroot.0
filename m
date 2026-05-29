Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBEBECD4F54
	for <buildroot@archiver.kernel.org>; Fri, 29 May 2026 16:14:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8F443614F3;
	Fri, 29 May 2026 16:14:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KrzgfHb-RmYL; Fri, 29 May 2026 16:14:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4BFB614EC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780071260;
	bh=Y01heUptRHQoCDlU/myG67rui7eTz+zKez4jos8etoY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=X5J66RlhMq0k0wz+obdx8S+a3yECgB4jBgAItQJStBHd3l6PwDueKfEoP0wBNsEb9
	 1Gzi7Hoar22dUYZZwV/SKes4TkgWfTJ49I87q3bQFjO5/HU1aizbZ1i+Sml1eCJSoN
	 y9CNqEIU65cdU3qEru+jszpv3a3sSWWUz3iUQiFxIY2z8p/TFHHaYxHPMTmExC30mh
	 JY+FR+7olCLp87caIYCdkNESNyl6rBG6Qg/n0FY5bTHpAthDguCt05FqaCkDf8xDPT
	 nfYkHGq9n4PjJe5qqCzZ0tf37Do26YhLuhNfDwxExWKKpZu9SkYyQwH8dyVusc5I8K
	 jBu0VsrytwXIQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4BFB614EC;
	Fri, 29 May 2026 16:14:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 08DB4F4
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB9D3421EB
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:14:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7Z_hDH9LmrLI for <buildroot@buildroot.org>;
 Fri, 29 May 2026 16:14:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54F0B421F0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 54F0B421F0
 for <buildroot@buildroot.org>; Fri, 29 May 2026 16:14:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B08DE873F2; Fri, 29 May 2026 16:14:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 29 May 2026 18:13:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 06377680ae681de5b223cf1eeaae511449def0a7
X-Git-Newrev: 69dbd64802e5714bb9622e9de185e6d9984fa996
X-Patchwork-Hint: ignore
Message-Id: <20260529161405.B08DE873F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libks: bump version to 2.0.11
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/69dbd64802e5714bb9622e9de185e6d9984fa996
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Changes: https://github.com/signalwire/libks/compare/v2.0.5...v2.0.11

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Arnout Vandecappelle <arnout@rnout.be>
---
 package/libks/libks.hash | 2 +-
 package/libks/libks.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libks/libks.hash b/package/libks/libks.hash
index de16d0b029..681fe3692f 100644
--- a/package/libks/libks.hash
+++ b/package/libks/libks.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  8525dd943cf970c860cd2596207c7ba6646c9e1f407e350fc0a39b76af75e625  libks-2.0.5.tar.gz
+sha256  7142800a0c9095ce0e52308c815026a8ad2a197f519363c050fe441039de20be  libks-2.0.11.tar.gz
 sha256  3aba376a08bf91c95518532e627157f0ee3ab2712d1198463e2b1ac9186dd142  copyright
diff --git a/package/libks/libks.mk b/package/libks/libks.mk
index 2de6b727dd..53bec7dcdc 100644
--- a/package/libks/libks.mk
+++ b/package/libks/libks.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBKS_VERSION = 2.0.5
+LIBKS_VERSION = 2.0.11
 LIBKS_SITE = $(call github,signalwire,libks,v$(LIBKS_VERSION))
 LIBKS_LICENSE = MIT
 LIBKS_LICENSE_FILES = copyright
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
