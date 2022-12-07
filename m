Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160ADC4708E
	for <buildroot@archiver.kernel.org>; Wed,  7 Dec 2022 13:33:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B691C81F24;
	Wed,  7 Dec 2022 13:33:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B691C81F24
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mFJfoTdQ4Z6z; Wed,  7 Dec 2022 13:33:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 101E781403;
	Wed,  7 Dec 2022 13:33:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 101E781403
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE9F21BF4D8
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 13:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C9D6240B67
 for <buildroot@lists.busybox.net>; Wed,  7 Dec 2022 13:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C9D6240B67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2LgjTQ-QB74j for <buildroot@lists.busybox.net>;
 Wed,  7 Dec 2022 13:33:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0DF5A405F5
 for <buildroot@buildroot.org>; Wed,  7 Dec 2022 13:33:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0DF5A405F5
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE1F485D9B; Wed,  7 Dec 2022 13:33:54 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 7 Dec 2022 09:38:11 +0100
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 48462e9fae8c49bfa216e04db0133f94a0e11db0
X-Git-Newrev: f91c90e080b270082f077688e8ceb5599dc802a3
X-Patchwork-Hint: ignore
Message-Id: <20221207133354.EE1F485D9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/kodi: add comment
 to display udev dependency for gbm when wayland/x11 are disabled
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

commit: https://git.buildroot.net/buildroot/commit/?id=f91c90e080b270082f077688e8ceb5599dc802a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

Without this additional comment only the comment

  kodi needs an OpenGL EGL backend with OpenGL or GLES support

is displayed which is not enough to guide users.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 8aa68a529ecdcf6f83d81a71863d59eb2147522b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/kodi/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 90710683db..7bd8bc2943 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -27,6 +27,9 @@ config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_GBM
 	depends on BR2_PACKAGE_HAS_UDEV # libinput
 	select BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
 
+comment "kodi needs udev support for gbm"
+	depends on !BR2_PACKAGE_KODI_PLATFORM_SUPPORTS
+
 config BR2_PACKAGE_KODI_PLATFORM_SUPPORTS_WAYLAND
 	bool
 	default y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
