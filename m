Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 470D2C77B73
	for <buildroot@archiver.kernel.org>; Sun, 16 Apr 2023 20:17:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF74141918;
	Sun, 16 Apr 2023 20:17:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CF74141918
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jTn2GN52KY9o; Sun, 16 Apr 2023 20:17:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BEEA241BF4;
	Sun, 16 Apr 2023 20:17:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BEEA241BF4
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4FA9B1BF35A
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 20:17:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2874C821E9
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 20:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2874C821E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WbnQOnHiMftL for <buildroot@lists.busybox.net>;
 Sun, 16 Apr 2023 20:17:41 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A1DCB821DA
Received: from mxd.seznam.cz (mxd.seznam.cz [77.75.78.210])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A1DCB821DA
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 20:17:40 +0000 (UTC)
Received: from email.seznam.cz by smtpc-mxd-6fdf5f5c8f-nc7j9
 (smtpc-mxd-6fdf5f5c8f-nc7j9 [2a02:598:64:8a00::1000:a2f])
 id 529a4602e4baf959529df875; Sun, 16 Apr 2023 22:17:30 +0200 (CEST)
Received: from localhost.localdomain (mail.ms-free.net [185.147.46.46])
 by smtpd-relay-778887b495-kcqsn (smtpd/2.0.9) with ESMTPA
 id 4380108e-1b01-4a88-a44b-944966e1bbd5;
 Sun, 16 Apr 2023 22:17:13 +0200
From: Petr Vorel <pevik@seznam.cz>
To: buildroot@buildroot.org
Date: Sun, 16 Apr 2023 22:17:03 +0200
Message-Id: <20230416201705.2294430-1-pevik@seznam.cz>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=seznam.cz; s=szn20221014; t=1681676250;
 bh=soVBmIA26lxz9IpYTd3wI3ClZNje716ziIDn969dfXQ=;
 h=Received:From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
 Content-Transfer-Encoding;
 b=hk7jVOetP9zHMVtm5FeVKt67FuFUGVZ5ZKbeTSgZTJv2jyKV/U++Eh32rPdTzUJS6
 DBNXu8SmSls2MXa0N0zYwtUxbtKmRXs6pUQ7gZ7IBpL7Gc8DKEus34RHJ9V+BDAfi1
 2N5XJGgpbShhEf8z0hcYgtQJI+b7s2/9Anhbl0uELtbrPfgnSHD4HWwaRVbTwmPtHs
 THSkvMAI8OH7QfglMIpiPLICZwLYl0ZjBuKV+VbOgVmdThrQn2qVBp5UEo7YjzR8tH
 GgF51aXEk+d7bAyqDDULr0plwhSTIieWH+gKQ3mkTCIjid6Ub1kgpa/UiRNgFZdyAC
 NK8PXE/MYA9dw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=seznam.cz header.i=@seznam.cz
 header.a=rsa-sha256 header.s=szn20221014 header.b=hk7jVOet
Subject: [Buildroot] [PATCH v3 0/2] Update LTP to 20230127, fixes
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
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Anders Roxell <anders.roxell@linaro.org>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Petr Vorel <petr.vorel@gmail.com>

Hi,

changes v2->v3:
* new commit: require 5.11 headers for musl (Yann)
* backport was squashed to version update (Yann)

Petr Vorel (2):
  package/ltp-testsuite: require 5.11 headers for musl
  package/ltp-testsuite: bump version to 20230127

 ...onfigure.ac-fix-mount_attr-detection.patch |  54 +++++
 ...ysinfo.h-to-fix-build-with-MUSL-libc.patch | 211 ------------------
 package/ltp-testsuite/Config.in               |   1 +
 package/ltp-testsuite/ltp-testsuite.hash      |   5 +-
 package/ltp-testsuite/ltp-testsuite.mk        |   2 +-
 5 files changed, 58 insertions(+), 215 deletions(-)
 create mode 100644 package/ltp-testsuite/0001-configure.ac-fix-mount_attr-detection.patch
 delete mode 100644 package/ltp-testsuite/0001-lapi-Add-sysinfo.h-to-fix-build-with-MUSL-libc.patch

-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
