Return-Path: <SRS0=BIUF=O2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91813C433EF
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 05:33:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C76B9611CA
	for <buildroot@archiver.kernel.org>; Wed,  6 Oct 2021 05:33:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C76B9611CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lespocky.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 67216403EF;
	Wed,  6 Oct 2021 05:33:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eCh2DnBf46NI; Wed,  6 Oct 2021 05:33:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 69E3D403EC;
	Wed,  6 Oct 2021 05:33:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AB59E1BF9AF
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 05:32:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 973664044F
 for <buildroot@lists.busybox.net>; Wed,  6 Oct 2021 05:32:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GXib7EIguZPx for <buildroot@lists.busybox.net>;
 Wed,  6 Oct 2021 05:32:47 +0000 (UTC)
X-Greylist: delayed 00:05:08 by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.74])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E2B2D40428
 for <buildroot@buildroot.org>; Wed,  6 Oct 2021 05:32:46 +0000 (UTC)
Received: from methusalix.internal.home.lespocky.de ([92.117.42.49]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1MMXYH-1mFdUy37DT-00JXPp; Wed, 06 Oct 2021 07:27:31 +0200
Received: from lemmy.internal.home.lespocky.de ([192.168.243.175]
 helo=lemmy.home.lespocky.de)
 by methusalix.internal.home.lespocky.de with esmtpsa (TLS1.3) tls
 TLS_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <alex@home.lespocky.de>)
 id 1mXzSi-0005bY-Pa; Wed, 06 Oct 2021 07:27:30 +0200
Received: (nullmailer pid 7386 invoked by uid 2001);
 Wed, 06 Oct 2021 05:27:28 -0000
From: Alexander Dahl <post@lespocky.de>
To: buildroot@buildroot.org
Date: Wed,  6 Oct 2021 07:27:14 +0200
Message-Id: <20211006052717.7328-1-post@lespocky.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Scan-Signature: f00bfd5f632f2c745cc9cbc9a9ad50ee
X-Provags-ID: V03:K1:ThLuVBxRIZQOMA2kJkmf0Si+q6H3vBaNEL2bI1HzunqYcDqe24Q
 VDY0ovToiORHxKWO7r+VFwkTrSasW/0lbkUVbRRlRVHwbS3VPlSs2zE2sEPchBeZzz7FR5d
 TwbAsOCddyjsLQyyclc27vfRlFkLCi3v2JYNvTxknmw/QurNZNHn5AuJh1zrgbE8XyVev3Z
 3AQMHxXzJj7mT0J0hccGg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:2djTXbtveOE=:lqUjTURuxwU8lK8oR4Oqq/
 zjhw/RE1QpFiZBArK7MwPmGuahBMeHLfRuEdjl3rE/4UdskBGkPuosQ1UIv7A6WZhJXZqgniw
 iJY3oW57/17YVD16C/HZ4IrFKqWFSJjg8Z5U+9hDKcpGbv7l71oWo+AqxTTuSE3Wec+DHqrNS
 D9PTQlLh2bHLzmq0wLGcXGtmg/53v1PWdQj10h67wd0Tey9pxyQf2xzEjDKKJ45d4SIEG5nRF
 jyzE7jTcnZvuZShSMgqC3c2CX0UHWtPDXqH/0pnvoqbbUVfYgwJq9QtGDz6xlj1b4zvTzELdh
 DxrnqysxWXu50q+3HGxeV3ClAAdigAUXZJltbj7ZZT+/AQ+b8V9n7kMoA5f4RxPuJg1oW7J+U
 duHX8QA2N9FGYC406sNeywjzgDGDvfdyzTTr6ZkSWlzoHodhxPLTi1Up/9174lzrinztdu+kc
 D13CYgQgEUHeb10ZCne2lC5jhHNPE5/ok60LZUN3GDVx6XUjYZ+pf9wx8PZkdMgCQg0WtHH9v
 +IPm2Q0T4LbGqjT/J18KnUF2UbO5okJ/hxUvdQmAZ47Hlkh44Num5f6QYrOy9zJTLm2DJdrNN
 wl5kKn124nxsRNs+2/qM3h9/i4qVI1DKkHrZqTt+0f2J1l30fsVxXDcYPBejKumP4p4Kw8yZQ
 RiytgLNKIdN2/cWuwgDfCy+CElItuleIrtjzffKqRXdZr9QWv/wYFAHdQOcTeAXfdzQNHcFH+
 59sC2V1b/VIcU9GVn2fefiz1raCy2NoGt4XC9g==
Subject: [Buildroot] [PATCH 0/3] package/dfu-util: new version 0.11
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
Cc: Alexander Dahl <post@lespocky.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hei hei,

some housekeeping before and bumping dfu-util to 0.11.

Greets
Alex

Alexander Dahl (3):
  package/dfu-util: Update help text
  package/dfu-util: Fix licenses
  package/dfu-util: bump version to 0.11

 package/dfu-util/Config.in      | 7 ++++---
 package/dfu-util/Config.in.host | 7 ++++---
 package/dfu-util/dfu-util.hash  | 6 +++---
 package/dfu-util/dfu-util.mk    | 4 ++--
 4 files changed, 13 insertions(+), 11 deletions(-)


base-commit: 280f7793b209156f0601f36916790f01cd1d33b7
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
