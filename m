Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79020CD54BF
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 20:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 20DF740352;
	Mon, 25 Sep 2023 20:03:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 20DF740352
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J3QHRn4UCnET; Mon, 25 Sep 2023 20:03:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 582C641719;
	Mon, 25 Sep 2023 20:03:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 582C641719
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E8E4E1BF94D
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 20:03:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C28056131A
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 20:03:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C28056131A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y0DGppxKLVJC for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 20:03:07 +0000 (UTC)
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A589160EE5
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 20:03:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A589160EE5
Received: from localhost.localdomain ([146.241.127.78])
 by Aruba Outgoing Smtp  with ESMTPSA
 id krnKqX8r6DAHrkrnKqB70Q; Mon, 25 Sep 2023 22:03:02 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Mon, 25 Sep 2023 22:02:57 +0200
Message-Id: <20230925200301.2790925-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfMFw/1prL2KOK/sAsrC2hn2OdMYvZlZo8dss6BphEhn6UB4NFXJ8Csje3lhYEDFf8dppPIDfBmZq+iKKquEYqj9aqmk7W+dnSvY1rRsju0Y0AWH/ye7M
 QdnngM0Pe32F7TACgbiAU5KeZRY6GnwMJA7itb0UIkY5rV+nnij3bEtQlXYKdv0WQscBq8k9hvLLXRPYo35WqY4w1yGop5qzR8fGLydQv5VQymteEc57e8d0
 YFFdPwk1x3+fnKWcnjRXwEnyybT0LyHdFuYwNyCrA95KawDx+AKgtgSbzGgpnafynpiplTnFdLbfXJWKh5lc8Uh0hCn+gr/tzYSSwMZsBfuPxL99KtdpkArr
 1UDuO8t8/YakF3IoLQfG+wPIZ9I/NQ==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1695672182; bh=CQcKwZlBWNNm0Ey3zhN8o1E/Xx0bHP5B+TuSnY3AhtQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=d4mb7/xJwxYFK+L+vR+JWEtpDik9NVhA8tFExE8PD8HGqrkzhCZM5uKa9tGoiu46b
 37ILRm7rKuggkXgjkHfkWhgYfftKUjerKXCfhP8a8E6tB34Ui1L1wjhSzQsiUDW+Su
 DNRQ3KR5oWmrlqD2gOzNIaZDoYG2vrZm2+FfKcQSfIq0wrIyPZ7xvozhukBmOH/caB
 +s7Qwm6TfO2nQvFQIcecgcAkbX8UBx9gffMq+NGnsQ2l67+wbcc/3m7oKRe7N7hJB6
 xGBq7LNVZJB/WLoXeDzcr+ZweDYt1zbX/Q8NQ48DV0J1pfxz3jKXTj46p/ogYprk+t
 gMy5fPFV4Fxqw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=d4mb7/xJ
Subject: [Buildroot] [PATCH 0/4] Bump udisks to version 2.10.1
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Marek Belisko <marek.belisko@open-nandra.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

udisks version 2.10.1 requires libblockdev with libnvme enabled so this
patchset:
* add libnvme package
* update libblockdev and add libnvme option
* enable libblockdev libnvme option in udisks

Giulio Benetti (4):
  package/libnvme: new package
  package/libblockdev: bump to version 3.0.3
  package/udisks: bump to version 2.10.1
  DEVELOPERS: add Giulio Benetti to libblockdev

 DEVELOPERS                                    |  2 +
 package/Config.in                             |  1 +
 ...-replacement-function-for-strerror_l.patch | 68 +++++++++++++------
 package/libblockdev/Config.in                 |  8 +++
 package/libblockdev/libblockdev.hash          |  2 +-
 package/libblockdev/libblockdev.mk            | 15 ++--
 package/libnvme/Config.in                     |  7 ++
 package/libnvme/libnvme.hash                  |  3 +
 package/libnvme/libnvme.mk                    | 41 +++++++++++
 package/udisks/Config.in                      |  1 +
 package/udisks/udisks.hash                    |  2 +-
 package/udisks/udisks.mk                      |  2 +-
 12 files changed, 126 insertions(+), 26 deletions(-)
 create mode 100644 package/libnvme/Config.in
 create mode 100644 package/libnvme/libnvme.hash
 create mode 100644 package/libnvme/libnvme.mk

-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
