Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D395CD37B4
	for <buildroot@archiver.kernel.org>; Sun, 17 Sep 2023 20:51:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCCBF40598;
	Sun, 17 Sep 2023 20:51:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CCCBF40598
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5jHYEJSbDDif; Sun, 17 Sep 2023 20:51:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EE9A7411A1;
	Sun, 17 Sep 2023 20:51:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE9A7411A1
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 976AF1BF870
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 20:51:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6B66A415E7
 for <buildroot@lists.busybox.net>; Sun, 17 Sep 2023 20:51:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6B66A415E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IGy-9Ry4YpzP for <buildroot@lists.busybox.net>;
 Sun, 17 Sep 2023 20:51:15 +0000 (UTC)
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 79AA9415E5
 for <buildroot@buildroot.org>; Sun, 17 Sep 2023 20:51:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79AA9415E5
Received: from localhost.localdomain ([146.241.100.148])
 by Aruba Outgoing Smtp  with ESMTPSA
 id hyjUqU2javDh7hyjVqmc5J; Sun, 17 Sep 2023 22:51:09 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 17 Sep 2023 22:51:06 +0200
Message-Id: <20230917205107.366824-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfKZmtonaB9fvQAsVx3RO/+jZ5N5VP0VbsQ+ZUKIEUhclYvFpfBZmpezn/KoK3q/vRuo3rkl2YjqXX0EdA3fXaP0rjqJVoK2/luTXe9gy8ElfF1oCvdLr
 gNE4DIG0+BoxVIfXYnUVyd/mh4T92kxrhAw0BHZ6KPcUGoaQ/j+JxcvRfecKrVl4VzXVsyJc5v5nYL80R3ubELEZNbR1bG4ymzMPSe8icIfAnEwKh5T+pjxF
 VdI0yeokVG7EDdE5nZo0/zT4y6nGs1nF4aoQSlYQGJtWtdXWPF2qBKBDqONItUZryjlOwHmjovehWrdsKvRTiq9KlFOf7fjRcFYhYt15M88=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1694983869; bh=6SexFWijCddHDZ5FEWqzDxUEuzrABrGfUnPIE3afqQY=;
 h=From:To:Subject:Date:MIME-Version;
 b=iNLGEbJBXt8SRWfj8G8PnQ2sFWuIGEgzOgk7EYUQ8NoSToQFWY5PDo+jLez/vmMPC
 trMK7YMLSB5DXm4FFkZXvD/eEAlO4vVGZK1mkEe/33ObnKmsmeoub8Y+BWv12eAFAU
 frXCcfCKyuwR94xAVfYZPTvWB72xlJSKeO46cKXHldjL3S0KOSwMYMQIaGk96LHIkc
 fj79FJud6MtcQcJY0ii3KUAOxEp4fhDidz7kHL++Q2k+MloJdUah1HbX7JCdXLcPXA
 l07jT9i+TaDjNdXlH5M9JtZV/QAqPNbLWTa3hTEadRhVnvA3pfpSPVvRMTQ3rEWmrc
 ahssJPmSP32tA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=iNLGEbJB
Subject: [Buildroot] [PATCH 0/1] docs/manual: document how to give credits
 to a sponsor
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
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Following my previous patch:
https://patchwork.ozlabs.org/project/buildroot/patch/20230819211825.60854-2-giulio.benetti@benettiengineering.com/

I come up with this after having feedbacks from Linux ML:
https://lore.kernel.org/linux-doc/20230817220957.41582-1-giulio.benetti@benettiengineering.com/

Basically they have 2 ways to give credits to sponsors, but the most used
way that is used a lot by analysis tools is the one prepending '+sponsor'
to developer's e-mail domain.

Best regards
Giulio

Giulio Benetti (1):
  docs/manual: add section to explain how to give credits to a sponsor

 docs/manual/contribute.txt | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
