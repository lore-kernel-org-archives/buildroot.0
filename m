Return-Path: <SRS0=IJqM=OO=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61F0EC433EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 19:56:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 02A346103B
	for <buildroot@archiver.kernel.org>; Fri, 24 Sep 2021 19:56:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 02A346103B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEC6B40215;
	Fri, 24 Sep 2021 19:56:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sqt0EEsWdx4T; Fri, 24 Sep 2021 19:56:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C4E2140210;
	Fri, 24 Sep 2021 19:56:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 382321BF870
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 19:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26EDC400D4
 for <buildroot@lists.busybox.net>; Fri, 24 Sep 2021 19:56:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QfqVPYyyiI1I for <buildroot@lists.busybox.net>;
 Fri, 24 Sep 2021 19:56:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38C5340210
 for <buildroot@buildroot.org>; Fri, 24 Sep 2021 19:56:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 65C808D228; Fri, 24 Sep 2021 19:54:26 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 24 Sep 2021 21:49:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: f05136090de781d038070b1b197fb868c7c339cd
X-Git-Newrev: 83541769159ed7a8241cf82ab56db56e5c96a126
X-Patchwork-Hint: ignore
Message-Id: <20210924195426.65C808D228@busybox.osuosl.org>
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: point
 LICENSE_FILES to correct file
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

commit: https://git.buildroot.net/buildroot/commit/?id=83541769159ed7a8241cf82ab56db56e5c96a126
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since v2.2 release (commits 8cc36aec912 "doc: De-duplicate readme and
license files" and 9f1622b018ab "doc: Move content out of readme and
create new index page "), the license.rst file at the root of the git
repo is only telling to look at docs/license.rst file.

Let's point the ARM_TRUSTED_FIRMWARE_LICENSE_FILES to the correct file
and modify the .hash file accordingly.

The comment has also been wrong since we bumped from version 1.4 to 2.2
in commit  a757d173f179  (boot/arm-trusted-firmware: bump to version
2.2). Drop referencing an explicit version, so that is is never wrong
again.

Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
[yann.morin.1998@free.fr: also fix the comment.]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 boot/arm-trusted-firmware/arm-trusted-firmware.hash | 2 +-
 boot/arm-trusted-firmware/arm-trusted-firmware.mk   | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.hash b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
index 1ab50a9e28..80402ec374 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.hash
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.hash
@@ -1,3 +1,3 @@
 # Locally calculated
 sha256  d12a824afcc5cb90d005f9820f3274f1319cef1bb282e40a6a190b75900206d3  arm-trusted-firmware-v2.5.tar.gz
-sha256  487795b8023df866259fa159bab94706b747fb0d623b7913f1c4955c0ab5f164  license.rst
+sha256  0171b0795501ee90634fbc4a7835e2fb215d9423daf1cf5b0d0682adde12c597  docs/license.rst
diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 9d44a5df06..03fa83b7b5 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -18,10 +18,10 @@ else
 # Handle stable official ATF versions
 ARM_TRUSTED_FIRMWARE_SITE = $(call github,ARM-software,arm-trusted-firmware,$(ARM_TRUSTED_FIRMWARE_VERSION))
 # The licensing of custom or from-git versions is unknown.
-# This is valid only for the official v1.4.
+# This is valid only for the latest (i.e. known) version.
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST_VERSION),y)
 ARM_TRUSTED_FIRMWARE_LICENSE = BSD-3-Clause
-ARM_TRUSTED_FIRMWARE_LICENSE_FILES = license.rst
+ARM_TRUSTED_FIRMWARE_LICENSE_FILES = docs/license.rst
 endif
 endif
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
