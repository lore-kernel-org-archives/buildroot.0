Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52EF1C3ABD8
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 11:06:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 35E757127D;
	Mon, 19 May 2025 11:06:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xLyla3JpYTBS; Mon, 19 May 2025 11:06:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67D2471280
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 67D2471280;
	Mon, 19 May 2025 11:06:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 32129D4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:49:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E874411B0
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v8U3UM5Nisbb for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:40:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CE4E6423E5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id CE4E6423E5
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:40:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CBF81872E7; Mon, 19 May 2025 10:40:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 18 May 2025 18:45:04 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 36f9436488c5fc640836eda96799305e114c6e9d
X-Git-Newrev: d2d5014a8e10e82debc5f9222ab931a21edbf0c8
X-Patchwork-Hint: ignore
Message-Id: <20250519104010.CBF81872E7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/heimdal: drop
 INSTALL_STAGING = YES
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=d2d5014a8e10e82debc5f9222ab931a21edbf0c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

HEIMDAL_INSTALL_STAGING = YES makes no sense since the package was
introduced in 56258f491bf459cbdb2cee1db3267030340755f0 ("heimdal: new
package") since it's a host only package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/heimdal/heimdal.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/heimdal/heimdal.mk b/package/heimdal/heimdal.mk
index f6c52f63aa..ed8826a741 100644
--- a/package/heimdal/heimdal.mk
+++ b/package/heimdal/heimdal.mk
@@ -8,7 +8,6 @@ HEIMDAL_VERSION = f4faaeaba371fff3f8d1bc14389f5e6d70ca8e17
 HEIMDAL_SITE = $(call github,heimdal,heimdal,$(HEIMDAL_VERSION))
 HOST_HEIMDAL_DEPENDENCIES = host-e2fsprogs host-ncurses host-pkgconf host-libxcrypt host-flex host-bison
 HOST_HEIMDAL_AUTORECONF = YES
-HEIMDAL_INSTALL_STAGING = YES
 # static because of -fPIC issues with e2fsprogs on x86_64 host
 HOST_HEIMDAL_CONF_OPTS = \
 	--disable-shared \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
