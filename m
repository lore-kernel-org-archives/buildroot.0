Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8446C76195
	for <buildroot@archiver.kernel.org>; Mon, 27 Mar 2023 18:27:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 38C5A4176D;
	Mon, 27 Mar 2023 18:27:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 38C5A4176D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iCgh0dVe0DgI; Mon, 27 Mar 2023 18:27:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4B17E41763;
	Mon, 27 Mar 2023 18:27:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B17E41763
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 684821BF2EF
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 18:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 402E541763
 for <buildroot@lists.busybox.net>; Mon, 27 Mar 2023 18:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 402E541763
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2QsBC4CjHGrL for <buildroot@lists.busybox.net>;
 Mon, 27 Mar 2023 18:27:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 87D2541756
Received: from smtpcmd04132.aruba.it (smtpcmd04132.aruba.it [62.149.158.132])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 87D2541756
 for <buildroot@buildroot.org>; Mon, 27 Mar 2023 18:27:24 +0000 (UTC)
Received: from localhost.localdomain ([146.241.97.239])
 by Aruba Outgoing Smtp  with ESMTPSA
 id grYvpZsAlMFtdgrYvpkkVN; Mon, 27 Mar 2023 20:27:22 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 27 Mar 2023 20:27:21 +0200
Message-Id: <20230327182721.33997-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfGctGQPOPMctc2OFlLiNjX+zXv/iaXBEmARpYSwt44jSstO8Ow/yOW12uybljJwfEQ60s5z7QWeUvNDt+SLH9dT7Wnse6lohkHW9BM2GYEsWGjqP+m47
 CQB1xymnoMYd7GfglidKLhbsiS2oVFnS5dRIMNl2IzGD8CUt/++tSLMv6mazcj0Suh60GIKqntLznDb8NakXMm3+L5sB4o2XfuqOGj3qxLBwSi6J34sA8XMq
 ML61N6pSvJQTHYvX+0ppq1tuFxicm99mhH8ybxNr/HYdcnqRCvZ8JGXf0PiarocsxMet1/PpsH4wBqDGd8vGVg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1679941642; bh=YPYrJHj/oeleR89ZsiqlIeylNLA9ZNNcxdJQf+sc01s=;
 h=From:To:Subject:Date:MIME-Version;
 b=fm+bIbk4hQ+ndJVxNvEMXwTuzUBMvdtpsdtP/aWhJwRbRINferHsNX483oBQqhS2B
 4RTEEq8X+WmhZc/qysLOOcyt0ufrDfOYASrtCirgqL3QZxJTkkGZ2bSOOnZi+JCwa8
 qgyRhMHtuXKqQsXzJtV2N1XGlER1+9LZGJ93W5nT6boh7k6TO8vxPzuUgdtfngf/ZI
 1JKI0YBEWniEXa3uWmaS6R4ZpBXqZdP4VHfJ+ucP8EAa0U4uADWpLOMj6nBimke8GA
 YpOoSVkh4LrMEy+nC/3I7VOtDoyPV5SdAkuHTjo6aK4D7ObuJmi6FVcDPiNbw0Drtw
 twPtosFJafZdg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=fm+bIbk4
Subject: [Buildroot] [PATCH] package/rtl8189fs: bump to version 2023-03-27
 on rtl8189fs branch
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

Fixes:
http://autobuild.buildroot.net/results/a1c/a1c4c386e60a082d30cae686b9e1d27d01046266/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8189fs/rtl8189fs.hash | 2 +-
 package/rtl8189fs/rtl8189fs.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8189fs/rtl8189fs.hash b/package/rtl8189fs/rtl8189fs.hash
index 018e5b8a77..95a031b6f2 100644
--- a/package/rtl8189fs/rtl8189fs.hash
+++ b/package/rtl8189fs/rtl8189fs.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  20382dbb1ac33425e6b3198cc9be269b79cd1423ea656e0ccd16dedafa3e2a2a  rtl8189fs-ed6741b52bc998875298117b55d18b0d557c37a6.tar.gz
+sha256  5d8aad48b8d124a313e5b8182c5dba2b94ecdbac2a9f1861a50c081b9034a543  rtl8189fs-c223a25b1000d64432eca4201a8f012414dfc7ce.tar.gz
diff --git a/package/rtl8189fs/rtl8189fs.mk b/package/rtl8189fs/rtl8189fs.mk
index 2dd9e6097c..dd35a166e5 100644
--- a/package/rtl8189fs/rtl8189fs.mk
+++ b/package/rtl8189fs/rtl8189fs.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8189FS_VERSION = ed6741b52bc998875298117b55d18b0d557c37a6
+RTL8189FS_VERSION = c223a25b1000d64432eca4201a8f012414dfc7ce
 RTL8189FS_SITE = $(call github,jwrdegoede,rtl8189ES_linux,$(RTL8189FS_VERSION))
 RTL8189FS_LICENSE = GPL-2.0
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
