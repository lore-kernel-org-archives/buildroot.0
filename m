Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B386D43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:30:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFDED4115D;
	Thu, 11 Dec 2025 19:30:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X13IjqaLEwfK; Thu, 11 Dec 2025 19:30:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2A9641181
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765481418;
	bh=+W1TN659yoVX4S8iasOdtk28S9Xic9vEFU32gZL8dz8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=O5upPzdB30qT02AXWJQBlQtZgd3BOVzlq94i8j3jkolXFft3mYjsHm6NfyHS6qayE
	 lwDZUngPjW/hmbdDOlfSxt0r0XzmWWIqhGoLx2Y5tTrYU6Y5TULi/fTlPDyGQ96udt
	 qacUV3xnNANNW4wW/cL5m2Q4/WtQW4jQvWXGBpyVB7iHMClpQRVPt5+MARaGiXTIUI
	 n9GUHTf05opdAvV7frQp+gNPZqfVYMVz4Nd5FTU8iumWMw0KFDlzvORFrX07RcLKRn
	 CRYyqCyriosBe96YnKmDaX0a8Sm+AA7tx3CDIOSndQtOoIGZtDjYJIldKn5j4LzLO2
	 CsN9j9XjbKMBA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D2A9641181;
	Thu, 11 Dec 2025 19:30:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 016AD2C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:30:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BAE83410DE
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1l-cAC-W1sje for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AA761410DB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id AA761410DB
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A9A5486BE5; Thu, 11 Dec 2025 19:29:54 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 10:57:01 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 44beca14a269d0c90ac62771ed7806f8c23c74c7
X-Git-Newrev: 8a405b4e2ed8e0e74b77ae1214c9ac4c870caacb
X-Patchwork-Hint: ignore
Message-Id: <20251211192954.A9A5486BE5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/racehound: switch
 project site
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

commit: https://git.buildroot.net/buildroot/commit/?id=8a405b4e2ed8e0e74b77ae1214c9ac4c870caacb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Previous repo is unavailable, switch to fork.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 655accbfeaeaf61816ff504cb01f795c4c37ceb0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/racehound/Config.in    | 2 +-
 package/racehound/racehound.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/racehound/Config.in b/package/racehound/Config.in
index 5b8bdc77bc..757743f79b 100644
--- a/package/racehound/Config.in
+++ b/package/racehound/Config.in
@@ -23,7 +23,7 @@ config BR2_PACKAGE_RACEHOUND
 	  - CONFIG_KALLSYMS_ALL
 	  - CONFIG_KPROBES
 
-	  https://github.com/winnukem/racehound
+	  https://github.com/kmrov/racehound
 
 comment "racehound needs an Linux kernel >= 3.14 to be built"
 	depends on !BR2_LINUX_KERNEL
diff --git a/package/racehound/racehound.mk b/package/racehound/racehound.mk
index 6499e166d8..93ce5c8e57 100644
--- a/package/racehound/racehound.mk
+++ b/package/racehound/racehound.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 RACEHOUND_VERSION = f09f06fcc3c77c8c5541be3ba5be80aa8148ce0c
-RACEHOUND_SITE = $(call github,winnukem,racehound,$(RACEHOUND_VERSION))
+RACEHOUND_SITE = $(call github,kmrov,racehound,$(RACEHOUND_VERSION))
 RACEHOUND_LICENSE = GPL-2.0
 RACEHOUND_LICENSE_FILES = LICENSE
 RACEHOUND_SUPPORTS_IN_SOURCE_BUILD = NO
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
