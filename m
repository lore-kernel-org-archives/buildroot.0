Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EEBCD13DE
	for <buildroot@archiver.kernel.org>; Sat, 31 Aug 2024 16:25:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FF3D80A9E;
	Sat, 31 Aug 2024 16:25:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9Zezb-T7ytbI; Sat, 31 Aug 2024 16:25:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7A30880D78
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7A30880D78;
	Sat, 31 Aug 2024 16:25:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 55CB71BF2C3
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 16:25:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4372C4026B
 for <buildroot@lists.busybox.net>; Sat, 31 Aug 2024 16:25:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GMMkxK_EOM6o for <buildroot@lists.busybox.net>;
 Sat, 31 Aug 2024 16:24:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39D30400B9
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39D30400B9
 for <buildroot@buildroot.org>; Sat, 31 Aug 2024 16:24:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 345F386784; Sat, 31 Aug 2024 16:24:59 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 31 Aug 2024 16:20:54 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: d2a0b6bfbd1234d20f18c27de78e113c2d5bdf62
X-Git-Newrev: fe60ac7a779c7cc958eb2046834ce481cc65deee
X-Patchwork-Hint: ignore
Message-Id: <20240831162459.345F386784@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/hostapd: drop
 duplicate host-pkgconf dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fe60ac7a779c7cc958eb2046834ce481cc65deee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

host-pkgconf already defined as dependency in package ingress.

Signed-off-by: Joachim Wiberg <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 2dc37e5c5b216b2e93f05c015a16a52b9402693f)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/hostapd/hostapd.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 8981d9247e..5756510e1d 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -25,7 +25,7 @@ HOSTAPD_CONFIG_DISABLE =
 
 # Try to use openssl if it's already available
 ifeq ($(BR2_PACKAGE_LIBOPENSSL),y)
-HOSTAPD_DEPENDENCIES += host-pkgconf libopenssl
+HOSTAPD_DEPENDENCIES += libopenssl
 HOSTAPD_LIBS += `$(PKG_CONFIG_HOST_BINARY) --libs openssl`
 HOSTAPD_CONFIG_EDITS += 's/\#\(CONFIG_TLS=openssl\)/\1/'
 else
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
