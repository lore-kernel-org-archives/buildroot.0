Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1FFDC433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 09:42:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 570554094B;
	Mon, 31 Jan 2022 09:42:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id C5KQ9udt4eO3; Mon, 31 Jan 2022 09:42:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A6E4F4093A;
	Mon, 31 Jan 2022 09:42:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DE8A01BF2B9
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 09:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CA7B483EE0
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 09:42:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id axT4R9mz4OZD for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 09:42:29 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 850C483EDF
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 09:42:28 +0000 (UTC)
Received: from houde.tangerine ([185.195.233.153]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1MJV9M-1mz8DB0iEq-00JrVm; Mon, 31 Jan 2022 10:42:25 +0100
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 10:41:56 +0100
Message-Id: <20220131094156.166729-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Provags-ID: V03:K1:8oWAxljuvNA7fP92w+V5GCzE27UKUPHeH3+z8BIHbaz004Q1s7r
 vIj7b/GeyK5j7lSlxzl1hAyOBhavt+qr8iUji9Y7/q6ZQFZgD8rDttDO2sTTf4/beb/eK/1
 VzQBn6tr6yljpsucBM+dfo7EfJ3LO7Qcs/g+sVDyPM9IQNXqIqBhcgsYbmBDSlngvQaQTqA
 7hkTPo4XXlONfQwoi2cSA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IJpT5Rhn3yo=:9FUGmocJzLNuzXQgRUrJtv
 FoDDwp5crFEqY8FrJ00INFiO5QbOKEnHZGn77GvYYUqH754MTb8IeR3uay8fVBjE4jNvv7Csf
 11iydNqZbc1ayczMT0quh4vvp+jmkTOkkXpnxof2Me88VYRm3SpJuPxdqWSsZOeuK5U/4+zxV
 Q+9bSVcdSQ5KiS6dcSm0zQ97/kL/uNkQ18hjVMWXomrd6x8BpV3c6ssqrLqIDeyXB8tFkjm4u
 /D90KVLKGHPKh1X1MXfapfxqIaLKHk0hr7/zu68E9qKUYXz0YMMVFGnzCEgc8bot5/tc/pgDL
 LgFKPfapO4Hf4Qh+LFpMY8M4I1qoF5gdVv90kk+B/AJahDDxDB798ks6fr0i429o2BXDLfZEJ
 j+r7gKUrzkrH3Q6b/+w5NtHb3AT4Kknli3zbmFrF4ewquYBQ9GnpRlzIErFhVCjaxUGmGifCA
 2qJQLpHdKaVPT5a4ZbkHaqw8PCHp5LgsR2XkcIZcjwu3i7+yuoVrzb8gVhY9VTIsJ5r8pfsO8
 C6GWrgAGkBQOTPULWpTDCEua3yaK/sMb6TReXb+CG2iZXrlYrehojJgh6vSz2n7Y+vsIRCuLm
 6J8MmebzJzQTiKT4Qnea6sp7HzYC5ctkNw/IyLu8kn8lc2xj+YLpgDmk6dlUYc1pmLerRdVTR
 aOfzWi1QFJijtFOF+q680hTONUqCmnaQ/pF56ckVqqv925Wq3k0jGbdTKOru7OoTk7cDrma7t
 CVqnkY7UYnWW1J9A6tiOT8HnNY5qlt5mb0aE3w==
Subject: [Buildroot] [PATCH 1/1] package/openlayers: bump to version 6.12.0
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
index b72d5fcde8..2d6c2fb9d3 100644
--- a/package/openlayers/openlayers.hash
+++ b/package/openlayers/openlayers.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256  8c4751915808a5a84adcd760fff453429a95993cadf77003ac94eae127240c1a  v6.11.0-dist.zip
+sha256  aeb8107a23a99d79efb6031c7cf901307b63571c39fd744f771d4a707e06a14f  v6.12.0-dist.zip
diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
index 1f8b485018..7532bb7f68 100644
--- a/package/openlayers/openlayers.mk
+++ b/package/openlayers/openlayers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLAYERS_VERSION = 6.11.0
+OPENLAYERS_VERSION = 6.12.0
 OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-dist.zip
 OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
 OPENLAYERS_LICENSE = BSD-2-Clause
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
