Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9371C4332F
	for <buildroot@archiver.kernel.org>; Tue, 13 Dec 2022 14:34:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED7CB60E65;
	Tue, 13 Dec 2022 14:34:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED7CB60E65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GPt2MNnYTp8l; Tue, 13 Dec 2022 14:34:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A53C60BB9;
	Tue, 13 Dec 2022 14:34:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A53C60BB9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 485751BF328
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 14:34:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1F40F415F8
 for <buildroot@lists.busybox.net>; Tue, 13 Dec 2022 14:34:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1F40F415F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kLZLUfFh69mA for <buildroot@lists.busybox.net>;
 Tue, 13 Dec 2022 14:34:01 +0000 (UTC)
X-Greylist: delayed 00:05:05 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4C7F1415F0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4C7F1415F0
 for <buildroot@buildroot.org>; Tue, 13 Dec 2022 14:34:00 +0000 (UTC)
Received: from localhost ([217.91.205.33]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MPGiR-1pHY5o1plt-00PbXj; Tue, 13 Dec 2022 15:28:53 +0100
Date: Tue, 13 Dec 2022 15:28:52 +0100
From: Andreas Klinger <ak@it-klinger.de>
To: buildroot@buildroot.org
Message-ID: <Y5iMJJIFk5DTmSLF@arbad>
MIME-Version: 1.0
Content-Disposition: inline
X-Provags-ID: V03:K1:6v2Well+j/BO6zlbxqLyd4bev5CksO+nXdnuOXgklicdQWRDoOC
 jBC2umusaCKygYehbSB9L7G+sVcP+IdaH1xhAMjZoQAwoN1eEH93+6SmDisGJEBG/W29DB1
 +HEXkK1/Qts1i6ktxJEoIs+xfZgeCCxUkwYMP9rrk58spBosG8vjlqgRVnr7QhHDocOEjQg
 uHotps0C+/8cukE96D+gQ==
UI-OutboundReport: notjunk:1;M01:P0:XbyLoV3tvOY=;uhWUCWrviityHqpfIBXURXEgExm
 SU5AMrFW4sxTOv/yJcmOG/Zm+ExUydq47ZS8kGXUDtwmKTfg8Nsq70dQ6svcUlICOnD1J7NDB
 zBlXYIxae4wUhKvMNg+8SWG7AJEzHKP6+unyeusRXd9bCOg0NbhtoSMDA2vRoPVgQBSYGrYVc
 4CJPxXOQA9dc+crrc936JbMYu/vIke1j4kzruf6Jbee5zBfWu4ejuZYPVDrA4q7hfR2rR4p4h
 CH7kkAk1i12lqncQxJZihyjeSycYjqfedsCQWbxOWy8VsFsTAYnxWIgMtAzTtx0a3YpqnwePY
 4WxcoHcKRNASYbzAAtE8blhNycOpAFKa1a0TZYB62xGhktc/M3KevJKdHX1T2P9lROVYAmv3H
 DVaYnugQcgAp8g2BzTfcnHgdt1wsOTiyvU2GvPUqaX0mpUgZGwLEYpLwIFOtq85BpJF/SZBw3
 otfiwSWwoFIoApYZaPqHsUfJQOSHhAtCxpReLOWCRM4RxPC4lIJaP+u4ysSN7tZgMAd057f39
 g4fx5d3hrFRHK5anDG8QHBdzuBodiIm5V/02prInc4pEnQF285es+Z7h6iEhAlyLWWe0R5Vfp
 J+ggvwqblgHPmvucRQa7XpWkaQTwfH8CzUaIZAhUB5jNbt0cO2zOkTvKTTI7YceDz34wIgvf/
 sZjbzYP+EaGJ9O2i4nYzmHPAUXHMkZZnanVicup/pA==
Subject: [Buildroot] [PATCH 1/1] package/ply: bump to version 2.3.0
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
Cc: Andreas Klinger <ak@it-klinger.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Andreas Klinger <ak@it-klinger.de>
---
 package/ply/ply.hash | 2 +-
 package/ply/ply.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ply/ply.hash b/package/ply/ply.hash
index df01ae08e0..b6a56aa909 100644
--- a/package/ply/ply.hash
+++ b/package/ply/ply.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  8cd92fc8784873fb0507bc11f3f62a31d0345c64914ddaadb958d8b2d6de0100  ply-2.2.0.tar.gz
+sha256  99be1ed3942370699cbfc7f493bc3ffd4601312a81471215ac7ccb2e04a0a8b2  ply-2.3.0.tar.gz
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/ply/ply.mk b/package/ply/ply.mk
index b3c56bd9a5..dc02fc5472 100644
--- a/package/ply/ply.mk
+++ b/package/ply/ply.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PLY_VERSION = 2.2.0
+PLY_VERSION = 2.3.0
 PLY_SITE = $(call github,wkz,ply,$(PLY_VERSION))
 PLY_AUTORECONF = YES
 PLY_LICENSE = GPL-2.0
-- 
2.30.2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
