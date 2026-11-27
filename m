Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7A6F606A31C
	for <buildroot@archiver.kernel.org>; Fri, 27 Nov 2026 15:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=htz8A+XF
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A74FF608C4;
	Fri, 27 Nov 2026 15:31:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jgL7xlZfqdMU; Fri, 27 Nov 2026 15:31:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org B2C4C607B0
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795793500;
	b=ebkbBhpMKgKCIrfWiqAs8PAsDiKHCGDNPsdkBAoubPmvIDBye6jwuIysgdCdw1dEqB+N
	 Lq4M4+OTCiwrr/3uh9YejFGgeUD3HED14DHkoA0CMlyN+BXeb0FHsZPr5+Hd1+Pzr8pQ4
	 c44eK12sHpi0e1woGhToEXIeW4phGeIiJqMz72E8ZIdYwjyeiC/hvW2OxXSQubjKNrtuH
	 SaiBJp02+ekboL4CVihI9kAoSFbKhk+1OG3FnpxHLaIghpevDtpiuRivskZanmcWYp7Vp
	 pWcFZelOM8CpvzoIMgeJSNjlMyzUIilhwiAVmirYKsHaei4wixnvNit2yEeG5boFFWQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795793500;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-Exchange-RoutingPolicyChecked:
	 X-OriginatorOrg:X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=FB1kBcLcAeXrTTQQlwCMa5gedvGnvKiqXud1+Y3QzJQ=;
	b=k0rmqHfUYuGrnE06fFGn0eDnfwQaD7QcnH68yn6vaTrh7j8ODvzNhGgk1r7JGR2DYZR+
	 fovUtK1BC/iT0FgMDugdBa987mBBJoJVLGzvlrYSjDWtc3Yptmm7pCkF/+GfLlEfYLMLX
	 G8PyUFBhZudyiJJAQqGjeODqxtfCs/JKtAvw2h2hVN3G5b6UGjUF4omwmhIxJbXgh+YHd
	 bTkSKPetxYeWnG/6VYv87fUhZO8uX33EnYxJHedW3vxMGeWV0wRlFoartL9R6xwCyE7ni
	 WC9KmKfGGtVF/1/eXMjdkt5Ts9ag0GJvU7q1ufLU8o3QKWI6mkIXuMUroQrUmxgqpMA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795793500;
	bh=FB1kBcLcAeXrTTQQlwCMa5gedvGnvKiqXud1+Y3QzJQ=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=htz8A+XFxcFXerq36XZUYS9cRYmFGByOAmE9wILCXter9WEeWx//oqdTVDOfFh+bj
	 X18ctDyFqyGefZq+cnE1/hgfivJimhb/ZNjGKjyyirPjeg4EXnnuIOX6Pxdf8U3xi2
	 UUEPAdvtgK41rgvWtys7n9GdSj36mSkjfdrI6ykzpgVrxymAVtW2IL4PVhh+et5NVB
	 grCMuLwbPFHFY6msY1AtI5dsuw67rqJ/jXf6h4Ggv0s0U5bIrAN7aEXQjtVxtR9CnQ
	 FcEp27C8JyHfhlkSwL5U5o49SUZ9eQoyQtLbV4md32wIvqT7Lbr0lQrFK702pWMMr6
	 mLkROE7rMXazQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id B2C4C607B0;
	Fri, 27 Nov 2026 15:31:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id E8F7F373
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:31:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CF474607B0
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:31:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zt5MwWh4fZWB for <buildroot@buildroot.org>;
 Fri, 27 Nov 2026 15:31:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org A60DF6070E
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=148.163.135.77;
 helo=mx0a-00128a01.pphosted.com; envelope-from=philip.molloy@analog.com;
 receiver=<UNKNOWN> 
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com
 [148.163.135.77])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A60DF6070E
 for <buildroot@buildroot.org>; Fri, 27 Nov 2026 15:31:36 +0000 (UTC)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
 by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6ARDxqx63739170; Fri, 27 Nov 2026 10:31:35 -0500
Received: from ph8pr06cu001.outbound.protection.outlook.com
 (mail-westus3azon11012071.outbound.protection.outlook.com [40.107.209.71])
 by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4j6a88gvqs-2
 (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
 Fri, 27 Nov 2026 10:31:35 -0500 (EST)
Received: from PH0PR03MB989121.namprd03.prod.outlook.com
 (2603:10b6:510:3ae::7) by PH7PR03MB7063.namprd03.prod.outlook.com
 (2603:10b6:510:2a4::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Fri, 27 Nov
 2026 15:31:33 +0000
Received: from PH0PR03MB989121.namprd03.prod.outlook.com
 ([fe80::ef52:54ee:4294:2906]) by PH0PR03MB989121.namprd03.prod.outlook.com
 ([fe80::ef52:54ee:4294:2906%6]) with mapi id 15.21.0662.007; Fri, 27 Nov 2026
 15:31:33 +0000
To: buildroot@buildroot.org
Cc: Massimo Pegorer <massimo.pegorer+oss@gmail.com>,
 Greg Malysa <malysagreg@gmail.com>, linux@analog.com,
 Philip Molloy <philip.molloy@analog.com>,
 Philip Molloy <philip@philipmolloy.com>
Date: Fri, 27 Nov 2026 16:31:12 +0100
Message-ID: <20261127151142.2983596-2-philip.molloy@analog.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127151142.2983596-1-philip.molloy@analog.com>
References: <20261127151142.2983596-1-philip.molloy@analog.com>
X-ClientProxiedBy: FR3P281CA0150.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::19) To PH0PR03MB989121.namprd03.prod.outlook.com
 (2603:10b6:510:3ae::7)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR03MB989121:EE_|PH7PR03MB7063:EE_
X-MS-Office365-Filtering-Correlation-Id: 4488fce1-f337-4e71-eae9-08df4c9b8415
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|23010399003|1800799024|376014|366016|22082099003|18002099003|3023799007|56012099006|11063799006|261026140227099003|261022105027099003|261028144727099003|261009223027099003|261021121427099003|261021123027099003|261102123227099003|10067099003|261026121527099003;
X-Microsoft-Antispam-Message-Info: HQjpoVM3lHuSbf3VMi7LFhb26KEdEKCUOn1fQVxUaXao+S3iwTipS3WHR8ksIv7J34dBqbqipF9IR2PwfHzr+I2XZY8UCar5QXvMWoRNfZ+GoS4oSOS4uOE/9zgHEy3A+N9W4SMMxw1VHlIbePgGfgLaEkXYYcOzMLXv2dpDJbIeGal0gQbbaL3bOGhAVOmZESIMVqccXpSbKkSZXGIRz33B8FAf//2NVTvhfa/pnV4IxJHEOOvkwdkCd8UcgGSotNDUZHOTJRLWL7caYlJZbSx1NdDG4AuZVU9wBsSzpNf0farLdnxhUlLaA9Arkp99HeqWN+726IpfKirtyiZC+5AmGuAclB+z7poQlnm7roL662rZjKfFDLUz1nVRWWraYqy+ExFZhHI6MTZNAFCxTWIW+CWNHwkxahn1kdK4g69qvr4D4GYNgq34qXW9HShw36Lz0tPaciiK2PdiYTt34w7HlJAbsiG93o5VeigXFtjh2B/EC8W3MPRBTeN/s1byIxUZVaAYN0ilhbm0ZVrkreZdAgTmaG+l8LoW1jEIEvYTwzvjTg0bTN8DiPttRZkdk3jpN+KdLW7kiHv/Xzgct8Xy6qvKxMFiROgKbdtaX49g90VCx7yOmzQpNwiAcXyZ/Jn7G1G9Sfm2AN0Ct7C/XTZu1yOQH+SxC3tYh/cfhog=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR03MB989121.namprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(23010399003)(1800799024)(376014)(366016)(22082099003)(18002099003)(3023799007)(56012099006)(11063799006)(261026140227099003)(261022105027099003)(261028144727099003)(261009223027099003)(261021121427099003)(261021123027099003)(261102123227099003)(10067099003)(261026121527099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CO1abR6dfkyKjEw7nB9dL5mZn2JBvP+NKdo0kN9Da6j52kr4nAkIHrCP9UgZ?=
 =?us-ascii?Q?sIKtbc80HStFgDbxLUNFRmbF7l/um/w+xcazdYYcnbzS1Lsnf0yF+coxn2J0?=
 =?us-ascii?Q?ouIauyYXtnkNrTQ0DC1WvwPgWRUgJ69kZC6E0KDWh+oGgT8nzdHsPErFk10l?=
 =?us-ascii?Q?a+Pu19JcvcP/dOpsvN48ObLLtBqb1gGVn5o+Huqtb8BhGdep+slbD/cWoC2j?=
 =?us-ascii?Q?gBge/+WrgqP5lKv1lPo6dqBhkK0fCoMb6dJ2oAmdLc/tk9Axpj5l/S6zljgz?=
 =?us-ascii?Q?ijOu/OcG8nrstTN2AyOq0QDZ9HkUdByQr76e/CHVy+gEMeY1mjAPV3yZnbuS?=
 =?us-ascii?Q?0DiZqL413rvuMEn0uI8vlSFd7GoYckR81hjHoNx4iQbE2zlrI0SSv8GbykIf?=
 =?us-ascii?Q?LzdBAN2TQ0V/gLGvSdxqn6XfjnuPbOehOG8lF2yLC3EFdIKQn5vRHdZfjR90?=
 =?us-ascii?Q?Fdupm71nXxkPvB+db2rpEvsh7kYuQOQ5LqFxYNRLrY2cBIG44Hi0hJonhB5b?=
 =?us-ascii?Q?mkurcUCh8KPdgttfH5tfgSckKKnC4be81AivYQMhu4jRQQbW/UgF/uBsqBsN?=
 =?us-ascii?Q?0YWdqcZqUgyxJAhXr77jHnsyTxcu+tlyjuKCQ7CfyAHIE+diG8LFIcbx8bnF?=
 =?us-ascii?Q?vD9sAV838q/Y9XPinc1IhSi7GPF5f/sGrZRJ3RCnzVmbEMtc5WI8/o7wcyPg?=
 =?us-ascii?Q?mTHLSTZtYyKf74C0weZvGdfBmxmFJH3AeIC84IDf8vmgWn+tOSEbQ8OcmSC9?=
 =?us-ascii?Q?Mzr1yWnbOtUfEsVPoi+K4qTIhxo6P8Aj+7ASHpjN9pDwI3P5kzDz+pA7i/NZ?=
 =?us-ascii?Q?IdW1NS+pFeE+WnB4wjYMnYS+SZ5jxERq+HMsF1qwBjA7QBRpKAX4RbxxkpSO?=
 =?us-ascii?Q?BYJIupBtOgjiUVP7uKQm2SlrroR4SWVdxokqXjO7gJLVia6rMvzVDRX9NM3l?=
 =?us-ascii?Q?XbIZ/16srPKMvqdgVu1mdvFEKcR0ls+EG93xqTaDZ+rTpF38EjgzUetZ84/P?=
 =?us-ascii?Q?6tBt/c6U4qHmL43ABVPYEHlFlSTFwehBaMq7CfWmE9vrI8PTZioBjVY55LhL?=
 =?us-ascii?Q?Ks8xGgZEx4OjqN4f8k+E04BhlxP2pNPCxhGqWHeHq8uicTzHV76ce0bQOR4h?=
 =?us-ascii?Q?g48ZQ/yoNRtzFQxIKFpngzXuySrIWin2m83a4sqbj9fJed8oHqce+jrBe+Ft?=
 =?us-ascii?Q?cT1ekf1E54Wq2LSn0O0bgE2ORe0dH2uKcbd6R+3dxT+nAnvavfEvtCCUusHI?=
 =?us-ascii?Q?dDQKSfjd/KnaikAOK16oTJ/eZsj0yU5DlaE2l46RyE6oZvaWWiWqTd/1AEyj?=
 =?us-ascii?Q?FDGDz5ZT0RF4lZbGzX317mEjRx+l4KnOy0hzP6wdks8SDVzfxXD3BAfI/rKY?=
 =?us-ascii?Q?Gec+Sx6CqZ8YGPBOgh3qtu5wQxBxxBJLHCjxm1nFGM2BjZGjJMYgmrgYLB+o?=
 =?us-ascii?Q?p3OrSIuaKoBUNQQbn3M20nY5d9hRUeL2pYGz0/xFoW6VV0yNYodVVHfuaKjp?=
 =?us-ascii?Q?0adqeM5sLCtVxamnH0e3iANml800Y/pbF6D5qPd38lHHhQ6rBPsK+yJk8gwC?=
 =?us-ascii?Q?vsFgVqu266HvvR5QR1TJ072gCbealdSaOaXfheOrlKnibcCMnAjTAktvKN9k?=
 =?us-ascii?Q?y0qibSmrXlnAcMlNJ+6G8ahiKdzazDuBgyeAZqd3WVjRpdA6uB+IZ/20WlKf?=
 =?us-ascii?Q?D1evV1aV/tHHuWjEktmkoP4frIY+1xqa15UskkMYeYoSu0uLWsL6KlgWdO+9?=
 =?us-ascii?Q?lJk1kKkM2ftB555V6baiLRyq7QoK7Fw44xUO0oaVvmC7RkUI8Eo5sIBNGsxi?=
X-MS-Exchange-AntiSpam-MessageData-1: gHNMYb1/J9UAi5C5U2NhBRwVZ/5ccD9/MQ8=
X-Exchange-RoutingPolicyChecked: Jr5MWpQek80dEe+Ob+vQxdo1UrydJ/1o/nZRwyBqEqV+YVZ0cGIIhb9uXeTrbrZA0GEsE/8xi0kTYweWb66OfHQ5c5XgDa4AMlQioXduIr0qqGQUAnO5orMFVjOVTqWqnNgOV8HpZA9/xqv9P9xEdCp+BnqpXn1c4B/0ZE+W+XJ3MP0UcmoessehzjvObSEhTecRaQrvAL6aQl+cc2cxypUvjhx0y2W3BylfH5TYCAwyg841e9PthSXfVr+YvpKT/sfwz1MtfjB3qPUVk+sAkDVzt34VqSVxUaz9PAFUx1dVYZQMojqtAa2Lhuhhl0/Yd6BMZb+3O6NxAfIEYKZjlQ==
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4488fce1-f337-4e71-eae9-08df4c9b8415
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB989121.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Nov 2026 15:31:33.0271 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pFDSMrTc9D+HfVfA8GE0pGN/z6kBhi4Ao+5NNVxdYQhKBQqAVoK4S9o8b5YPwzyqNCoICvkCYTMPEw3TDRuQtP6j+X4vZSsG/dMIrXeHI3w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR03MB7063
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MSBTYWx0ZWRfX/h8Lj5WlM0dv
 8+PcKt3W12PZMBJYumm1N1k7qhAzXDCGAWtw/lovf0Gu9DXtEmOhlhHXHn+434snreOLlItZ5Tp
 VpYNLWYa9UQaV5JRAmYGwuWEe4Hrjrloga2ELIiDA0OuQ4gjad683BdfKpid0vayck87Fpu9mvd
 tGBDQIHZe1DbKsMJJixXJMmFy27N6bY5P7a4l3xEOBkrJeUFaHIp+6WYHgDeNpBwNFKlerQS+IZ
 j6C63GUB6ajL1BVGAY27h74+PL0nd47w2WdWLbBLffVHpHefhIH/b5YAhlG+cF1FViu5qYtpBn+
 u5rG0X414/KWnz1iJsJ25yZ3iqybbZ2Tq3mVlHua7JQjwkdNYUMawQf54YrpcPABh8dzw6JhrdE
 Wy68peuw2WaKnLTDxqV+kRiweL+fMTigEcMVjR0CDUOxvGsuD2WwbC6Lut5u34vzMnCrlBGON8s
 m6BApa+e+mfS/zsVl7g==
X-Authority-Analysis: v=2.4 cv=Dp/Da2/+ c=1 sm=1 tr=0 ts=6b09a257 cx=c_pps
 a=3rvMy2ukNI5EHG76q/Bj7A==:117 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19
 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=xqWC_Br6kY4A:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8
 a=eDKwIjLYKN89NEMnvVAA:9
X-Proofpoint-ORIG-GUID: V-r0oE1h-5ewMqQqqW7n2l_u1nXlljIt
X-Proofpoint-GUID: V-r0oE1h-5ewMqQqqW7n2l_u1nXlljIt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MSBTYWx0ZWRfX1xibPaCpXq+e
 XTPtBHmPCFeactX7YOK4eYtZpnzFYnrygE0ci8DHhS3s/fgGdthxStB5avFDicUdZB0dMRFzez+
 0EUJSox9/XFrrCOeFGt/SK4lmG6jTcvk7c4N7ZbC9fDbTBrBcbLq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 adultscore=0 malwarescore=0
 suspectscore=0 phishscore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270061
Subject: [Buildroot] [PATCH 2/2] package/adsp-ldr: install ldr without prefix
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Philip Molloy via buildroot <buildroot@buildroot.org>
Reply-To: Philip Molloy <philip.molloy@analog.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In the U-Boot next branch, commit 4b0ee21c408d ("Makefile: Drop
$(CROSS_COMPILE) prefix from LDR variable definition") changed the
U-Boot Makefile to call ldr without the $(CROSS_COMPILE) prefix. Since
commit 943998e33366 ("mach-sc5xx: Generate LDR artifacts only if ldr is
available"), the LDR artifacts are silently skipped if ldr cannot be
found.

Drop the custom install commands, so the default meson install step
installs ldr as $(HOST_DIR)/bin/ldr, which newer U-Boot versions find in
PATH. Pass LDR explicitly to U-Boot, as is already done for DTC, so that
older U-Boot versions, which call $(CROSS_COMPILE)ldr, also use it.

Signed-off-by: Philip Molloy <philip.molloy@analog.com>
---
 boot/uboot/uboot.mk          | 1 +
 package/adsp-ldr/adsp-ldr.mk | 7 -------
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index ba6f608751..1386a678af 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -268,6 +268,7 @@ endif
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_ADSP_LDR),y)
 UBOOT_BINS += u-boot.ldr
 UBOOT_DEPENDENCIES += host-adsp-ldr
+UBOOT_MAKE_OPTS += LDR=$(HOST_DIR)/bin/ldr
 endif
 
 ifeq ($(BR2_TARGET_UBOOT_NEEDS_DTC),y)
diff --git a/package/adsp-ldr/adsp-ldr.mk b/package/adsp-ldr/adsp-ldr.mk
index d46beb7ad5..b3299de38e 100644
--- a/package/adsp-ldr/adsp-ldr.mk
+++ b/package/adsp-ldr/adsp-ldr.mk
@@ -11,11 +11,4 @@ ADSP_LDR_LICENSE = BSD-3-Clause
 ADSP_LDR_LICENSE_FILES = LICENSE
 HOST_ADSP_LDR_DEPENDENCIES = host-libusb
 
-define HOST_ADSP_LDR_INSTALL_CMDS
-	# The U-Boot Makefile expects ldr to be prefixed by $(CROSS_COMPILE),
-	# hence the rename to $(TARGET_CROSS)ldr
-	$(INSTALL) -m 755 -D $(@D)/buildroot-build/ldr \
-		$(TARGET_CROSS)ldr
-endef
-
 $(eval $(host-meson-package))
-- 
2.56.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
