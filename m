Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C79C433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Apr 2022 12:00:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F40EC61204;
	Thu,  7 Apr 2022 12:00:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id egIglfnWrbmx; Thu,  7 Apr 2022 12:00:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0A7F7611ED;
	Thu,  7 Apr 2022 12:00:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5D82A1BF352
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 12:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B17840194
 for <buildroot@lists.busybox.net>; Thu,  7 Apr 2022 12:00:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=smile-fr.20210112.gappssmtp.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AMsYdHvYTXMD for <buildroot@lists.busybox.net>;
 Thu,  7 Apr 2022 12:00:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 22D824018B
 for <buildroot@buildroot.org>; Thu,  7 Apr 2022 11:59:59 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id k23so7493301wrd.8
 for <buildroot@buildroot.org>; Thu, 07 Apr 2022 04:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KVTZ7rK50cHN5RPs86d0lMwiYZQsFDzTxCRT8f0u0vE=;
 b=vQCEIa3cBxwzH2G2uv25bzG4WR8GPEZ6e+kdY7YyGMdfcltyenZka0uM3zcCGjWQWr
 /TyJpyumyHviEEqOXMK1mTV6eUU4YMBRF06A/rop4yIuJ/fR8zw8PZsSGg6AGLBnCf63
 u9xWTVOTVTUZiUaCaaB4PiLIN9dpyjesltUe8Jc++gUgQknqfQjz8mKS3ka9qoIrQ/k5
 /UnbQZEZ1RdikTitU1MjpM2fOAsYkjnHtg+hTM8J/67Ysia71Wl7P1vPcMZhJilRbna8
 W9rEhnt5/WiOU6Cc2beHuWBSf0be0rRbPORBwoYIOuQaZIWWT99lSfSzJPcZD4ZzEzH/
 pU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=KVTZ7rK50cHN5RPs86d0lMwiYZQsFDzTxCRT8f0u0vE=;
 b=vgjqQCJVYMJr8vpBxX9kMNW+sG6XQcOtv9tZSm4nYpmAgKHQAimRNMdww3tfyKkUe2
 Ewxgo6uKU8ndX/T0AahJx2bW96EgqUlnEsvNlOPWVpHE4bLWQtyByw3OEzgyGaBhp530
 OL8xD8R/TyoR2vEz1d1j/mNpP9amZsxmwJIPpJN4wh4B5ut1tIyNl5CZc91IxWLZ4FAc
 nFvxXB3qfio9n7omLYN0Kof+pV3+fLAM6hTzlyXMQJvClQ3OZBFuUysFkE9A+D/v2esv
 DZXB5M1micafKo3pkdoXk6EC57qlHmlFmTJBTanefxLL+UeZlyi6R2akh78xymRrySUC
 w6DQ==
X-Gm-Message-State: AOAM532jZqpzqjOt3XJyQViYY3tGCaKYs/JJ7PUVyQ8v9ANH0ov76LmD
 p2W0sYcJRWC5MkCtwOg6ZHIaMcOkiNJR0w==
X-Google-Smtp-Source: ABdhPJyR39mD/ERBnJiFdpXfeUSMRnFjgKSonc+NCK57hyLcsvK0OAujBlSRcJB09l4bfppPPZJGrw==
X-Received: by 2002:adf:fccc:0:b0:206:fc6:31f6 with SMTP id
 f12-20020adffccc000000b002060fc631f6mr10266635wrs.270.1649332798069; 
 Thu, 07 Apr 2022 04:59:58 -0700 (PDT)
Received: from nitra.nantes.intranet
 (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
 by smtp.gmail.com with ESMTPSA id
 d20-20020a05600c34d400b0038caf684679sm9625334wmq.0.2022.04.07.04.59.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 04:59:57 -0700 (PDT)
From: Nicolas Tran <nicolas.tran@smile.fr>
To: buildroot@buildroot.org
Date: Thu,  7 Apr 2022 13:59:51 +0200
Message-Id: <20220407115952.56219-1-nicolas.tran@smile.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/1] First contribution to Buildroot
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
 Nicolas Tran <nicolas.tran@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Link to Rust 1.59.0: https://blog.rust-lang.org/2022/02/24/Rust-1.59.0.html

We modified packages implying rustc 1.59.0:
package/rust-bin
package/rust

We have retrieved the source archives and replaced the hash value of each file after having verified the signature of the .asc files as follows:
$ curl -fsSL https://static.rust-lang.org/rust-key.gpg.ascii | gpg --import
$ gpg --verify <filename.asc> <filename>

The signatures were recognized but we cannot ensure their ownership. Therefore, we considered trusting the corresponding key by blindly signing it:
$ gpg --lsign-key 85AB96E6FA1BE5FE

We verified typos in the packages thanks to the check-pakage utility:
$ ./utils/check-package package/rust-bin/*
$ ./utils/check-package package/rust/*

The testsuite was successfully run to test the Rust toolchain with the new version of the packages in version 1.59.0:
$ ./support/testing/run-tests -k -d dl/ -o testsuite/tests.package.test_rust.TestRustBin


Nicolas Tran (1):
  package/{rust, rust-bin}: bump to version 1.59.0

 package/rust-bin/rust-bin.hash | 198 ++++++++++++++++-----------------
 package/rust-bin/rust-bin.mk   |   2 +-
 package/rust/rust.hash         |   6 +-
 package/rust/rust.mk           |   2 +-
 4 files changed, 104 insertions(+), 104 deletions(-)

-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
