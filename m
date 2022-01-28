Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED2AFC433EF
	for <buildroot@archiver.kernel.org>; Fri, 28 Jan 2022 16:45:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C8FC40327;
	Fri, 28 Jan 2022 16:45:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Q6opVn56ZM55; Fri, 28 Jan 2022 16:45:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0B7AE40535;
	Fri, 28 Jan 2022 16:45:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D76361BF276
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 16:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C494240439
 for <buildroot@lists.busybox.net>; Fri, 28 Jan 2022 16:45:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i7EBBuRsY9np for <buildroot@lists.busybox.net>;
 Fri, 28 Jan 2022 16:45:00 +0000 (UTC)
X-Greylist: delayed 00:19:44 by SQLgrey-1.8.0
Received: from mx0c-0054df01.pphosted.com (mx0c-0054df01.pphosted.com
 [67.231.159.91])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E686540499
 for <buildroot@buildroot.org>; Fri, 28 Jan 2022 16:44:59 +0000 (UTC)
Received: from pps.filterd (m0208999.ppops.net [127.0.0.1])
 by mx0c-0054df01.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 20SCX6MN031588;
 Fri, 28 Jan 2022 11:25:14 -0500
Received: from can01-qb1-obe.outbound.protection.outlook.com
 (mail-qb1can01lp2051.outbound.protection.outlook.com [104.47.60.51])
 by mx0c-0054df01.pphosted.com (PPS) with ESMTPS id 3duu8krxby-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 28 Jan 2022 11:25:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NzHaSipIVnK+bJlML72RB5AwyFScR/K9INTcA1ydadIMjLJdiRAuW9H6OiWEErYmJrlGykIAxHOo9g1+YVktWHFTpc9VVS2gLYSR+aQFMSJLhNXFZk4OI95D2w6l7ONBP4FkfVy2h4Soz0EFVcnamXq0ADBwX7aGUsgtwcgGtKjUhk5duAyPSMfc7AF+y8PIpd/0VIHVifIYMeOH1F7bRY4K8Z/QkC0X1IpfjcqPyKkD5FdnAGZb9j+hRogtZtESAZy/Jjpz96OW8jQ7cXz0s5D7rZmrbc50Yj/o/vpnh/ALfZD1s66WzIxV/ZmGL9z3qRAH00t54jKP4Hz1udr8OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zo31e3tbtVZkjT3sM4nmpCCwXWs0M82PNk8gS55FzuA=;
 b=jXjJUESEsdCLnFwLcpWCorc1nw94dppNjfetPZI2aN8BkGuaOW28GuSNuhwXUa3NX1RQPe+9y7jRWVr4HjmBtUhkceTbqVXEBTk3n6NRvXeAKTj/VxBRo21PgbF45MBEAzkuepfRkueKwTU2J9e0pp5YOfeDxt4ddmGTtDITNO+d/Xy2GEpeDW3ORl/13qsRxReq/oaIJSlpFV7zY+xLt35Bm/rP97B3YTDoYUMuYEat/j4YP+pb2a5VT1bIQFZ5mEw81kbKCRg4bNNnLH4HpXIEwxnpDEOBphI58gnxHWMlwsfyyBCIyemD7hS1l0TAPmTBmSyEH7jg0/09KkN//A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=calian.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zo31e3tbtVZkjT3sM4nmpCCwXWs0M82PNk8gS55FzuA=;
 b=YmV3P0aRwhXGdRRkUSXdzZtHBhZlLFyVukkQ4vDKXhIZSa7jV9o4NbLegxtk+6Q4oj4qvCIffsi+8PKThzwTSb8Al2YmdBVyLKroGG0GqWJLOFgcp+toO4WBsibuLKgLxczKB6h/qQBb0HWZkxi8bEv53tAPjEJF5AGPrrH0988=
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:6a::19)
 by YTBPR01MB2704.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:18::30)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.19; Fri, 28 Jan
 2022 16:25:12 +0000
Received: from YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8]) by YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
 ([fe80::6929:c39f:d893:b6c8%2]) with mapi id 15.20.4888.020; Fri, 28 Jan 2022
 16:25:12 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>, "universeiii@gmx.de"
 <universeiii@gmx.de>
Thread-Topic: [Buildroot] [PATCH] boot/arm-trusted-firmware: add config option
 for custom patches
Thread-Index: AQHYFFayw/w4jT90hUSTEGUS/48MFax4npCA
Date: Fri, 28 Jan 2022 16:25:12 +0000
Message-ID: <24f645845a855b039cfa19432c2417e9cedce104.camel@calian.com>
References: <20220128145103.3422-1-universeiii@gmx.de>
In-Reply-To: <20220128145103.3422-1-universeiii@gmx.de>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Evolution 3.28.5 (3.28.5-18.el8) 
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6d17fb71-11ed-405e-af00-08d9e27ac296
x-ms-traffictypediagnostic: YTBPR01MB2704:EE_
x-microsoft-antispam-prvs: <YTBPR01MB27043319C319F8127DB00846EC229@YTBPR01MB2704.CANPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ad91TOHqaqWsW5+Ajc4t1NWfEtvTRVUBTM+XOeyOBII9Txk3ZlymiToKjKyhRRS0LY4UoNZJB1+Q4YL8Js8nWlgESuyMv2e2BLQ5cE1bz/mANYKDR82zzZ7Ktxa7tZ9oFPQGHr66q0q0A44tyhDRLPLZrQo84U7ZxpiKjvclOK4Uf3vpPBAS2IrTX1fLBwEAsjXcMr7jYm40wXhlINn0QZJrk8BgGlZVFKbZAuNS5GxZ819yta5yE7juPajkemieFePiuxkkzPCLwB6QKUk8KJ6nNhY/ZltQ2D2d9+gaTzOaagiMunn/Fiy7DKEOYa1q7Ypig/nx8mM97LJ+k/u7DijmHBTJq7Rfh9t/j88hTUqte0o7KXln4ubTjf4W3tRd7FSPnjYVohwJJbZlcVrtYTg8e2lUMVa2x5Y3SEy0PZu0LoJTU3Scn9jMpurZEoZmL7RsTqINXhM5CB0ogc9fa8teqDDPcp11JYyTfK7OY0S7sTs6TrVpak+QxQ35txLWD7SKfEWskXNuCg56C3tOpCEkofzwqQqD98lr2OOWHVEdcD5cnDKibYmhIstO7FTp3Kok5oTPjZjTZ3lAzs0KbmHIS244y2GTStzqXIflPmNOIVPQmNKldxdHRoLiIkcgRAY4eEM5Y32Lu1E7ytosV2NX+uemlwBd1IGInPp+6VAV/iJLLV6qWrYH3GJIasuikLKemIEaY8jhIPw8u59q6lVxFwKfcaCzIU/42ZYmlh9n4DbgqyGNOnQgthg5vbhDrb4BlqRZNadD871SVbe5XbjZ8yn3XdFoqi41mYtCUaWStScuErKPF9/KBOeYke/AsPBDg/AdvjlSWUf4qAuKUIJ/pXaLywjHdWbtR7J+gAs=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(2906002)(6506007)(2616005)(966005)(6486002)(26005)(186003)(86362001)(508600001)(83380400001)(38070700005)(76116006)(38100700002)(66476007)(66556008)(8676002)(66446008)(8936002)(91956017)(36756003)(66946007)(44832011)(64756008)(5660300002)(122000001)(316002)(110136005)(71200400001)(99106002)(20210929001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aDhUMjJQWHdSQUFRWjZUWHJrZTdFY2NtMmwxWi9TczViTWFTVmduSkpHRXAw?=
 =?utf-8?B?bXFpNy9yL2E1TTV1WDJBekF1VUtRYUVzaHVKNlRQbmxVd0dVM3IyaFY3K3Bh?=
 =?utf-8?B?MWs2VEFkdHV5VmhFbFVTV1had1h3MXRybDAzUFd6bGJMaWhDYVlpOXVDSytK?=
 =?utf-8?B?VVJJbi9Ib3JPdGF1TXhqejlyK09JM0RBRFA4L0FYdFVodXluRnBNWnlzL2VP?=
 =?utf-8?B?eXF4R0VPdTNBTkFSeC8vRjNpaTdKVFlYemR2ZEQvbHNDK2Y3RTUzamh6RDBP?=
 =?utf-8?B?dEMza29uZ0YwMjErNi9GdXFHbUpKNjBoazQ5VHpYUUREMGZSVzVObDNaMllt?=
 =?utf-8?B?V2RwNi9kQXl5TmNpWlBwNXhObldrVVQ0dHd6eXN6T3BORnpseFgvOG9FSENh?=
 =?utf-8?B?UkROc05qTVhSazAzS21BZDNmc2oraDdSVTB4TW5vM1VOSkVvb1V6MjVBVkM3?=
 =?utf-8?B?S3dNMnp4eDBvbkFaSHU5N1pCTlY1OXVqZVczQ0dsbloxWUNJRmV4OUg4TUhq?=
 =?utf-8?B?VlRVMmd0NzJFQSt4c2N3bFk3NWhXOVZ2WVgrSlBTeG1qK0Q1RjNaemFmeGZh?=
 =?utf-8?B?WkExL2hxeENPTStteS8vanM4S0V2aFYwYjFjd3JjN1pRM3YvVVIvTVcvYm5T?=
 =?utf-8?B?Q0prTjk2MUw3cWZDYUN0SUJjS1czV1UrVUt5RnJkYnBOUjFrN2laaHNwSG9u?=
 =?utf-8?B?WHJseWErVFBseXFqcVJXU2tMZEQwVkpQNVgzRTBZaEdWNDVpR0hUS0tjeXlN?=
 =?utf-8?B?blVBVGRjUHV0MXRlemo3REZmU2Y4WnB5R05JeGZBdkkyU0MzRDFYV1hYT05L?=
 =?utf-8?B?ODRUeG1tdzhkZlh4di80elNPTElxSlJ5aENxMW9OV0szeDVJRGFLc3FtZFN2?=
 =?utf-8?B?UDFHd1BTaHhGMGM5b1E5eERrMmxqaFVhZDJoQ1U4ZFFSbHp2V040d0VSekZo?=
 =?utf-8?B?NEVoUEJMTThYYm12NExpMTBja0NVemVzWFpmenI5blJrb2tORzZ6OG1jaEhU?=
 =?utf-8?B?RXhSMFJnSDU1MGozNkpQNUN2Ym11Ykd6V3hYTGJJZ2RmSVFvbjUvNVgxdG9M?=
 =?utf-8?B?TmhoQ3R3eWk4WTViMEtRbHMzcEFzUWJqSlovaWx6ZEt6blNDdTE3NDJ5QmQ5?=
 =?utf-8?B?WlR4bjd3V2d5V25JY0toNWRFZEl2aldjZFRRNTdpNEdaajdUQnZVNjQzd2w5?=
 =?utf-8?B?a3E0V1BoN0pMQXNreUdKais3OG1MUDYweWlsZTR5ZHgyc1F6RkJEaEFpN2VC?=
 =?utf-8?B?UFBUdlByemR6RFhBNjJ4azRCRVJOUjdQUkwzQjV6NkNsQ1Z0ayt2U0h3UE5M?=
 =?utf-8?B?L2c5bE4xdG00TU1jbm1BZ09tUEdOMVZ6QXNiN2lFZ0xSQ29VUm1RZ1A0bnNy?=
 =?utf-8?B?U09rRktTYjNPWWx4eklVWE12eUxKMm4xVWN6a1lJcWoyWUZnOTRSVHFIcjZ4?=
 =?utf-8?B?WVhEbGt1NVpDekhKL29CeFg1TFJTRTNXU2VwNk5sL1VYeDRuNVR4N244eVVD?=
 =?utf-8?B?YXBPZUxaNW1ZYjBzMGFjWjh4VDYzVUNKYkp2V2w2OGN2UHhCejYxZGZReFhF?=
 =?utf-8?B?d3o4NUVQM3BzL01PMy9mMmZmNUJhYlVqNkgxYUk2OTVVTUFpcHg4dUVNeGxF?=
 =?utf-8?B?L0ZBQ0dGZmtwMHFpNXd2Q0JsUEJVVDczd1YwZ2xBUHlDc2xxSzdNVWRQSGxH?=
 =?utf-8?B?cjZFWEV4ek9EUU5kRkZ6MmN4R3c4SVZLcm8rbC8wTFI5T3ZMMG9Zd1MxRHUv?=
 =?utf-8?B?MjVldFIxRGxFZUtzVXYzdGp0b1d2K2c3L2dkcUtPSUFrblhPYTFJTXRVVGJh?=
 =?utf-8?B?bmlBL2FqSjFqMjBabWM2dURuTXNNTlNXQ0d6d0lnc2trSWxwTnpUUFppQjQ3?=
 =?utf-8?B?V0phcHhCR0xwYnNVZEhIcWdJS3ZXRnNCSGp4MHc3c0hBaDR0UVkrN05KSjdi?=
 =?utf-8?B?U0o2OGVnRHFzMWZBVnlJNkhCZ0VoTU4zRGlvTUk3UTEvVVppdUg0WitobTdP?=
 =?utf-8?B?MEc1RGxnQXhPSTBlZTlsNWEvN0l4c3NhellScXRpMEJyaGthL21HSEcwWEdy?=
 =?utf-8?B?Y25SVDJPMmZFTkdtOVVtaGRhM1FBaDdIR2c3R1JYL2VHc3JjRFJQS2FVN2Ny?=
 =?utf-8?B?M2FETVpTeTlCcFJoRmJ5VkhraXVKSE96MzJHK01ONm5jd00wR2tYSjVaQjVw?=
 =?utf-8?B?NFh1dGZ5Q3BwSS9nbmhZZnE0azUwWThLN0pnUnhYNlg2cHJaSVhoTDBzU2Mz?=
 =?utf-8?Q?bGHSWrdfewGuLEhwX60r9z6d87Hpw61yoURyjyyTCI=3D?=
Content-ID: <BB37689142F2804AA884A6DBAF016C49@CANPRD01.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: calian.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: YT3PR01MB6274.CANPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d17fb71-11ed-405e-af00-08d9e27ac296
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jan 2022 16:25:12.7397 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 23b57807-562f-49ad-92c4-3bb0f07a1fdf
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: UAEJbwBXMpf4VlT79QP76JcPS5JBqST1LGo8dxkGtdE3uD2Y40kF5VSVPOOugUDy9Iu/L8InqS3tsHCg7zIuZdu/SQehR4T/H8lVGvt1aL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: YTBPR01MB2704
X-Proofpoint-GUID: CFVU4lEvLpoaXCVvo08qvU1CgAYDCdEJ
X-Proofpoint-ORIG-GUID: CFVU4lEvLpoaXCVvo08qvU1CgAYDCdEJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-28_05,2022-01-28_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1011
 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=999 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201280102
Subject: Re: [Buildroot] [PATCH] boot/arm-trusted-firmware: add config
 option for custom patches
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
From: Robert Hancock via buildroot <buildroot@buildroot.org>
Reply-To: Robert Hancock <robert.hancock@calian.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 2022-01-28 at 15:51 +0100, Andreas Ehmanns wrote:
> Many embedded board manufacturer provide their BSP as patches to
> linux kernel and u-boot. They can simply be applied by setting the
> corresponding buildroot config (custom patches).
> Nowadays patches for the arm trusted firmware (ATF) are also part of
> BSP deliveries but there is no config option in buildroot for ATF
> to apply custom patches.
> This patch adds (similar to linux kernel and u-boot) an option to
> apply custom patches to ATF.

Hi Andreas,

You shouldn't need a custom option to add patches for each package. If you add
patches to $(BR2_EXTERNAL)/patches/arm-trusted-firmware then they will get
applied automatically, we are using this mechanism already.

I think the specific patch options for the kernel and U-Boot may predate that
mechanism but don't need to be used anymore either.

> 
> Signed-off-by: Andreas Ehmanns <universeiii@gmx.de>
> ---
>  boot/arm-trusted-firmware/Config.in           |  8 +++++++
>  .../arm-trusted-firmware.mk                   | 21 +++++++++++++++++++
>  2 files changed, 29 insertions(+)
> 
> diff --git a/boot/arm-trusted-firmware/Config.in b/boot/arm-trusted-
> firmware/Config.in
> index b1fc03e10b..786a3083a2 100644
> --- a/boot/arm-trusted-firmware/Config.in
> +++ b/boot/arm-trusted-firmware/Config.in
> @@ -63,6 +63,14 @@ config BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_REPO_VERSION
> 
>  endif
> 
> +config BR2_TARGET_ARM_TRUSTED_FIRMWARE_PATCH
> +	string "Custom ATF patches"
> +	help
> +	  A space-separated list of patches to apply to ATF.
> +	  Each patch can be described as an URL, a local file path,
> +	  or a directory. In the case of a directory, all files
> +	  matching *.patch in the directory will be applied.
> +
>  config BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM
>  	string "ATF platform"
>  	help
> diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-
> trusted-firmware/arm-trusted-firmware.mk
> index 03fa83b7b5..d329bdbfc3 100644
> --- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> +++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
> @@ -29,6 +29,27 @@ ifeq
> ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE)$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_LATEST
>  BR_NO_CHECK_HASH_FOR += $(ARM_TRUSTED_FIRMWARE_SOURCE)
>  endif
> 
> +# Analogous code exists in linux/linux.mk. Basically, the generic
> +# package infrastructure handles downloading and applying remote
> +# patches. Local patches are handled depending on whether they are
> +# directories or files.
> +ARM_TRUSTED_FIRMWARE_PATCHES = $(call
> qstrip,$(BR2_TARGET_ARM_TRUSTED_FIRMWARE_PATCH))
> +ARM_TRUSTED_FIRMWARE_PATCH = $(filter 
> https://urldefense.com/v3/__ftp://*__;JQ!!IOGos0k!zefK7OglGeltoASai_ZVP128fh66I9s3_Ij-rcq9bSBMIxBB8jTXDxe6jH78mYZP6cg$
>   https://urldefense.com/v3/__http://*__;JQ!!IOGos0k!zefK7OglGeltoASai_ZVP128
> fh66I9s3_Ij-
> rcq9bSBMIxBB8jTXDxe6jH78b3MIP3A$  https://urldefense.com/v3/__https://*,$(ARM
> _TRUSTED_FIRMWARE_PATCHES)__;JQ!!IOGos0k!zefK7OglGeltoASai_ZVP128fh66I9s3_Ij-
> rcq9bSBMIxBB8jTXDxe6jH78N2PO7_g$ )
> +
> +define ARM_TRUSTED_FIRMWARE_APPLY_LOCAL_PATCHES
> +	for p in $(filter-out 
> https://urldefense.com/v3/__ftp://*__;JQ!!IOGos0k!zefK7OglGeltoASai_ZVP128fh66I9s3_Ij-rcq9bSBMIxBB8jTXDxe6jH78mYZP6cg$
>   https://urldefense.com/v3/__http://*__;JQ!!IOGos0k!zefK7OglGeltoASai_ZVP128
> fh66I9s3_Ij-
> rcq9bSBMIxBB8jTXDxe6jH78b3MIP3A$  https://urldefense.com/v3/__https://*,$(ARM
> _TRUSTED_FIRMWARE_PATCHES)__;JQ!!IOGos0k!zefK7OglGeltoASai_ZVP128fh66I9s3_Ij-
> rcq9bSBMIxBB8jTXDxe6jH78N2PO7_g$ ) ; do \
> +		if test -d $$p ; then \
> +			$(APPLY_PATCHES) $(@D) $$p \*.patch || exit 1 ; \
> +		else \
> +			$(APPLY_PATCHES) $(@D) `dirname $$p` `basename $$p` ||
> exit 1; \
> +		fi \
> +	done
> +endef
> +ARM_TRUSTED_FIRMWARE_POST_PATCH_HOOKS +=
> ARM_TRUSTED_FIRMWARE_APPLY_LOCAL_PATCHES
> +
> +# We have no way to know the hashes for user-supplied patches.
> +BR_NO_CHECK_HASH_FOR += $(notdir $(ARM_TRUSTED_FIRMWARE_PATCHES))
> +
>  ARM_TRUSTED_FIRMWARE_INSTALL_IMAGES = YES
> 
>  ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_NEEDS_DTC),y)
> --
> 2.26.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://urldefense.com/v3/__https://lists.buildroot.org/mailman/listinfo/buildroot__;!!IOGos0k!zefK7OglGeltoASai_ZVP128fh66I9s3_Ij-rcq9bSBMIxBB8jTXDxe6jH78CXtWZJI$ 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
