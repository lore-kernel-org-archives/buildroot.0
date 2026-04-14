Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BAE6F9D0D8
	for <buildroot@archiver.kernel.org>; Tue, 14 Apr 2026 21:22:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9C3DC84DBC;
	Tue, 14 Apr 2026 21:22:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N8K4T0zd5iQ8; Tue, 14 Apr 2026 21:22:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D5EE84D9F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776201775;
	bh=p+9AcPP9Wqt54jaQspK7ro0DcXtebiuCiCdujpb2bLI=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=I5qKRgIu0pbE+cCu5cEhuKj9JLqOAtRk8f/MAXmICjEsKIVXBVIBmmVmIh/L8jmJh
	 xLijx+igubk7L0+6vGkM5M85faj1cXxXnODoMv9MjN8jA8qFq5Opl4eRTV0m/P7z/b
	 9Ft4TyGNQY9FcF23ROVxeOIKT78tNCRRz/ZaP4q78AavJ72+2LErMkqMW4FfAutewY
	 kHR+2MMO/8TN6J7sGfQAl7+golSz1JHydneB2UBwO6/JxxwG9kgkELKPqPUNS2Xk1v
	 j96R4isTozbuRZWw+GTROtv8lLwFVucg6L3igVCGIFsg5/M6XG09tuad885qB6C2B4
	 XD3+KFwypPftw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D5EE84D9F;
	Tue, 14 Apr 2026 21:22:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id AB43D375
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 21:22:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 909C66F548
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 21:22:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cCyLgbpEX3yo for <buildroot@buildroot.org>;
 Tue, 14 Apr 2026 21:22:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c40e::1;
 helo=meupr01cu001.outbound.protection.outlook.com;
 envelope-from=afshin.pir@gallagher.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 7431D60A4C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7431D60A4C
Received: from MEUPR01CU001.outbound.protection.outlook.com
 (mail-australiasoutheastazlp170100001.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c40e::1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7431D60A4C
 for <buildroot@buildroot.org>; Tue, 14 Apr 2026 21:22:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kihbPwxJzQVsxNVUyrbYy79+G1H4OTq4j3q4xExTTrnvVe3Bp/VxaYheRkhtzM2RFsylL6H6SMyAtQcvm5+XjK5ibE/txpcQBS0QVXeP0uLCXiFKm/RZMzUSTppHNHHCwyvrCms7QJNzBW3PMx2u+3aSbjkobs4e8DHMzOCilTnxQ+SR4dskK+ngc5mFtTZ4S8O+ux0v5J535FGdcr/sJoLH932mZDew7Ti+UHVX1Mb5HuqzsnUtPbvU/rVzQuUE6I3FQEOUD9CazloEcIYrHs5P8R2dKPNiMW+UCy2hzMwi+VuPr+FZdkoxXz4DCSzl8Cca7iIFUfqqg13LX8wu0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3vsSbffLTCfuA5nq6gWtgTx8d7b0RQdo5d0tHn4f4o=;
 b=VUQnnyJmy1p1TmqoK7vCwc01KG9Wu2qxeV1ePvrf2xPWOEiwJmCfqljfG2cMgINuoZhJQTztQu20XQAAt+fUrXpo5BxSwV0y4IJfxHgcIR7uJzTZ7dTCUIKM0kk9uGRKhjJql9z1YyklXUAfHtjMBeJ3SyHYBLKbDtAbo9wkDF8r7Dsc9gXY8GFxH0jP2mpeQ8TVKBft9QNW7ZMkRw6zhJ3pSsrA+y7VZVjw3GvIHDqRr20j8w1Mc15+iLT/uouyLlc6izwvYi9VQGDPsXcQW93ndzJ4VW/io8l2lbPuaKHFiQgvHOpxu91Jpkm4eDoatbnQyGeVUnXdj94asaQwOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 54.252.196.160) smtp.rcpttodomain=buildroot.org
 smtp.mailfrom=gallagher.com; dmarc=fail (p=none sp=none pct=100) action=none
 header.from=gallagher.com; dkim=none (message not signed); arc=none (0)
Received: from SI2PR04CA0016.apcprd04.prod.outlook.com (2603:1096:4:197::7) by
 SY8PR01MB8710.ausprd01.prod.outlook.com (2603:10c6:10:22a::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.48; Tue, 14 Apr 2026 21:22:42 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com (2603:1096:4:197::4)
 by SI2PR04CA0016.outlook.office365.com (2603:1096:4:197::7) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9769.49
 via Frontend Transport; Tue, 14 Apr 2026 21:22:41 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 54.252.196.160) smtp.mailfrom=gallagher.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gallagher.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 gallagher.com discourages use of 54.252.196.160 as permitted sender)
Received: from smtp.au1.defend.egress.com (54.252.196.160) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9769.17 via Frontend Transport; Tue, 14 Apr 2026 21:22:39 +0000
Received: from MEUPR01CU001.outbound.protection.outlook.com
 (ip-10-241-238-71.ap-southeast-2.compute.internal [10.241.238.71])
 by smtp1.au1.defend.egress.com (Haraka) with ESMTPS id
 EBE56867-CA14-4154-925A-9DBD32B5D216.1
 envelope-from <Afshin.Pir@gallagher.com>
 tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256;
 Tue, 14 Apr 2026 21:22:37 +0000
Received: from ME5PR01MB11041.ausprd01.prod.outlook.com
 (2603:10c6:220:261::17) by ME2PR01MB5794.ausprd01.prod.outlook.com
 (2603:10c6:220:d0::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Tue, 14 Apr
 2026 21:22:35 +0000
Received: from ME5PR01MB11041.ausprd01.prod.outlook.com
 ([fe80::668e:40f9:11d7:ea9c]) by ME5PR01MB11041.ausprd01.prod.outlook.com
 ([fe80::668e:40f9:11d7:ea9c%3]) with mapi id 15.20.9769.048; Tue, 14 Apr 2026
 21:22:35 +0000
From: Afshin Pir <Afshin.Pir@gallagher.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Cargo package build target packages twice
Thread-Index: AdzMVDTz8Xvz0v88TEO5haAN4/WEiA==
Date: Tue, 14 Apr 2026 21:22:34 +0000
Message-ID: <ME5PR01MB1104101DA3451469E6C66F45294252@ME5PR01MB11041.ausprd01.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=gallagher.com;
x-ms-traffictypediagnostic: ME5PR01MB11041:EE_|ME2PR01MB5794:EE_|OSA0EPF000000C7:EE_|SY8PR01MB8710:EE_
X-MS-Office365-Filtering-Correlation-Id: edaa61a8-2265-494a-beac-08de9a6bf4f0
x-egress-defend-domain: gallagher.com
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
 ARA:13230040|376014|366016|1800799024|38070700021|18002099003|56012099003|8096899003;
X-Microsoft-Antispam-Message-Info-Original: igmGdrngYQGfQzpCw8NlFoNZ2gDE/3vCjUhT6in0MqiNHaa+50dKlnChY5kW8XFj6Di8FQ0LxVO3OcLO7JH9UDIy/iwF5tx0lLzrGKe1GChLQh+RVLgG9JEEgjttjkmYXFwl+Mv0BksnOuY1nyT6O6/oA+hpHWwzhsSzgTORUydJWNnrbsyrQDdZ4rx5guw09cIwzgbYU1DtV26gKo+X7GHAooJnOoWvcet5JiSqHl7ea8efBG5P2mvNGOy24gReP4lYT9/sSEddlRLmO2W7rqHCryGD7lpT4FhyNADJr1IYZJ9Zq1nzKF8iFPESlGeKjrlnNmV9g8bu25V0I4kfGlaAZmcyFEpuiVoap90zTAyVfJYcn3tUrCnXUA2+yjd3m/iq3pDa5Dx6nE5xj6L+yxLnmHk3rwjMKktaWg6Yn3lWYKXezzd+/M3m4bYPQTU6gfM6tIkBkf3gX+DP/FfLjIBIHZdE1vlwgh19uEgJnz2wuXBtWMVPAIAMULYu2Ic9r9BamGHElae7g2pkEStF4KRQl7FAxhaiLn8/b1igLSQhg9Q496PXiUYQ5M7BsPR+h+f1eJexEw7NkDXsFrI0kHe1oz6+D0sJEUNdxcIshTgcKXvL/GAli9t3IlupzT6gqszt2w7z2uO4U8PT44SD4Zxz7lwYNyFRUDgy6r57Evf9Ql5mfLRjxUh+AaZy+AK2KdLFNHGmwvebwkKuxj0l1DpjvS9lTmpmJtXhBv8AFjHbTXQOhLqc3ZfSB6WvkJpWxBUp4rZMu74Sy5/nLPaKAJX2NJ4ArBVexOGbLwOtx18=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:ME5PR01MB11041.ausprd01.prod.outlook.com;
 PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021)(18002099003)(56012099003)(8096899003);
 DIR:OUT; SFP:1102; 
MIME-Version: 1.0
X-Exchange-RoutingPolicyChecked: OXYSWnEezF/kIsMBkYbOePR2Y7MO2Owr4S1dphc/oCcjkeX0urA+g0Lh5CtARABKWAjJZMRFfT/52Gkur9D0hnIojIWc4UlYM03aCa32qPwiFASpAGioDulNFVZ6psyL1WHjuMqfxJKo7qa2Spu6jWg0QoCq7xU37+NhOOWsWfPgJHRWt1qQkJE3j8NVZyeLnv5QzrvjDAMvfjvyXldQBz4QpNxD+L8QL2/xmeVxTaIZXwEpwDJRHkvJU8a5SdkbMxSUQpIMJw2wDfiO0TIvk7Q3aOoAIGpAJr0zmNTmSo1Uqw54bfVV2ATBgwDWcpXX3G3kA2vCZrU/rSmx50+o6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME2PR01MB5794
X-Ajax-SCL: 0
X-Egress-Defend-SCL: 0
X-Processed-By-Ajax: true
X-Processed-By-Egress-Defend: true
X-Sentry-Times-Processed-Count: 1
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: dd8ec989-065a-4783-e3ad-08de9a6bf24a
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|14060799003|36860700016|35042699022|82310400026|8096899003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: MD2hqdc20GbMGZp63PXM4JfiVuUikE3HXDzTLn3wbLfEZr/EypmXuTpdHdavIOXms+/63QSauSxf0DNLrNYre9muZjhw+GfZLASVw+Iv0l6QvK8pNolZLZqCJIBX0leggqUyTLrx/OTAUfcItd3TxEAv4zvmP5/jylF1pv0JJo3U86HsVq1uO/bQtrlEe3b3yQ0jD8Jd6MsMtdw1k43ZRU/xzqsWqBKj96Hiq6regTSS0VxiFQ4muhA53+ZSntl2574mgYCdxeh5rXcMi++KAOxZUYY7Q5toV8nzZRuDubwCjEV8vRyXuVo65h8OSjpeI2R/+VJ1En4stDA4DiejgmZsFxqwgHRTHm9dVsPeMST6WETwDlFQDe+f/gku2zOa1NJX6dC11Xpcm7cQYeO9FZQF8i2FIeJ07y7hNQy3Oa0yabv58qygd60yRCEx/NQtWrzJBnqyTRRjHPOCmRejV7ssqsxRn1EbufaPXuJ0xVXrkOhuP9MVs9C3ltnX7W2vwNkv2fp4ZX9pzgjuL86FQVQMXM3gcduh93kc2lJu29oGraLc1m17EIRNk1npnzMJRtN8oH+rIXX0S2Nbah42ijnMR9DnsiXDXCZ7m7D2WkCGpUyaCuDMDhk3olG09UxWd7UnIsaQEkD7XHRkXw6J63TcV4KBPEcxLs/qDMiDbNME3bxh+cnzmZeXE4OdPlIGj6c9+d49g3JW1ucuUfPTWbHHBsv84NVuEOdBanRK4wO36csgE+RbggZN2Z2mdTcStMJ9YrViDQkqt2LsgW7LAQ==
X-Forefront-Antispam-Report: CIP:54.252.196.160; CTRY:AU; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:smtp.au1.defend.egress.com;
 PTR:smtp.au1.defend.egress.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(14060799003)(36860700016)(35042699022)(82310400026)(8096899003)(56012099003)(18002099003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: UJ+9KFDQb5FIOg6bllsTUseDGYmPJ0zIk18i/ty9SqR6qMG3CNpoCVkfmULPyNo5XXSkNWb5ItsFts44N+wHZIuNBnNJWjX/tX9ATMlDSxVDU2pokcaVHFMUOQwpedQl2A6IFBCVFXezK7vw97zzBGnCI6yvvbvBWhYMyzbduYVugLi791OaAhSMZmwhdA0Zbb10za8o4zyzckl1oh141AmgpYxNIKyfI/WWmPHQoMs7zgYvlOH3A1FgZQxz/tiR0kl86ye1MsRUHSE2+GaBsBP9LbB9clDt7J5zhdkHqMI5O9XUkBaCcjY5aNHeSqK0+tkOIzlMFXji1PZCcsR6VSxttYfrjkQrEgkI9hSvkWHZyCeiwGqKqSY+Ol2XTRV8X20MHVw54g+wcHRqd/6sUxMtYQ3ML8M9biitlP5a+dt22Gz4JhuAqcyPTkJIpMSp
X-OriginatorOrg: gallagher.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2026 21:22:39.1112 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edaa61a8-2265-494a-beac-08de9a6bf4f0
X-MS-Exchange-CrossTenant-Id: 2156b869-431f-4815-b2ce-b4893b5c9aaa
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=2156b869-431f-4815-b2ce-b4893b5c9aaa; Ip=[54.252.196.160];
 Helo=[smtp.au1.defend.egress.com]
X-MS-Exchange-CrossTenant-AuthSource: OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY8PR01MB8710
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gallagher.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3vsSbffLTCfuA5nq6gWtgTx8d7b0RQdo5d0tHn4f4o=;
 b=jTWbB4crSUrga3uFwfpcEgI6J5XoIXEWRUKv/beQLIAK/I/S/H/vuIH0HN9p30tCpQgkaNQ6vU1Zl8KYTtGqJpBc39H90mCPq3jTBsDKlV7q13Hk9Swl9BRuX7dEO0gERlOEr0KvFegDP+hmpNrBhtf8MV5tYzrA149upSNZWcbTOuLuRqLT6Vwub3pkh/CMfw33sOP5wmMoiTDUxL0mvhOOkwr9u3byWj86C0w5CjU/GcENG/mhMjIDP8rXXzklKcL7qYhXuen2/+o2UQqW5PkK7sl3XlXaZzCbQ6rJvj4NNRA/4V5COSDH+L6o1FOj2GgNrdl6HYwDGlo/KFvq6w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gallagher.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gallagher.com header.i=@gallagher.com
 header.a=rsa-sha256 header.s=selector2 header.b=jTWbB4cr
Subject: [Buildroot] Cargo package build target packages twice
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3999103429663702036=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3999103429663702036==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_ME5PR01MB1104101DA3451469E6C66F45294252ME5PR01MB11041au_"

--_000_ME5PR01MB1104101DA3451469E6C66F45294252ME5PR01MB11041au_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi All,

I noticed that when we are building a cargo package, the target packages ar=
e built twice. Once during the build and another time during install. I'm n=
ot sure exactly why this happens. At first, I thought maybe it is because o=
f --no-track -force options at install time, But I don't believe it is the =
case. So, I assume the reason is the difference between build options of bu=
ild and install phase. This problem applies to target packages only and the=
 host packages work correctly.
Any idea how to improve the situation?
________________________________
This email is confidential and may contain information subject to legal pri=
vilege. If you are not the intended recipient please advise us of our error=
 by return e-mail then delete this email and any attached files. You may no=
t copy, disclose or use the contents in any way. The views expressed in thi=
s email may not be those of Gallagher Group Ltd or subsidiary companies the=
reof.
________________________________

--_000_ME5PR01MB1104101DA3451469E6C66F45294252ME5PR01MB11041au_
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40"><head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Aptos;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	font-size:12.0pt;
	font-family:"Aptos",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Aptos",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-NZ" link=3D"#467886" vlink=3D"#96607D" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span lang=3D"EN-US">Hi All,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US"><o:p>&nbsp;</o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">I noticed that when we are buil=
ding a cargo package, the target packages are built twice. Once during the =
build and another time during install. I=E2=80=99m not sure exactly why thi=
s happens. At first, I thought maybe it is because
 of =E2=80=93-no-track =E2=80=93force options at install time, But I don=E2=
=80=99t believe it is the case. So, I assume the reason is the difference b=
etween build options of build and install phase. This problem applies to ta=
rget packages only and the host packages work correctly.<o:p></o:p></span><=
/p>
<p class=3D"MsoNormal"><span lang=3D"EN-US">Any idea how to improve the sit=
uation?<o:p></o:p></span></p>
</div>
<hr>
This email is confidential and may contain information subject to legal pri=
vilege. If you are not the intended recipient please advise us of our error=
 by return e-mail then delete this email and any attached files. You may no=
t copy, disclose or use the contents
 in any way. The views expressed in this email may not be those of Gallaghe=
r Group Ltd or subsidiary companies thereof.
<hr>


</body></html>=

--_000_ME5PR01MB1104101DA3451469E6C66F45294252ME5PR01MB11041au_--

--===============3999103429663702036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3999103429663702036==--
