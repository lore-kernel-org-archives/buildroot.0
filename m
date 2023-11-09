Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0E9FC4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 12:52:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25ED4607C7;
	Thu,  9 Nov 2023 12:52:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25ED4607C7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 730rBi3Q0R_x; Thu,  9 Nov 2023 12:52:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50F9460F1E;
	Thu,  9 Nov 2023 12:52:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 50F9460F1E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 87BE01BF40F
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 12:52:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 608C240A48
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 12:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 608C240A48
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ADZHd2fm1s7n for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 12:52:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4E97E40A44
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 12:52:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4E97E40A44
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3E0EC86DFB; Thu,  9 Nov 2023 12:52:30 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Nov 2023 13:48:02 +0100
X-Git-Refname: refs/heads/2023.08.x
X-Git-Oldrev: c284d6bba0944ae3af609312ab2411e525787d28
X-Git-Newrev: d8191f154660d28c9dce63b5a2d96c75c7023436
X-Patchwork-Hint: ignore
Message-Id: <20231109125230.3E0EC86DFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.08.x] package/libzlib: Switch
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

commit: https://git.buildroot.net/buildroot/commit/?id=d8191f154660d28c9dce63b5a2d96c75c7023436
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.08.x

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
