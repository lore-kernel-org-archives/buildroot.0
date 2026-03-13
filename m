Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A862107BCFE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 07:58:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1C59B60EFB;
	Sat, 14 Mar 2026 07:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NEvO6xCsXu67; Sat, 14 Mar 2026 07:58:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 30F6660F7A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773475125;
	bh=auHRV8rPGr1NJnB7eLo2+ZAZlJWQeHP5NXobHuHgUYA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Frth0mBTyqBqvurRssph0UYWSgNNvD0nBOM0RR3jOv6vPA6UKWfQprx5owgwApd7o
	 hJRWSYvXvLCgySEULgPskJiEDJE5yOmCd2uW0WGfTDJJaTue5IYl8I51C9EPu9G8zO
	 KkxzDAyx/yo1hgPfyAkzM0KMA5sgNQgKcDfuIhQbBuRaYNHWw1CksSCyDF46o30iAv
	 Pzm4P2z7zBctFS+woSmdU9T+dzIJWPXFAp2b0PkqRK7n5gKn3oUA3zVZMyTBHbxGOR
	 ze8+qRAh9p3MAChM3NZbpVeVYVYrCWi0GNayiWL4256PU66JV9Ixps/OQsDvOi+ykA
	 9Rn07KbBbeBdw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 30F6660F7A;
	Sat, 14 Mar 2026 07:58:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 16BA11B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:58:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 65D5D60EF3
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O-YDvvGGEyUN for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 07:58:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B702B60EF8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B702B60EF8
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 07:58:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DC18186365; Sat, 14 Mar 2026 07:58:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 13 Mar 2026 16:04:40 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0e98503e3040b957fafcb9693c0edeb8c2a356ce
X-Git-Newrev: b6c5853350886c7c9cd157fe9f60d7ee5cccd0a6
X-Patchwork-Hint: ignore
Message-Id: <20260314075838.DC18186365@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libtpms: security
 bump version to 0.10.2
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/b6c5853350886c7c9cd157fe9f60d7ee5cccd0a6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

https://github.com/stefanberger/libtpms/blob/v0.10.2/CHANGES

Fixes CVE-2026-21444.

Added comment to hash file about locally computed hashes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit b1c4276c2d0fb266ccf08c03b8d50961b8f7553b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libtpms/libtpms.hash | 3 ++-
 package/libtpms/libtpms.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libtpms/libtpms.hash b/package/libtpms/libtpms.hash
index f10364f36e..175e6e3af6 100644
--- a/package/libtpms/libtpms.hash
+++ b/package/libtpms/libtpms.hash
@@ -1,2 +1,3 @@
-sha256  ebc24f3191d90f6cf0b4d4200cd876db4bd224b3c565708bbea0a82ee275e0fb  libtpms-0.10.1.tar.gz
+# Locally computed
+sha256  edac03680f8a4a1c5c1d609a10e3f41e1a129e38ff5158f0c8deaedc719fb127  libtpms-0.10.2.tar.gz
 sha256  82f1e6bae374bb6a9d4f4596767fd33e499718d560de140fd9f3d402cc5e41fb  LICENSE
diff --git a/package/libtpms/libtpms.mk b/package/libtpms/libtpms.mk
index 6e5708202e..7bc69a50d6 100644
--- a/package/libtpms/libtpms.mk
+++ b/package/libtpms/libtpms.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTPMS_VERSION = 0.10.1
+LIBTPMS_VERSION = 0.10.2
 LIBTPMS_SITE = $(call github,stefanberger,libtpms,v$(LIBTPMS_VERSION))
 LIBTPMS_LICENSE = BSD-4-Clause
 LIBTPMS_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
