Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37D72C433F5
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 21:38:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84702611CC
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 21:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84702611CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37510841A3;
	Wed,  6 Oct 2021 21:38:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Sdlr9EPmsZmi; Wed,  6 Oct 2021 21:38:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 934718419C;
	Wed,  6 Oct 2021 21:38:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9C7451BF2A1
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 21:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 978494080A
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 21:37:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AfbFS35OTJUV for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 21:37:46 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E458C40802
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 21:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1633556249;
 bh=yDb9fjJOa6AaaO2Ix/uDlKEC4iPKCbmizf/RGB+aH8s=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Cxn/94dGfyZMRzoaFctkmwhGzPzHdCS08pn+RmPtebC4yDdt0TrhtiLKotuR6BKQB
 0IgVQTJqUqpxrSA7atu35W7gCJqrLlnwPkU+hucJuqXSUN7gAX8mLTmSajqplR0gLK
 NJXO5/ORfbk0gC/p1tTIC2kIk9zf4tStTCb5qzwc=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost.fritz.box ([62.216.209.251]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N95iH-1mt4iE2rTj-016AeV; Wed, 06 Oct 2021 23:37:29 +0200
From: Peter Seiderer <ps.report@gmx.net>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 23:37:25 +0200
Message-Id: <20211006213728.1069-2-ps.report@gmx.net>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211006213728.1069-1-ps.report@gmx.net>
References: <20211006213728.1069-1-ps.report@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:Vc9kRqZC309Rt5BIlTLzetwlX4dCYuyNhqR10Em5uuFhAju0xFL
 zwm0anab81AqE9thFSH7eWa3Ee+lMo9CMS4XEgZsSvLqxbn2yOLk4N2VKkWrn8LpkjqLHSH
 h91zKta8gilupmdsKNHLVCZC7gyAyuzikgdbJ21vhuY69LgSyZ1xN9yyJqMSAJKK4v1SGXR
 67lJG0mGrqujDItidkSaQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tNQPTAwiFmE=:/CViNSQ3MmgRDuIxP0EH4S
 f3U3LQv41CxiPuMVl835RDGlEp47qxLvoZPYBj4Xsqepk+Gj/DeD+1aE7mbWjS8SuRTR7t7lC
 +AxbvIJg2qm6Icisguz1fPwHMZbvSlaki/zQrELozYOebXenvKT1H4W+uL04L7hyQxvZBUHJ9
 CkclTRz15g/dGSi5le25dQV+vV+lq7OqxT6f8ug5tKZ7jSh1pG4NnhGH/ZaeOgGqQKQqhDKpB
 /dN6gaiEPN9wniE0pIKyf4c7LbynFx6C3CGSaqRsf3cJ+YP/o2acI2Q5jS2X4eacY6IWMz2uA
 57gOaSBUZ2veK5hY7eS7tT5riGFph4lbW4UQ4xKMPhiVJI96Z9x3v/ZZYuQzFJXbbga+6JANe
 p8cGiah4d+mOyBYdoURY1gulO5MfPNa0dIvm5lgpgr6fQXdn7YcLfZB7HYXI3X1biPzEww1Br
 jGPOruXyjoT/9LtKLhTtAptTt9uoRjFCevpl/FMW3WNLjLzcGbiENTjvlHpxSYUwbDS3qE5Hq
 r7h3DU8YGZvSb1Mi/yJbn5veBXOIp1vZHKqHHcdnmGVXcx4RyANYxzNYPUM3o6LmsNEBJ2sqv
 wLnPJQ6Z7vkYfJSaEjeVuSTadLpONNoZwSF4dUDtLz3T1pc5dBLDZAzVzeFsd8jqGwnKQT05h
 MnRKpRgIhlmQQM25wBUnUQJ9hz+8samdJcXgW1phDdppTE+4v8vHqC1MfJ56atpWRvnZYeTC8
 tbZN+gxSJ544aZgiBDWBvv67vamC2eaOBiDNiHwnHirHqKuufC4hynxaqMsPZuDgeqZveaI1k
 MaA9Mqxzm3Id3PvyAsjPhLEqSlwqNxGiHwRWQ277bNbXeHwRSn6cnD72DJfcPbjzkksmpijmG
 8kUZWgXs0My97S7cF4ACRZqvqNdxsrKHn98kKxHRJ2mttApEuvtACQlOoo+dGirvRXBr6AzNj
 xsw3oqoSTEjeZ63TSNu8hrqFps35MA7UUxaX7DaCSgWDZGCDRZbMLPxwrDjW9M7PqRUaNFjEE
 C28VFJufGkTb07slmG1FBMBW0aNxKKX+R2ZslJB6EzjhxXMLvC2jR4kg8ZPtZUCXQBzLkuFHy
 nXi2vXc23Q2/D8=
Subject: [Buildroot] [PATCH v2 2/5] package/rpi-firmware: bump version to
 2ef3800
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
Cc: Vincent Fazio <vfazio@xes-inc.com>,
 Arthur Courtel <arthur.courtel@smile.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

- bump version to 2ef3800 (past [1] which fixes the boot starvation
  introduced by [2] as reported by Vincent Fazio <vfazio@xes-inc.com>
  see [3] and [4])

[1] https://github.com/raspberrypi/firmware/commit/b5257da58c0e652633592c6fce09a7f3b100a2eb
[2] https://github.com/raspberrypi/firmware/commit/25e2b597ebfb2495eab4816a276758dcc6ea21f1
[3] http://lists.busybox.net/pipermail/buildroot/2021-September/623659.html
[4] http://lists.busybox.net/pipermail/buildroot/2021-September/624550.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - update to 2ef3800
---
 package/rpi-firmware/rpi-firmware.hash | 2 +-
 package/rpi-firmware/rpi-firmware.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rpi-firmware/rpi-firmware.hash b/package/rpi-firmware/rpi-firmware.hash
index 7127b2d824..0ff7a73a37 100644
--- a/package/rpi-firmware/rpi-firmware.hash
+++ b/package/rpi-firmware/rpi-firmware.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  5eaff5da660d6ecd74bb2c927d7a1ba84b5e5c5582f02e65aec058af2ffe50f4  rpi-firmware-33e09977ff3b02967d191801e3361224455acb9d.tar.gz
+sha256  80af5efb51677edb7af6746a553dc2d8ad3f532ff44e4b7263f1e12d4bf72ffd  rpi-firmware-2ef3800b1b71c0e30c2a61ecad6e007ae96ea342.tar.gz
 sha256  c7283ff51f863d93a275c66e3b4cb08021a5dd4d8c1e7acc47d872fbe52d3d6b  boot/LICENCE.broadcom
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index 181650fa08..d74f7155c7 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RPI_FIRMWARE_VERSION = 33e09977ff3b02967d191801e3361224455acb9d
+RPI_FIRMWARE_VERSION = 2ef3800b1b71c0e30c2a61ecad6e007ae96ea342
 RPI_FIRMWARE_SITE = $(call github,raspberrypi,firmware,$(RPI_FIRMWARE_VERSION))
 RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
