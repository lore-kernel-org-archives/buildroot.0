Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5055C433FE
	for <buildroot@archiver.kernel.org>; Sat, 15 Oct 2022 15:27:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8EBFF4061F;
	Sat, 15 Oct 2022 15:27:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EBFF4061F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZyrtuwltTriN; Sat, 15 Oct 2022 15:27:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 87C1640643;
	Sat, 15 Oct 2022 15:26:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87C1640643
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 57A551BF5DE
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:26:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 322BB410D6
 for <buildroot@lists.busybox.net>; Sat, 15 Oct 2022 15:26:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 322BB410D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MVyaD2AJcuoZ for <buildroot@lists.busybox.net>;
 Sat, 15 Oct 2022 15:26:20 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D2CF414CD
 for <buildroot@buildroot.org>; Sat, 15 Oct 2022 15:26:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D2CF414CD
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 096D186D81; Sat, 15 Oct 2022 15:26:20 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 15 Oct 2022 17:23:54 +0200
X-Git-Refname: refs/heads/2022.08.x
X-Git-Oldrev: 03d8b05c12642368c4b0f9241882e2c536799a06
X-Git-Newrev: 15547176843494c60abb0cbb60000cda3f52ba77
X-Patchwork-Hint: ignore
Message-Id: <20221015152620.096D186D81@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.08.x] package/libinput: add
 LIBINPUT_CPE_ID_VENDOR
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

commit: https://git.buildroot.net/buildroot/commit/?id=15547176843494c60abb0cbb60000cda3f52ba77
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.08.x

cpe:2.3:a:freedesktop:libinput is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Afreedesktop%3Alibinput

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit db5c4a06a6da5e64268667c7c07aa4154fec6919)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libinput/libinput.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/libinput/libinput.mk b/package/libinput/libinput.mk
index 1529411355..6cd298f3b3 100644
--- a/package/libinput/libinput.mk
+++ b/package/libinput/libinput.mk
@@ -11,6 +11,7 @@ LIBINPUT_DEPENDENCIES = host-pkgconf libevdev mtdev udev
 LIBINPUT_INSTALL_STAGING = YES
 LIBINPUT_LICENSE = MIT
 LIBINPUT_LICENSE_FILES = COPYING
+LIBINPUT_CPE_ID_VENDOR = freedesktop
 # Tests need fork, so just disable them everywhere.
 LIBINPUT_CONF_OPTS = -Dtests=false -Dlibwacom=false -Ddocumentation=false
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
