Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA02C6379F
	for <buildroot@archiver.kernel.org>; Thu, 19 Jan 2023 11:50:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E18B418F8;
	Thu, 19 Jan 2023 11:50:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E18B418F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MjbMqMetsUXm; Thu, 19 Jan 2023 11:50:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 715FF41910;
	Thu, 19 Jan 2023 11:50:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 715FF41910
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F7451BF3EE
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 11:50:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5861981FFF
 for <buildroot@lists.busybox.net>; Thu, 19 Jan 2023 11:50:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5861981FFF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id puOlK3ALWKir for <buildroot@lists.busybox.net>;
 Thu, 19 Jan 2023 11:50:08 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org ABF6281F83
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by smtp1.osuosl.org (Postfix) with ESMTPS id ABF6281F83
 for <buildroot@buildroot.org>; Thu, 19 Jan 2023 11:50:07 +0000 (UTC)
Received: from houde.tangerine ([185.213.154.234]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1MVeDq-1pAnto36UW-00RdGZ; Thu, 19 Jan 2023 12:50:04 +0100
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Thu, 19 Jan 2023 12:49:43 +0100
Message-Id: <20230119114943.882703-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:WRDCR+JZ127Z+TmtevqYi/HB0fvIVaPrv6mGzaE3m3NFH61fKeo
 7cQ3+dW+tUGn5CfyZpUTDZvvIc6pvdHqMj5Wk3ddbahpZRbblUMKfQzyaV7Ny32iJpNf5O/
 ay4VkvLe+vqGi5qqMWYOt/kcgXmvBnAXGLMBufM/Z+gpisdZqO2b/ry4hP76K3E4rTIEpJQ
 4ceouoqGHVZl+T+GfAX6w==
UI-OutboundReport: notjunk:1;M01:P0:hCi1SSZlBTs=;kayFyYh2YDGYD4i+eYzj1z4Sv+v
 CarwJnqVLqG1/DHYM43bfVV5/XsQ6OuDF1lf8DWoRWfaSp5HdEDOgJBp4Esi4PbY9L6x6wzhL
 J7SvWBdnrdxVSyiCQkHq4YmpH6J+TZzrGyOqtXfPj0xB4v/CUkBBeYaPy9TGMqvLOGzvmsBgJ
 nhrTvYHslomIUU+m/AW+a8noRJpIYs2uviQETAOjC2yVwbrSNfsj74jQVUNonxYZzOMIM2mYP
 HiKzPIrilZkiYEIE025P0BZnkeZ/xbKSftvJ3PClwspEfDQBG9Di33T58K0HIwpeJK2ue0ojZ
 rDt8QHsJMgq7cHEO8FBKxTNa0u74Hq+FXU/bemN4WtCSJ+zoxv11nVU2DVFCfXv0FuwA8VD+2
 HbVgKR+1MIaTL6bLjqIdGpJncrRznccqEEyxOOyejLXKXK7UHlJHAQjifb8vB4z/3JXHArzL0
 OV+CDXg7yjO48kBdkRjUKiQ5t8+/+4tjjHP1Z8HXQgLM1hkYvM0VKE/k7+ryFPu2YPazeOMpV
 CH7fSh6eTIaOBAhpLBiWOCxplgaZRmpul5QVmEIYtaXtAYQUWjxVoMNFlm/+eyW5+jMaT88zQ
 ldd0JNxCguF2NycgwCjuW73K+wVR1LVEpvzAag9DPBshxGOJBChdEc5eU4JtVGplF3yH9KxKY
 BhwayLpnSds0co3RrOGzFvBhacLKQB7FGRiq29QhPA==
Subject: [Buildroot] [PATCH 1/1] package/openlayers: bump to version 7.2.2
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/openlayers/openlayers.hash | 2 +-
 package/openlayers/openlayers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openlayers/openlayers.hash b/package/openlayers/openlayers.hash
index 1b3f3cce51..7e33716f78 100644
--- a/package/openlayers/openlayers.hash
+++ b/package/openlayers/openlayers.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  37a0e5fde4df3db6e6c11ed0ceb8e20608121afe5f8f7f91cf03990e89a919ca  v7.1.0-package.zip
+sha256  31b848cc55967c7de63fece8cd1699fc51152421d04653b859103c7391ad5bbe  v7.2.2-package.zip
 sha256  6c4347b83a8c9feef18d57b18e3b6c44cf901b3c344a4a1fbd837e421555ab8e  LICENSE.md
diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
index 7396e38fb9..852f5f1dcf 100644
--- a/package/openlayers/openlayers.mk
+++ b/package/openlayers/openlayers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLAYERS_VERSION = 7.1.0
+OPENLAYERS_VERSION = 7.2.2
 OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-package.zip
 OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
 OPENLAYERS_LICENSE = BSD-2-Clause
-- 
2.39.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
