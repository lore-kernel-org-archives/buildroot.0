Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3E5C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 12:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1E8261362;
	Thu,  9 Nov 2023 12:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1E8261362
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eNEdQ23vwZrY; Thu,  9 Nov 2023 12:51:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2674C60F1E;
	Thu,  9 Nov 2023 12:51:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2674C60F1E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 822311BF40F
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 12:51:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E7ACB6131A
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 12:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7ACB6131A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MiAFA7lzG2Oi for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 12:51:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2CFD760F1E
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 12:51:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CFD760F1E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1A0B386DFB; Thu,  9 Nov 2023 12:51:40 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Nov 2023 13:47:53 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 73ce3248e903ba33bfbd33e530f1c6513fbe9f8e
X-Git-Newrev: 84fe0a157c3da75ba78a49b63086385fbd4bb9f3
X-Patchwork-Hint: ignore
Message-Id: <20231109125140.1A0B386DFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/libzlib: Switch
 to using HTTPS
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

commit: https://git.buildroot.net/buildroot/commit/?id=84fe0a157c3da75ba78a49b63086385fbd4bb9f3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Switch to using HTTPS for downloading libzlib from zlib.net.

(zlib.net doesn't default to HTTPS but does suggest HTTPS in the permalink
for the latest zlib release. Also works better with some corporate firewalls
that get suspicious about zlib for some reason.)

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 5b139e2a8ded312e3b4a0939b35e6888a3d73076)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/libzlib/libzlib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index e344cc7ad9..b6193a6767 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -6,7 +6,7 @@
 
 LIBZLIB_VERSION = 1.2.13
 LIBZLIB_SOURCE = zlib-$(LIBZLIB_VERSION).tar.xz
-LIBZLIB_SITE = http://www.zlib.net
+LIBZLIB_SITE = https://www.zlib.net
 LIBZLIB_LICENSE = Zlib
 LIBZLIB_LICENSE_FILES = LICENSE
 LIBZLIB_INSTALL_STAGING = YES
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
