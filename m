Return-Path: <SRS0=F6DF=PN=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 839BAC433EF
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 09:06:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1AF660EE9
	for <buildroot@archiver.kernel.org>; Mon, 25 Oct 2021 09:06:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C1AF660EE9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=robotize.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68FB980CD3;
	Mon, 25 Oct 2021 09:06:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id z1zlBCWLiZl2; Mon, 25 Oct 2021 09:06:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7425F80CD5;
	Mon, 25 Oct 2021 09:06:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1831D1BF3D6
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 09:06:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 06B91403AB
 for <buildroot@lists.busybox.net>; Mon, 25 Oct 2021 09:06:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=robotizedk.onmicrosoft.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8OqNiEV7GojW for <buildroot@lists.busybox.net>;
 Mon, 25 Oct 2021 09:06:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2075.outbound.protection.outlook.com [40.107.21.75])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C179B4037F
 for <buildroot@buildroot.org>; Mon, 25 Oct 2021 09:06:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ULnYLnurdfMAg1aPna2HEB8fZ+bp73wrMDvVcDJZWpkpYwQmOdQOiTGc95Ei+bxG3msta2TbuyfCn10NvpnlcXozxX8X6n0yOpGRgI4kfMSag8ZUN1edDzZLxuZR3X9R+axZ+3YaqtcHeIMkuySVXSIQ4qmkI3Ic3XwewvwjrLdRUHFLgwiGqh6l0QPoyOMy168yn6Y7mj7lD0Yo6i7Md4K73WVz/Mgossd4cJTZsXH38ZIQ4xk5xsX5gNvtRxCY545Az9JxV2lNUXe3zQPSzqnmptfF8b58vKLqqLxjuBtyS5Yvn/BQPark3Ib4q3QTfLUlgWXpFFRqR19PtFZLHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7EF4GVEcMKqcdKSuOUkT/11gqV8/ytFfons7jwY9pU=;
 b=SBI1XXzjC/kXfRCVJxck0fEgDBwEYML9C26m6rKg6hKz1/oJ81YNDepVb2eTsdJTUx6PdOJ+QVp0A2o0l91ovjZhgeNk76UIPF4L2h33X47vlivsBRjd4qh4ZpcOBShmeipriyNAtYXZf+lKPLiv06a56Og0WGMmO1ITArJPJ0mK+CwGKjlfqJgmaz/jBqB1UEX67zyfT8m313QDzSMseUgN0oQ6+SUFKn2RI3yksWRUEYvlhMJc6Zdh6urULn+r4WNRMlQIz0P6dY527EJ85cbhZ59NWH6rKmi8EISJyWRj5AZ1rrNiRrRoDUMbUDjI0fz48iuhkcBr9OX5J8V0+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=robotize.com; dmarc=pass action=none header.from=robotize.com;
 dkim=pass header.d=robotize.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=RobotizeDK.onmicrosoft.com; s=selector2-RobotizeDK-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7EF4GVEcMKqcdKSuOUkT/11gqV8/ytFfons7jwY9pU=;
 b=eMR3jemrWRnC/kzCGP4YlYCH+qls0javMDLtwR+F70VBjRwhwwkB485n22u+74bvKIW2fJdjqXhA8CkjXwHPC4HgGaaJg2cJSJD7B/rBV0IwUXgr1Wu3GlclkK3UT60JZG4Cp48dByVtvE6zhZkrDnxchyffABql7ox6srF99Gw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=robotize.com;
Received: from AM0P190MB0691.EURP190.PROD.OUTLOOK.COM (2603:10a6:208:1a0::23)
 by AM4P190MB0164.EURP190.PROD.OUTLOOK.COM (2603:10a6:200:5f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.20; Mon, 25 Oct
 2021 09:06:17 +0000
Received: from AM0P190MB0691.EURP190.PROD.OUTLOOK.COM
 ([fe80::5577:beeb:4c3a:ed9b]) by AM0P190MB0691.EURP190.PROD.OUTLOOK.COM
 ([fe80::5577:beeb:4c3a:ed9b%8]) with mapi id 15.20.4628.020; Mon, 25 Oct 2021
 09:06:17 +0000
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20211015105914.9428-1-brm@robotize.com>
 <20211023215705.GK2400@scaer>
From: Brian Murphy <brm@robotize.com>
Message-ID: <7ccf4953-a921-54ab-59b0-a77e91056f1a@robotize.com>
Date: Mon, 25 Oct 2021 11:06:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <20211023215705.GK2400@scaer>
Content-Language: en-US
X-ClientProxiedBy: HE1PR0401CA0107.eurprd04.prod.outlook.com
 (2603:10a6:7:54::36) To AM0P190MB0691.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:208:1a0::23)
MIME-Version: 1.0
Received: from [172.31.10.10] (185.181.221.98) by
 HE1PR0401CA0107.eurprd04.prod.outlook.com (2603:10a6:7:54::36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4628.18 via Frontend Transport; Mon, 25 Oct 2021 09:06:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4686f548-fd84-42ad-d052-08d99796b3ff
X-MS-TrafficTypeDiagnostic: AM4P190MB0164:
X-Microsoft-Antispam-PRVS: <AM4P190MB0164684F94973418A64D067EDA839@AM4P190MB0164.EURP190.PROD.OUTLOOK.COM>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g02oXJ90lE7wrVIVq9QDTCBSYATjzp2LmHbbEOgt9iSwtLPZ1exOrZPOR2tdBWPcvCgcgApkV0IoCS80jIjd0cDCngjnjmkA6Ond55b3kuFMA9lDEy73AcKOjtiBOpU3wL08ugO0UBbSv+9uId0QZwIVIILBvvVhvKxEoaWokISfp2EYCN4WaDaBbKnc3h5HHISd3KqAtPh9vKK6HjIJKQ4nQmNsKdXTu05TIMFF/bBSwK0kvDHA7+CCsx8EaowtytUD+BXyzkz4EmEksKjwMkPgCBLKkOeHyMR3RMMLEhhiyMel9Me4WEZvp8cPivznfKCaPDFC1uRAz2NHhpVqWtGKW1IH7osV+FuKjsITEXOQj1fqE/zampdfSu6f1ie0eZ8tZNWy2DsIeVftIbI11E7pfGq2J9l8aXp4HhYDNJHdEPWtFHpOpg2eO09H9hhhtlRnyhecv2P+HnxrRsI7evw8yWPlFhOUVS+5OnhchlJXf7dkCjMzw0jjbKru14mKp+Zr0UbFquA/X3SBJu4wVPP4RWS3dZg00frlmkrpUKW7e91Jwihn0J6tiAW0joIJU622gHD2S8vaiwpLBeRWPbkWm9NL0NLz0EOJIabPfgbmlcxwvV9gVgc0uENirmRjiH77cJezK3hUjpew9wpebRk1MMqOzAxt/5s6mA5b+cXc4cYdAXZV0gFdcKK/fTgmFF1+g2tkNCIyEiAYks73pA/SWnF34BMR4uoEAINGmAfRxntYnZOSfn0akRNGTiEA6H9DTf+GPgjBzsxiA+axkWNjzH8KaVzSeNPsMn7wX+lAY1yYOkXx9woM5ebHCZYj/04xTHqoAW3PV98oVpgrR53iOaiw0Fdk96K1PDaQrX8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM0P190MB0691.EURP190.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(376002)(346002)(366004)(396003)(136003)(39830400003)(8936002)(83380400001)(54906003)(36756003)(33964004)(66556008)(52116002)(4001150100001)(8676002)(53546011)(66946007)(31686004)(26005)(316002)(166002)(956004)(38100700002)(66476007)(186003)(966005)(5660300002)(15974865002)(508600001)(16576012)(6486002)(4326008)(31696002)(66574015)(86362001)(2616005)(6916009)(2906002)(38350700002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUNRWUd1MFpKbERzM3RCS1ZJb0E0SkZUK0VHUEtNc0Q5ZGxjZVBzTUJ1b1Vu?=
 =?utf-8?B?b01oODNuNkcwczZHaUpDN3J0d0pHVGZYRTZ3alBrM21KOXJOQk1iVGtLY1Rp?=
 =?utf-8?B?Q1Y1QVhWcGNUZ01UeE1DMVl1OEtkNllmT2NCVXhPQXovU1FUczNZUWptcVZ1?=
 =?utf-8?B?a1NQVEdybW9xVE1FZW85UWFHWS9BQ1BZZ0NvN3J3TTJsUmhWT0x2ZnZFM1Q4?=
 =?utf-8?B?M2xIZkcrSkFlVGEyRzJhc09UZUFmOXpHVjQzZ3QvcmNwbHFUK2paT1NHbXpT?=
 =?utf-8?B?bEc1alptZWpkOWU0VUhWNXhWZ3BKM2tGaFd6TDZpY2l0N0I0TVlvNTZ5VEZa?=
 =?utf-8?B?WFkrMXo5NnNRTlMycGZyREZkUzdiaENQWENPOWpUMitiTHRSWFg1VXJOYzVO?=
 =?utf-8?B?SC8wZkdhL1ZPc2d5V0tDN2FnUkc2dllHTG5zOVpvK0tmVU9JdW9lR1gwd0VB?=
 =?utf-8?B?aHF2UXpNTEEvUERsdWlDOVhjb1FCTXNiYWNBMHdkdUg0N1FnVENWdUdqNFFa?=
 =?utf-8?B?Mi9WZXdTSnZHbWxGOHgyKzU1Z1lpZUtTNTYyeFh3UHQwcHlsc2gwMHlldEVo?=
 =?utf-8?B?VFY0RVVFN1JwS2pCOFNiWlRJYlJwU29oVE1uSHNYaVArUWFiQ0Z2ZXNTbFhI?=
 =?utf-8?B?cFJ4UW1tNWQ1WVNQUUFkNTlOWVIxVXBYak1IZ09WMDdDL1RERkNzWTljTk0r?=
 =?utf-8?B?c0ltLzlTNzNBSEpDM3hTd2o3OUNvMGRkKy9PQkFiUDhHb1c4Z1NES2gvWmNF?=
 =?utf-8?B?ZEZkYnpoTVFpdXRwdWZzdTgvUUtRby9MdisydElJRFhYWTM2cXM5S21pdnpM?=
 =?utf-8?B?OG1KOVdrU0xtZm9EemRxU0M5Nkt5aW55OHJxTFNmMUIrc2J5T2dKNk1aTk43?=
 =?utf-8?B?Zi9Sb3BxVDdFWUtCNjY2dG8rUnRxRlp4S0hlUEVFcnFJYkViUlFXSDdabzBz?=
 =?utf-8?B?bUJRaEMwTG1hT3JZMDd0TE8vU0Vua213RHBZNUs3NXlNU054UzZqMm5hcFRV?=
 =?utf-8?B?dFE2NERKQVJFUnV0MVUwNW1zMkt1NE82elJOYjBaZEI2VjNuNS82NlJlZFhw?=
 =?utf-8?B?NzdGOGxSM0Q5REVkNnlCR3FudzhEYnJJNHFGK1M0eThMdVFRS3F3TnI2YWZT?=
 =?utf-8?B?Z1M1NWNEdk9kMWhNZzQxUGxSMVlFWU5ocW9XOTJYMElIcDlUWGxoSmFZV0xw?=
 =?utf-8?B?aHZrR3crUVZ6dTV5RGpxQU54TkxaZG9oYzBScXl3VGFNWjM5d1R2SUIxcUpG?=
 =?utf-8?B?Q2tEQ05nZFl1NEE2WGZtd0NvWDlSa3hJb2phLzJld0wra0UxRHBlaDE4Zzh6?=
 =?utf-8?B?VTVuUUpsTVZIOUZFVWJ2Q0hzd2lWVUdKOXpENUp4TU11UndaMEQ0cGtjQTc5?=
 =?utf-8?B?Skp2SUFkSmlVNEVlM2ZFR2ltbGVXclBHTTBweERleDFrczRyLzRKbDc0NkNM?=
 =?utf-8?B?elp4TVZRcG9CTmFHZVZ2NDRmUEV6Y2crb3FBNSsrOGdIWEpIcXZSVHZuUWh0?=
 =?utf-8?B?SnRocXJMMGdRc1FKdDAwcnBHOERSRWZmRnRmMDE5T0J1a1FPeFBZR1VkdVlx?=
 =?utf-8?B?K0VlSE5QMDBJZ0ZuUnZHQVBJN3NFZGs5NVh1MVd1YXRPNnBVRmNIWXJnTmYx?=
 =?utf-8?B?bkMwdVlvT2ZPVS9qNC9xZzJVVmZPaDBKTFE3SXBDZzFyeTVTcm02ejU3YkNk?=
 =?utf-8?B?WmFzb1o4QjRUd05iS3ZYZ3RiR1huQW9jYTBMVzNaZUoyQUdVM0tNY0JqNkto?=
 =?utf-8?B?NmsyTVRFc2l4SFYrVTRsTFhRVDkxbHdYRUc0MUh3VHpZN2RKTVNRbEZBMTVH?=
 =?utf-8?B?NXF4c3Fnc0tXNUJrb3F2empTbllCSVNZUmFTVTlySS9XSTdjSmkzbWVZZS93?=
 =?utf-8?B?TzFVWTY3Z21oMDlWbXc1YzN2RmgyTmdRUDNUblVZZ1pmSFB0OVM1VTlrR3Fl?=
 =?utf-8?B?RU1hTm5QWHdwOCtaVjM1Qzc4NDZiYkNHMkVNNmdkVkFFcHpPSzNNTFlldFZ3?=
 =?utf-8?B?eDdua0FJRTBHbnFwS1JRcVc5ck80VnFDeG1CK0VFM2g0UVltVFJGT3I4VHYr?=
 =?utf-8?B?VXVnRnE0VWFGU3M2a0JkUmlRYkdFZHVpcElBV2t1SmlTd1hhbEwzMU9NN0hS?=
 =?utf-8?B?V25iVDladkw2T2szcnZ3N2NNWGdqRGwxU3ovWEtCWkdMS3pxUkJoU3p5UVNk?=
 =?utf-8?Q?yx7cZbS08tG9tKRvnAz6imE=3D?=
X-OriginatorOrg: robotize.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4686f548-fd84-42ad-d052-08d99796b3ff
X-MS-Exchange-CrossTenant-AuthSource: AM0P190MB0691.EURP190.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2021 09:06:17.2163 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 97da0719-efeb-4023-96f7-55c60ccaef1e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: njhBRP1PL9lORbmq5iBNwBPpxkzR/vC7s16eqI8Pbn0K3ktd8VifdqdJ4OuLojYX3AGZ+ajGgFMUOm6ACs3hPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM4P190MB0164
Subject: Re: [Buildroot] [PATCH 1/1] boot/grub2: fix dependency on host-gawk
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
Cc: Kory Maincent <kory.maincent@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0063149368908490146=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0063149368908490146==
Content-Type: multipart/alternative;
 boundary="------------CF617CDBB47B3BE62A6C75FD"
Content-Language: en-US

--------------CF617CDBB47B3BE62A6C75FD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Yeah. I got this randomly when building - and pretty much always from clean:

aclocal.m4:17: warning: this file was generated for autoconf 2.69.
You have another version of autoconf.  It may work, but is not 
guaranteed to.
If you have problems, you may need to regenerate the build system entirely.
To do so, use the procedure documented by the package, typically 
'autoreconf'.
rm -f stamp-h1
touch ../config-util.h.in
cd . && /bin/bash ./config.status config-util.h
config.status: creating config-util.h
In file included from ../include/grub/disk.h:22,
                  from ../include/grub/file.h:26,
                  from ../grub-core/fs/minix.c:21:
./config.h:38:10: fatal error: ./config-util.h: No such file or directory
    38 | #include <config-util.h>
       |          ^~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [Makefile:13096: libgrub.pp] Error 1
make[1]: Leaving directory 
'/home/brm/src/buildroot/br.pc/output/build/grub2-2.04/build-i386-pc'
make: *** [package/pkg-generic.mk:294: 
/home/brm/src/buildroot/br.pc/output/build/grub2-2.04/.stamp_built] Error 2

and when I run the command I get:

$ /bin/bash ./config.status config-util.h
config.status: creating config-util.h
./config.status: line 2356: gawk: command not found
config.status: error: could not create config-util.h

So grub ends up needing gawk to create this config-util.h. I do not have 
gawk installed on my build machine but other buildroot packages depend 
on host-gawk so it ends up being built. Perhaps grub autodetects gawk 
before it is ready to be used (sometimes) in a parallel build if it is 
going to be installed as a dependency from another package?

Making grub depend on host-gawk fixes this for me.

On 23/10/2021 23:57, Yann E. MORIN wrote:
> Brian, All,
>
> +Köry who did recent changes in grub2
>
> On 2021-10-15 12:59 +0200, Brian Murphy spake thusly:
>> Signed-off-by: Brian Murphy <brm@robotize.com>
> Could you give a bit more details about the reason why host-gawk is
> needed? I've just been able to complete a grub2 build with mawk as my
> system awk. grub2's configure even detects that situation;
>
>      checking for gawk... no
>      checking for mawk... mawk
>
> Regards,
> Yann E. MORIN.
>
>> ---
>>   boot/grub2/grub2.mk | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
>> index e01ebb2edb..77bf26b739 100644
>> --- a/boot/grub2/grub2.mk
>> +++ b/boot/grub2/grub2.mk
>> @@ -10,7 +10,7 @@ GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
>>   GRUB2_LICENSE = GPL-3.0+
>>   GRUB2_LICENSE_FILES = COPYING
>>   GRUB2_DEPENDENCIES = host-bison host-flex host-grub2
>> -HOST_GRUB2_DEPENDENCIES = host-bison host-flex
>> +HOST_GRUB2_DEPENDENCIES = host-bison host-flex host-gawk
>>   GRUB2_INSTALL_IMAGES = YES
>>   
>>   # 0001-build-Fix-GRUB-i386-pc-build-with-Ubuntu-gcc.patch and 2021/03/02
>> -- 
>> 2.20.1
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot@buildroot.org
>> https://lists.buildroot.org/mailman/listinfo/buildroot
-- 

Med venlig hilsen / Kind Regards / Mit freundlichen Grüssen

*Brian Murphy*

Development Engineer

robotize

Maglebjergvej 5B - 2800 Kgs. Lyngby - Denmark
Tel +45 3080 9070
Mail brm@robotize.com - Web www.robotize.com

--------------CF617CDBB47B3BE62A6C75FD
Content-Type: multipart/related;
 boundary="------------1B3A3FE5FE57BBA12DE7913D"

--------------1B3A3FE5FE57BBA12DE7913D
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p>Yeah. I got this randomly when building - and pretty much always
      from clean:</p>
    <p>aclocal.m4:17: warning: this file was generated for autoconf
      2.69.<br>
      You have another version of autoconf.&nbsp; It may work, but is not
      guaranteed to.<br>
      If you have problems, you may need to regenerate the build system
      entirely.<br>
      To do so, use the procedure documented by the package, typically
      'autoreconf'.<br>
      rm -f stamp-h1<br>
      touch ../config-util.h.in<br>
      cd . &amp;&amp; /bin/bash ./config.status config-util.h<br>
      config.status: creating config-util.h<br>
      In file included from ../include/grub/disk.h:22,<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from ../include/grub/file.h:26,<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from ../grub-core/fs/minix.c:21:<br>
      ./config.h:38:10: fatal error: ./config-util.h: No such file or
      directory<br>
      &nbsp;&nbsp; 38 | #include &lt;config-util.h&gt;<br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^~~~~~~~~~~~~~~<br>
      compilation terminated.<br>
      make[1]: *** [Makefile:13096: libgrub.pp] Error 1<br>
      make[1]: Leaving directory
      '/home/brm/src/buildroot/br.pc/output/build/grub2-2.04/build-i386-pc'<br>
      make: *** [package/pkg-generic.mk:294:
      /home/brm/src/buildroot/br.pc/output/build/grub2-2.04/.stamp_built]
      Error 2<br>
    </p>
    <p>and when I run the command I get:</p>
    <p>$ /bin/bash ./config.status config-util.h<br>
      config.status: creating config-util.h<br>
      ./config.status: line 2356: gawk: command not found<br>
      config.status: error: could not create config-util.h<br>
    </p>
    <p>So grub ends up needing gawk to create this config-util.h. I do
      not have gawk installed on my build machine but other buildroot
      packages depend on host-gawk so it ends up being built. Perhaps
      grub autodetects gawk before it is ready to be used (sometimes) in
      a parallel build if it is going to be installed as a dependency
      from another package?<br>
    </p>
    <p>Making grub depend on host-gawk fixes this for me.<br>
    </p>
    <div class="moz-cite-prefix">On 23/10/2021 23:57, Yann E. MORIN
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20211023215705.GK2400@scaer">
      <pre class="moz-quote-pre" wrap="">Brian, All,

+Köry who did recent changes in grub2

On 2021-10-15 12:59 +0200, Brian Murphy spake thusly:
</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">Signed-off-by: Brian Murphy <a class="moz-txt-link-rfc2396E" href="mailto:brm@robotize.com">&lt;brm@robotize.com&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
Could you give a bit more details about the reason why host-gawk is
needed? I've just been able to complete a grub2 build with mawk as my
system awk. grub2's configure even detects that situation;

    checking for gawk... no
    checking for mawk... mawk

Regards,
Yann E. MORIN.

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">---
 boot/grub2/grub2.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/boot/grub2/grub2.mk b/boot/grub2/grub2.mk
index e01ebb2edb..77bf26b739 100644
--- a/boot/grub2/grub2.mk
+++ b/boot/grub2/grub2.mk
@@ -10,7 +10,7 @@ GRUB2_SOURCE = grub-$(GRUB2_VERSION).tar.xz
 GRUB2_LICENSE = GPL-3.0+
 GRUB2_LICENSE_FILES = COPYING
 GRUB2_DEPENDENCIES = host-bison host-flex host-grub2
-HOST_GRUB2_DEPENDENCIES = host-bison host-flex
+HOST_GRUB2_DEPENDENCIES = host-bison host-flex host-gawk
 GRUB2_INSTALL_IMAGES = YES
 
 # 0001-build-Fix-GRUB-i386-pc-build-with-Ubuntu-gcc.patch and 2021/03/02
-- 
2.20.1

_______________________________________________
buildroot mailing list
<a class="moz-txt-link-abbreviated" href="mailto:buildroot@buildroot.org">buildroot@buildroot.org</a>
<a class="moz-txt-link-freetext" href="https://lists.buildroot.org/mailman/listinfo/buildroot">https://lists.buildroot.org/mailman/listinfo/buildroot</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
</pre>
    </blockquote>
    <div class="moz-signature">-- <br>
      
      <title></title>
      <p>Med venlig hilsen / Kind Regards / Mit freundlichen Grüssen<br>
      </p>
      <div class="moz-signature"> <b>Brian Murphy</b><br>
        <br>
        Development Engineer<br>
        <br>
        <img moz-do-not-send="false" src="cid:part1.D130C650.4696CBF3@robotize.com" alt="robotize" width="203" height="61"><br>
        <br>
        Maglebjergvej 5B - 2800 Kgs. Lyngby - Denmark<br>
        Tel +45 3080 9070<br>
        Mail <a class="moz-txt-link-abbreviated" href="mailto:brm@robotize.com">brm@robotize.com</a> - Web <a class="moz-txt-link-abbreviated" href="http://www.robotize.com">www.robotize.com</a><br>
      </div>
    </div>
  </body>
</html>

--------------1B3A3FE5FE57BBA12DE7913D
Content-Type: image/png;
 name="robotize_mail_logo.png"
Content-Transfer-Encoding: base64
Content-ID: <part1.D130C650.4696CBF3@robotize.com>
Content-Disposition: inline;
 filename="robotize_mail_logo.png"

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
NcQYTUOaGc0AAAAASUVORK5CYII=

--------------1B3A3FE5FE57BBA12DE7913D--

--------------CF617CDBB47B3BE62A6C75FD--

--===============0063149368908490146==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0063149368908490146==--
