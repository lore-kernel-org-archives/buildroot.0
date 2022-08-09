Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D033C19F2D
	for <buildroot@archiver.kernel.org>; Tue,  9 Aug 2022 11:28:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D80460E3A;
	Tue,  9 Aug 2022 11:28:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D80460E3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E4s8a-0Ku8xI; Tue,  9 Aug 2022 11:28:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B53C760DB2;
	Tue,  9 Aug 2022 11:28:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B53C760DB2
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4F2FB1BF2C7
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:28:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37466405B0
 for <buildroot@lists.busybox.net>; Tue,  9 Aug 2022 11:28:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 37466405B0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7xWccMiGbHlW for <buildroot@lists.busybox.net>;
 Tue,  9 Aug 2022 11:28:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7424A400A6
 for <buildroot@buildroot.org>; Tue,  9 Aug 2022 11:28:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7424A400A6
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id CA5DE86FCF; Tue,  9 Aug 2022 11:13:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 9 Aug 2022 10:20:33 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8acfedf922325a0fb7d7d6e7a1287eab6fae386a
X-Git-Newrev: 61360da1051f30d232fd136fbb0edf4bba69e9ab
X-Patchwork-Hint: ignore
Message-Id: <20220809111348.CA5DE86FCF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ocrad: fix license
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

commit: https://git.buildroot.net/buildroot/commit/?id=61360da1051f30d232fd136fbb0edf4bba69e9ab
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ocrad is licensed under GPL-2.0+ since version 0.24, here is an extract
of https://lists.gnu.org/archive/html/bug-ocrad/2014-10/msg00000.html:

"The license has been changed to GPL version 2 or later for better GPL
compatibility. GPLv2 and GPLv2+ programs may use the library now."

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/ocrad/ocrad.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ocrad/ocrad.mk b/package/ocrad/ocrad.mk
index e037a08195..914d53a59c 100644
--- a/package/ocrad/ocrad.mk
+++ b/package/ocrad/ocrad.mk
@@ -7,7 +7,7 @@
 OCRAD_VERSION = 0.27
 OCRAD_SOURCE = ocrad-$(OCRAD_VERSION).tar.lz
 OCRAD_SITE = $(BR2_GNU_MIRROR)/ocrad
-OCRAD_LICENSE = GPL-3.0+
+OCRAD_LICENSE = GPL-2.0+
 OCRAD_LICENSE_FILES = COPYING
 OCRAD_INSTALL_STAGING = YES
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
