Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E352C433EF
	for <buildroot@archiver.kernel.org>; Fri, 24 Jun 2022 14:22:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13A276146E;
	Fri, 24 Jun 2022 14:22:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13A276146E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3Qyq5BPNyECv; Fri, 24 Jun 2022 14:22:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 31C7C60AEC;
	Fri, 24 Jun 2022 14:22:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 31C7C60AEC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 622051BF40F
 for <buildroot@lists.busybox.net>; Fri, 24 Jun 2022 14:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1419184854
 for <buildroot@lists.busybox.net>; Fri, 24 Jun 2022 14:21:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1419184854
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Pv4gBIg3MKFt for <buildroot@lists.busybox.net>;
 Fri, 24 Jun 2022 14:21:58 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9822484840
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com
 [149.117.87.133])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9822484840
 for <buildroot@buildroot.org>; Fri, 24 Jun 2022 14:21:57 +0000 (UTC)
Received: from mailhost.synopsys.com (us03-mailhost2.synopsys.com [10.4.17.18])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
 by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id 6C585C3CC8;
 Fri, 24 Jun 2022 14:21:53 +0000 (UTC)
Received: from o365relay-in.synopsys.com (sv2-o365relay3.synopsys.com
 [10.202.1.139])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client CN "o365relay-in.synopsys.com",
 Issuer "Entrust Certification Authority - L1K" (verified OK))
 by mailhost.synopsys.com (Postfix) with ESMTPS id 475DAA0087;
 Fri, 24 Jun 2022 14:21:51 +0000 (UTC)
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2106.outbound.protection.outlook.com [104.47.70.106])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (Client CN "mail.protection.outlook.com",
 Issuer "DigiCert Cloud Services CA-1" (verified OK))
 by o365relay-in.synopsys.com (Postfix) with ESMTPS id 0295640067;
 Fri, 24 Jun 2022 14:21:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bN6UN93eG0RTcKM89EkSyiK1DnWMLinZtXX+vYP83ZnQ78E+795x9zWHzfHPlMCp/hPl4VA0xLask0nQVrZq+WAXlR3CUJm1FReq+o+VzT8F1YUtyXC2wUQ498T3LIXRkFl7aS1BbrLWkKM8xiSOggVPPkcOxFCSAruWHjNxKvokeMkBSLaEHYt45+BU4T72HAtkpomeDXgMinNVlk7JlJ7BWbEtrvIsLNA0C/dpxiwYLt4tXwT8IQ1ey3zGYUaQEcOKq5wZ3siHAQBDIz/PSDArQ/TLAj3JO47kGzvOBOUpzO5FpNih+pCRdfcqEoYxACPyG+3XlA1LJYXpKj6/Ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U+Kuv7L11Z49bdyFKfHV4qyI0VuZvgP9OhgCQbrZQis=;
 b=TcYWYeLhzFBWt1sIc/gBJjPQcQRvQ67lYjKcwNoTnhdweJoPhWSUQ+kkwlQjVlXcWBuPgcd+vTTmPMzqGNBweDjx8Dr0ZynUQZgzluFbFalYNzY4K7hUAPeM/4MTpDQvJ4kybSuThw+bDsy3LDLkCdnYQFBsQApMWS4/D9/P3fBW7HDQGhZ0jYTUwef6BOyOVSShuf50AL/JdCKFdqkjnDPOo1jPO3Vbmk0lworqonYRUamN7mrum9YG4QojcT+5BY9+JU/jsrJlYizzponwiQc2DCNbl6p63wtv2cnlw+2y/5SlGPzqExIx09hn0UrIUXaN+6Vml5p/PsiyenChsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=synopsys.com; dmarc=pass action=none header.from=synopsys.com;
 dkim=pass header.d=synopsys.com; arc=none
Received: from SN6PR12MB2782.namprd12.prod.outlook.com (2603:10b6:805:73::19)
 by BYAPR12MB3590.namprd12.prod.outlook.com (2603:10b6:a03:ae::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.20; Fri, 24 Jun
 2022 14:21:47 +0000
Received: from SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::8531:7f90:c11f:2fb4]) by SN6PR12MB2782.namprd12.prod.outlook.com
 ([fe80::8531:7f90:c11f:2fb4%7]) with mapi id 15.20.5353.022; Fri, 24 Jun 2022
 14:21:47 +0000
X-SNPS-Relay: synopsys.com
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH v4 1/1] package/bpftool: revert bpf_cookie
 patch to allow building
Thread-Index: AQHYgKa1M48yKL+fGECWDKsB+ehK1K1eqiuA
Date: Fri, 24 Jun 2022 14:21:47 +0000
Message-ID: <4a2b6823-8a43-4c51-702b-d3fc1058d3ef@synopsys.com>
References: <97ea44bb-58fe-d6cb-6c79-9be0b245f2c6@synopsys.com>
 <29d2a8c7-44cd-da42-5fed-f17ec0f8ccf2@synopsys.com>
In-Reply-To: <29d2a8c7-44cd-da42-5fed-f17ec0f8ccf2@synopsys.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: bebccffd-16b9-48b8-2b01-08da55ecdf34
x-ms-traffictypediagnostic: BYAPR12MB3590:EE_
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MOZgYwJaya7A3ISv3pZDMioeI4cjyvU51xjjWpx2Uo7VPslQkoTSyPGckUi2pLWlEwOcAOlTrGG9VXfWMnCM/gOIo/e+3zXxYJoUI7hCsadpQPJodysaFALDRGGdHmYaYN23AOdCr0n9JWrZwoqYUwRgl+vS12FjKjvIRq2Yr2fmIUTDtvJVWoVVx6XCMfo7L4PdwmUKKf26IpBh2YSlbhPTsO/mkibbO2HMqJGIqBNAhILTOvc+gInFMNRsoA2C88GTEhYTDY3MTxqM+QeJ+pfAXcof7Ct87BZFbDzx5AGLJuvDDDWLi8cLAg0xhLqh/O6fx6t0jx900F2RqQkaHP15DV3gSK6E0+6U0rqQ1P8GSsCce255P3SCkG+2Nh5SV6U+55zCikQu/RKmKFmny1NLNVSi+1g/LTLc3KCBWdJOP2h9fYUbHg4zgRVhUQuLlhqA/ffkni9pQdwZP/idY3cn2tnilsOpt9kdXtz9asSZ7AWTWEcx+ejgGXM6FGyHVjxmKGOB7AtaFEIeSvV4cSWlkNPDb7r9zhnJWIpnFlIOF+HVxPf9iYEiEgS2R7ml
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB2782.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(376002)(39860400002)(366004)(396003)(136003)(346002)(31686004)(122000001)(6486002)(66556008)(8676002)(54906003)(478600001)(4326008)(6506007)(2906002)(186003)(8936002)(71200400001)(26005)(38070700005)(6916009)(2616005)(86362001)(38100700002)(36756003)(19618925003)(41300700001)(316002)(66446008)(91956017)(66946007)(64756008)(76116006)(6512007)(558084003)(66476007)(31696002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZFVuV1FKamtRVkd4dUZSVG83SHNTcExDOCs3WWlZTWh5WE9PM1hNVmpJK09s?=
 =?utf-8?B?TGd4REFobjhnaTJzOUhldlFlVVlUYk1jZzRYVUZnejlkbk5BTGFUWTRraG9B?=
 =?utf-8?B?SUxpT2tuNW9DVEFJTjFkblpTRzlET2RER2JUQTM4WS8wcElXV0RPSytUYi9B?=
 =?utf-8?B?R29wUWFvOVdFTElTN2U0YkVIUlJBSlVLeVdOK0c1ZmpLbmF6Mzg2S216UFNU?=
 =?utf-8?B?QVFwckw4TXBGQTV6RExaazdjUERmTFNIeE9NMWNGd0xBUUxUdXdXQ25ZYTBq?=
 =?utf-8?B?UDhvd09KekJXbG5JUUgzNDhkV3ZqVFdKcHFPVXJCV0hHTWJBYUZCSnl6b1NW?=
 =?utf-8?B?Sm1qZ21sa0dSWlorZ21nNlVLQUhEUkhvZVhoNE9xREFXR0VNNXZSSXN3T1Fi?=
 =?utf-8?B?N2hMQkp4bTNZSHdncEJYMVpOdGZDV0VoSW93Y3I4R250Y1cxSlJGVGxvTVY2?=
 =?utf-8?B?TGNPOGJwTTUzV2pCMm1teXhmeVFkTjRNSkVWelVMMGxJT3I4TTJjQk5iK0VS?=
 =?utf-8?B?NUs0bUozeE1hVXpPc2FIVE1jSk9RdGVxNklpRFRYNGV5ZlRGVUxTYlUzR3B6?=
 =?utf-8?B?eE52eFFpbzY0T0l5Q1c5SlZVUGVlM1RUWit6Z1ptMmdWd1Vsek5sN3hVS2pG?=
 =?utf-8?B?bWNweVBEakV6RS9xVmcrWDJ2SXRVMFBFTkFTTW10YTFid09Ga2ZaYWpnL01X?=
 =?utf-8?B?eDhsVktYYUR3Z3B0OGpSL2FOMnRlU3hQV1NYR1pib0pWb212M1JwNlU1cWRs?=
 =?utf-8?B?aXZkblRXeGRYQnErQ01YT2xkaVdOQXBTNmRndjJwTDZEd1JkTVl2M2JaYStv?=
 =?utf-8?B?dlhOR0cxa1I5aDNLTUJ2aXVVL2NxK0N4VzJ4Zmt4VzJjSjBQOHRQWGdSL2ln?=
 =?utf-8?B?dGF4VW1JWVJ3R0hxV3BWR2lYbGNXYmw0RGpuc29rbUdneHNBTzBIZmZwaDY0?=
 =?utf-8?B?SHc0UFV5dytzUmxqbmZnTXM1RTNFRHl4N1NnbjFtS1ZwUXpYSW9CNSs4S1Az?=
 =?utf-8?B?SThZa3J5OTdUeFVWbllxcTFiZzA1OGlUS0dYZnNkVk9hTWVZa3Z6SmhQVU9B?=
 =?utf-8?B?YjVrUGZSQzZqbDFLaVJTUFdMWEI3TWhNMXVZWHB6OXhYWXdBWHVpeFpSSlhw?=
 =?utf-8?B?Z09iRExUQ0pISmJlSTJmQ1JHUi9ITzIxdVRGc1ZHaXdreTcwaUZBaVAwUWFx?=
 =?utf-8?B?aWh6NDVydnpyOHc5Zml5bnlRNm5QSTBjTFcwcTZoUVhMZldOdm1zNDB6TGV3?=
 =?utf-8?B?d2pFSHRNeWR5eXVON2pKTzJ0M2tsYkcwRkRtYjJkZU9MTFhGM1RqbjEySC8z?=
 =?utf-8?B?b1JreG9qbEJMRXJWNWpmTVFtZHM2Y2dtbXp0RDVmQkRNcVZkN2tUaFVzZjhw?=
 =?utf-8?B?Wks0WHozSHgwRHdSdWRQRlc0dnhBUXVlQ2J2cWp2Q01uNVlDMjVJMzAvQVNU?=
 =?utf-8?B?eGpyZWNKMW13Q2pHNlM0MXlSNDlIalhhUmQwc1JXaEJaNWRDdnRqUUVWYWpG?=
 =?utf-8?B?WUJWbkY4TmNpVU5uenBOYkt0aG5yYnpiYU1xNlh6eGFWL1NwZnhEN1l2RDhu?=
 =?utf-8?B?aDRZQkoxVHZXQU5rUG9DSHR0UDZXOUNDVFdLQ2xBeHUxSUZNcXQxNWJ6Wk1n?=
 =?utf-8?B?RU9iRmF4R05xNGhXdzZiQ1A1RmltR0RvU1ZEVnBkZ0VEYXcxV2dEMDkrL0Nz?=
 =?utf-8?B?QUsvdUN1b0FDU2tPUEZ2dkt1VjJiaXhoU2RYajZXZmZOclNFUnNOUXRRdmZR?=
 =?utf-8?B?VGVGYU1NMy9SM1F3ZTNmZHJCS1IwUk96OUEwcm9YZmlsRjByRE1lS05UQ2pv?=
 =?utf-8?B?K2g3TXQ1WlRPVDQ3eXFScHhxSjJVUnZvTnRNczc0WXA0cmdvRGdWSlFPTFVF?=
 =?utf-8?B?SHNQQzdoUnRaZlMzSm9RcHFxYkZGL2FqMjJoQWtmNkxGQ01iVDJRcHZsVGFM?=
 =?utf-8?B?dERmeWtrVGRmeXBheS9iQThrN085QWpMMndESnJHVk56MHpFVm9qSHNZMHlj?=
 =?utf-8?B?NURHOE8zZ1FnY0tJL1RFMmRrc1RxWGlDUlJRR2VYVmV3T3J0enhQWlZGbFVL?=
 =?utf-8?B?RXByTzMxWU4wa1V0a0JoS1dKeklSRFBocThOUDVFU0Y0Sno0VVdQS3RsRDJ2?=
 =?utf-8?Q?zS27xVi43W4CKIH90kXLd5XY8?=
Content-ID: <1876AE9C75BE984A9A04F60213A25F6D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: synopsys.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB2782.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bebccffd-16b9-48b8-2b01-08da55ecdf34
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jun 2022 14:21:47.1258 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: c33c9f88-1eb7-4099-9700-16013fd9e8aa
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CBU0a5bYWxo/sev6ulgUwuSiXF8MxDA72VmYI4g/1x9ldDpJw2KRF6dJN+ZVExuYXp0eDrtD/p8gjpwTqNby+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3590
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=synopsys.com; s=mail; 
 t=1656080516; bh=U+Kuv7L11Z49bdyFKfHV4qyI0VuZvgP9OhgCQbrZQis=;
 h=From:To:CC:Subject:Date:References:In-Reply-To:From;
 b=M5WqJB3AxpPFQdU5i3LTJ2zs/t4xvtqAsVEGcKagwY8qgkWtJb7aDto6dFSppLcji
 Um/ACKIzzHyYCHjOemwIyHxSzEwOOkX6fxnsM50VS1q3jNWaOkCxEQZL4f2Lu8qmhQ
 QwPmp5LkMJ/ttdUES9YPABT6iKUNLJjlWtJo9I4sKX4Lf3wbP7DZyqlf0n15KR+XIM
 eswp4lheZpUgIKE3oGDt/zZ6sjJUiGX144GLXRXwcGsvqD59XzKpwWWeE9JDxXZkye
 0JEa7W6mWO2qFOLW/YImkMYmgr2HW1zPUnQKLT60pWuYxmVjqcSbe5JG6ks6mgm62S
 LYh5F164jX79g==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=synopsys.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U+Kuv7L11Z49bdyFKfHV4qyI0VuZvgP9OhgCQbrZQis=;
 b=vsMsD2HeSqfzSto40YDvJJjHEEU1buNXarb4vMOm4duN9BmNULo2+Yai9yX9tao2sGDYEM09nlP3qNu4vog8XJgDUb5QSF0SrZwCTPNFPntEDvhaXGUIqqrNSepbBGfvqk0SD3Ts5e4NQKJJR1B5PowLeC9daTBi2q5tCTEyYk4=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=synopsys.com header.i=@synopsys.com
 header.a=rsa-sha256 header.s=mail header.b=M5WqJB3A; 
 dkim=fail reason="signature verification failed" (1024-bit key,
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.a=rsa-sha256
 header.s=selector1 header.b=vsMsD2He
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dmarc=pass (p=reject dis=none)
 header.from=synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com; spf=pass
 smtp.mailfrom=shahab@synopsys.com
X-Mailman-Original-Authentication-Results: o365relay-in.synopsys.com;
 dkim=pass (1024-bit key;
 unprotected) header.d=synopsys.com header.i=@synopsys.com header.b="vsMsD2He";
 dkim-atps=neutral
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=synopsys.com;
Subject: Re: [Buildroot] [PATCH v4 1/1] package/bpftool: revert bpf_cookie
 patch to allow building
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
From: Shahab Vahedi via buildroot <buildroot@buildroot.org>
Reply-To: Shahab Vahedi <Shahab.Vahedi@synopsys.com>
Cc: "linux-snps-arc@lists.infradead.org" <linux-snps-arc@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

ping!
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
