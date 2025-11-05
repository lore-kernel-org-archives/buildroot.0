Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75CA0CEBF91
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:08:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10B1D41480;
	Mon, 17 Nov 2025 20:08:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KQpu13rav06I; Mon, 17 Nov 2025 20:08:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1462F4145B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1462F4145B;
	Mon, 17 Nov 2025 20:08:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0EEEF1BA
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8682B612D5
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fsbGcgwOK0SM for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:07:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9A9E6137C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E9A9E6137C
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E845F8405F; Mon, 17 Nov 2025 20:07:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Nov 2025 16:50:54 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: e28f5f0f374efcd70aa1a57a2cbb093f47611b06
X-Git-Newrev: afa914efa6b827bb6514e52f9e3d9082525cd463
X-Patchwork-Hint: ignore
Message-Id: <20251117200752.E845F8405F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/bind: enable
 parallel builds
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

commit: https://git.buildroot.net/buildroot/commit/?id=afa914efa6b827bb6514e52f9e3d9082525cd463
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Buildroot commit e4749b826c04cda213768332f67ffb82f06105b2 disabled
parallel builds back in 2016. Nearly 10 years and a "Complete rewrite
[of] the BIND 9 build system" later

https://gitlab.isc.org/isc-projects/bind9/-/commit/978c7b2e89aa37a7ddfe2f6b6ba12ce73dd04528

we enable parallel builds again, make -j1000 finished without problems.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 6a20a930fd7a10aecd2b217a643a60a748eb986f)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/bind/bind.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/bind/bind.mk b/package/bind/bind.mk
index d137245ef9..64cf2fa9fb 100644
--- a/package/bind/bind.mk
+++ b/package/bind/bind.mk
@@ -7,8 +7,6 @@
 BIND_VERSION = 9.18.33
 BIND_SOURCE= bind-$(BIND_VERSION).tar.xz
 BIND_SITE = https://ftp.isc.org/isc/bind9/$(BIND_VERSION)
-# bind does not support parallel builds.
-BIND_MAKE = $(MAKE1)
 BIND_INSTALL_STAGING = YES
 BIND_LICENSE = MPL-2.0
 BIND_LICENSE_FILES = COPYRIGHT
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
