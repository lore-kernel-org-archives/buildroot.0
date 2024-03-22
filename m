Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46781C54E71
	for <buildroot@archiver.kernel.org>; Fri, 22 Mar 2024 06:15:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85C1E416D3;
	Fri, 22 Mar 2024 06:15:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2moyOoU8tWok; Fri, 22 Mar 2024 06:15:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 54B20416D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 54B20416D8;
	Fri, 22 Mar 2024 06:15:17 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7FE691BF473
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 06:15:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 64573416D8
 for <buildroot@lists.busybox.net>; Fri, 22 Mar 2024 06:15:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9vMo_vwZ0--k for <buildroot@lists.busybox.net>;
 Fri, 22 Mar 2024 06:15:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::15;
 helo=smtp6-g21.free.fr; envelope-from=friedtj@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 2D713416D3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D713416D3
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D713416D3
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 06:15:14 +0000 (UTC)
Received: from zimbra-e1-03.priv.proxad.net (unknown [172.20.243.151])
 by smtp6-g21.free.fr (Postfix) with ESMTP id F3EA878035E
 for <buildroot@buildroot.org>; Fri, 22 Mar 2024 07:15:12 +0100 (CET)
Date: Fri, 22 Mar 2024 07:15:12 +0100 (CET)
From: friedtj@free.fr
To: buildroot <buildroot@buildroot.org>
Message-ID: <56682917.1047768770.1711088112969.JavaMail.zimbra@free.fr>
MIME-Version: 1.0
X-Originating-IP: [194.12.170.33]
X-Mailer: Zimbra 9.0.0_GA_1337 (ZimbraWebClient - FF124 (Linux)/9.0.0_GA_1337)
Thread-Index: 9ojdfQajbS+MQsMQnuvsH4eQp/wGzw==
Thread-Topic: package/gr-osmosdr: add host-python-six dependency
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1711088112;
 bh=ZWH7ccVCv6hkgOIposIc6WGYMsbFiDtjM4iUTwkfuLU=;
 h=Date:From:To:Subject:From;
 b=T3t5JSCRWlFqaqBQPYCOiNGdBJ0/EpsNZ+1oJHYAL6BJvS0bc2LTvfne7c9XpXo+p
 o8ihR5SoP4WG63OrZbmpFM59ZdIcKX0Es549/kudefkMTV7shqkerd9QbDEMMmDWKl
 oR6ERKkuwG7IXXCrDKnqUfUM0NuLSEK1ZtJMR6EpMlIfz8jkCXYQQwbzF5KsGMupmd
 +Iz/eNn9VHbFWH2zQOjPiUPihqC0RUIHRy+wblurAv2j2KxfDgavxRO3sqTbKaqR8Q
 IaYXGvcHqiNfMCdNAY524UdHzvb0K/WY6rw24QyJblii+XyOwV7QQypz/XJgbv9JaV
 SUu1t5bj8te9Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=free.fr header.i=@free.fr header.a=rsa-sha256
 header.s=smtp-20201208 header.b=T3t5JSCR
Subject: [Buildroot] package/gr-osmosdr: add host-python-six dependency
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

From 3d33ec7551d0013717f5cf408a920c52329fee4f Mon Sep 17 00:00:00 2001
From: JM Friedt <jmfriedt@femto-st.fr>
Date: Fri, 22 Mar 2024 06:13:18 +0000
Subject: [PATCH 1/1] package/gr-osmosdr: add host-python-six dependency

---
 package/gr-osmosdr/gr-osmosdr.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gr-osmosdr/gr-osmosdr.mk b/package/gr-osmosdr/gr-osmosdr.mk
index 8491c005d8..68a7ecbbf4 100644
--- a/package/gr-osmosdr/gr-osmosdr.mk
+++ b/package/gr-osmosdr/gr-osmosdr.mk
@@ -12,7 +12,7 @@ GR_OSMOSDR_LICENSE_FILES = COPYING
 # gr-osmosdr prevents doing an in-source-tree build
 GR_OSMOSDR_SUPPORTS_IN_SOURCE_BUILD = NO
 
-GR_OSMOSDR_DEPENDENCIES = gnuradio host-python3
+GR_OSMOSDR_DEPENDENCIES = gnuradio host-python3 host-python-six
 
 GR_OSMOSDR_CONF_OPTS = \
        -DENABLE_DEFAULT=OFF \
-- 
2.43.0

Signed-off-by: Jean-Michel Friedt <jmfriedt@femto-st.fr>

gr-osmosdr will not compile unless host-python-six is activated.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
