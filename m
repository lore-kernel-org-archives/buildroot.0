Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE6AAC43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 10:31:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 56ADB40B9E;
	Sun, 24 Jul 2022 10:31:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 56ADB40B9E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2VK-1EhdEcb5; Sun, 24 Jul 2022 10:31:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C4CA40359;
	Sun, 24 Jul 2022 10:31:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C4CA40359
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DDFF1BF2E4
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15A4B424C3
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 10:31:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15A4B424C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bN5B8sO-pk9J for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 10:31:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C160424BE
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 10:31:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C160424BE
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5FE1A85BF3; Sun, 24 Jul 2022 10:17:53 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 24 Jul 2022 12:28:27 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 20c9e5cfd406751f090072d0c532fa8f4c9591af
X-Git-Newrev: 5bbbf1ba584d760980eb243dc5da0c2d4bfc8bb9
X-Patchwork-Hint: ignore
Message-Id: <20220724101753.5FE1A85BF3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/hackrf: drop unrecognized option
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

commit: https://git.buildroot.net/buildroot/commit/?id=5bbbf1ba584d760980eb243dc5da0c2d4bfc8bb9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop BUILD_HACKRF_TOOLS which has never been recognized since the
addition of the package in commit
29b7cc88f401dcc69a085be5af067851f896da58

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/hackrf/hackrf.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/hackrf/hackrf.mk b/package/hackrf/hackrf.mk
index d80f87e6b9..6d694f5fbc 100644
--- a/package/hackrf/hackrf.mk
+++ b/package/hackrf/hackrf.mk
@@ -13,8 +13,6 @@ HACKRF_DEPENDENCIES = fftw-single libusb
 HACKRF_SUBDIR = host
 HACKRF_INSTALL_STAGING = YES
 
-HACKRF_CONF_OPTS += -DBUILD_HACKRF_TOOLS=ON
-
 ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
 HACKRF_CONF_OPTS += \
 	-DINSTALL_UDEV_RULES=ON \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
