Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F72AC5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B33581114;
	Fri, 31 Jul 2026 11:56:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5UktUHH4HzaO; Fri, 31 Jul 2026 11:56:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3A8F2810BC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499018;
	bh=oL2RRuwjwMxtD3x4jNLl47SNze8ZsH23LUOe0gl1SWA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=fiuw0n4m4kkT4Ay5MorqLADCrHAfwU+1E1x+ZId5UrDsC59olPd4yZQCcksTaQdg3
	 sDZJYWVJcz7oRlOnkP7/f1hq3V2GL9GKwXFoS6V84NmwT9uYVKSXurA4lA52hFTyDw
	 4RcI3jsRIucl3WncqmsaFejN70+SJbJcXlKKtaua2zSCeVwEOlwdbTieC/zFkCbdF/
	 02DwH1QFD0/nyNNmBForkWbSYpwpaqy24/kkgGWY5Xd3tZX1qL67fyI7prnyO94QmK
	 ZvndP+acc4BXW3PanUzYhC5WhcwUpQVorUZfTgKvRYjTko78p+v8yaiReXRm/kZKJl
	 /Yc4QCm1xAigA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A8F2810BC;
	Fri, 31 Jul 2026 11:56:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B76A69
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E104D60AB3
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CFIDgfOk9jaA for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:56:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 891BA60825
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 891BA60825
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:56:48 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7802F8B741; Fri, 31 Jul 2026 11:56:05 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 11:44:20 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: 9cb109e5b33404010a22f688b7c45d25b5c4d79c
X-Git-Newrev: 031a4acf6fe6bf0e57ad551456e7fa41f7cefcab
X-Patchwork-Hint: ignore
Message-Id: <20260731115605.7802F8B741@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/nettle: clarify
 license info
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/031a4acf6fe6bf0e57ad551456e7fa41f7cefcab
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

The Nettle manual (nettle.html in the source archive) states:

> Nettle is dual licenced under the GNU General Public License version
> 2 or later, and the GNU Lesser General Public License version 3 or
> later. When using Nettle, you must comply fully with all conditions
> of at least one of these licenses. [...]

This means "or" is the correct description. Ellipsis covers a note
that a few files are licensed more permissively.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 9a77d5547afd32123eee493d42eeacf041c5a980)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/nettle/nettle.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
index 93c638a4cd..dbbd60622d 100644
--- a/package/nettle/nettle.mk
+++ b/package/nettle/nettle.mk
@@ -8,7 +8,7 @@ NETTLE_VERSION = 3.10.2
 NETTLE_SITE = $(BR2_GNU_MIRROR)/nettle
 NETTLE_DEPENDENCIES = host-m4 gmp
 NETTLE_INSTALL_STAGING = YES
-NETTLE_LICENSE = Dual GPL-2.0+/LGPL-3.0+
+NETTLE_LICENSE = GPL-2.0+ or LGPL-3.0+
 NETTLE_LICENSE_FILES = COPYING.LESSERv3 COPYINGv2
 NETTLE_CPE_ID_VALID = YES
 # don't include openssl support for (unused) examples as it has problems
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
