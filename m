Return-Path: <SRS0=pZJ6=P7=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 940B7C433F5
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:36:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4FD076102A
	for <buildroot@archiver.kernel.org>; Fri, 12 Nov 2021 13:36:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4FD076102A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BC1C4052D;
	Fri, 12 Nov 2021 13:36:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XjcTzNqZaHzU; Fri, 12 Nov 2021 13:36:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C24940542;
	Fri, 12 Nov 2021 13:36:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A15691BF405
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:36:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 90C36605D7
 for <buildroot@lists.busybox.net>; Fri, 12 Nov 2021 13:36:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WPRwrTsG5MVm for <buildroot@lists.busybox.net>;
 Fri, 12 Nov 2021 13:36:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E2BBC60658
 for <buildroot@buildroot.org>; Fri, 12 Nov 2021 13:36:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 353038B70F; Fri, 12 Nov 2021 13:32:10 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 12 Nov 2021 14:35:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7863327ea2fa92fb8bae2ddf42b7df001f3400a6
X-Git-Newrev: 907fc65bbb07b2d099d6b721e12abb60e1d22d0d
X-Patchwork-Hint: ignore
Message-Id: <20211112133210.353038B70F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire-media-session: needs
 alsa-lib-ucm
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

commit: https://git.buildroot.net/buildroot/commit/?id=907fc65bbb07b2d099d6b721e12abb60e1d22d0d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the
package in commit 51f30f47cd04efe494c8da37077bea860d3fbe14:

../src/alsa-endpoint.c:34:10: fatal error: alsa/use-case.h: No such file or directory
   34 | #include <alsa/use-case.h>
      |          ^~~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/bbf54d1bdb0f8f2d4f675ffdcbcbbf56562c3d7b

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pipewire-media-session/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pipewire-media-session/Config.in b/package/pipewire-media-session/Config.in
index d025cd4d75..affbc00c1a 100644
--- a/package/pipewire-media-session/Config.in
+++ b/package/pipewire-media-session/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_PIPEWIRE_MEDIA_SESSION
 	depends on BR2_USE_MMU # dbus
 	depends on BR2_PACKAGE_PIPEWIRE
 	select BR2_PACKAGE_ALSA_LIB
+	select BR2_PACKAGE_ALSA_LIB_UCM
 	select BR2_PACKAGE_DBUS
 	help
 	  Build pipewire media-session support
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
