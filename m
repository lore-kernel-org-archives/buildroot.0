Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 587DAC433F5
	for <buildroot@archiver.kernel.org>; Wed, 24 Nov 2021 19:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B4A8860B35;
	Wed, 24 Nov 2021 19:20:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PNXpMtbNdEnJ; Wed, 24 Nov 2021 19:20:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BF116089D;
	Wed, 24 Nov 2021 19:20:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9C7111BF2E4
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 19:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B884402EE
 for <buildroot@lists.busybox.net>; Wed, 24 Nov 2021 19:20:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aXZJpRHifTgB for <buildroot@lists.busybox.net>;
 Wed, 24 Nov 2021 19:20:09 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp4.osuosl.org (Postfix) with ESMTP id 50A1B402EC
 for <buildroot@buildroot.org>; Wed, 24 Nov 2021 19:20:09 +0000 (UTC)
Received: from localhost.localdomain ([146.241.138.59])
 by Aruba Outgoing Smtp  with ESMTPSA
 id pxoNmJ7XayoivpxoNmsE2V; Wed, 24 Nov 2021 20:20:07 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1637781607; bh=Vr02+edcFfRS4R34p0dE+yeVGKrVTwlcNXFIymPHMxA=;
 h=From:To:Subject:Date:MIME-Version;
 b=TcgxlJdN/4rvqRXXQ4bPEy305+WAvyLHBS/WONms98BlIhpIOJ6QYs++mUI6pU7t7
 mJ/ky4y7u9kaz9v5c6LBC1hmMlDepOnbQE4CXGKnbq67uXq9CUYP1VlTPsNn9ZFzel
 41GcMU/6BpiZBpjzqjNpB2gJsrC6De701CUcA+KgVSEwbMcsVhNXahWduGF92W/hSQ
 MH+x7IM8ar3A8AFSX7szxgOySmlK3cJ7ykgbyrdmOC5yIIcfS8VHm3eNELfcOsWOZ6
 0ic9Z2D5gLqopWOI1MfnyyOovNA4QORvw/ljSwxQH7nyjYK/RcU+h1nH/6/HrKELB+
 3MxCyYIB2WKzg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 24 Nov 2021 20:20:05 +0100
Message-Id: <20211124192006.646757-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKzqYkfQ/fYTGxhfb5P/4I049r9YpLW1KPGGy3eYuQCaYA/EEfw8gv1b1vDkYf1hhXxLhEUYLgd9N/bq4h8wuRnoFexlfOkN7WbqLUB9cPYfuAgr9VZg
 W49tP5AO2YJXAXoDg4q/waTND7++0ywVCYyH1YN8yvrbf58u3FBX/vBjqYs8crfpKlgNEhJ3GlMoFqvE4fIl2s4FffQPCDdHLgm6b18BQyetZQSSiF6N8RDL
 yzm5K81ND/ui9UulyhQS3F2shLd8IwuHxdCR+qZ52aMm/3CWZXf9pzNSLFuVRBGioNjVZE5CFmXWM63XNOvAWQ==
Subject: [Buildroot] [PATCH 0/1] board/olimex/a64-olinuxino: bump
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
 Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Finally I've found an a64-olinuxino and I could test the following patch
and it works correctly.

Best regards
Giulio

Giulio Benetti (1):
  configs/olimex_a64_olinuxino: bump to Linux kernel 5.15.4, u-boot
    2021.10 and ATF v2.5

 board/olimex/a64-olinuxino/genimage.cfg       | 10 +---
 ...ve-redundant-YYLOC-global-declaratio.patch | 52 -------------------
 ...e-redundant-YYLOC-global-declaration.patch | 28 ----------
 configs/olimex_a64_olinuxino_defconfig        | 25 ++++-----
 4 files changed, 13 insertions(+), 102 deletions(-)
 delete mode 100644 board/olimex/a64-olinuxino/patches/linux/0001-scripts-dtc-Remove-redundant-YYLOC-global-declaratio.patch
 delete mode 100644 board/olimex/a64-olinuxino/patches/uboot/0001-Remove-redundant-YYLOC-global-declaration.patch

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
