Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95B67C77B7C
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 21:35:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3904C400D6;
	Sun,  7 May 2023 21:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3904C400D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bpFa3STMjNCu; Sun,  7 May 2023 21:35:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 756B5408D3;
	Sun,  7 May 2023 21:35:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 756B5408D3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 414291BF2C4
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:35:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 19DC0821D0
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 21:35:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19DC0821D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sHKWUXMFwnuX for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 21:35:08 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C7D66821AB
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn20815.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e89::815])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C7D66821AB
 for <buildroot@buildroot.org>; Sun,  7 May 2023 21:35:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kaGqDR4L2l811MzRE+vNrty17g8PtkmhCiXKXZCFH+iK7Bnbl1Q6Ce8rNbLEABxUfhxyf2rRb/rSSkF7Q9y/3NOocMb6UGI5cf+0u25pBscDSzh6LKFo4+3PIkVHW3BRQ1S6dEyOAKisOzWK+fSQzgWRrHMIKqPRVtYDjPrXJb9m2qe4Hsbk/UdrhyxwEwVQzhRSo8wRcKbedtMd+saA/TBh/c4McAetqsq1SMyrQIRhRUb71M/joaOerBn3WiiPgHIid4r5/hHhjwyCB7WAuErgc00jLH4kTwDSd6G4b5WkRZEwy7p35ypcT2sQlwOuOjV7KxyK7KnMEPA/YCRo9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Rv9Z11IM6EUUJcKpyJr8FA1EbMsjMeZM44RsM7+5+I=;
 b=Lm7qS4DSOgL9zbDljWGIUK+AvcqYYhdfQD+afgJsi8LJs0fhL1rZtFWb6UfZpRsDxJM2l9V43Tw5rF7xLAfbzmuYlE35Hus1YPLoHz2paapYsvN77nFy1M4aG8lsygnYAhPyHdHO0L0oYB3dK58EZEsXhETyvGF3jyMnUeHlXXiAEf6SSJUFuErBKBIzG8FmD8JvIZgRp2l3KJk/1sjBhos6nkbAeHMWnpJTr1vMh16KELp3QKRnbWMiHjbavqDZtFIMrAeaUt+6+xGyoYE/OBC37kBGyAdJYUt3GD/9SdCztVzP4QVF0IV4RJs41s7kRO8JJAaGj8YTvbq9KKRx6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM (2603:10b6:806:1e9::12)
 by PH0P221MB0831.NAMP221.PROD.OUTLOOK.COM (2603:10b6:510:fd::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6340.31; Sun, 7 May
 2023 21:35:06 +0000
Received: from SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8]) by SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 ([fe80::e6be:cc11:976e:e2b8%5]) with mapi id 15.20.6363.029; Sun, 7 May 2023
 21:35:06 +0000
From: James Knight <james.d.knight@live.com>
To: buildroot@buildroot.org
Date: Sun,  7 May 2023 17:34:29 -0400
Message-ID: <SN4P221MB0682A85E1D08A44BED847C8EA0709@SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.40.1.windows.1
X-TMN: [VkH4J4psvyls/5+nDNA3pVELhNoWblLZ]
X-ClientProxiedBy: YQBPR01CA0156.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:7e::20) To SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:1e9::12)
X-Microsoft-Original-Message-ID: <20230507213433.4128-1-james.d.knight@live.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN4P221MB0682:EE_|PH0P221MB0831:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d926bab-2dcb-42e8-4e9c-08db4f42ecc1
X-MS-Exchange-SLBlob-MailProps: 0wLWl8rLpvtRtQtMOsBtDaMYSViNzYjvu8FcUOwpmSz8cNP6EqzX6JPtkTC5Xr5uW/oe368xqkKXxZmHLL4OgDYFUqKi2BbxWq609nuWfyAFsFQuu/Wb4VcLVlMP688ZE5XZAwANu56zPO9wnLrRFN+UZE9wYQu10UvfwJx7hA+i/RBuVoXE5+QTQpdlrk7TAQAnz/AVnYE7JqzJH2tjXVl3vfVbs5eDFyGG0n1puTk58xEkm7Q+IxrD3hyrue3zdqwFRkcKoxGrSU/fcDLBXqRfs+cKbYs1nBxjay2xnzOmAUF7/PQZSNrEjEwmEj0BG8ihrLL8Fr/+EDvm0z/odCKAUDKjLFdCNyMm+g2gwM1LGxvPEaHj6TXmq4gkmWiBBlXa8FWQqfd7JT4GNQvvI2MClSzYKhsTUkf+PfHs3Z5EuTWACT2rhBLj9TOaoZlRg4VQGnV+lOwJ0LvkEZNEChLU4ftyq+OovkgrwuaxedAxWJmjIk396fklM3sM6EbpjCz6oBhhv/ZkLrg5A6VyRtAnPP5bLELe8uaeokpE0LK49xJSXUI54D50f0ssQLfqLY1Vn8JtwD7oon5NJG8Gr3Z9vI8cwARftZHycb0F5NCidLRYmJVTIYd3vlDKR+0tuYu8cf1TFb6O9+tsEcZce9K/y7iaiS0HuAcfm55xS1pf4osSguXD8PzN3UeXiBjJc21uHFRl5R+uyHP4Jguc3mp91IbK2vnQcitSvZbJUKeGcws4RvsbrR6A5dyoVdcJrztlBr99d6s=
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JEU8s4dXIR1V+klh6k/7mi9TrTM7A8LtMbnp22hWx7Y2Yt412mHa4wXNFLh8bjQe96XMToBBMu5mNXCZ13cJvDaNmgxYbwPZ/9kqwtlbl/IAfx3yhUGtOlpy2IHMm+/vXJ2qwkUGdo55mLZT5nnrLtprrSC/3zLR9j6OSIhY/MTecuSITpHAQffnuNTBLIhvr7/7Xl73M5ftYpJGlOQOf5uFpaPrQOj/kBdvjq8VCl9pnAOMs3bwH4ybMRBE9LOjDHFtsAkJm+J1pLXtWkbRQNkDdLz5s9lGIvjqHRgrfwY4vDo88nkug5lJlYLRO/ILR0shsFTOPHnjEIRvyKN1r3TUO/5njyMyDyByiazX+N23q+jU/OgbL4QEgz7EnhYr/jdfJT8H9Q5y63fzaQ9ih7ZASsJUNuWmHcSg1lgPBjYJo0RaKLe2VgeNaVkiXTC0WdussoL3N3OKL4YoGT2fOLFpAT8rzTIUv3hKeTD5+g6sWNQQ58Plr/VA3F6DmbQOldk1kGaLbOwgg8YxOliRx1KcVGfyHyIdLgFM27neHRhdUMpRzSgw7nsRVbEP4l5/5dTMZGggZJW2sFj9X4WFYBlPx10eLtOz5n/0DJknOldhHuz+MGMPIigs9geuI8cQ
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7ze2tPdmKMP8cABDk86jXORolZg0fSYALe9Gz8qD5JfppG7p+hMSlUzbJH8l?=
 =?us-ascii?Q?aVizw1caItyn2itwFuYYFfBBHscpeuV+Qu6D2Kr9HGvddzdI2eyTB9v5msfi?=
 =?us-ascii?Q?dfeZhQIcSzRZ1bPyAFgWzJj9f8d4WuBHJj7ldTZa561R68AQf1yWhnQ2XfS3?=
 =?us-ascii?Q?eTUaZ0UURwvsWp7ibbiltV5h58W9s+th2WR44MBg+/ElzSXdClWDZ3j58PtH?=
 =?us-ascii?Q?h/XDFYifAHQl2jEtYNStuf3A9kyrYdJexXYA5IihlE3IUmfVVKEfVWYN5HMh?=
 =?us-ascii?Q?dUg0+ukd2wgqvm0TostVIjLWUZJDUlrIv2b5dfQlfRsAt99DMenSqjEdFgv+?=
 =?us-ascii?Q?UlM/4Wf5v2pYsPZk9b8KMjxvYZWzT7DaItdgksYx7zyCdmgoo7GiXETvq2yG?=
 =?us-ascii?Q?XNAUnn/yOepIsJCi1OfFVVPsTofWij3y9aR+9sUrEuvYHa4ql9XTxQtfbD1d?=
 =?us-ascii?Q?UhCZFHzGMxKR5/z3pEPXJqEekYZaZ3Xz+KnsiWg7wP02zxkH/mm2RaoYbY9R?=
 =?us-ascii?Q?pzP6eS3K2SoEu4B8DS7OoK+cm9i20BuINHEYpX7juwpEPsfbpmlokCDdzJXp?=
 =?us-ascii?Q?Ts3Q6TjVxwEVHsmvDbwMVzPmaMrAIds54D4nYQ9N/TGlUzonFPYY7aRbOvcr?=
 =?us-ascii?Q?5a64Af9KGlwreA4Wi1636JHDWHnz3SldvWRMhblT7lgIU+Vi1faqzVk26s59?=
 =?us-ascii?Q?VXqtgwUhW7JVi0yVyl+dr7NHZblH0TKcZ9h6pbEl6LCCyPzb84xi1QWZSG+l?=
 =?us-ascii?Q?y5DQ3RFDsMj3UnWpap3G3mtovabQzhHaT34gxr+yEE/Bm9ItuwLzU7PJ4B68?=
 =?us-ascii?Q?/oJykQ1AcsUsVxnS5coo6m3dM1UAkq1ZWcjdZnvu5K+p5Fw/HMhgzGtk98ZG?=
 =?us-ascii?Q?TLdRw5p/6/NN+Td6rvrwAoYBbF495BDsk9tcEueOyIC00eXPC54zR1pEMNl3?=
 =?us-ascii?Q?pEnoHBZk4eLq2NpoLyrfUL3vBQVjYbUhDlps+voaV9ax/Z19widhWutnqHAQ?=
 =?us-ascii?Q?K/DO1azxxgqfiDUwUY5wFOegvbR3DIO8kypvHvM8ypafLhv1csrUghJGSDyc?=
 =?us-ascii?Q?pBAMO0TdIt7Tm5zawGm8anGiyc3WupkEdomQoK00GRKjPsb2wJMQusrLk+Xj?=
 =?us-ascii?Q?0u68atOfWk2mmusW/MpeMEKQq/FCEaG1lAE68nFAfa6Ypql8TEt0XIBOnP/o?=
 =?us-ascii?Q?YTNRaV1G+LJvsFQ1P609mFQ7YHEKRiYFZkPHeNRRcTFEDEuCrBz4P1Hawms?=
 =?us-ascii?Q?=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-f5d03.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d926bab-2dcb-42e8-4e9c-08db4f42ecc1
X-MS-Exchange-CrossTenant-AuthSource: SN4P221MB0682.NAMP221.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2023 21:35:06.7351 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0P221MB0831
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Rv9Z11IM6EUUJcKpyJr8FA1EbMsjMeZM44RsM7+5+I=;
 b=Ba9lBcPVc4/imJMzBCTq/nA96/bRB/V4xuHXz4ywjUVTQQqmPjRxcK+F2qpig/aturpimrFkIAXGeKgQ4JgX3gzYzh6pkGeMV3DJmoS/YyJqiMWdUs0Y61H4r8m9ilZlF6Q/uuzx8yUgvAbcIG1Ger9uvvndfneT+4/yiAzgkq63Ccl1R0cnZvy76Fm6ZtbfmmZFF6b8hTNSxOw4tgwd+LgjDHLQXSl791pyQES62TfTkI46aLey/8PbDgnVsQOxNAZ8yZ+ucplB1RcIQKRUczZsHF1UQZANhpE+mR9SMD89NAw9vFAB/tpXYfOIDqfbOe6GOJRYO+Ftu69w7yRMTA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=live.com header.i=@live.com header.a=rsa-sha256
 header.s=selector1 header.b=Ba9lBcPV
Subject: [Buildroot] [PATCH v2 1/5] package/rpm: drop remnants of custom
 CFLAGS
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
Cc: James Knight <james.d.knight@live.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drops the use of `RPM_CFLAGS`, which their use has been obsolete when
this package bumped to v4.17 [1].

[1]: 429e247b869027f6ecd4efa0f31bccd2765e3875

Signed-off-by: James Knight <james.d.knight@live.com>
---
Changes v1 -> v2:
  - This patch has been split across multiple patches; no changes to the
     implementation itself (suggested by Yann E. MORIN)
---
 package/rpm/rpm.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
index fc57a14fd6518ddcd65a90f294ecabbca8057f67..08bcb85ae41701a192330732984401d7092cd492 100644
--- a/package/rpm/rpm.mk
+++ b/package/rpm/rpm.mk
@@ -104,7 +104,6 @@ endif
 # ac_cv_prog_cc_c99: RPM uses non-standard GCC extensions (ex. `asm`).
 RPM_CONF_ENV = \
 	ac_cv_prog_cc_c99='-std=gnu99' \
-	CFLAGS="$(TARGET_CFLAGS) $(RPM_CFLAGS)" \
 	LIBS=$(TARGET_NLS_LIBS)
 
 $(eval $(autotools-package))
-- 
2.40.1.windows.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
