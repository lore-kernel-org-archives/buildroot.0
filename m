Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314ECC46CD3
	for <buildroot@archiver.kernel.org>; Tue, 26 Dec 2023 20:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9461D80F73;
	Tue, 26 Dec 2023 20:03:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9461D80F73
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id A1pSe7V-mW-W; Tue, 26 Dec 2023 20:03:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC3CD80E7E;
	Tue, 26 Dec 2023 20:03:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC3CD80E7E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0C6941BF3B0
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D871B4098F
 for <buildroot@lists.busybox.net>; Tue, 26 Dec 2023 20:03:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D871B4098F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qC9mhAJ8wi8q for <buildroot@lists.busybox.net>;
 Tue, 26 Dec 2023 20:03:26 +0000 (UTC)
Received: from smtpcmd15177.aruba.it (smtpcmd15177.aruba.it [62.149.156.177])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EA78E40164
 for <buildroot@buildroot.org>; Tue, 26 Dec 2023 20:03:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA78E40164
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id IDe5rQmVx2IzBIDe5rErVn; Tue, 26 Dec 2023 21:03:21 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue, 26 Dec 2023 21:03:20 +0100
Message-Id: <20231226200320.143381-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfPdPxB4cm0c4frYaUswOo2UV7SHL2p7WyEePaML2vNX4se4WbdzEeZWU/rcBXfGkN/o6+fB9bk40uY5auw47o3pILSrVEkE4EXEaa3oaCUyHWrchn9QG
 X3wyzLUyErthmzvHetnG6u72PVqMVRizjxtAbGVzq84cGmPiBEFT9TdE5aovJ5pSFk/NXcgSKuu+YtSVkPGWdJ1rpf7l9OtFWJZliSWgosFDD6YLPbWbYxQ7
 hS2PiCeJsD3cwAYg2EhbDmlWOzbz+nzMTRxLiuzmJ4EIVisuLj4NdsPPcsSmW4zQg4ulKb73EWQV3k8/fbu8Og==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1703621001; bh=afluxDIcutFMdG0S+kalGoU8+DFz79hOS3TWU6qnCDo=;
 h=From:To:Subject:Date:MIME-Version;
 b=fa9LFgfzsUoNcP1/7QyObFdRiQG5zMsm9n8iegrcTp5YrcWsy/JFCVOUueC3pzgxO
 e7XgiBwjQcGFewATOh6RtXffbiW6a2DhS1zvk9eK7H0yK4ZtmZHThiJJNID4JDMymw
 5MRnsCy83tm83Rg50W4cyeBPG87kHm9g9Xtl5aNjAmKMfRbX7x6yxJV/LvQo0okgt7
 MIMan4MnMDTRiqf0pedMRI01hNI1n0YCWN5SUroz+6SDByOyYNa+IYWknm/1aH+P+v
 RQ+Gd7aHggc14rpyWKx9FApzKHA8XV8GYPFhpjFTq7Nsc/n7wtQdKOmlfV2rlHrSrr
 45yLrFcE/Eyjg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=fa9LFgfz
Subject: [Buildroot] [PATCH] package/xr819-xradio: bump to version 2023-12-25
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With this patch package builds with Linux up to version 6.7

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/xr819-xradio/xr819-xradio.hash | 2 +-
 package/xr819-xradio/xr819-xradio.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
index 1ff36368ec..388a3a3cd4 100644
--- a/package/xr819-xradio/xr819-xradio.hash
+++ b/package/xr819-xradio/xr819-xradio.hash
@@ -1,4 +1,4 @@
 # Locally computed
-sha256  e27b6b5fb35ef44a93eb1f5b29bd61c06109e951c8a5ea2cc3e0310663f22001  xr819-xradio-547521df27d1a80fb5542e93fa13bd09fb2259a2.tar.gz
+sha256  8bc3d745ed08b7f3a9c0413c2635d0faf647362b41494d04edc98709b869deef  xr819-xradio-3a1f77fb2db248b7d18d93b67b16e0d6c91db184.tar.gz
 # Locally computed
 sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  LICENSE
diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
index 1e4cdb6872..8b576a347a 100644
--- a/package/xr819-xradio/xr819-xradio.mk
+++ b/package/xr819-xradio/xr819-xradio.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XR819_XRADIO_VERSION = 547521df27d1a80fb5542e93fa13bd09fb2259a2
+XR819_XRADIO_VERSION = 3a1f77fb2db248b7d18d93b67b16e0d6c91db184
 XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
 XR819_XRADIO_LICENSE = GPL-2.0
 XR819_XRADIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
