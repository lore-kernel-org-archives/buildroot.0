Return-Path: <SRS0=6sxh=PL=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CACA0C433EF
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 16:48:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 30737603E9
	for <buildroot@archiver.kernel.org>; Sat, 23 Oct 2021 16:48:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 30737603E9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 05004403A5;
	Sat, 23 Oct 2021 16:48:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jIyPg3Emg_ry; Sat, 23 Oct 2021 16:48:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 717DB4033D;
	Sat, 23 Oct 2021 16:48:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 958F81BF2AA
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 16:48:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85536607E9
 for <buildroot@lists.busybox.net>; Sat, 23 Oct 2021 16:48:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QHBqxYMaTg51 for <buildroot@lists.busybox.net>;
 Sat, 23 Oct 2021 16:48:22 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C9DB160776
 for <buildroot@buildroot.org>; Sat, 23 Oct 2021 16:48:22 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 32518884A9; Sat, 23 Oct 2021 16:45:07 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 23 Oct 2021 18:48:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b8c8fcee7a38558a7247ef772ac9d93ff87bd943
X-Git-Newrev: 386d3c9a5a8292e05ed6f1bbf99c591f78a3be24
X-Patchwork-Hint: ignore
Message-Id: <20211023164507.32518884A9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/firmware-utils: requires DES
 support in openssl
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

commit: https://git.buildroot.net/buildroot/commit/?id=386d3c9a5a8292e05ed6f1bbf99c591f78a3be24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit 21d2a0c2ecfdddb250007ce75d1839ba81278e5b:

/home/giuliobenetti/autobuild/run/instance-0/output-1/build/firmware-utils-86739f2b3ae9502368b89ef37fa6f31c42aad6f4/src/mkhilinkfw.c:54:8: error: unknown type name 'DES_key_schedule'
   54 | static DES_key_schedule schedule;
      |        ^~~~~~~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/0563b24ccb7dd242998e1b59b217405c6340e276

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/firmware-utils/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/firmware-utils/Config.in b/package/firmware-utils/Config.in
index 9e47263d73..501b89b453 100644
--- a/package/firmware-utils/Config.in
+++ b/package/firmware-utils/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_FIRMWARE_UTILS
 	bool "firmware-utils"
 	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
 	select BR2_PACKAGE_ZLIB
 	help
 	  Firmware utils are tools that can be used for managing
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
