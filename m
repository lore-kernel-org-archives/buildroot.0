Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57CE9C4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 14:26:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F202C60F36
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 14:26:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F202C60F36
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=green-communications.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1332828A9;
	Mon,  2 Aug 2021 14:26:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e2pWGzO_Re1t; Mon,  2 Aug 2021 14:26:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 09F2782896;
	Mon,  2 Aug 2021 14:26:48 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7A9A41BF4D5
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 14:26:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6755D403C3
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 14:26:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EpWq_GFBc7T9 for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 14:26:45 +0000 (UTC)
X-Greylist: delayed 00:05:05 by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2EF1D403C1
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 14:26:44 +0000 (UTC)
Received: from houde.tangerine ([141.98.255.145]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.168]) with ESMTPSA (Nemesis) id
 1MxV4T-1n7Rto0AqP-00xonK; Mon, 02 Aug 2021 16:21:37 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Mon,  2 Aug 2021 16:20:56 +0200
Message-Id: <20210802142056.379851-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:BOaX4KVvkovfWLNZmKYLtgpoyuXP5LWKKYd8Lv5viBAXXCVE410
 AHcDb3cEOyr67VKn0Bs3hU3rHSoHccjdhV0zDyY4b67NGg+rrKOBetYa5Oo8MDhmuColkXL
 CjD3G5cyeTK/5+XYS0URsdePaM6bPN04hlDRVgfnDS7xIBz22rTAWPI6cESN24j8aMImEAS
 hTAuG5Bq6IUhpWnwgumIg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:AP0r8Q45eY4=:hokABfEf9PNrnKWNFKKoXL
 3bwHY31kFyLV8nT0vju7v4pdmjVkEvhOZMZpnmqEKa0NmDrKr8a8f5CM7vS1s+9JO3/awzpwh
 bVVOTQdgclJi980mgAZ8UvUebxGVoj7NzUH/EGbhljzfDZdGQDhxWU/o0hP66XSUGthgg7N7O
 r0INi6VLo3EMEwI1PLhjq8cFZuX896oQs4ShJpKFnLmo0PoXwqh4hvCOc+r8GqcNc1p6yAnBO
 E4QLmT69p999Jt6HZ9tG/SM5EaPO4cjjM06vSen0BV2CRck6o6yXlbPvlGxZKLfSDiHrw4Zl7
 GWruDRpYuOjcVS6fqxScYJ+/ezLW9YG0omMGp9Yhftqd/I4/gcew9vIcLtIJTpi5NtDEblcMU
 PcgC/OqIQpiwRyg6D5PCJAVedow5KDCuivR1xfJ4agO6UK5JqMv1ipQjrDGlDfTFdQEEk3rdb
 g3YpadkAfb0Vt6WPyjHrHVl8++8NMK8HuInv8MmXWVLUgKqD0eOtV7dKyoWO7M7SOWSo3Vgqn
 K+T8BsKPBWugnFg0s87B3FrEpHYVe49C9dlFcDN6gxOGOegSAYkQWPlHv2SWKppyOY0YhStt5
 fo30W3dohJ8M+34X1Zr/U3qS/zJOchLj9LAsEZeB5vdykf/ICELLewJ+1HXDwaC3WI+MYdv8U
 ZT5+DAMGzTsnn40BSP98GS3z0+6unYpk3ShCVEX7hD+jXTpEHCoVnsvCMWonHfsIZcq6zfwmy
 LYJgFSGTJ5VgIsvIc8PzoV0WvMVfJa04RvXsUSWjk2Siii/9a8hZBaBHhlEvvuGx5TFBvF9wk
 5+EXaIdjaNSHyaeKObo0PXif0K2wdLm0k1zjXqpeL74q3Gq/m8shjg8gFCZMNdk6bZSUjAlhc
 qX69ClyB/+Lz4bsjDhtwenPc5vdazWj7kV9WI6us4=
Subject: [Buildroot] [PATCH 1/1] package/vuejs: bump version to 3.1.5
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/vuejs/vuejs.hash | 3 ++-
 package/vuejs/vuejs.mk   | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/vuejs/vuejs.hash b/package/vuejs/vuejs.hash
index db4a5bbe3e..c2804961d2 100644
--- a/package/vuejs/vuejs.hash
+++ b/package/vuejs/vuejs.hash
@@ -1,2 +1,3 @@
 # Locally computed
-sha256  a69f04bf138af09a956150675151edb9354aeec8bd627c21cbcfa646248214fa  vue-3.0.5.tgz
+sha256  ddd5e07483d18d2abd645c01200f57d5ffd1c3bf262cdb9f9e1a66a7b855d84a  vue-3.1.5.tgz
+sha256  1bb85cc9b13b81ef41c81c51866172fc345e0503c86726a6755b796590b70175  LICENSE
diff --git a/package/vuejs/vuejs.mk b/package/vuejs/vuejs.mk
index 43b45e00b7..18e12f69d4 100644
--- a/package/vuejs/vuejs.mk
+++ b/package/vuejs/vuejs.mk
@@ -4,10 +4,11 @@
 #
 ################################################################################
 
-VUEJS_VERSION = 3.0.5
+VUEJS_VERSION = 3.1.5
 VUEJS_SOURCE = vue-$(VUEJS_VERSION).tgz
 VUEJS_SITE = https://registry.npmjs.org/vue/-
 VUEJS_LICENSE = MIT
+VUEJS_LICENSE_FILES = LICENSE
 
 # Install .min.js as .js
 define VUEJS_INSTALL_TARGET_CMDS
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
