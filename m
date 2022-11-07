Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6FA6C6379F
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42A6840946;
	Mon, 20 Feb 2023 21:03:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42A6840946
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bsD0j2K4oly6; Mon, 20 Feb 2023 21:03:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 11832403CC;
	Mon, 20 Feb 2023 21:03:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 11832403CC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 134871BF94D
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2E84840BA8
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E84840BA8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sPYHFZN3X-bc for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4167540C2C
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4167540C2C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2DE6786496; Mon, 20 Feb 2023 20:51:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 7 Nov 2022 23:09:50 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a29e7fb6765c0a08a3276a11a4da54dfdbdca703
X-Git-Newrev: 68c143419336139fcf5dccd8289f410be4285550
X-Patchwork-Hint: ignore
Message-Id: <20230220205149.2DE6786496@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/ipmitool: fix
 per-package build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=68c143419336139fcf5dccd8289f410be4285550
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following per-package build failure raised since commit
82480ee22bdfae6f7d399975722b5c125749d8c7:

configure.ac:44: error: possibly undefined macro: AC_SEARCH_LIBS
      If this token and others are legitimate, please use m4_pattern_allow.
      See the Autoconf documentation.

Fixes:
 - http://autobuild.buildroot.org/results/ecf72cd1ebd53f3b3b10f0a24082f9c0ab5d4d12

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ipmitool/ipmitool.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/ipmitool/ipmitool.mk b/package/ipmitool/ipmitool.mk
index ebd8f9b337..b9f60d8151 100644
--- a/package/ipmitool/ipmitool.mk
+++ b/package/ipmitool/ipmitool.mk
@@ -12,6 +12,7 @@ IPMITOOL_LICENSE_FILES = COPYING
 IPMITOOL_CPE_ID_VENDOR = ipmitool_project
 # From git
 IPMITOOL_AUTORECONF = YES
+IPMITOOL_DEPENDENCIES = host-pkgconf
 
 ifeq ($(BR2_PACKAGE_FREEIPMI),y)
 IPMITOOL_DEPENDENCIES += freeipmi
@@ -34,7 +35,7 @@ IPMITOOL_CONF_OPTS += --disable-intf-usb
 endif
 
 ifeq ($(BR2_PACKAGE_IPMITOOL_IPMISHELL),y)
-IPMITOOL_DEPENDENCIES += host-pkgconf readline
+IPMITOOL_DEPENDENCIES += readline
 IPMITOOL_CONF_OPTS += --enable-ipmishell
 else
 IPMITOOL_CONF_OPTS += --disable-ipmishell
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
