Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D078EC7EE23
	for <buildroot@archiver.kernel.org>; Sat, 25 Feb 2023 21:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 84AB840BA3;
	Sat, 25 Feb 2023 21:04:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 84AB840BA3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qFyEyA8hNBlM; Sat, 25 Feb 2023 21:04:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C275840BE0;
	Sat, 25 Feb 2023 21:04:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C275840BE0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 461C41BF3EE
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 21:04:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F11E60BE3
 for <buildroot@lists.busybox.net>; Sat, 25 Feb 2023 21:04:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1F11E60BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uIRYN9M0Uz2q for <buildroot@lists.busybox.net>;
 Sat, 25 Feb 2023 21:04:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9DE1260750
Received: from smtpcmd11117.aruba.it (smtpcmd11117.aruba.it [62.149.156.117])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9DE1260750
 for <buildroot@buildroot.org>; Sat, 25 Feb 2023 21:04:01 +0000 (UTC)
Received: from localhost.localdomain ([146.241.66.151])
 by Aruba Outgoing Smtp  with ESMTPSA
 id W1i1p5FcZEYuOW1i2pyBVL; Sat, 25 Feb 2023 22:03:58 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sat, 25 Feb 2023 22:03:57 +0100
Message-Id: <20230225210357.1449825-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfJYCRe9Q5a+L/4sY2zl3OTmy/4q7UInM9J5CZZ39U60emohsY9mY8qiaAKdP0KyoDe1W/SOEL496buunx2ZWb3jSeRLjFqWmKZW6ki7ieCpaIkcJt8K3
 6Vzd8Wtgn6P89YTabXj8JxPsn/fxBC7tmvXsMYekpKBtXJYVJ4SjmAec5OCFNG+Lu55yX567MQMo1Ok7A7FYb8H7P2jn+gfqGSG7nkNyFMNrL/6/5dhXPF8Z
 pKBnQdCCmgoWumQAsmet2G1Hq9TGad4lw1Qzy2PUngA9AHbSC/Z4DYqNTFwzfFn9
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1677359038; bh=yf59jR/0cSogGH10okUVV2HQThPvXe1a72OmTaTsYxI=;
 h=From:To:Subject:Date:MIME-Version;
 b=WJzhr6rN+Oe10loAERI918CM9KhMny/IvCCdK7l31ey7oWBw0Da0QO8bUifPHHSdM
 VzgsO8qJrHdpqAu/XAWUlDivgtS4ujcS+kdsj9DqKyZzZmt63Xy6tEW0RVSYn/BZiM
 MAg35AIZBb6bvgpArbcG5USsZGW6yiVMpT+seWdpNGDzIE3PzQVUoJALRMpE4mCN3e
 zktg7jHnUvfOiL0M/5iIBYEiWhGuhvedF3N+DW+MXrEs9TZ8ppOl/59424J6oTNV61
 NWlhJ83G8+/dN6HVCiouPGENoyAB9GihM0LhoZXGXAwZUTH4K/o21zrE6gd+aCk8w1
 d2eVvRM1oIeCw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=WJzhr6rN
Subject: [Buildroot] [PATCH] package/rtl8723bu: fix module installation
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

At the moment module is build but not installed to target/. To fix this
let's bump package to 2023-02-18 version on master branch to fix module
installation.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8723bu/rtl8723bu.hash | 2 +-
 package/rtl8723bu/rtl8723bu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
index 6a28c34773..bc3b8fc727 100644
--- a/package/rtl8723bu/rtl8723bu.hash
+++ b/package/rtl8723bu/rtl8723bu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  21372b654886c6d100f46636d7807428698bd618e00db1b8b49cfc3037e46d10  rtl8723bu-f1dbe1c8ccc2c5b2cbeb84da6b9f0e547a84a255.tar.gz
+sha256  d0db523f256795d8f3284fa2ec03855f231747ede8337e878bc096325b965654  rtl8723bu-92c19318cb54ef96c2cfb4a22b2c98eb512812d8.tar.gz
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index af1ac9454e..ad9bb9a462 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723BU_VERSION = f1dbe1c8ccc2c5b2cbeb84da6b9f0e547a84a255
+RTL8723BU_VERSION = 92c19318cb54ef96c2cfb4a22b2c98eb512812d8
 RTL8723BU_SITE = $(call github,lwfinger,rtl8723bu,$(RTL8723BU_VERSION))
 RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
