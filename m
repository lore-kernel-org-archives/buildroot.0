Return-Path: <SRS0=AA6u=N6=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1294C433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 22:15:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F7946113A
	for <buildroot@archiver.kernel.org>; Wed,  8 Sep 2021 22:15:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3F7946113A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0840380D3D;
	Wed,  8 Sep 2021 22:15:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id I6Us8dp1-c-v; Wed,  8 Sep 2021 22:15:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77FF180D2C;
	Wed,  8 Sep 2021 22:15:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AA44A1BF2F8
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 22:15:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 946F6400AE
 for <buildroot@lists.busybox.net>; Wed,  8 Sep 2021 22:15:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ed5xFpIxyZmQ for <buildroot@lists.busybox.net>;
 Wed,  8 Sep 2021 22:15:21 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd10101.aruba.it (smtpcmd10101.aruba.it [62.149.156.101])
 by smtp2.osuosl.org (Postfix) with ESMTP id CAFFB40146
 for <buildroot@buildroot.org>; Wed,  8 Sep 2021 22:15:20 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.179.121])
 by Aruba Outgoing Smtp  with ESMTPSA
 id O5qfmiloJnyXHO5qhmZIwD; Thu, 09 Sep 2021 00:15:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1631139319; bh=vpJ+Eiaepwc7r+HQ67/bjmUCOYd+y5wPoo+KLEiJ0Fg=;
 h=From:To:Subject:Date:MIME-Version;
 b=Ny+C7OUq/iFrCizJ2sictathhpj3xdrePIst8p0OMuNsPbZ3u2y8ONr6Rh2uh+4l0
 C8xCFvroQAtPlESfQ4W3QOpxhi9DuDWm4ZVn24dBVtQJHJRdU4v7zhikCl/jyZXs9F
 82eSkUYGQy2y/ODl3TQt9GJpTuaFEpGN6WZwchjlkChWj90W5IUuyOEzdPEikolBXq
 TrKyFxpOEDBmdM2rDYenh+vPGsWThh47Hvn5nIQkjlwBCA+uDxwOaRnSRMPj5lnvei
 /gBD+aqbtiFPFeQJsea+DrYlY4o3quPGeKKgpx30xwZl/QCyH0dZzzcF2L9F/YwOrX
 9E4uHyC0Pb+jg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu,  9 Sep 2021 00:15:16 +0200
Message-Id: <20210908221516.1719932-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210908221516.1719932-1-giulio.benetti@benettiengineering.com>
References: <20210908221516.1719932-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKxDoQSHSQ7GCewAk5DtNnPd4KgZZnTSFboFGf5RrtSY/UgdC8nZZ3jZfUzjtY23cbUBjLdtlM0bqQbZ0aZY9oHobOSn0J0crcbhhW00lqGdefWDXY5I
 3nm5FIAn9jOcjiKEGpr++4Hr2lwBbqLg7CVNsNNkgt7HNPXS2OFNaG6+c0vZUOoQKUap1a8PCkIxoQymJ9Dvvx3vEKKAAoCd8MZeYwV13mSSMc0z6Q/Q161q
 OETDd4ee8z9eKmG8zPyAjFd0AB+Urizw+3s5iGhkcS4=
Subject: [Buildroot] [PATCH 2/2] DEVELOPERS: add myself to harfbuzz package
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Add myself to harfbuzz package.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 DEVELOPERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 5cedb8d6ea..9498d9ce36 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1057,6 +1057,7 @@ N:	Giulio Benetti <giulio.benetti@benettiengineering.com>
 F:	package/at/
 F:	package/binutils/
 F:	package/gcc/
+F:	package/harfbuzz/
 F:	package/libfuse3/
 F:	package/libnspr/
 F:	package/libnss/
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
