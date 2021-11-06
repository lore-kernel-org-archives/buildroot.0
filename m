Return-Path: <SRS0=GWv0=PZ=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4016C433EF
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:47:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 37E0E60F9E
	for <buildroot@archiver.kernel.org>; Sat,  6 Nov 2021 10:47:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 37E0E60F9E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E6A15405CF;
	Sat,  6 Nov 2021 10:47:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2mXFzGtX6oIz; Sat,  6 Nov 2021 10:47:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F3CA405F8;
	Sat,  6 Nov 2021 10:47:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1209E1BF476
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:47:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 02056405CF
 for <buildroot@lists.busybox.net>; Sat,  6 Nov 2021 10:47:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id G1NvCKHrznsm for <buildroot@lists.busybox.net>;
 Sat,  6 Nov 2021 10:47:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6756B405CD
 for <buildroot@buildroot.org>; Sat,  6 Nov 2021 10:47:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C869A884F6; Sat,  6 Nov 2021 10:43:50 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 6 Nov 2021 11:47:21 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 18911c935cb0b904ab4a0e669774d962e57202f4
X-Git-Newrev: 27908c6eab768d0b9fd3444a929b3f1b1510da71
X-Patchwork-Hint: ignore
Message-Id: <20211106104350.C869A884F6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: drop dbus from Config.in
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

commit: https://git.buildroot.net/buildroot/commit/?id=27908c6eab768d0b9fd3444a929b3f1b1510da71
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit d9796f2db9866060b916487784b046bb6b76f9b6 forgot to removed dbus
from Config.in

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pipewire/Config.in | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index 506b85e856..1f48a4b50f 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -1,11 +1,10 @@
 config BR2_PACKAGE_PIPEWIRE
 	bool "pipewire"
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HAS_THREADS # dbus
-	depends on BR2_USE_MMU # dbus
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO if BR2_PACKAGE_BLUEZ5_UTILS # runtime
-	select BR2_PACKAGE_DBUS
 	help
 	  PipeWire is a server and user space API to deal with
 	  multimedia pipelines.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
