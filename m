Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA32606A321
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 13:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=rREM0kM0
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 441D980C6A;
	Mon, 23 Nov 2026 13:43:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zGOReqjlBrY5; Mon, 23 Nov 2026 13:43:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 6888D80AFB
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795441401;
	b=DGBqf41EOKvh7y+GS8D9J2EgPBDrd5xMUB3CPaDZyuEwMOFVXwb7vEP3JWXGLs/kjQwe
	 1/vZl8OiTNPRsktHWFc8jNIxTsD+moRcsdZyITmLb0sm9nWfnmRUJDkCtRassi03pyJF8
	 NpafaI7TvoVYcz5iLrrzYE/G0R1bJ3m/tI3BGVdzF1IByVYGppkeFRB5K/+ePt5WuUigv
	 g/hJ3Az26LMFQ7mH3lugcG73YkNo0cFZV+r85ZmNmESuoX6Pf4s9H9m31NQM9iQ42P98+
	 qOyycgulBNnWwWz1bwf4I7CaHmg9DfzSXJLe2tSYkt4Qn1WT2zW7gr2tCc/V8Es/SUA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795441401;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Date:To:Cc:Message-ID:References:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=AAHTLa5M4GhXgcm3jJgbTYlMTcMdWfUsPantBzJg+TQ=;
	b=EbeVs1cfcyHQeMWT1jDm2HV16AyMAQEhLvovZhOnzatVjGmAs4I3yEgVcbkC3rhc7ZXm
	 sT7MDAdcb87DO/AwHC28+38MTTvfB3aqD1Yx8c8AN0BTLlGtaOAm5UbrEswBNFeZC2p7E
	 R0msKHV0qska+i1Rd+edAdVSdzWUt1HS6xhLDCWYEMLX+yJ+aVcwDQRDiXJAeuCmA65+4
	 sZx9ySk2n8x51eD/aseQe+vIGtjwhNf64X7VH51jG/Wm+DqYWDrGkYxCZryxOQrUbwhQT
	 PXNDa+Kx0vCUT1Zst24uW2ut7HJc6+bDiLw2NDR/qQ0yBVkd8fOybk5levGdUBOuuDA==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795441401;
	bh=AAHTLa5M4GhXgcm3jJgbTYlMTcMdWfUsPantBzJg+TQ=;
	h=Date:To:Cc:References:In-Reply-To:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=rREM0kM0HAHBs/z41Cuzf1FNZy94c10EBfvB6TR426FbcgfqelZs9b1bGJBdtZXxy
	 MON5zQWucynPBqBJPHleCNKk8OWA5pQwBLxbqJIwhgopJd+95OXTbWMUwEPIWMQsuD
	 MyIB0eYIrYL28ZeK05rkLnJcPZcuLaH9KIrpgvRlBPLkZq8AsUMgtmZ+1l6prMMBbj
	 eu9DeG641J2w+wVFuqs6mK5AjLCblQ3WaGHLAevy90zOG1lp06zKmcNjZj8SIEfkCb
	 MKfYSHgjVNH0DY/nhu2wzGsM22bpZE2C2/i84nHdBlKa3IgPSbWmWQi3rSwA8rLrZ/
	 imkL3BOKCakhw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6888D80AFB;
	Mon, 23 Nov 2026 13:43:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5DE9D1AB
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 13:43:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43D0D80B80
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 13:43:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tyupd-NWnz9Y for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 13:43:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 2F01E80ABD
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c112::7;
 helo=cy3pr05cu001.outbound.protection.outlook.com;
 envelope-from=colin.foster@in-advantage.com; receiver=<UNKNOWN> 
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazlp170130007.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c112::7])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2F01E80ABD
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 13:43:17 +0000 (UTC)
Received: from CH0PR10MB5290.namprd10.prod.outlook.com (2603:10b6:610:dc::14)
 by IA0PR10MB6793.namprd10.prod.outlook.com (2603:10b6:208:43b::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.13; Mon, 23 Nov
 2026 13:43:11 +0000
Received: from CH0PR10MB5290.namprd10.prod.outlook.com
 ([fe80::fd87:b9a4:818d:5ef5]) by CH0PR10MB5290.namprd10.prod.outlook.com
 ([fe80::fd87:b9a4:818d:5ef5%5]) with mapi id 15.21.0639.012; Mon, 23 Nov 2026
 13:43:11 +0000
Date: Mon, 23 Nov 2026 07:43:08 -0600
To: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Cc: buildroot@buildroot.org, "Yann E. MORIN" <yann.morin@orange.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <awRC7Gl9E3vIsFLp@colin-ia-desktop>
References: <20230526175506.1071354-1-colin.foster@in-advantage.com>
 <20261120214740.592746-1-angelo.compagnucci@gmail.com>
Content-Disposition: inline
In-Reply-To: <20261120214740.592746-1-angelo.compagnucci@gmail.com>
X-ClientProxiedBy: BN9PR03CA0226.namprd03.prod.outlook.com
 (2603:10b6:408:f8::21) To CH0PR10MB5290.namprd10.prod.outlook.com
 (2603:10b6:610:dc::14)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5290:EE_|IA0PR10MB6793:EE_
X-MS-Office365-Filtering-Correlation-Id: 49201912-70f6-4d5f-96c8-08df4967b6df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|23010399003|366016|18002099003|22082099003|6133799003|261009223027099003|4143699003|56012099006|10067099003|11063799006|261102123227099003|261026121527099003|261021121427099003;
X-Microsoft-Antispam-Message-Info: 2/JF2dPmmY/bojMZY50Qa2X/M9+DGT0BIFt7BYb9bDvZG3jLoqN2Lu7Ef5JyDTdC5mCAZejDRXEoxJmU8Hl7x6M/JyipP3svAquS9X3sVM+Hv47ssIR4xZfDTZ5UQ2+szsZONQYZZlz5HLqOlh7t9t7z90g/+QF/0PH/J9KSBf0HlAWGZT9AJkbhKf1kyvG0MC+fmqmioAnc2jSImHyDbB5t5ttvbg6lmX2PNpJqZRKEwRdJNvt4hVAC2HD0fvWn7U/6aZ2sZMeM+U9KjwSSaBFK7y2qdltUb/8Hyc4JvvsDAyQMDuoj/VsaW+Vx0C3Lps0z221W/8UeKkV25j+2Lin951JpVqWOIYiAC8+F+GKpAFDa5Q5dBSzRkz3e1JzN15sW+nHJ1pvKaFl6QuAa0wQhhMZ+CtNWgzH1nDuv8PcX6T+Gq3CAm6bb3QmiwfyvtJJyuatAWhMquJ303QVn57lQF4QNORTjTHCIqAJHhHsTi2dSt+g9atcrxInwkUHDRix/ZwF8IxdlEEVoyHfcmxgmDn129X9aKgaYjGRvrw8y38fztt9ZWOWYAc9PBit22XpfNMlZFfGDEukrVL7EW26kvN7erXbDC9oDlsGqG9lsVteOQDtys16VV5hN/ssOdKZcdyigA7W8TPq2mJDCKa1fvV+8Pm7TRlASvL4qV/M=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR10MB5290.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(23010399003)(366016)(18002099003)(22082099003)(6133799003)(261009223027099003)(4143699003)(56012099006)(10067099003)(11063799006)(261102123227099003)(261026121527099003)(261021121427099003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QcIBCZ7ZsI4smBhQv8HXdrSwMg4nLUXr/ruQ5AUPnQQ0jOybbezrPIJPPc4d?=
 =?us-ascii?Q?z1Am67JWuYOPaSQCGh+EkuPnOmg0QCblMEE+pBpgZdRmWJIS03WYc/HHFL4z?=
 =?us-ascii?Q?QuXXFQDlFVwk5sFmpcb9JYhoF6fgPIWtmR4VIUEw2ck0yWPRuYF0JKvStzXn?=
 =?us-ascii?Q?tBz/ePFcQSJcjm6cvmKR3GYFD2/mgv43wPNaa9D3H/vfKvsvj/XhbDT3ioCm?=
 =?us-ascii?Q?MhZvhqI6V0DHbZHwuh3gkPNpqv6fP5hf12tLfmLWeQilmTEdAP8LvdGi4Xdl?=
 =?us-ascii?Q?DnEX3QKe9yY/SNXtAtGB2ojiMun6mEbzhwC+Q9IlOdzDgaVZHBn51ff+GxYA?=
 =?us-ascii?Q?z/+Cx2HDYHM0yhJRbXdxTHAVNCpz+6We1K8lqK7mhjvq2aRP+mjqTOJXw3Bi?=
 =?us-ascii?Q?zjTw3wagKOsNVK9nohD5Bky3LbUqKOW4cTEEFSbz+5S8GaiyOFMmnuqAhYNZ?=
 =?us-ascii?Q?3yzXzUjhUzBfNlopNGr3mwvIRHuWsSfxyBe67jsZaSOHamu3ugmVjgHfkIWr?=
 =?us-ascii?Q?lu4ssxvRPDr68djoBaqxM4quOOZrsC9DptnkElPduoYHjbh5VAc9OluAITjd?=
 =?us-ascii?Q?XPA6WV9M/In9juwluhvxA3r/G1spvFRpLBGCKsmQJFMRBnTboUEz2NSyRm4k?=
 =?us-ascii?Q?0zWJZ69RjajW6dwsS3O31B0jthPIXNnfE0caK146/hpNOvQFSNlMuzTcAEYg?=
 =?us-ascii?Q?DaWAKiI72UYUG+uNBqrqzR5yAawTb4qRh4W6PAAu+50TW8gEIN42A6FWAQOu?=
 =?us-ascii?Q?KdvV6xp5gqmftRr+BZ/U4vVuLCfYfZ0ldn6RGT09hci8CmGq28J8GMOVjVDk?=
 =?us-ascii?Q?rkftqvNxHIAHnLLFA5rTtf9MLFxVE28cJ2k3TtChAq6OkR/DJX15n13I15Tv?=
 =?us-ascii?Q?rWVt6xEGUPQwmVvWavKr2+MSOSZ8i2oqAhermvM7c8MG8EhLVKXqBQ/7cVIN?=
 =?us-ascii?Q?eZKDtlA/CLfq2A87btXzJA+YHNC4M+uPD479MVyk4xa3hFROn7JGgJX57D0N?=
 =?us-ascii?Q?fzuW3oDVCzJpc7eUeLFBLcL/3t0pEMaxGxcSw0TwWPp2tSyF2jB6w8RgnoTf?=
 =?us-ascii?Q?ZGGZBK36oakw+e1uSjbwvr4AnBl+9PeMSP4Jw+0vyOj9KbcD8vjLrdgYY2Rc?=
 =?us-ascii?Q?xBiDYfnzL3HUNPAoAAj6YsD/jm0UYg66MYtrwSX5CpwAaC/eKrUQhYpdjEh1?=
 =?us-ascii?Q?VPedErV6H17PZGz2neckotoEz8RGMBoo+o5hS7XNwdYqbBRlfLipR6K02lAT?=
 =?us-ascii?Q?ESv3SGlzQ8cu91wbYY8xFRRQqd0HDBvqc0sNF/9/8InjztvqaeYG/m/8I+Bs?=
 =?us-ascii?Q?Aomz93ClBdKTLeUKIw0avLQrkuKp1lHQDVcctdZsxbggWYwAREpybLDCdfFQ?=
 =?us-ascii?Q?QsD3w/VhVgvQqtjF9Ijf+R7aFwmHwNFcLSd995hcEwmqeL6OLrYpaRVvNuGE?=
 =?us-ascii?Q?GXPeX1bBSUaI3uLVXIOGFOzK6EhivmFTwNHLSwsOlHxs9TzNX1AmV5NZhxwY?=
 =?us-ascii?Q?vv7h6xI0FWnBTSjwA6wVbcSZwrrWMzsvSs5+CY1SaDffJYzdc/agztYF25Ym?=
 =?us-ascii?Q?FBnQNwJzdFNcULB5XAHrmLiGeKzdsARWdiOEpMOT5NBMz2TNIA0hMNtSHupN?=
 =?us-ascii?Q?ddhM1ZGKGhu57VU1hF51SaBCcFrBvBH9XsSUWuRcW0/v8Wx1htK2+5XFV3cB?=
 =?us-ascii?Q?e9kHlyZ5jMIRfDavgJS/ZJoueipusUwmo/WIpImKF0h4abJIcAykxj5LdSlR?=
 =?us-ascii?Q?TMCjjO6UxgG+bhiuSRKphMKy2t8muik=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49201912-70f6-4d5f-96c8-08df4967b6df
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2026 13:43:11.1804 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mcQhKBUh5hX/AlWDHIvawc8opHcc96zeGtEgc4LHxdBKMCF4qrrpRPJ5e7Oo+PqsuQwPS0QJsZ/n2Wfq9emX590yoe2Xdy0x66tWq6sKX7g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6793
Subject: Re: [Buildroot] [v2 0/2] package: bootpc: add bootpc and bootp
 interface configuration
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Colin Foster via buildroot <buildroot@buildroot.org>
Reply-To: Colin Foster <colin.foster@in-advantage.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,MAILING_LIST_MULTI,
	SPF_HELO_PASS,SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Angelo,

On Fri, Nov 20, 2026 at 10:47:40PM +0100, Angelo Compagnucci wrote:
> Hi Colin,
> 
> On 26/05/23 19:55, Colin Foster wrote:
> > Believe it or not, there are use cases for running BOOTPC instead of
> > DHCP or static IP addressing.
> 
> I think this series can be dropped.

Agreed.

> 
> A BOOTP client is still useful when the server only speaks BOOTP, and
> Buildroot can already do that with DHCP tools:
> 
> - dhcpcd is also a BOOTP client: add "bootp" to /etc/dhcpcd.conf (or
>   run "dhcpcd --bootp"). It brings the interface up and configures it,
>   so no wrapper script is needed.
> - With CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP in busybox,
>   "iface eth0 inet dhcp" in /etc/network/interfaces runs dhcpcd.
> - At boot, the kernel can use BOOTP with CONFIG_IP_PNP_BOOTP and
>   ip=...:bootp on its command line.

This is good to know! Thanks.

Colin Foster
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
