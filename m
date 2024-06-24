Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E0AC30653
	for <buildroot@archiver.kernel.org>; Mon, 24 Jun 2024 20:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7FB0260B1E;
	Mon, 24 Jun 2024 20:02:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3jJ5nxmrjTQb; Mon, 24 Jun 2024 20:02:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B26C60B6F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B26C60B6F;
	Mon, 24 Jun 2024 20:02:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 369CD1BF473
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1B058608F4
 for <buildroot@lists.busybox.net>; Mon, 24 Jun 2024 20:02:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WTvHortgmRw7 for <buildroot@lists.busybox.net>;
 Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 083216072F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 083216072F
 for <buildroot@buildroot.org>; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0137382B64; Mon, 24 Jun 2024 20:02:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 24 Jun 2024 21:28:21 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 462fe09bd19f5b085bf9b06268fe4b763addb4a7
X-Git-Newrev: 0be7dc36881457ffb44b418c49587ac34a3fab03
X-Patchwork-Hint: ignore
Message-Id: <20240624200226.0137382B64@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/pine64/rock64: make the patches to
 be applied with fuzz 0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7361176046415129708=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7361176046415129708==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=0be7dc36881457ffb44b418c49587ac34a3fab03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit allows the U-Boot patch to be applied with fuzz factor 0.
The fuzz factor specifies how many lines of the patch can be inexactly
matched, so the value 0 requires all lines to be exactly matched.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 ...efile-rk3328-needs-itb-image-to-boot-properly.patch | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/board/pine64/rock64/patches/uboot/0001-Makefile-rk3328-needs-itb-image-to-boot-properly.patch b/board/pine64/rock64/patches/uboot/0001-Makefile-rk3328-needs-itb-image-to-boot-properly.patch
index 2d35b78daa..7c84736034 100644
--- a/board/pine64/rock64/patches/uboot/0001-Makefile-rk3328-needs-itb-image-to-boot-properly.patch
+++ b/board/pine64/rock64/patches/uboot/0001-Makefile-rk3328-needs-itb-image-to-boot-properly.patch
@@ -1,4 +1,4 @@
-From 211bf049084e6e374dac253138fa813682910146 Mon Sep 17 00:00:00 2001
+From d312c4e40bf816823bdcfd066dd2511b23e83c9c Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
 Date: Tue, 5 Feb 2019 22:08:54 +0100
 Subject: [PATCH] Makefile: rk3328 needs itb image to boot properly
@@ -7,16 +7,18 @@ Content-Type: text/plain; charset=UTF-8
 Content-Transfer-Encoding: 8bit
 
 Signed-off-by: Michał Łyszczek <michal.lyszczek@bofc.pl>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 ---
  Makefile | 5 +++++
  1 file changed, 5 insertions(+)
 
 diff --git a/Makefile b/Makefile
-index 8086f3c93e..a6425b5b03 100644
+index 149f83994814..ebbdf2596b9b 100644
 --- a/Makefile
 +++ b/Makefile
-@@ -799,6 +799,11 @@ ifneq ($(BUILD_ROM),)
- ALL-$(CONFIG_X86_RESET_VECTOR) += u-boot.rom
+@@ -923,6 +923,11 @@ ifeq ($(CONFIG_SYS_COREBOOT)$(CONFIG_SPL),yy)
+ ALL-$(CONFIG_BINMAN) += u-boot-x86-with-spl.bin
  endif
  
 +# rk3328 needs itb image to boot properly
@@ -24,9 +26,9 @@ index 8086f3c93e..a6425b5b03 100644
 +ALL-y += u-boot.itb
 +endif
 +
- # enable combined SPL/u-boot/dtb rules for tegra
- ifeq ($(CONFIG_TEGRA)$(CONFIG_SPL),yy)
- ALL-y += u-boot-tegra.bin u-boot-nodtb-tegra.bin
+ # Build a combined spl + u-boot image for sunxi
+ ifeq ($(CONFIG_ARCH_SUNXI)$(CONFIG_SPL),yy)
+ ALL-y += u-boot-sunxi-with-spl.bin
 -- 
-2.18.1
+2.43.0
 

--===============7361176046415129708==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7361176046415129708==--
