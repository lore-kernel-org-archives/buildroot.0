Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFA8FC433F5
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 08:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7332B83689;
	Tue, 19 Apr 2022 08:54:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uuGyfvfZzvPE; Tue, 19 Apr 2022 08:54:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 97C0682ADD;
	Tue, 19 Apr 2022 08:54:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A76F1BF29C
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 08:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 76A29612CB
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 08:54:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v-1UlVGRayf9 for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 08:54:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2D659612CA
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 08:54:45 +0000 (UTC)
Received: from houde.tangerine ([193.138.218.222]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1MY5XR-1nQO4t2eOT-00YQAG; Tue, 19 Apr 2022 10:54:42 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Tue, 19 Apr 2022 10:54:09 +0200
Message-Id: <20220419085411.125022-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:cMDwMF9TN9ZX2wpgAdCfV4xvJN5yXJli6eq3YWafxVNmdTbGhD4
 EayDFowUb18eV+RTfj8oUn/varqiSBEPueJ4kleO3KFRm9tCwRzuO11NikJnvFVjiFvx+Cj
 +xAqDQV4LTMe9GVFAVik9JrVM/cOCkvgY0f8nJ/bt+H8RRyZxFSW7Qt6grIwmB3ZFhVxaDz
 DRo9L4fpigfttS4iAiLJA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:NHH7ZT7t+vw=:0YBz01QK5X+3Ue/U89u22v
 qAdC2n7b2yq25Kni2/8J039fcqZ3AEBjqauqRGq7Brw1NHxNhTcy8W7bHCnH+SqEy3XYYzfjG
 M/kUwDRWX5tbb0BVHT35T2ycsTxg/RNeuL6etBnbCS14sBHW7Zv4yzA9xtcuux0gLAeFMDMIz
 QqNC75quHo1gY92onmjEYfC8PlJONv5KdWSikz61bQtAS7b5NRSi9a0jEy8vfRcXNQADVH97y
 DFpfZyr+LHHiWqUUhpFQeSx7/30BxOjVjIoCH9UUpSAJzH5hrRwfdU/wEcNHDMU2YK2oL+tSj
 TqC5YqFL5aFXiN5xotvQsgNSZq9gmJBXvpSWrfPlmBPstGDjp2F5Mpvy+xz3GJQjtQ0zfztKh
 OItFYDmiO1RXw4QudUnRxuMJz2NctwnybPgoNtyB0oOOOaNJnavocGviyNMHGQM4FwPn++8Ut
 qBMvQSqbZxVPu2j8cxIJc2AxmQfNkZUkeRvCqV1gAe0dLRlL99Ot1X7UTVWHiXCz01JkhW0MA
 gVx6SrvH4lXajNYwino+AJ8JMMikweJ3qpapVSkdZ/dFROaDhXyRTGixJPEwuYBLJR/woQ8Lb
 eRjhi4ecsc4iBPbt2bxyis2BXqxNnDI0Ijp6NbRiglE9t3nSkfWrzQyngvGRqi47DPEuloLBf
 ap5T4EYWXCZXE921F0eL6s1WEgJEFVoJf+ybxN9aCUKXYzVYO3rOKkOZkPQUxrh1cco3URpZA
 KvL957SRFDScse4EzMfaLvsHEgBleienmyOZhw==
Subject: [Buildroot] [PATCH] package/openlayers: bump to version 6.14.1
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
 package/openlayers/openlayers.hash | 2 +-
 package/openlayers/openlayers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openlayers/openlayers.hash b/package/openlayers/openlayers.hash
index 2d6c2fb9d3..1c93b9a729 100644
--- a/package/openlayers/openlayers.hash
+++ b/package/openlayers/openlayers.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  aeb8107a23a99d79efb6031c7cf901307b63571c39fd744f771d4a707e06a14f  v6.12.0-dist.zip
+sha256  8a9fda6e392688c049ebb88fb2c73b5788b4965b625443de4cca7d4688b1fb82  v6.14.1-dist.zip
diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
index 7532bb7f68..4626e7545a 100644
--- a/package/openlayers/openlayers.mk
+++ b/package/openlayers/openlayers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLAYERS_VERSION = 6.12.0
+OPENLAYERS_VERSION = 6.14.1
 OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-dist.zip
 OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
 OPENLAYERS_LICENSE = BSD-2-Clause
-- 
2.35.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
