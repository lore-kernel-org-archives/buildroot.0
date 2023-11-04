Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8282C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 20:42:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B9DA60C15;
	Sat,  4 Nov 2023 20:42:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2B9DA60C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zdEveDuxwc3x; Sat,  4 Nov 2023 20:42:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5EC1460BA9;
	Sat,  4 Nov 2023 20:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5EC1460BA9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A053E1BF584
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 79038418C2
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 20:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79038418C2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h1OaGDDezcFB for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 20:42:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A8BF8418AC
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 20:42:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A8BF8418AC
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 92EED818C9; Sat,  4 Nov 2023 20:42:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 21:41:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3c71477f663c64bf7e3455e235f610fe17d0956c
X-Git-Newrev: 5b139e2a8ded312e3b4a0939b35e6888a3d73076
X-Patchwork-Hint: ignore
Message-Id: <20231104204232.92EED818C9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libzlib: Switch to using HTTPS
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

commit: https://git.buildroot.net/buildroot/commit/?id=5b139e2a8ded312e3b4a0939b35e6888a3d73076
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Switch to using HTTPS for downloading libzlib from zlib.net.

(zlib.net doesn't default to HTTPS but does suggest HTTPS in the permalink
for the latest zlib release. Also works better with some corporate firewalls
that get suspicious about zlib for some reason.)

Signed-off-by: Andrew Donnellan <ajd@linux.ibm.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libzlib/libzlib.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libzlib/libzlib.mk b/package/libzlib/libzlib.mk
index da452af8e9..e0a4e454e1 100644
--- a/package/libzlib/libzlib.mk
+++ b/package/libzlib/libzlib.mk
@@ -6,7 +6,7 @@
 
 LIBZLIB_VERSION = 1.3
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
