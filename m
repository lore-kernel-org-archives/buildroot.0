Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17FAD30CC1
	for <buildroot@archiver.kernel.org>; Tue, 13 Jan 2026 20:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C7EDC60DAD;
	Tue, 13 Jan 2026 20:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gLQSwNhqpsxk; Tue, 13 Jan 2026 20:58:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D1CDB60DB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768337938;
	bh=c8510ynx41YyDTiCX+h0o45xSZsjWRgpF6YbWi1O9wg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Mc2khE0Ik3WkbpndWOR6vmvQWF9JaMV+6UCESu9GdR6KL0cTWPzvqeRud5BYlTkMw
	 9B+zEcvbDJuqN6heYaAYRo8H73XIjIj92Zy3IKs0VzaLXI2Ept/puRiOfyJrWdUg3K
	 EI4ZMHfBhwSrEN6G0QkmmKtG8J4ijKty3HVhnneGYvFLAEFUcE6cv1gpZAAV+LEmbo
	 A0m2m3dIeu8T2vMibqbb5UJjlKD4tRmIk9PSaLHxaSj+ziirjKVMd7Azyrf2oAKmZN
	 0Sv+8wHhXC0sNqCGUjtBCpVnSXHzkYye1wH2nyYZ/82bf8Z2E9mnZi8tM7jyWZTjVV
	 yBrgXIQeG4dQg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1CDB60DB0;
	Tue, 13 Jan 2026 20:58:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D0815231
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1E1681109
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CE12d7W0z1oq for <buildroot@buildroot.org>;
 Tue, 13 Jan 2026 20:58:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7EA180839
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7EA180839
 for <buildroot@buildroot.org>; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DA68381382; Tue, 13 Jan 2026 20:58:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 13 Jan 2026 21:37:22 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9de86eafe232167f569942921f7830cfab900d2
X-Git-Newrev: 90b693a416e2e76d23c3b2cd8c46d236a667a646
X-Patchwork-Hint: ignore
Message-Id: <20260113205847.DA68381382@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/x11r7/xdriver_xf86-input-evdev:
 bump version to 2.11.0
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=90b693a416e2e76d23c3b2cd8c46d236a667a646
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

https://lists.x.org/archives/xorg-announce/2024-October/003544.html

Switched tarball to xz.

Switched _SITE to URL mentioned in latest release notes.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash  | 8 +++-----
 .../x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk    | 6 +++---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
index c80eaeb9fa..5d02514294 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.hash
@@ -1,7 +1,5 @@
-# From https://lists.x.org/archives/xorg-announce/2018-May/002898.html
-md5  e8bd1edc6751f92e425cae7eba3c61eb  xf86-input-evdev-2.10.6.tar.bz2
-sha1  660de292d5a40e2b8f385965c6a4e149c981ba59  xf86-input-evdev-2.10.6.tar.bz2
-sha256  8726073e81861bc7b2321e76272cbdbd33c7e1a121535a9827977265b9033ec0  xf86-input-evdev-2.10.6.tar.bz2
-sha512  560b0a6491d50a46913a5890a35c0367e59f550670993493bd9712d712a9747ddaa6fe5086daabf2fcafa24b0159383787eb273da4a2a60c089bfc0a77ad2ad1  xf86-input-evdev-2.10.6.tar.bz2
+# From https://lists.x.org/archives/xorg-announce/2024-October/003544.html
+sha256  730022de934cc366bb12439daf202a7bfff52a028cf4573e457642e25a071315  xf86-input-evdev-2.11.0.tar.xz
+sha512  ccd3727d9726565259a81db1c238aba7e414292c3f91e182c048845ac3caf1705c2b16ff1775f3b35ecb3b7088903257085bc90a20265641ccde05b2fc6966df  xf86-input-evdev-2.11.0.tar.xz
 # Locally computed
 sha256  f6b9b4732932434cad03b29cb3151d20edcf7d6e5681f40ee3c47f03dbd92dc9  COPYING
diff --git a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
index 28923cb2a1..b40a44bf30 100644
--- a/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
+++ b/package/x11r7/xdriver_xf86-input-evdev/xdriver_xf86-input-evdev.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.10.6
-XDRIVER_XF86_INPUT_EVDEV_SOURCE = xf86-input-evdev-$(XDRIVER_XF86_INPUT_EVDEV_VERSION).tar.bz2
-XDRIVER_XF86_INPUT_EVDEV_SITE = http://xorg.freedesktop.org/releases/individual/driver
+XDRIVER_XF86_INPUT_EVDEV_VERSION = 2.11.0
+XDRIVER_XF86_INPUT_EVDEV_SOURCE = xf86-input-evdev-$(XDRIVER_XF86_INPUT_EVDEV_VERSION).tar.xz
+XDRIVER_XF86_INPUT_EVDEV_SITE = https://xorg.freedesktop.org/archive/individual/driver
 XDRIVER_XF86_INPUT_EVDEV_LICENSE = MIT
 XDRIVER_XF86_INPUT_EVDEV_LICENSE_FILES = COPYING
 XDRIVER_XF86_INPUT_EVDEV_AUTORECONF = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
