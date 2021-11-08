Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F066C433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 10:32:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CDDC611C0
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 10:32:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9CDDC611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=green-communications.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F19114025D;
	Mon,  8 Nov 2021 10:32:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id p9wgqy0rYSxj; Mon,  8 Nov 2021 10:32:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D9094025E;
	Mon,  8 Nov 2021 10:32:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 204F51BF36C
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 10:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0FE7080E17
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 10:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D9x-YLLL65Ix for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 10:32:47 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 28D6580DC3
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 10:32:45 +0000 (UTC)
Received: from hardbit.localdomain ([92.154.77.116]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.168]) with ESMTPSA (Nemesis)
 id 1MJV9M-1mzLsZ16kK-00JnYd; Mon, 08 Nov 2021 11:32:43 +0100
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Mon,  8 Nov 2021 11:32:27 +0100
Message-Id: <20211108103227.23310-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:ucJ/ZBVotNLQP9GD5m0k4I3Ym+lPcy9gLwhM2ZsthPtIS1jNzEv
 YIH3FLFpBer1uL8FOor5pMA2THv7Is6kq788JQ2zIeYyi0C9Ri2UHAdQ4UnI1SNGETPBPU6
 op8kvZZkwM0UgRghrqkYPAuWcL5d7/tOCN+i/w2Ob5pXjlokoWMD3wng/psbKhhy+ltYzte
 2il5XPDgdI9cJyK5LiD8g==
X-UI-Out-Filterresults: notjunk:1;V03:K0:viVnd+Dd6lI=:9ZZfyNJMJ/4ERnP2r5/41c
 J7fFsU+fhruMEklEj+8pnhuKSs27rubTkVvMiVbYhopZ+pO8G5Zsd7yqwWx+eGFuUGF9RtxMe
 dC2m18w0+GmfwPm7UEpTaRakzyu0i8vQALxCbLTP6ADvh3HrEVU/ZViBZDSlULswrouBXkU4H
 PUYvmz4Hbj3ynLNwm4I9RtuNLn1PigOq8vsuBZrxpPmvsJIMwujEbwnV/ETizPkX4vzQ/WzbK
 JwY89l7MjhFH8c3rikrRmRqIiSA6PnkOY6H3cLYno7AaMtN9w0bugs5nz0y9IbTcUVPKNvtzQ
 fej4wqJstVzVfIhNyzrQpx6swXBUOxCJprQl6lM/ZedZUfUFDyxfo+7zByvfpHf4NWboIGSwk
 O5M8m/U4af6W7RccyIPMbJMaH+6bMzaLFqpuR+7hRTIsOMZXg96naZxjJBGKJ6oVMEfdNr5lh
 wcNOMbfV8qglALHOttRQT68aqbWo4HEvVb8xAbq9X69bzK2u0wGr5OPnqer2Z9YrcWs3uMG0Z
 ixsZUmcyFEpur4sxmRvAT3kLHAZfZ9FfClCAbr6HLt3kobhpc58XQ4pdRz+6VhaMu2ozCmrI9
 P98Bwy5r8Ezw6fuz+yp7uQn7uCQIflbphpXurDkhXMgMI5qE1erbqFi0+sJeRnaP13+jeKe0s
 8KaRAgMKVK6Os3mS9hPZ8KdfzAuGTJD6Tuq+0vGoQiMN5bAMVmX/b2oFHC458Nx3XjbYF3dgn
 NydbuBlY9TKDgrsNxzlohZrtt4EbJ5FMggXGaQ==
Subject: [Buildroot] [PATCH 1/1] package/openlayers: bump to version 6.9.0
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
index 306996090c..e29365fc91 100644
--- a/package/openlayers/openlayers.hash
+++ b/package/openlayers/openlayers.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	07d06f17f44399d86ddeac8d8000d39ff9db503257f77c59e5743d5934463623	v6.8.1-dist.zip
+sha256	35a0b37a5c1e7c48553215c6e8c24a12bac8e9048f008fc61c4b329cf6611b5c	v6.9.0-dist.zip
diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
index 7a4922edc4..b20ea9977c 100644
--- a/package/openlayers/openlayers.mk
+++ b/package/openlayers/openlayers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLAYERS_VERSION = 6.8.1
+OPENLAYERS_VERSION = 6.9.0
 OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-dist.zip
 OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
 OPENLAYERS_LICENSE = BSD-2-Clause
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
