Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E6FDC74A5B
	for <buildroot@archiver.kernel.org>; Tue, 21 Mar 2023 10:10:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A990A60F28;
	Tue, 21 Mar 2023 10:10:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A990A60F28
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hasq0GSyxLDK; Tue, 21 Mar 2023 10:10:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 074CE60F22;
	Tue, 21 Mar 2023 10:10:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 074CE60F22
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B76711BF23B
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 10:10:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9EE5360F22
 for <buildroot@lists.busybox.net>; Tue, 21 Mar 2023 10:10:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9EE5360F22
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 42WrnaswTG9W for <buildroot@lists.busybox.net>;
 Tue, 21 Mar 2023 10:10:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3098D60F18
Received: from sonic314-13.consmr.mail.bf2.yahoo.com
 (sonic314-13.consmr.mail.bf2.yahoo.com [74.6.132.123])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3098D60F18
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 10:10:15 +0000 (UTC)
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1679393413; bh=+yX951bafbZBPMULv1GZxdhrxlae1313XRqlGTFRe/c=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=DS7azZJA2pnCsVsSKHxHO+YUY5wYkoM/mmN3YO3GNud1fmwjvuNg/2f0bIvNAxq0Y6QutVZKXa/Raxs48lIqFleQ3DQAb9g6kLL86enYFQTgAu2NX971Wvq4kBX4L7w7fjFOfzVa0TmhTL95E7jXOUiE34MxqVBe0tknnv+op8kQ+oU4attjwq9lBRtcCtEsaUqWGr38VM4joSVmCwCLdeIzp3heYYpD/M4uRI5kZzBmAe/CvPced/Zu0dUZ6BhvDa0mB7/DHWyi+ut3YvqIt45vC8Vrb/lRVe+Hs2yDnC4I/i1Imiv2K5GYKr2v+0xb/y57MpxPPhFDZVlrVtgeIQ==
X-YMail-OSG: o1_M1y8VM1kosoRJdIkRwS6xe0EXwiK_j35rkOGjs38OwiGU0F1roJNdZl9nzyb
 gfnuZa6IeRBZM5rMR67.N4FLq9ikNtzneanRKRnUWODpCyFz3TnTbSSlaqT14KVsO6NUtncpQoDd
 PyR6.6rD9P3r8n8UNq1RxH3CBdfWJLp6CS1ffEFN0f.b4EAciJO5WU6X7rWAOHaKT4ud9vL9r89F
 ivzKhfsXG8FDR38Nc0H_mQJYqP8lZyfakjzyVeMYW24H9OnZp0PhQMoHZV_MxktbULHw3.1Zq5kt
 Zvd4qH4DXjSNoIyP.9XwccG71ZwdIQzFbAM.kZovymFl7xObzzUY99aG2B9vBQrqkSU71ui77Ur2
 TAJWlTAKcO6v.yJYqCtIwLd0667ZJpFB5oX0u9rq5XnjlhMxjrSZ64f5rkVSb3O7NJz1eMNNGrKS
 7Bws8TA5vFEVqHU0besyq4w6KLpJq8f4t.K.Ab2VfmPNa6YFzEKkROsC3xJv_mOCHqOTJEgE7JA_
 YcP67eAC62l2jRRt9fOtVjDdOJayqU6HKCqEW0ecQGRgUs0x.J7cSZ6cL957AkSWEXvbUKSKvVTk
 1klM3KxIBtlpNQnawFMpEX1dMIa7Fa1OpT8mTOjcpCeCChBPFu.JUkCX5anlj9TbKXs9ELDklYXk
 o6_Ba3fXUECiUf9dWVg2b9uKmj9JdAUfr_3js8EIppy9E7ZxgcxoXUMGTzhWud7IL6owJrfaHfAt
 i59xcAwu2qocDHwaeSQM1AAK1rhAwVApbHb35YBJ8wu2LhwNOSlLrTUhcjSeSpkQC.hzaK_0VnhI
 DrIWYR4LeUltELUNtEhP.KwvA1qiJ0PmR71mJ3jE1lFR8Po123sjb8m8er0WdQuW8vTk3_MfH4jb
 tumTrATaycD56H2Irobd7YQMQ.YLZ9f.4jggSHAqWKTvitEDxmtPvUs3Nz5Kfu3oyZVnTHPqF35N
 dfGVxIdnBZ5V_8x6SWIllep1HQw1wjHgiTomdmHS27QLuB6xpIntzSUIWdDPeJuHV0tHe4n6Pfd1
 8g4STzJTvDR1fYCGwtqh9Klj78imIXsrwSJMxZvr7uCoV9FvvOxle04Se91iZse2IZS9UaszxTG2
 dVS1SYNlBxOA7bsDPjXEGMtewCLwRTXGHWR46qg4uR2FyojQAMd.BmEfACggIDTmHh0Aiaf5aoG6
 YiNug6k8yhSTPiXzLcwf3eMMDdxope.xtICq4K2UtTHTAU6wQsHBCfOcgAh.IbdraO32bSEFLCBy
 bAQlWdStlv3UJZPKMK8FzC5Z_qlAGrN4u7TL1uw4jvc8jGnVcq.paWwruRNAHTGGQs6EsfyD4Jzx
 3KSPfIkBOW_iNhPBjfkl_e0svTtXrIwob9hx06fulrU7a9.9OLwPU430bGdt8idTwg.atI7aTGX3
 OOIRFecNt35.y1DkbRpTeCSfYJyeUbMAsZOuB4e.DDFuqItw376kG7Lt0GMHxKqsTYiZwQ35SxLL
 zdUZzZXy2TWWfNk.JXt0qvaoidRI3HDO3beeovCuZbNbYLGowNHP5lRSWGVnuDsbcyOmVlCeLkjU
 Z18mq.4xNgOi.MQGR202dWX6.OiJfYuqQmZyqcLI4GHcYI1CDbAhNp2YRpRUmVFxWWpKPr_Yb_Zg
 HxzIFV1lmL8oXr3KMXkyNcuc024hb1eXNjS0JxDrdLv9KY_JI.MkJ9q60u6vNWuJB9tt98vytqc_
 uHLCEOB0kKrYESx_eV1_wcbfw0lYmhxpVeU2QByCAMuww1s0obuXzQNbYWEAKhNRzaMysiBnajMb
 Grk9baIidUqbvW9mpZPXEo3ZH0INgVdKJWpsrCnTXfv6_Db070JfyQGu4iMEnroDrHFSPZyGpPMt
 Nm6MXSlpgMWejveBd65vpo_su8wbulSDG3XBNDXbrKUI1MpzZJpeBgCcQFHvFLfkIsr0Bzg0Op9m
 LkO8GHDrZd.BXAo0Of0k7.DYFa9cC9rrqa5xnAOjptvj.nBGRDH6hrpw.z5jJ2bIoqa1t2thTZ8.
 e10_Z.tNqKjeaC7KAJDmcTexL3tZeh2ZcSqYV2DxQu9kdUU0U7peGYz0VUDYfr2uKUqNqq7PXDOl
 .6MYD.mp0U4hu4Q8ljjiyCUgEkwlOgtJa_Lj_frvGWzkF3Ysl_3o5wL1seoqHJxa.ZR1vBS9C8RG
 7D2ccOD5bFIRnp3rL32gEFL0ouLTbawWS1CQPTdj4hWlPlSZjs8SmlWyl8mTJvgIXLSOzi46JkRh
 7JyeqJPO4C0YTR__AJLguIN62QTvD3x4UqfFKrEoMyGdvHrvFVNfIvA--
X-Sonic-MF: <dullfire@yahoo.com>
X-Sonic-ID: 8101be07-2398-4040-aa37-72bd4dfb7c8a
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.bf2.yahoo.com with HTTP; Tue, 21 Mar 2023 10:10:13 +0000
Received: by hermes--production-ne1-759c9b8c64-fztnz (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 64cfb9ee850eb4e33e00a4915d0d25f1; 
 Tue, 21 Mar 2023 10:10:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 21 Mar 2023 05:09:56 -0500
Message-Id: <20230321100956.11869-1-dullfire@yahoo.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
References: <20230321100956.11869-1-dullfire.ref@yahoo.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yahoo.com; s=s2048; t=1679393413;
 bh=QLTLl0nu96FOcm4gT2K9jGiRDjdSTbopb/rze47VErQ=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=AEURbwGTRCHmPcn9mXROHUJFLTkallL0PfI0uO75Kce9cdr9uAcRcym/hgCmn4bCWWIpCjZvwSU1oSZGpm0iQmDcP4jynUAn9urw3M9qlbwHk4FsuEhYVbI1r/Cvyv5R/uxFS8INTB6hLZ1nrTjTCIXv2lcSFyLjv6lqVu4/mnqhy1XuBgQrTGoblWosjW/8FiVq9jD/jTgvrj8aFcl1qDUd2KqEin97+bxeFZMEFwRTKk7kXXYcaEJtaypTz3ESWHLDCyYBvw1BnxkRZRmEZpZlrNmRzAEvujy3iMgtQ8Si/YFbcd3J34TEFz4E3LdQZ8uWHCzro7Q3jafge0D2zA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com
 header.a=rsa-sha256 header.s=s2048 header.b=AEURbwGT
Subject: [Buildroot] [PATCH 1/1] package/musl: add aarch64_be
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
From: Jonathan Currier via buildroot <buildroot@buildroot.org>
Reply-To: dullfire@yahoo.com
Cc: Jonathan Currier <dullfire@yahoo.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jonathan Currier <dullfire@yahoo.com>

Add aarch64_be to musl supported archs. Upstream musl
already supports aarch64_be.

Signed-off-by: Jonathan Currier <dullfire@yahoo.com>
---
 package/musl/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/musl/Config.in b/package/musl/Config.in
index c1a10bdd58..1baf6f7a78 100644
--- a/package/musl/Config.in
+++ b/package/musl/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_MUSL_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64
+	default y if BR2_aarch64_be
 	default y if BR2_arm
 	default y if BR2_armeb
 	default y if BR2_i386
-- 
2.39.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
