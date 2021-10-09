Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F155C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 10:33:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61CAD60F55
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 10:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 61CAD60F55
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=korsgaard.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 040D540502;
	Sat,  9 Oct 2021 10:33:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qLJCi3hMl-y9; Sat,  9 Oct 2021 10:33:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2295640431;
	Sat,  9 Oct 2021 10:33:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DB92B1BF391
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 10:32:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C8B5383984
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 10:32:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4pE2UJPQZUxP for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 10:32:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23EB082D0C
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 10:32:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 7D10E9357E; Sat,  9 Oct 2021 10:30:09 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 9 Oct 2021 12:32:19 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2c2c135e4f4c4d6994d4c6bf35d52edae99f5d25
X-Git-Newrev: 2048405191cae83d3ba2ec4c1953e8c8e78df758
X-Patchwork-Hint: ignore
Message-Id: <20211009103009.7D10E9357E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libinput: bump version to 1.19.1
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

commit: https://git.buildroot.net/buildroot/commit/?id=2048405191cae83d3ba2ec4c1953e8c8e78df758
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For details see [1].

[1] https://lists.freedesktop.org/archives/wayland-devel/2021-September/041989.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libinput/libinput.hash | 6 +++---
 package/libinput/libinput.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/libinput/libinput.hash b/package/libinput/libinput.hash
index 7d57ae9b2d..0f0b12bc49 100644
--- a/package/libinput/libinput.hash
+++ b/package/libinput/libinput.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/wayland-devel/2021-September/041977.html
-sha256  3d3a2f12b4a65cd82684121ae4b33cdc3ad541c761a55e8eb73a8e5e443cccbb  libinput-1.19.0.tar.xz
-sha512  daf42ce797f2b5aef8d6f7a5c0d967590581e6ac12c26fa6bde5fbc619d75319e39ca55d65d5347e554dd6a48b91f5fed4d3167eabef8ad1ebc43bc0c3e8e220  libinput-1.19.0.tar.xz
+# From https://lists.freedesktop.org/archives/wayland-devel/2021-September/041989.html
+sha256  0bdcf5b1783b737854b7af1ca22df67bc36a6fe7c9cfa71f01e9149f9220446d  libinput-1.19.1.tar.xz
+sha512  63084f5e081ee4918fee8584d99e6feb84ce9b771015c556c930843e0097abb9b93b6f9731c488b8493eac18fa4086f4822a2ed00f3cb3258346341ad0061c36  libinput-1.19.1.tar.xz
 
 # License files
 sha256  80de50b2022a840db044c56db804ca3565600a692c0714babface587acc6d1b0  COPYING
diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 3ab1a2c38f..0c232994df 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBINPUT_VERSION = 1.19.0
+LIBINPUT_VERSION = 1.19.1
 LIBINPUT_SOURCE = libinput-$(LIBINPUT_VERSION).tar.xz
 LIBINPUT_SITE = http://www.freedesktop.org/software/libinput
 LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
