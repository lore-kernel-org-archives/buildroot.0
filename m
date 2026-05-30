Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13229CD5BD0
	for <buildroot@archiver.kernel.org>; Sat, 30 May 2026 18:53:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C07C7853D2;
	Sat, 30 May 2026 18:53:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GCmAU2gNMRzk; Sat, 30 May 2026 18:53:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D5A8D853D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780167209;
	bh=RtvUYtclo3CKykpvWJqQ7KZCg5MadOP8bnOzx+KXNm8=;
	h=To:Date:References:In-Reply-To:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=otRQ04Ij8N+KdGrMr70Unhfhg0AJuX+295g9sEQH4Nxqc066jLk1UPA6lryTO2j8j
	 f4vt5TknqXH8y4LxPOCFq+2Rq4w3s+8XqwXLX3uAeZ9g5gXbsuVAUqO8gdwPMFmHEZ
	 hc06LTIIL/rTeTTBJOCW86cKn/68OGOYDhKVOGfKSRHveEC/blylRINcdFOQ4IEyBl
	 MCouqAVV6OeqbPlTNAVoxZXZYo7SElpFTjt1CTrTqA+OuehtPY3dzH7eRPcupStpA1
	 zBN4sjNwP6o8njk9DNZlkG/4AJaYkJFREfU6kVAoD5o+Po20MHwSkAy0NcCZmAAKni
	 H2iBgkQ0fFMNA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D5A8D853D3;
	Sat, 30 May 2026 18:53:29 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CE1B12F
 for <buildroot@buildroot.org>; Sat, 30 May 2026 18:53:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E85561739
 for <buildroot@buildroot.org>; Sat, 30 May 2026 18:53:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FXLY-FvBzRBP for <buildroot@buildroot.org>;
 Sat, 30 May 2026 18:53:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c100::f;
 helo=bl2pr02cu003.outbound.protection.outlook.com;
 envelope-from=neal.frager@amd.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A0D0760BB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A0D0760BB2
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazlp17011000f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c100::f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0D0760BB2
 for <buildroot@buildroot.org>; Sat, 30 May 2026 18:53:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W6T0Z/DAwfVT0SO9TqXIpIMScPstChFIMx1cWcdus508TpuHyRCXfPA41kw9crpGgOs5LKtGdC4h6vrju/FIbfFSURPy14KQfyLGL4iLsq13Q66r7cCzesE1LZXkeXBJ8CskGgRku43WTbJfK0v2Akmx7kVY8cqJVD7NaQDXRMOtTGgG7N62aMtY8IN2oWWP/qc6odkb3pjV2dxDaBNafv2Q8bw+R0BB1B9LXulWnj4zMH3PsJ91rFMH3/oTqHyj+AZT8aVbzcwVeXmezstemFPTazoZyyXZUrMklK8z/rIAqM+XTD6L5GBadpHGwAm2cJsYiPUWXssRD0M9haLSuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8BRxFpnOsBZ5xjOoipHgNp8qOl7lxwtKud3031wT2NM=;
 b=h/cTxsY53p6youw4Ejfwm7B0CAPDPnJCtZDDRL0bqhjSoiQ6HYAqRDn2zmNotAkXW1yEAAnMHu68la5uD8gvLbWOX7nriUSUbRDiLNrDG7csWL7XjxkDGe37b73I1WQNe5SRS2X7IL6gCZXmxRt8ThumLIGdoR3hSHIyYeCzIqYOeMbhyWs7pdGFBh9UntkFCjFEeaEAytBH9UESh2CPrfE5y9AfqYVn+t9ahEvFGSaKitoYPvVG2t+7npNo+xW4rPs17Wdfhrm4dJJAfnaGreiR/wfds55a9PSIWo1rrgfsZ7loJpKQt/LAP/NLOH2t0kXsHYUqXWbZ4aDfaNOYOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BL1PR12MB5032.namprd12.prod.outlook.com (2603:10b6:208:30a::12)
 by MW4PR12MB7465.namprd12.prod.outlook.com (2603:10b6:303:212::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.15; Sat, 30 May
 2026 18:53:19 +0000
Received: from BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d]) by BL1PR12MB5032.namprd12.prod.outlook.com
 ([fe80::3c13:eeb6:d9ef:c95d%4]) with mapi id 15.21.0071.015; Sat, 30 May 2026
 18:53:19 +0000
To: Arnout Vandecappelle <arnout@rnout.be>, "buildroot@buildroot.org"
 <buildroot@buildroot.org>
Thread-Topic: [PATCH v1 1/1] package/gcc-bare-metal: bump to gcc 16.1.0
Thread-Index: AQHc51y7LdmFJJquZ0yht1I3EtfvYLYlV/SAgAAJDJiAAAM1gIABl0BR
Date: Sat, 30 May 2026 18:53:19 +0000
Message-ID: <BL1PR12MB50324447B9BBE29AA56E1469F0172@BL1PR12MB5032.namprd12.prod.outlook.com>
References: <20260519065710.324849-1-neal.frager@amd.com>
 <194ccb18-9d29-4851-9aeb-55b0cb6eb213@rnout.be>
 <BL1PR12MB50321FD4A2BB80590984A6A2F0162@BL1PR12MB5032.namprd12.prod.outlook.com>
 <62237613-6844-4c5d-8c14-0a8660f654fd@rnout.be>
In-Reply-To: <62237613-6844-4c5d-8c14-0a8660f654fd@rnout.be>
Accept-Language: en-US
Content-Language: fr-FR
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Enabled=True;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_SetDate=2026-05-30T18:49:48.9240415Z;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Name=AMD General
 v26; MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_ContentBits=3;
 MSIP_Label_198e8dea-a4f3-4850-b16a-fd6d2b1302b4_Method=Standard
x-ms-reactions: allow
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BL1PR12MB5032:EE_|MW4PR12MB7465:EE_
x-ms-office365-filtering-correlation-id: ce47df57-492e-4fb5-2d71-08debe7cb741
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|10070799003|376014|7416014|1800799024|13003099007|38070700021|8096899003|11063799006|18002099003|22082099003|56012099006|4143699003|41080700001;
x-microsoft-antispam-message-info: WLJHaRRS3FX4v6r2PdQUYgRNU8HK1MaOKB4yinT/LoQdUMgesS9CHB5wrPUkNUru2ycYlwUnF8yoUIUC2ShczFqhPk2hBE84hnXgUN1mg5In1Omtg9orhDrWBfrHmEn0ZKCcoF4VTnCylW4/9eNU9rL+GkaTnZ/69ZMpVfVBDvyFESe2dlGyUUWurL50yb7RfhvsLmHelzwTtJO+jDc2SwNlM//DTEWr3nn4w+iijQkFYGJd6UqUjQPtQF0oxMmnH7E2odmuduh5shyp5cl+o/e/fkvRYxZ2lOao77ThQY2r8AbVTffhhALOLgVCl6niFbYsKcDfJY4OOMw2Wif+zjTEGclaxpx6QtaG7kW5o6qo0nmPSXS0c6Hf4e2PYYANkmZb+0Ip2ZigitEiLtKa6yZboHl3Ri0fONVJY7T0bI9yetsjD5BvXYaK3xSs6uDMqief1bcK73Ai+TxHGF0qHifYjkq5XXV+uAlQjBhH+DM9mg2OCiH9B8e0b6d8Dr8x/z0puGMwwn+pBUzcbqf1NLQAa45uGlYhaZdZftWJEb2q+mgHv0ELZRD8Dby51DRqp8PTE6qTYUIdCQaROsvnMIb1lAsgy5j8/+dOhK3sYyhyxKssc9VCMkHkn9yQGPmURbpAFqNa8cweq1QytmJ2qZ9zBrhWZ0BdXWsGXQuDRNZ1+j4l7+DyqfBfjoWwTxG0jxVdN2P6cERWLaFoCYOyvkq6ESkwA/6/dkUJ37KTst/2k5lr0FIoWIO5GTPVECjZHDOnh0hw8vuYKI2q92aPzisg/ljhCWpvzDkNj/cbtZg=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5032.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(376014)(7416014)(1800799024)(13003099007)(38070700021)(8096899003)(11063799006)(18002099003)(22082099003)(56012099006)(4143699003)(41080700001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 2
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?DX1srzEZL3c/hFD9D8Yi8guF8lwCe16P+vhzPT5h5B75dj6dmV24Ccq43yNh?=
 =?us-ascii?Q?Qrsa2aLWBDEtRBo74eoH1YXRGF5odKxf74VUZSDSap6RtEa81dtNYomYtc6R?=
 =?us-ascii?Q?NyyLpdLD+fOTJEdTz/j7Gl6GmoX+jIxZ636LAZEKqI6rpE44p8IUTE4Qj05t?=
 =?us-ascii?Q?4BUY3azYkAo4KjpsHZoUggy9E1QqAM16EKA6wRPcOo2CTGlnhB/u8ljv/2il?=
 =?us-ascii?Q?ppvFMCN2MjH4/hUrBdwqRDutrAPt7ERxfYkBHZiI7ZGHn4Jv5rsgW+QbvR37?=
 =?us-ascii?Q?WTjonuvB6HZjomgWKjzWUAFhRZYsJPz6ZbCIPnv879prLUKSZTF/EpsPrN4M?=
 =?us-ascii?Q?OxYKYZZMCAgy0oPqn1Yb/hCZr+hX/vLBiaj3Rii9x0SIjsFumj7YtgAiACwn?=
 =?us-ascii?Q?SpvV2vFSOigDHhUF7smaT8nb/znATHCjck50DvQDZSK/4FsF2IJSdka9fyad?=
 =?us-ascii?Q?C9oYPK9aTfqka432nBo3E8x4GXlbThlVWEikfLcdJsvvMbEUX3WiMNdDoetn?=
 =?us-ascii?Q?/1HD5Pc/XzUybBynst0JPHGA3KwfCtEBmvKiCJS3J1VuqC7dNn2tanyxNZL3?=
 =?us-ascii?Q?NKal9qJJqT/ucNIY3zGeMk7mRnfOVEE0ET+/4+W5OcCRZEyRFhrsMgjktGQ3?=
 =?us-ascii?Q?diTrMW0wAaLt/RE/HD2tXZQgzMOAvWt2aTr35bN9rXkbETUWFseNpGhjDI8H?=
 =?us-ascii?Q?CLWv7rTMNbvQk+wcsMkH+P8T6XtAAwPMEIrd1/4JU0Ipfj2AcJhe379WCkS4?=
 =?us-ascii?Q?nglVI8utsFayLVrK6P9jtGrJrh0YN8dzZkV504OIQsHY3+h5nWMB3XGtgl4a?=
 =?us-ascii?Q?dty8yBdNHaMdQQSr3l9QQrY29cyHTQEymbVXst23nZ/sH7HGTQDPJlYKv4j2?=
 =?us-ascii?Q?97aUsS5LMoCCGi5PHOAHdCpn3Y+dBcyS0FtVgoUh9iAyGjXQKtcvYGWUlpsj?=
 =?us-ascii?Q?Rn6mZOXSjNDTwYRvfZH/r8RPdIiprKlL/sLKT3a+42ByIH+JE93e7stSCzsV?=
 =?us-ascii?Q?V3WTFPxIwlSrVI9vICXRVDMEMFckZamtQr2gvHVYllex5rjCsOdvaeXVWtHk?=
 =?us-ascii?Q?wpNUKX/uIamil0+29DEZEuObIamZPjKh5pQfRd6ZeqIenGAeQg1ff5qIztra?=
 =?us-ascii?Q?vxQxSy3d19i/tVJSBN2E7sYihFLMHwyF5eHvpMyClxWvEU3gw+XgsYam+U7i?=
 =?us-ascii?Q?xVV2Qq0mG45ctYT63sKXDJoQ3Q85C0IMHlY/N8YHVU8RsCPTwaeNGsHcgAn5?=
 =?us-ascii?Q?wfbL9W+6Jw7fc8yy1DaW5buhGBER+oj84GfgSz7e3pZoFw2Jw1IjVesHwZRo?=
 =?us-ascii?Q?C8Xft/7S6K5KlpiPTlANLMYxhY8CxknLLqzmaqe3X1ncxFNAB+oqsT9TTbuD?=
 =?us-ascii?Q?F9hvQXMBKYiVmwYS/N4QT/7L67MnUtkDs1m16RbnujurAgNyMWEBKbjGA7dX?=
 =?us-ascii?Q?tbpRrQ1mhJ0xeEETPhGVHLuCHnzeLmDH9x2U7CEhzFpm2zn+K7Xy4B9AAcMt?=
 =?us-ascii?Q?7CwvJ3EL3TDi8vPMV2Lpb99XsFB7/LIjeH1cn/cHFod/NO0qJL0athJdnLHM?=
 =?us-ascii?Q?UBJysDoKatocANrbjrOKd//DyLHOVnebitGBaqCNTTd53D+SOFMp3I8POpow?=
 =?us-ascii?Q?SKa0rvL37mFn1gK1gN0hhSh9oPrDWgbU/I6gYz6+7WVbZIJ0mWYrSnevJNfn?=
 =?us-ascii?Q?QUBGL0hAUi1XxOXqAs1RKHrq8K2S/vdEMve88MEySDTOXaLXEQv9YZkzcaIl?=
 =?us-ascii?Q?guqzHGKHaJ1KXt3QnreHvXYDII/kIQLWJzaSFQVkUApUZtYzWraKe0IyAKMH?=
x-ms-exchange-antispam-messagedata-1: RrACwBQTAc8cCg==
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5032.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ce47df57-492e-4fb5-2d71-08debe7cb741
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 May 2026 18:53:19.2317 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ajdhmN6sWgZMB2uqQ2ZBXgerMBq755cG16Jj8XXruxTN0ee+/q/JQLKjHHEeKXMh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7465
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8BRxFpnOsBZ5xjOoipHgNp8qOl7lxwtKud3031wT2NM=;
 b=g10D9296ail0ayb1B7GHT2sXYd5ft/ggAO4kI+eJHiMFaHCVKh7mabEei3DwjZWS89m7lpfhEr75WzH8yVvoiKf4+AsS19WVtFcj2kI8WMhQyqNYTG45NezyWbQSCMpLjwgMG098/5QLHhCfUDws50+OOJMIgs4FYv1TX4vPR4g=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=amd.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amd.com header.i=@amd.com header.a=rsa-sha256
 header.s=selector1 header.b=g10D9296
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Subject: Re: [Buildroot] [PATCH v1 1/1] package/gcc-bare-metal: bump to gcc
 16.1.0
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
From: "Frager, Neal via buildroot" <buildroot@buildroot.org>
Reply-To: "Frager, Neal" <neal.frager@amd.com>
Cc: "Erkiaga Elorza, Ibai" <ibai.erkiaga-elorza@amd.com>,
 "luca.ceresoli@bootlin.com" <luca.ceresoli@bootlin.com>,
 "yann.morin@orange.com" <yann.morin@orange.com>,
 "brandon.maier@collins.com" <brandon.maier@collins.com>,
 "ju.o@free.fr" <ju.o@free.fr>,
 "thomas.petazzoni@bootlin.com" <thomas.petazzoni@bootlin.com>,
 "romain.naour@smile.fr" <romain.naour@smile.fr>, "Simek,
 Michal" <michal.simek@amd.com>,
 "romain.naour@gmail.com" <romain.naour@gmail.com>
Content-Type: multipart/mixed; boundary="===============9078060947102936628=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============9078060947102936628==
Content-Language: fr-FR
Content-Type: multipart/alternative;
	boundary="_000_BL1PR12MB50324447B9BBE29AA56E1469F0172BL1PR12MB5032namp_"

--_000_BL1PR12MB50324447B9BBE29AA56E1469F0172BL1PR12MB5032namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

AMD General

Hi Arnout,


>  > Bump gcc-bare-metal to gcc 16.1.0.
>  >
>  > See here for changes:
>  > https://gcc.gnu.org/gcc-16/changes.html <https://gcc.gnu.org/gcc-16/ch=
anges.html>
>  >
>  > Signed-off-by: Neal Frager <neal.frager@amd.com>
>
>  >  We'll have to take care with applying this, because I just applied a =
commit
>> that introduces a patch [1] that has to be reverted. And I can't apply t=
his
>  > commit to master because it should go to next.
>
>  >  Regards,
>  >  Arnout
>
> I will make this easier by making a v2 that removes the added patch
> that is already included with gcc 16.1.0.
>
> This way, you just need to apply the v2 to next.
>  But that doesn't work because the patch is not in next :-)
>  Peter should release Real Soon Now so we'll just apply this after the me=
rge.

That's fine. The patch is only a version bump, so it is not urgent.

The easiest would be to commit v2 to master after Peter merges next.

Best regards,
Neal Frager
AMD

>
>
>
>  > ---
>  >   package/gcc-bare-metal/gcc-bare-metal.hash | 2 +-
>  >   package/gcc-bare-metal/gcc-bare-metal.mk   | 2 +-
>  >   2 files changed, 2 insertions(+), 2 deletions(-)
>  >
>  > diff --git a/package/gcc-bare-metal/gcc-bare-metal.hash b/package/gcc-=
bare-
> metal/gcc-bare-metal.hash
>  > index 19678dec30..6104962a22 100644
>  > --- a/package/gcc-bare-metal/gcc-bare-metal.hash
>  > +++ b/package/gcc-bare-metal/gcc-bare-metal.hash
>  > @@ -1,5 +1,5 @@
>  >   # From https://gcc.gnu.org/pub/gcc/releases/gcc-15.2.0/sha512.sum <h=
ttps://
> gcc.gnu.org/pub/gcc/releases/gcc-15.2.0/sha512.sum>
>  > -sha512
> 89047a2e07bd9da265b507b516ed3635adb17491c7f4f67cf090f0bd5b3fc7f2ee6e4cc40=
08beef7ca884b6b71dffe2bb652b21f01a702e17b468cca2d10b2de  gcc-15.2.0.tar.xz
>  > +sha512
> b3454958891ab47e1e5b6cb9396c0ad3b04f32fe2a7bf1153a143f21013fdb6b295ca94c9=
8964698a688e4c1d7555ffd8ffbc20187507cce6b1c32cbcc09897a  gcc-16.1.0.tar.xz
>  >
>  >   # Locally calculated
>  >   sha256  231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68=
564c
> COPYING
>  > diff --git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-ba=
re-
> metal/gcc-bare-metal.mk
>  > index 6c2c8a5e26..d4f011c2fa 100644
>  > --- a/package/gcc-bare-metal/gcc-bare-metal.mk
>  > +++ b/package/gcc-bare-metal/gcc-bare-metal.mk
>  > @@ -4,7 +4,7 @@
>  >   #
>  >
> #########################################################################=
#######
>  >
>  > -GCC_BARE_METAL_VERSION =3D 15.2.0
>  > +GCC_BARE_METAL_VERSION =3D 16.1.0
>  >   GCC_BARE_METAL_SITE =3D $(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_BARE_METAL_V=
ERSION)
>  >   GCC_BARE_METAL_SOURCE =3D gcc-$(GCC_BARE_METAL_VERSION).tar.xz
>  >
>

--_000_BL1PR12MB50324447B9BBE29AA56E1469F0172BL1PR12MB5032namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body>
<p style=3D"font-family:Calibri;font-size:10pt;color:#0000FF;margin:5pt;fon=
t-style:normal;font-weight:normal;text-decoration:none;" align=3D"Left">
AMD General<br>
</p>
<br>
<div>
<div dir=3D"ltr" style=3D"font-family: Aptos; font-size: 11pt; color: rgb(0=
, 0, 0);">
Hi Arnout,</div>
<div dir=3D"ltr" style=3D"font-family: Aptos; font-size: 11pt; color: rgb(0=
, 0, 0);">
<br>
</div>
<div id=3D"mail-editor-reference-message-container" class=3D"ms-outlook-mob=
ile-reference-message">
<div id=3D"mail-editor-reference-message-container">
<div dir=3D"ltr" class=3D"PlainText" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt; Bump gc=
c-bare-metal to gcc 16.1.0.</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt;</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt; See her=
e for changes:</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt; <a href=
=3D"https://gcc.gnu.org/gcc-16/changes.html">
https://gcc.gnu.org/gcc-16/changes.html</a>&nbsp;&lt;<a href=3D"https://gcc=
.gnu.org/gcc-16/changes.html">https://gcc.gnu.org/gcc-16/changes.html</a>&g=
t;</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt;</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt; Signed-=
off-by: Neal Frager &lt;neal.frager@amd.com&gt;</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt; &nbsp;W=
e'll have to take care with applying this, because I just applied a commit<=
/div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&gt; that introduce=
s a patch [1] that has to be reverted. And I can't apply this</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt; commit =
to master because it should go to next.</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt; &nbsp;R=
egards,</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt; &nbsp;A=
rnout</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt; I will make this e=
asier by making a v2 that removes the added patch</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt; that is already in=
cluded with gcc 16.1.0.</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt; This way, you just=
 need to apply the v2 to next.</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt; &nbsp;But that doe=
sn't work because the patch is not in next :-)</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt; &nbsp;Peter should=
 release Real Soon Now so we'll just apply this after the merge.</div>
<div dir=3D"ltr" class=3D"PlainText" style=3D"font-size: 11pt;"><br>
</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">That's fine. The patch =
is only a version bump, so it is not urgent.</div>
<div dir=3D"ltr" class=3D"PlainText" style=3D"font-size: 11pt;"><br>
</div>
<div dir=3D"ltr" class=3D"PlainText" style=3D"font-size: 11pt; color: rgb(0=
, 0, 0);">The easiest would be to commit v2 to master after Peter merges ne=
xt.</div>
<div dir=3D"ltr" class=3D"PlainText" style=3D"font-size: 11pt;"><span style=
=3D"font-size: 11pt;"><br>
</span></div>
<div dir=3D"ltr" class=3D"PlainText" style=3D"font-size: 11pt;"><span style=
=3D"font-size: 11pt;">Best regards,</span><br>
</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">Neal Frager</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">AMD</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;" dir=3D"ltr"><br>
</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt; ---</di=
v>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt;&nbsp;&n=
bsp; package/gcc-bare-metal/gcc-bare-metal.hash | 2 +-</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt;&nbsp;&n=
bsp; package/gcc-bare-metal/gcc-bare-metal.mk&nbsp;&nbsp; | 2 +-</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt;&nbsp;&n=
bsp; 2 files changed, 2 insertions(+), 2 deletions(-)</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt;</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt; diff --=
git a/package/gcc-bare-metal/gcc-bare-metal.hash b/package/gcc-bare-</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt; metal/gcc-bare-met=
al.hash</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt; index 1=
9678dec30..6104962a22 100644</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt; --- a/p=
ackage/gcc-bare-metal/gcc-bare-metal.hash</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt; +++ b/p=
ackage/gcc-bare-metal/gcc-bare-metal.hash</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt; @@ -1,5=
 +1,5 @@</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt;&nbsp;&n=
bsp; # From <a href=3D"https://gcc.gnu.org/pub/gcc/releases/gcc-15.2.0/sha5=
12.sum">
https://gcc.gnu.org/pub/gcc/releases/gcc-15.2.0/sha512.sum</a>&nbsp;&lt;htt=
ps://</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt; gcc.gnu.org/pub/gc=
c/releases/gcc-15.2.0/sha512.sum&gt;</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt; -sha512=
&nbsp;</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt; 89047a2e07bd9da265=
b507b516ed3635adb17491c7f4f67cf090f0bd5b3fc7f2ee6e4cc4008beef7ca884b6b71dff=
e2bb652b21f01a702e17b468cca2d10b2de&nbsp; gcc-15.2.0.tar.xz</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt; +sha512=
&nbsp;</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt; b3454958891ab47e1e=
5b6cb9396c0ad3b04f32fe2a7bf1153a143f21013fdb6b295ca94c98964698a688e4c1d7555=
ffd8ffbc20187507cce6b1c32cbcc09897a&nbsp; gcc-16.1.0.tar.xz</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt;</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt;&nbsp;&n=
bsp; # Locally calculated</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt;&nbsp;&n=
bsp; sha256&nbsp; 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32=
d68564c&nbsp;</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt; COPYING</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt; diff --=
git a/package/gcc-bare-metal/gcc-bare-metal.mk b/package/gcc-bare-</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt; metal/gcc-bare-met=
al.mk</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt; index 6=
c2c8a5e26..d4f011c2fa 100644</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt; --- a/p=
ackage/gcc-bare-metal/gcc-bare-metal.mk</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt; +++ b/p=
ackage/gcc-bare-metal/gcc-bare-metal.mk</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt; @@ -4,7=
 +4,7 @@</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt;&nbsp;&n=
bsp; #</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt;&nbsp;&n=
bsp;</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt; ##################=
##############################################################</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt;</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt; -GCC_BA=
RE_METAL_VERSION =3D 15.2.0</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt; +GCC_BA=
RE_METAL_VERSION =3D 16.1.0</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt;&nbsp;&n=
bsp; GCC_BARE_METAL_SITE =3D $(BR2_GNU_MIRROR)/gcc/gcc-$(GCC_BARE_METAL_VER=
SION)</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt;&nbsp;&n=
bsp; GCC_BARE_METAL_SOURCE =3D gcc-$(GCC_BARE_METAL_VERSION).tar.xz</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;&nbsp; &gt;</div>
<div class=3D"PlainText" style=3D"font-size: 11pt;">&gt;</div>
</div>
</div>
</div>
</body>
</html>

--_000_BL1PR12MB50324447B9BBE29AA56E1469F0172BL1PR12MB5032namp_--

--===============9078060947102936628==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9078060947102936628==--
