Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1206EC4167B
	for <buildroot@archiver.kernel.org>; Mon, 11 Dec 2023 09:56:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C733611C5;
	Mon, 11 Dec 2023 09:56:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C733611C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XkmsYs8O8vOa; Mon, 11 Dec 2023 09:56:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E7546611B5;
	Mon, 11 Dec 2023 09:56:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E7546611B5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 406D51BF593
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 09:56:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2651681EA9
 for <buildroot@lists.busybox.net>; Mon, 11 Dec 2023 09:56:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2651681EA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LVPmmkzTBslL for <buildroot@lists.busybox.net>;
 Mon, 11 Dec 2023 09:56:29 +0000 (UTC)
Received: from bg4.exmail.qq.com (bg4.exmail.qq.com [43.155.65.254])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7EBA81B01
 for <buildroot@buildroot.org>; Mon, 11 Dec 2023 09:56:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7EBA81B01
X-QQ-mid: bizesmtp75t1702288576tvqgds0v
Received: from main2-ubuntu.tail147f4.ts.net ( [202.201.15.117])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Mon, 11 Dec 2023 17:56:15 +0800 (CST)
X-QQ-SSF: 01200000000000B06000000A0000000
X-QQ-FEAT: l3NhZMCtXe2nwWUGJl4eFBzFveez/bfWkRIAnGXnBmiQm4oAcEDceGIV/sqdB
 RxiHFoPtuSszt3Gl1JR8qputbTeEVrevgHHiLJboYqW9BVYG/6AGe/7/OB+GTgkguoa26g7
 HdP8M06uy59L8ny9VyBRiY67xA6/LW75a7LQeXEczpVNyRG06Td6bfmaXC9u4sGTa+le67r
 n+zNuUd9sjOau8ew66zJt+SnOVkVeE+bOz5O7mZidCuyNf6MmvzqEAtFfCL3DwVcKiOXKzr
 ny6/KsyphOtsg4mLefM6WxfrJ3ckqy3xalD6t7JE07mlncyM9SA0cXDWlN52KEL9EnnLoMR
 HV13Vf/o2+yVilNqFn79aVxVgFg/AKn2PPJmAO9
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 8449250768287083628
From: Yuan Tan <tanyuan@tinylab.org>
To: buildroot@buildroot.org,
	yann.morin.1998@free.fr
Date: Mon, 11 Dec 2023 17:56:14 +0800
Message-Id: <20231211095614.182498-1-tanyuan@tinylab.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-1
Subject: [Buildroot] Inquiry About Mirroring Methods for Buildroot Packages
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

I am reaching out to inquire about the best practices for mirroring
Buildroot packages. We aim to establish a reliable mirror for these
packages, particularly to facilitate access for users in regions like
mainland China, where downloading packages can sometimes be challenging.

I have two suggestions and would like to know if either is possible:

1. Could you enable rsync for sources.buildroot.net? This would make it
easier for mirror sites to stay updated.

2. If rsync isn't an option, would it be okay to use wget to clone the
entire sources.buildroot.net?

I would also like to inquire if there are any licensing or authorization
considerations we should be aware of when mirroring Buildroot.

Thank you for taking the time to consider these options. I greatly
appreciate any guidance or suggestions you can provide.

Best regards,

Yuan

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
