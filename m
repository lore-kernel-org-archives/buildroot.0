Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8153EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 23 Feb 2022 19:14:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2833E408F3;
	Wed, 23 Feb 2022 19:14:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RfsB4MZE1xqA; Wed, 23 Feb 2022 19:14:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 11D32403E9;
	Wed, 23 Feb 2022 19:14:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B24841BF5EA
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 19:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8912D408F1
 for <buildroot@lists.busybox.net>; Wed, 23 Feb 2022 19:14:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lnUUAKNn3ibV for <buildroot@lists.busybox.net>;
 Wed, 23 Feb 2022 19:14:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 24077403B3
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 19:14:41 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id d23so32840264lfv.13
 for <buildroot@buildroot.org>; Wed, 23 Feb 2022 11:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DG8u712zO1d8Ifv6TxAur9vbbsQKILfW3JnMQc33XeU=;
 b=LRvb5MyAMFtLG55+TXRsHc3erCXtXAKOBWHBi5AfcvvDzELENNxysCgFuXqw96Rw0p
 rSOAlucEH284JyF/F8Qs8aEHl+uXNYromkA5GHxR1oXxgP0aMq9JnInQDi/oFRHB5iuz
 BaJnXCXvY5tDz03L2pbXbJhHjHIVEs+efIunX5+H0DwNAnjcfsUyaku0pbEbaU0bXvMB
 2Lbi6MY/FOLv/QLg5+BavRVzNMceWiEy+zYd/X+HLrYk0Uc3BZHFrIZI//a6E+2e8Isb
 QeSWvdMpTb3O29YGQJoM2c13P84TuS0C4S4PmK4YR8PNSjE5wnMxKYHkvrN3HgrN9IsJ
 u80A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DG8u712zO1d8Ifv6TxAur9vbbsQKILfW3JnMQc33XeU=;
 b=yVbwjE2BGX88e8GpbJ8vHZn1xn16jtOSY4YciHjlsByX8nJyELiyn0sNxG522xVxOE
 SFAsCt+0EuvOJg2DFa/i5+9DGKcIB/hmKRfE6bv+U7vxQwejacekhl7XYvDrFjUZDEqI
 CaEbiH8mdPXYvk93b1RwU0LtRaJwNd/s9+UO+JqEsTWYFf2NXGf88A91Puq+H/c1ve0U
 xa48M5C6Q0tAGsNr8l9xHC8l/0tW4At4wKclFpYZKMGN5OqOUgKLcsqVwhfHOoHAolY7
 1EsBdrpwZyLQqCTEu4n4B+YDqL6vX+h2fT0spcj6xxgevgRtlJgDe/GSGZTKxkzBcEBH
 W95A==
X-Gm-Message-State: AOAM530XldYwNfTmccDoRvGFQS45C6wNq6bAoFyXEZ4EP+MoD4Gwo5WR
 NNiqb8XeF8mzlGgXPY428yKKXpYAA7t45Q==
X-Google-Smtp-Source: ABdhPJxlaeGPypWUHfSV1k2qxZEeRa8rRW6p7w4B0fVAcLd8VN4K+opGgoAIOdRPKm+SsnRrII78tw==
X-Received: by 2002:a05:6512:694:b0:442:be61:2e02 with SMTP id
 t20-20020a056512069400b00442be612e02mr699706lfe.35.1645643678735; 
 Wed, 23 Feb 2022 11:14:38 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id o22sm31750lfr.92.2022.02.23.11.14.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Feb 2022 11:14:38 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 23 Feb 2022 22:14:32 +0300
Message-Id: <20220223191436.3045255-1-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/4] orangepi: convert more boards to extlinux
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
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi all,

Recently extlinux infrastructure has been added for  orangepi boards by
Sergey Kuzminov: see commit c0312f71cc89 ("configs/orangepi_zero_defconfig:
switch to extlinux"). This patch series converts to extlinux some of the
boards that I have at my disposal:
- orangepi-zero-plus2
- orangepi-pc-plus
- orangepi-one

All these changes have been build- and boot- tested. Also I added
orangepi-zero-plus2 to my list in DEVELOPERS file to keep an eye
on its build failures.

Regards,
Sergey

Sergey Matyukevich (4):
  board/orangepi/orangepi-zero-plus2: switch to extlinux
  board/orangepi/orangepi-pc-plus: switch to extlinux
  board/orangepi/orangepi-one: switch to extlinux
  DEVELOPERS: add myself for orangepi-zero-plus2

 DEVELOPERS                                    |  2 +
 board/orangepi/orangepi-one/boot.cmd          |  8 ----
 board/orangepi/orangepi-one/genimage.cfg      | 37 ----------------
 board/orangepi/orangepi-pc-plus/boot.cmd      |  8 ----
 board/orangepi/orangepi-pc-plus/genimage.cfg  | 43 -------------------
 board/orangepi/orangepi-zero-plus2/boot.cmd   |  6 ---
 .../orangepi/orangepi-zero-plus2/genimage.cfg | 41 ------------------
 configs/orangepi_one_defconfig                |  9 ++--
 configs/orangepi_pc_plus_defconfig            |  9 ++--
 configs/orangepi_zero_plus2_defconfig         | 14 +++---
 10 files changed, 16 insertions(+), 161 deletions(-)
 delete mode 100644 board/orangepi/orangepi-one/boot.cmd
 delete mode 100644 board/orangepi/orangepi-one/genimage.cfg
 delete mode 100644 board/orangepi/orangepi-pc-plus/boot.cmd
 delete mode 100644 board/orangepi/orangepi-pc-plus/genimage.cfg
 delete mode 100644 board/orangepi/orangepi-zero-plus2/boot.cmd
 delete mode 100644 board/orangepi/orangepi-zero-plus2/genimage.cfg

-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
