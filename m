Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F672C77B7D
	for <buildroot@archiver.kernel.org>; Mon, 15 May 2023 08:55:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30AF341FF4;
	Mon, 15 May 2023 08:55:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30AF341FF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WT_PVcK1axC6; Mon, 15 May 2023 08:55:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B5DC41FAE;
	Mon, 15 May 2023 08:55:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B5DC41FAE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 1F2261BF592
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 08:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E67706112F
 for <buildroot@lists.busybox.net>; Mon, 15 May 2023 08:55:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E67706112F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Wj-ziKFf1tDh for <buildroot@lists.busybox.net>;
 Mon, 15 May 2023 08:55:43 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 36AA560C23
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 36AA560C23
 for <buildroot@buildroot.org>; Mon, 15 May 2023 08:55:42 +0000 (UTC)
Received: from harderbit ([92.154.77.116]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1Mdvua-1qZC7Z22dS-00b0TO; Mon, 15 May 2023 10:55:39 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Mon, 15 May 2023 10:55:21 +0200
Message-Id: <20230515085521.12490-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:++IR9o0ClY6b28kT1LCvvqIAm9F28olWFwTmAhEcEn4ngfWn6Qs
 UKX7tNTVBELrnQc9YgHa2j1OLgbmTgjzeOxRvPJmLsCgoW39Ny5FbofKauf8d06MkWdS61u
 TyzNvXIdJ7cN1Ba273ConRwH35I3Cx1gyfKYh0Q7GWIr/ok6uCpnhpfRSLi6dV0NpZ1xzQW
 Kg5/VwjmaIm4nsD1WtfmA==
UI-OutboundReport: notjunk:1;M01:P0:UcCiRXeacAY=;iwJeQsqarxg7cZZSfq68BOkTAn2
 31M4aT3fCW38U24GQ1/41uslqxvl6pyY6v05nIzCVk/O8NEWfPiPYtEIZzXKIqdC33pR2C9vG
 eBRi1j8SVxmXPmmv5kN/ePgjfnMMNDUawqNNBu4FHKvTjmf6WrMLZIFWAgrWztCaruqxQfnlI
 0+esXZoyqKG2l/ltKHnFIR4av352UPnIH9tIoTlCPDLsVfGsU97655+Jty6UqaziMt5bSIic2
 jeTRXyErjI/w8pOL+CEHbxgiCgJkdsKXYcJnB8jaqtBo5risM2Vpu1fQksGW2LW9djVOlDAXY
 EqKS+AaqVH4nu+t4PSVnDx9lYATpKdNOjzLCTiOgo3/vL7FcYHPCuALKp86ey+X5Nsd3/nI/M
 iQM18z86qAeXbEiZJE2W3eJ5o8dGwEO0nDSRwSFlBZbdMNWSjX4NGb4US9yUatrMbafJwH5/G
 xeRwjQyw+k/jolh32/iogl7oBOnttm+CucIoZcag/p0KXNchQ0mHcuYcBzSJfWAlvllSijVy7
 +64PXSj8Qv0GAZTlki/QHuld8HNJb5O53TmjmqDyRiveegruuLbky/ftZY9fUC7z8kwtgYCzp
 iqFs3oklwLwGi1yWININXvO/akwJBcqTKNvmdQospSuwVp4Sv3lwnIoI21VEZ1vi1j1tG+8hT
 +H/w2mV3UQ7wCdyMPmfsiqBI2KVcToobzlR8afiUuA==
Subject: [Buildroot] [PATCH 1/1] package/vuejs: bump to version 3.3.2
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

This is only a bugfix release, to fix the bugs introduced by the
recent 3.3 release.

List of fixes here:
https://github.com/vuejs/core/blob/main/CHANGELOG.md#332-2023-05-12

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/vuejs/vuejs.hash | 2 +-
 package/vuejs/vuejs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/vuejs/vuejs.hash b/package/vuejs/vuejs.hash
index 7960b594ce..488608bc4c 100644
--- a/package/vuejs/vuejs.hash
+++ b/package/vuejs/vuejs.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  c2e4197818c64d6ad9f344141a8adee354cbc321f63be7eef6802b4b02cf19f3  vue-3.3.1.tgz
+sha256  b4d0234f0806a723d79a89426c7dbb351cf6cf554c323cf2625a3e078a93d065  vue-3.3.2.tgz
 sha256  1bb85cc9b13b81ef41c81c51866172fc345e0503c86726a6755b796590b70175  LICENSE
diff --git a/package/vuejs/vuejs.mk b/package/vuejs/vuejs.mk
index a9058b0d44..50b7100b8a 100644
--- a/package/vuejs/vuejs.mk
+++ b/package/vuejs/vuejs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-VUEJS_VERSION = 3.3.1
+VUEJS_VERSION = 3.3.2
 VUEJS_SOURCE = vue-$(VUEJS_VERSION).tgz
 VUEJS_SITE = https://registry.npmjs.org/vue/-
 VUEJS_LICENSE = MIT
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
