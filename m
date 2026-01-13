Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21D31D30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:59:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EB83E60DBD;
	Tue, 13 Jan 2026 20:59:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5GxU5CdRygjy; Tue, 13 Jan 2026 20:59:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1B54E60DE9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337958;
	bh=btgKKQYadUo1NtsIG2TgZPfYZ2k3bIfn5m6tjLpyO24=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=gb1/ohO0/VWka9+qCNDRT7Mgm4YrtxO/8lSYsWbuvcYDNsYKVoCPFVSfa3LphV0Y1
	 U4Fuy7CETARmhatxmafE4udQYJpAhUrIw5o4t/wxLUy9PHsGbIRaZvfLySaDHY+b0p
	 6Agi+FzHsn5HG6ace4kT7+Dzve133IoivhFLPj6lV1BhWBUDFsa+XPyjfKf9t0nVJU
	 A9hNo/UVuVHnk1yp1QfX3skjTF+QzTX3xdsODF/2eFQQO74WcOKFrIWGnd12YkvXuU
	 ra/A9LRiolKRbMVznJ2wQWs8r+wsHRqTG/zoLdnBvRmAuCdL89m4Sh5Gs8N9C4BLWe
	 d35fc8q4WB7lA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B54E60DE9;
	Tue, 13 Jan 2026 20:59:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id EAB21231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C545407AB
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dzNSAuEXBjxj for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9765C40730
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9765C40730
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 95C7B84685; Tue, 13 Jan 2026 20:58:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 4f4b9b31e7b5fd0b3d8331f0093b708242e9aa4e
X-Git-Newrev: 3d0656bf489df152c65dcd317b2ac9f63aac1f6b
X-Patchwork-Hint: ignore
Message-Id: <20260113205846.95C7B84685@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xapp_twm: bump version to
 1.0.13.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d0656bf489df152c65dcd317b2ac9f63aac1f6b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2025-May/003600.html
https://lists.x.org/archives/xorg-announce/2025-May/003599.html

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/x11r7/xapp_twm/xapp_twm.hash | 6 +++---
 package/x11r7/xapp_twm/xapp_twm.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/x11r7/xapp_twm/xapp_twm.hash b/package/x11r7/xapp_twm/xapp_twm.hash
index 75d89a9984..c2ed52c07a 100644
--- a/package/x11r7/xapp_twm/xapp_twm.hash
+++ b/package/x11r7/xapp_twm/xapp_twm.hash
@@ -1,5 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2022-April/003135.html
-sha256  aaf201d4de04c1bb11eed93de4bee0147217b7bdf61b7b761a56b2fdc276afe4  twm-1.0.12.tar.xz
-sha512  f3d68df7e06516f6b74f19181efcfd9db2479c8ea0c72c3a6ed0dc1b222405b40d81a2dea17b662955e0c1783e87d0d3eb067c3b6e7c6eed8c0d38d03d362260  twm-1.0.12.tar.xz
+# From https://lists.x.org/archives/xorg-announce/2025-May/003600.html
+sha256  a52534755aa8b492c884e52fa988bac84ab4d54641954679b9aaf08e323df2c5  twm-1.0.13.1.tar.xz
+sha512  6976e62c322d4d7e15501a290b65a771101a23f3ff7733b039215b583f12da9db22048947a4851a88f08c74b72c310891e721291487e63972da23819f8ae9656  twm-1.0.13.1.tar.xz
 # Locally computed
 sha256  4809ffc9656bc9a704e19ab467d1cedc97c48c9d1f9a4018e6d99d2e61f75945  COPYING
diff --git a/package/x11r7/xapp_twm/xapp_twm.mk b/package/x11r7/xapp_twm/xapp_twm.mk
index b222830497..00e43f00bd 100644
--- a/package/x11r7/xapp_twm/xapp_twm.mk
+++ b/package/x11r7/xapp_twm/xapp_twm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XAPP_TWM_VERSION = 1.0.12
+XAPP_TWM_VERSION = 1.0.13.1
 XAPP_TWM_SOURCE = twm-$(XAPP_TWM_VERSION).tar.xz
-XAPP_TWM_SITE = http://xorg.freedesktop.org/releases/individual/app
+XAPP_TWM_SITE = https://xorg.freedesktop.org/archive/individual/app
 XAPP_TWM_LICENSE = MIT
 XAPP_TWM_LICENSE_FILES = COPYING
 XAPP_TWM_DEPENDENCIES = \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
