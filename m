Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B62C4167B
	for <buildroot@archiver.kernel.org>; Thu, 30 Nov 2023 21:17:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E7676FA3B;
	Thu, 30 Nov 2023 21:17:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8E7676FA3B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vfFZfrib2CQf; Thu, 30 Nov 2023 21:17:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEB6E6FA37;
	Thu, 30 Nov 2023 21:17:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEB6E6FA37
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 921041BF983
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 21:17:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6AA0441FB2
 for <buildroot@lists.busybox.net>; Thu, 30 Nov 2023 21:17:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6AA0441FB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lOEHsB3SEXrV for <buildroot@lists.busybox.net>;
 Thu, 30 Nov 2023 21:17:06 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 44A4441F9B
 for <buildroot@buildroot.org>; Thu, 30 Nov 2023 21:17:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44A4441F9B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 292EE87592; Thu, 30 Nov 2023 21:17:06 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 30 Nov 2023 22:01:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 758d79faec0d95c57489296658517b1fd9fb5040
X-Git-Newrev: 5fcd48aff97866df5488eb47589f6f45064f0228
X-Patchwork-Hint: ignore
Message-Id: <20231130211706.292EE87592@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openfpgaloader: bump to version
 0.11.0
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

commit: https://git.buildroot.net/buildroot/commit/?id=5fcd48aff97866df5488eb47589f6f45064f0228
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This bump will fix the following build failure thanks to
https://github.com/trabucayre/openFPGALoader/commit/933ed793e85dea7e16ddd6540791097fd3a299f5:

In file included from /home/buildroot/autobuild/instance-3/output-1/build/openfpgaloader-0.10.0/src/jtag.hpp:13,
                 from /home/buildroot/autobuild/instance-3/output-1/build/openfpgaloader-0.10.0/src/device.hpp:13,
                 from /home/buildroot/autobuild/instance-3/output-1/build/openfpgaloader-0.10.0/src/efinix.hpp:11,
                 from /home/buildroot/autobuild/instance-3/output-1/build/openfpgaloader-0.10.0/src/efinix.cpp:6:
/home/buildroot/autobuild/instance-3/output-1/build/openfpgaloader-0.10.0/src/board.hpp:49:9: error: 'uint8_t' does not name a type
   49 |         uint8_t tms_pin; /*! TMS pin value */
      |         ^~~~~~~
/home/buildroot/autobuild/instance-3/output-1/build/openfpgaloader-0.10.0/src/board.hpp:12:1: note: 'uint8_t' is defined in header '<cstdint>'; did you forget to '#include <cstdint>'?
   11 | #include "cable.hpp"
  +++ |+#include <cstdint>
   12 |

https://github.com/trabucayre/openFPGALoader/releases/tag/v0.11.0

Fixes:
 - http://autobuild.buildroot.org/results/ee89dcc7430079195e2e9ff300e1320de848d3e3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openfpgaloader/openfpgaloader.hash | 2 +-
 package/openfpgaloader/openfpgaloader.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openfpgaloader/openfpgaloader.hash b/package/openfpgaloader/openfpgaloader.hash
index a8b537782c..6fa81a98a2 100644
--- a/package/openfpgaloader/openfpgaloader.hash
+++ b/package/openfpgaloader/openfpgaloader.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  966b4629df86b1d520ddd8a4e0a3fc00060b26b5ab4e172b596bd9d4659a196e  openfpgaloader-0.10.0.tar.gz
+sha256  a463690358d2510919472c2f460039a304d016a08a45970821e667eea1c48cc8  openfpgaloader-0.11.0.tar.gz
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/openfpgaloader/openfpgaloader.mk b/package/openfpgaloader/openfpgaloader.mk
index 6d7fbd9850..0fd172b532 100644
--- a/package/openfpgaloader/openfpgaloader.mk
+++ b/package/openfpgaloader/openfpgaloader.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENFPGALOADER_VERSION = 0.10.0
+OPENFPGALOADER_VERSION = 0.11.0
 OPENFPGALOADER_SITE = $(call github,trabucayre,openFPGALoader,v$(OPENFPGALOADER_VERSION))
 OPENFPGALOADER_LICENSE = Apache-2.0
 OPENFPGALOADER_LICENSE_FILES = LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
