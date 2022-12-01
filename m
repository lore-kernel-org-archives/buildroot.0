Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA1DC43217
	for <buildroot@archiver.kernel.org>; Thu,  1 Dec 2022 14:03:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46B9A610AD;
	Thu,  1 Dec 2022 14:03:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 46B9A610AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c3HzS8_A2nzO; Thu,  1 Dec 2022 14:02:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94F12610A9;
	Thu,  1 Dec 2022 14:02:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94F12610A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7F8C91BF3A7
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 14:02:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5A025418E1
 for <buildroot@lists.busybox.net>; Thu,  1 Dec 2022 14:02:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A025418E1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eebxelTUjgNt for <buildroot@lists.busybox.net>;
 Thu,  1 Dec 2022 14:02:56 +0000 (UTC)
X-Greylist: delayed 00:12:33 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A821A418DF
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.13])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A821A418DF
 for <buildroot@buildroot.org>; Thu,  1 Dec 2022 14:02:55 +0000 (UTC)
Received: from harderbit ([92.154.77.116]) by mrelayeu.kundenserver.de
 (mreue109 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1MJm8N-1pGUUI109Z-00KD0m; Thu, 01 Dec 2022 14:50:15 +0100
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Thu,  1 Dec 2022 14:48:38 +0100
Message-Id: <20221201134840.18838-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:FNomlw0S5pdD9pS+tc6tssWSvbt1J0js0JwRhKK+wNVBmTHpR5D
 CDeMXNcji0tgXJuA8G3CMLEukJrd4RLpWjn2d7iaTKgI+LEHIEp4nHsFKZEILt2DecPcG5s
 E5PZprkGRQE1OJLY3GGQuKabN2b/2bjLjPld+fOwbMUShi9SzZCDM2lUPgSbZvCq7eQyX4V
 PFcHcqjlCY2bLJlp9qdjg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fYnBlaGG0SA=:C1lKrfw22WHgFIGgw3Gwn+
 Dsg4/r3wOAux65bWuxpOIhKhsrDDqLd1dkSi4/GR2eEK4Y6aWoAdY+WNsMdQjaI0hUtkXQ/I4
 KmhF48OBw4bmMh/w3CFK0zuTytb3eCkqR6xND7T2Et3/ideHEkkwPz1tkMoRhuTqz5s1zMXsM
 lRTSAsPl5ojw/UxQBWdB1S7veMV+5AiTBIZptf9IX1hv2XULACk9YKRPCXteNzx6kpjne4bsX
 svfKl4I7p69gXiYt3YUVvsgrjn/rwejIt1uiO4LQ4qkAEUXEctH3ap9a4EcWuOI7gtJWjhNQy
 7Q/Hy7LdsE3RkxWNTWEU3/dJ4V6we7SEZPwh9L9a+B6rlX27iWogIRtQIQbkyOazgj7NjmG0E
 00W/O6K9PZIFfdU2DYrEL8tKImuvXxvMbjGxWFTEq6aFLjtMkvPYKd56rbD/4/r1YPUJCWWbC
 6AVDEmqmiSqD+f6HOz/cyqca63mzGmLVTEWwbEHy9ItNAT05VexzOJ1UljJTDtE1Q5kchQDhC
 tri0SCYfDE+1xOF1BvArlugInIgU9l8F9KlkQjAlDPAdSNZXRESHRgc9IIYStwPdMpng2/Hv3
 sVSkFH3KE+u65nETSmrAbfW7eWPuN8Dz6T5DL8eln+NnYoBvXtyD4Y9OfesIy7To/RsD3erbH
 i1U6YRL+T+ZtnjbV1MhNrEOJaNvHwivRhpB9Auzj0f3sDPVbJ8k6e2IAqs4gUdCl8r3oyGrrD
 R3bzM/Xsp9+nwweQnJwIvbm6H3FAarFToKW37K3zpjFjLOb3fAfjE9To8OtlmaZq7RzzUr+NZ
 ycQzxcbLS/m2JZz6EsoT6tbQv4Avogm2V4Em5lgvxsk3VDfEHo=
Subject: [Buildroot] [PATCH 1/3] package/vuejs: bump version to 3.2.45
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
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/vuejs/vuejs.hash | 2 +-
 package/vuejs/vuejs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vuejs/vuejs.hash b/package/vuejs/vuejs.hash
index c53364e97d..e66bee06d3 100644
--- a/package/vuejs/vuejs.hash
+++ b/package/vuejs/vuejs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  042033a2a8e6d45f750924953f03c34058d5afd9cc1571fbaf1827eaf04f6943  vue-3.2.33.tgz
+sha256  968e71a707a4a1961faa6e513b6bba162ef04c3413d7edaba0abc1a5996ae71b  vue-3.2.45.tgz
 sha256  1bb85cc9b13b81ef41c81c51866172fc345e0503c86726a6755b796590b70175  LICENSE
diff --git a/package/vuejs/vuejs.mk b/package/vuejs/vuejs.mk
index d544124bbc..8f7d0cd3d4 100644
--- a/package/vuejs/vuejs.mk
+++ b/package/vuejs/vuejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_VERSION = 3.2.33
+VUEJS_VERSION = 3.2.45
 VUEJS_SOURCE = vue-$(VUEJS_VERSION).tgz
 VUEJS_SITE = https://registry.npmjs.org/vue/-
 VUEJS_LICENSE = MIT
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
