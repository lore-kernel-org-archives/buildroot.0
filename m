Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A0EC32771
	for <buildroot@archiver.kernel.org>; Tue, 16 Aug 2022 08:35:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73C3181C04;
	Tue, 16 Aug 2022 08:35:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73C3181C04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id trcs3C7E8K_4; Tue, 16 Aug 2022 08:35:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 587B381B48;
	Tue, 16 Aug 2022 08:35:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 587B381B48
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D94A31BF2A4
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4A2360E61
 for <buildroot@lists.busybox.net>; Tue, 16 Aug 2022 08:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4A2360E61
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t0NGoyMHkz2D for <buildroot@lists.busybox.net>;
 Tue, 16 Aug 2022 08:35:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0CC6D60E39
 for <buildroot@buildroot.org>; Tue, 16 Aug 2022 08:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0CC6D60E39
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id D30588773C; Tue, 16 Aug 2022 08:20:38 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 16 Aug 2022 10:17:48 +0200
X-Git-Refname: refs/heads/2022.05.x
X-Git-Oldrev: abfdae4eb263e8c8ff90a6ff8b176c365759edcd
X-Git-Newrev: 3628685a288ea0ad7248acab8ca884154ab6b4aa
X-Patchwork-Hint: ignore
Message-Id: <20220816082038.D30588773C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.05.x] package/netsniff-ng:
 disable geoip and zlib if neeeded
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

commit: https://git.buildroot.net/buildroot/commit/?id=3628685a288ea0ad7248acab8ca884154ab6b4aa
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.05.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit fd0883ba2107add7b2b987195c5abfbcc86117bf)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/netsniff-ng/netsniff-ng.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/netsniff-ng/netsniff-ng.mk b/package/netsniff-ng/netsniff-ng.mk
index 3bc11b55b9..2b5b19b27f 100644
--- a/package/netsniff-ng/netsniff-ng.mk
+++ b/package/netsniff-ng/netsniff-ng.mk
@@ -27,6 +27,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_GEOIP),y)
 NETSNIFF_NG_DEPENDENCIES += geoip
+else
+NETSNIFF_NG_CONF_OPTS += --disable-geoip
 endif
 
 ifeq ($(BR2_PACKAGE_LIBNL),y)
@@ -41,6 +43,8 @@ endif
 
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 NETSNIFF_NG_DEPENDENCIES += zlib
+else
+NETSNIFF_NG_CONF_OPTS += --disable-zlib
 endif
 
 # hand-written configure script and makefile
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
