Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B58FC433FE
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 11:18:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC00A60B8C;
	Thu, 29 Sep 2022 11:18:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CC00A60B8C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l6GsXysnw0El; Thu, 29 Sep 2022 11:18:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07EFA60B92;
	Thu, 29 Sep 2022 11:18:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 07EFA60B92
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6671F1BF584
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 11:18:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4DE714195D
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 11:18:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DE714195D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EhquyjP_ebM7 for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 11:18:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3041241923
Received: from smtpcmd13146.aruba.it (smtpcmd13146.aruba.it [62.149.156.146])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3041241923
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 11:18:18 +0000 (UTC)
Received: from localhost.localdomain ([146.241.15.171])
 by Aruba Outgoing Smtp  with ESMTPSA
 id drYWoo8rGeEtAdrYWoeXia; Thu, 29 Sep 2022 13:18:17 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Thu, 29 Sep 2022 13:18:16 +0200
Message-Id: <20220929111816.497911-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220928205527.GH1419013@scaer>
References: <20220928205527.GH1419013@scaer>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfEC7wuaIwZT0TGaJCNhh8q/eUrh6Q/IP6tXiwM+2x232kmDqC0ZxSYkwuloDGaj5drUTQNM7TLCKgqyvyzVvNjuMUKi2Lw4A6IM+VhgEJkujI9w/XWRv
 2iWFNWBL4zVOmh4Z9c078edl9PmRBmK2X5SYI5qiPDjcZMnYeHE31Z6/3auO2MHYGIz+lll8s2txbFYnXZJenMSkWKs4v/6Nba4Poux+QDdiNU0yEwXKIjFu
 oa9u9Knml/TRjqthlLd3c7NQj3FkKtD9V3hGCTQV97wcIPqySmSKEsthEI9jm497de8suiEZgrXUCCWeTTnxoo4r57EBlaAhd+iRU3YEEfr7mq/IOG5zg6Gs
 NbmO6I7yiJmBFEXSFecdjFzJ0KkwbVkfE/dpaOijDJItH4ShMx0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1664450297; bh=XA4zp02FqUITXAhsOfyJf0l1sSltLe8fZWPRN5yhtQo=;
 h=From:To:Subject:Date:MIME-Version;
 b=G4f5dSGzW2abSuXNC0Nwpfgfh9llpBcsoQ0ozP9eNSrLaJygWTvD7OPoHI3sEYSZV
 bvEiCoCkL0IgqoDXRdB4qh5ppMlTa2pEYprZqTvKBImH22Szi/Ak7Cq1NNG5uX9Pkx
 38hrSeDkCb+6dkNCa6Oi81E5MYeOzH21uQNbfjmDtmuivIRh96QHlnLK/hIsi9FwH5
 i2KxYhFEwDv2RYj11JJbSbq+nY8hLKsXVud9sreUtQVT7LxCdciwnw0+r0zvUaX8v2
 SU/GK8XjkquKLu52dPxKAcNyzfhX0CBRqe9UPGyHVG9ybgQkU+RXrj1zsWH1eSu8kQ
 kOH/BCCUzXRjQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=G4f5dSGz
Subject: [Buildroot] [PATCH] package/gitlab-runner: fix forcing openssl
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
 Romain Naour <romain.naour@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

BR2_PACKAGE_LIBOPENSSL doesn't force selecting libopenssl, to achieve this
we need to use BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL. So let's modify
accordingly and improve a bit the comment.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/gitlab-runner/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gitlab-runner/Config.in b/package/gitlab-runner/Config.in
index 72c2742562..bfa79ac80e 100644
--- a/package/gitlab-runner/Config.in
+++ b/package/gitlab-runner/Config.in
@@ -13,7 +13,7 @@ config BR2_PACKAGE_GITLAB_RUNNER
 	select BR2_PACKAGE_LIBCURL_CURL # runtime
 	select BR2_PACKAGE_LIBCURL_OPENSSL # runtime, for ca-certificates.
 	select BR2_PACKAGE_OPENSSL # runtime
-	select BR2_PACKAGE_LIBOPENSSL # runtime
+	select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL # runtime, force using libopenssl
 	select BR2_PACKAGE_LIBOPENSSL_BIN # runtime
 	select BR2_PACKAGE_TAR # runtime
 	help
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
