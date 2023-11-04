Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98018C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 22:07:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D65E82179;
	Sat,  4 Nov 2023 22:07:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2D65E82179
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CzxZ0rkhA6Iq; Sat,  4 Nov 2023 22:07:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B5DB82177;
	Sat,  4 Nov 2023 22:07:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B5DB82177
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8FE1C1BF267
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 22:07:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 692E141A3A
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 22:07:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 692E141A3A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Op11ztQWJbgy for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 22:07:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6CC9741926
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 22:07:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CC9741926
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 402288679E; Sat,  4 Nov 2023 22:07:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 4 Nov 2023 23:06:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a9ceaba794141e9f06d97aebc852b67b6fb501b8
X-Git-Newrev: cac9018ef6e3e7c6e8a602a4f7fd576803b33028
X-Patchwork-Hint: ignore
Message-Id: <20231104220712.402288679E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcanberra: fix LICENSE_FILES
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

commit: https://git.buildroot.net/buildroot/commit/?id=cac9018ef6e3e7c6e8a602a4f7fd576803b33028
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The license file listed in the original commit adding the package in
a9ceaba794141e9f06d97aebc852b67b6fb501b8 did not exist.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/libcanberra/libcanberra.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libcanberra/libcanberra.mk b/package/libcanberra/libcanberra.mk
index 1eadcb571b..2505e58eb0 100644
--- a/package/libcanberra/libcanberra.mk
+++ b/package/libcanberra/libcanberra.mk
@@ -8,7 +8,7 @@ LIBCANBERRA_VERSION = 0.30
 LIBCANBERRA_SOURCE = libcanberra-$(LIBCANBERRA_VERSION).tar.xz
 LIBCANBERRA_SITE = http://0pointer.de/lennart/projects/libcanberra
 LIBCANBERRA_LICENSE = LGPL-2.1+
-LIBCANBERRA_LICENSE_FILES = LICENSE
+LIBCANBERRA_LICENSE_FILES = LGPL
 LIBCANBERRA_INSTALL_STAGING = YES
 
 LIBCANBERRA_DEPENDENCIES = host-pkgconf libtool libvorbis
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
