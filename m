Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 003C2ECAAD8
	for <buildroot@archiver.kernel.org>; Fri, 16 Sep 2022 19:03:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8803240C15;
	Fri, 16 Sep 2022 19:03:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8803240C15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id AxqQ0Pp1eURU; Fri, 16 Sep 2022 19:03:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 72C8940C0E;
	Fri, 16 Sep 2022 19:03:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 72C8940C0E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C6E51BF3E9
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 19:03:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 173524190C
 for <buildroot@lists.busybox.net>; Fri, 16 Sep 2022 19:03:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 173524190C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m9xLwUsjeq2l for <buildroot@lists.busybox.net>;
 Fri, 16 Sep 2022 19:03:11 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3691E41738
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3691E41738
 for <buildroot@buildroot.org>; Fri, 16 Sep 2022 19:03:10 +0000 (UTC)
Received: from localhost.localdomain ([146.241.22.4])
 by Aruba Outgoing Smtp  with ESMTPSA
 id ZGcHoXe2tMW5FZGcHoLRMO; Fri, 16 Sep 2022 21:03:09 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Fri, 16 Sep 2022 21:03:08 +0200
Message-Id: <20220916190308.579267-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfAkTpmNYEPG0xYVWfZWM4Lj86yJjGesQVdSS2xIjq1GRl2RZYjRG/07JxFLSsLPJh/fJfrHkLsunZYdxiZ7wWANyZZMsDjUPn9pcOhmyYyjQ5JA5gYvx
 ArB1uTRARxYidJlxfFqQTEjOZlQeZgb2TCQOazmkvntEcSJ1toPpEXC6ozNsEAHteL4/6RYqXxdVQ/TPp2EyAYhl+4T7W1kIr7KJCtqksHNjHQe9hKMNQlMw
 DVexcoDy44ATJThBGFeoRB0Cs366nwV6l1KmI5K0Yek=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1663354989; bh=yLVZW4shq1EJtQ7H0VZkY+yUGe7agiOS8t0jx9qpjrU=;
 h=From:To:Subject:Date:MIME-Version;
 b=T3msxWCCJvMkktNAMBfBVXoJtGUxumpTxxAgkErNr8raGZaF4Kzx5h+exnlpnh3t5
 SZh/0xjArPRw1YX6lrDBAJoWoQiacDZDdldSjKVtHVHd8H0uiJiRkV2akjOcWWOwwl
 72H47PueU8Cx93WdLO1HFsQrHfWlgLgFViLGHK48IeYd97NTP9UXhOyvkwILDgsv0A
 HR1HAcAu5L4RIpeXxjItWDY4ldTUOaQIyRx03ivrmOKLG8lmo+qniredWp1JjaafXW
 fhaFZFlNY60uab5zzJY++U6iEdIltv03nCXWkKvjObBYiIZUIgeTO2n4FT5VAsKXbE
 h56BRR0FxO5Yg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=T3msxWCC
Subject: [Buildroot] [PATCH] package/rtl8723bu: bump to latest version
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

Fixes:
http://autobuild.buildroot.net/results/4ba/4baf7b753a16e9cd798eaf51a4cb994a22f437e8/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/rtl8723bu/rtl8723bu.hash | 2 +-
 package/rtl8723bu/rtl8723bu.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/rtl8723bu/rtl8723bu.hash b/package/rtl8723bu/rtl8723bu.hash
index 1dad7154b4..9119abad76 100644
--- a/package/rtl8723bu/rtl8723bu.hash
+++ b/package/rtl8723bu/rtl8723bu.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  1cd658742ce10b21c92877e09cecc98880680d5f150de3845553005abc542977  rtl8723bu-19b4bdc05483a1e79a4f955a80f8f72cdd5dedc3.tar.gz
+sha256  07fece152704f4b5dbd0fd3af842816f95824317f3158fea774f15a6eddac009  rtl8723bu-d79a676a8d3f0bb6ac8af126689c6ac6869cb6f2.tar.gz
diff --git a/package/rtl8723bu/rtl8723bu.mk b/package/rtl8723bu/rtl8723bu.mk
index 838bbedb74..3da8d9cecf 100644
--- a/package/rtl8723bu/rtl8723bu.mk
+++ b/package/rtl8723bu/rtl8723bu.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-RTL8723BU_VERSION = 19b4bdc05483a1e79a4f955a80f8f72cdd5dedc3
+RTL8723BU_VERSION = d79a676a8d3f0bb6ac8af126689c6ac6869cb6f2
 RTL8723BU_SITE = $(call github,lwfinger,rtl8723bu,$(RTL8723BU_VERSION))
 RTL8723BU_LICENSE = GPL-2.0, proprietary (*.bin firmware blobs)
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
