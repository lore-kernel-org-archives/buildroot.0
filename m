Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FB1FC61DA4
	for <buildroot@archiver.kernel.org>; Thu, 23 Feb 2023 23:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8038181495;
	Thu, 23 Feb 2023 23:47:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8038181495
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ytyTgFtsn1YU; Thu, 23 Feb 2023 23:47:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id CC9E1814B5;
	Thu, 23 Feb 2023 23:47:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CC9E1814B5
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C88D31BF2CD
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 23:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FCEB40942
 for <buildroot@lists.busybox.net>; Thu, 23 Feb 2023 23:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9FCEB40942
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1eQYKuswF6dN for <buildroot@lists.busybox.net>;
 Thu, 23 Feb 2023 23:47:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AC3940941
Received: from AUS01-ME3-obe.outbound.protection.outlook.com
 (mail-me3aus01on2062e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:7004::62e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AC3940941
 for <buildroot@buildroot.org>; Thu, 23 Feb 2023 23:47:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Tb7R9JSvs+XucYLaQOWGIhleyaza+DPilM5B5SEJj/BP0ppZt5RE2Rpl2/xvQfs2Ykz+URdqKV9E7sBSj9vQS/eEO0eT/bVrBczY/QtIApSVpcL5QbZYYr35lakuG+iFZqQCHGiNWO6LEI6iTW/ncAsZaVktS2F7WNYpHQ7BYFfXoHov9wXMh/zbn9nxpJt9xp/EnOeodxlgl68LYcRdSsXCI6BM0O6+l+y1sEk9L9/ixEPzVvY+azqokoIJzp0/zSj48y2hgVNWB6eRaM4fG4DG01YIGZ3/EwmtRqtK7n0Sqtj5X/cSfRiHDr8c7w2vIrWayHFvqe9yI0rsDig/tA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h9g0tL4XqLdQ2pIaQizOUlqrTc/PkMghNH7PSZ4M2nE=;
 b=exZzmXGzZBt0XsBA/ykm87L1i/5JO93VwB87F51oVvTlW0GtwdT0guqRf0xzcZZB/vXKLNdcb812OkScVVJ5fcZmWcArUPL5cdzmY2K29vuBazhuJEKC4nllFUYIJQ1Y6VcFtp/6fZ1/hb2RoT7uY9+oeQ+wLJyaV0wtzsxoE28tN8BEGArMh/hus+EI8w3yLIKPplgvHmMeEA2zFA//Peikf1oPvLCa+P1g8Sw5eefZrdRkFVfQLTVMZwv42rB+KxiaO8jNWn9LcMFQgwmt8lnK+2QUlN/zuj+YwHWVIpFp8vhAdl+g7ZBrTdbI6btNK1DnuFcp0VQR1muYrKlEzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 13.70.157.244) smtp.rcpttodomain=buildroot.org
 smtp.mailfrom=rigtechnologies.com.au; dmarc=bestguesspass action=none
 header.from=rigtechnologies.com.au; dkim=none (message not signed); arc=none
Received: from MEWP282CA0062.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:1dd::19)
 by SY4P282MB1338.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:a2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24; Thu, 23 Feb
 2023 23:47:07 +0000
Received: from ME3AUS01FT007.eop-AUS01.prod.protection.outlook.com
 (2603:10c6:220:1dd:cafe::14) by MEWP282CA0062.outlook.office365.com
 (2603:10c6:220:1dd::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.24 via Frontend
 Transport; Thu, 23 Feb 2023 23:47:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 13.70.157.244)
 smtp.mailfrom=rigtechnologies.com.au; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none
 header.from=rigtechnologies.com.au;
Received-SPF: Pass (protection.outlook.com: domain of rigtechnologies.com.au
 designates 13.70.157.244 as permitted sender)
 receiver=protection.outlook.com; client-ip=13.70.157.244;
 helo=au2.smtp.exclaimer.net; pr=C
Received: from au2.smtp.exclaimer.net (13.70.157.244) by
 ME3AUS01FT007.mail.protection.outlook.com (10.114.155.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.6134.24 via Frontend Transport; Thu, 23 Feb 2023 23:47:05 +0000
Received: from AUS01-ME3-obe.outbound.protection.outlook.com (104.47.71.232)
 by au2.smtp.exclaimer.net (13.70.157.244) with Exclaimer Signature Manager
 ESMTP Proxy au2.smtp.exclaimer.net (tlsversion=TLS12,
 tlscipher=TLS_ECDHE_WITH_AES256_SHA384); Thu, 23 Feb 2023 23:47:05 +0000
X-ExclaimerHostedSignatures-MessageProcessed: true
X-ExclaimerProxyLatency: 29121843
X-ExclaimerImprintLatency: 2634961
X-ExclaimerImprintAction: 098832814e4b4b3a8b29b047030b1423
Received: from ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:8e::13)
 by ME3P282MB2465.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:10b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.20; Thu, 23 Feb
 2023 23:47:01 +0000
Received: from ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM
 ([fe80::78ed:8471:ff3c:7dcd]) by ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM
 ([fe80::78ed:8471:ff3c:7dcd%4]) with mapi id 15.20.6134.023; Thu, 23 Feb 2023
 23:47:01 +0000
From: Alberto Fahrenkrog <Alberto.Fahrenkrog@rigtechnologies.com.au>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [Help] Struggling to build external python package
 on out of tree build
Thread-Index: AQHZR1MInVPfY+A23Eawxw+Y5pnai67cHA/pgAABvkCAAB6C9IAAshQAgAAEJoCAAD9PMA==
Date: Thu, 23 Feb 2023 23:47:01 +0000
Message-ID: <ME3P282MB1347835B0C211FA9787F6A77B9AB9@ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM>
References: <mailman.16587.1677128985.134166.buildroot@buildroot.org>
 <40f9568e5843d49c2afd808bec856bde@umbiko.net>
 <ME3P282MB1347EBF1C507BA058F1C4E96B9AB9@ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB1347D11820FE34604E4CCCE1B9AB9@ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM>
 <ME3P282MB13471E87C461046A819DA1C7B9AB9@ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM>
 <03da8459-7360-1391-7e64-86d3fd75f145@mind.be>
 <20230223195409.GM2718518@scaer>
In-Reply-To: <20230223195409.GM2718518@scaer>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=rigtechnologies.com.au;
x-ms-traffictypediagnostic: ME3P282MB1347:EE_|ME3P282MB2465:EE_|ME3AUS01FT007:EE_|SY4P282MB1338:EE_
X-MS-Office365-Filtering-Correlation-Id: 680e18f1-abad-410e-031e-08db15f8453c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: dBlvgMiEmHDcZKeI/u4ZQmC8Bp7tERsj5pckOGOjXi3WuZxPBe37NZ4xCaK0EiD5BtOBtVzm3hIdvFr3K1C/fPgLmbv/eHxa2B3/o8tgGUZXIpEaPt4s3PR09/8mDi8Qy6DUTtkhWL3Bn3/D2bg0TO0qNnqiBsnZLcntxnPPMkII/CFQiFOUvv1+/FHKiwPQBZ5xQQrblGtK4DM2oUeCJroUiO41cfiS5MgUWKQPW57ICNMDisac05++g3vYWM0xQxs4L+cree/p6Z0qgyCePLr57FmKZ8cT8CFlJFRjt+mWNE6bZKAjve44FYf/gIosqu4Q8ZXKM8CokVotzm7p+dRo6N2XNvX4GAr+UQEjPzSXj7/T5FbWYCZ9oUL4k7wU+DCI5E/SLyDrY/XALf4mIwN0QF4qJcXa9e4wuDgziA2tGD/h9lq0+0Q8k+8yNiSFC5NeDjdCrC7E/WVpXHE6tO6mSk7ICxUXTQD0fEZbILGoznPndH9dPtev4L+QK2fXk1pXPKeJXlmnNj5T0zYuPr/idabsr4P4Ab+SoOUpHDE9pJfxC1QfifATVCAy4D3kwFLMOs8pbhotW9wpSNOEVvKXArKzIpfwkp3acnvP7DK7ctIm0vODvpOuj2MEoQoXFfYe1B4XjmF4Yf2L8eTlGLdPSydgXLTlZEF6tnRXRJuKIdqOZ5jmY1cYcu8ck7SB6yofYE9VOEZk+wBoIhIfAgQJFvpuTrGRKkMeiL1CAwOFTpube19vl+AQjfxW0Q9q
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255; CTRY:; LANG:en;
 SCL:1; SRV:; IPV:NLI; SFV:NSPM; H:ME3P282MB1347.AUSP282.PROD.OUTLOOK.COM; PTR:;
 CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(136003)(396003)(39850400004)(366004)(109986016)(451199018)(33656002)(83380400001)(316002)(7696005)(966005)(71200400001)(478600001)(18265965005)(9686003)(6506007)(26005)(4326008)(186003)(41300700001)(166002)(8936002)(53546011)(2906002)(86362001)(38070700005)(5660300002)(52536014)(91956017)(66476007)(66446008)(66556008)(64756008)(55016003)(38100700002)(66899018)(66946007)(76116006)(8676002)(122000001)(19627405001)(15866825006);
 DIR:OUT; SFP:1101; 
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ME3P282MB2465
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: ME3AUS01FT007.eop-AUS01.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 3bade1d8-bba3-43fc-cb38-08db15f84293
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZdwSgrNu6n83QGikLGcYG9haJmPY04K39hU6iFsJ8Om4GCqUCvOVMBrbTg28vqLyDUn3Fl8GTs691LAoqg4XIAcKwWvrwWAHn8tMotMRjZe6Z2PZ8QwX/oQBYSUwrI+bT9B+I3ubDV8KerxWQX0XqZCCunO6M47V3OAfz3rsMmYdovBhE1a+SV9XPCKqyg2FHgzrFZeNFDUuj29gnQehMfQ4Z6HBomyeXM6wBYZSnIC35iykckYkZdGD3/bXBYjARB7kzM0PAZcOySU4uyfYLLq/NBxWSMaANnX2HRfliuSLAdn35VNJ4AgSBU03d40VgcT4pze8aaxG52Y+tEhNMKANRaWPIr2UvcxVHEqzsla+tgvsIpwvdrz4pkNp3PSeDZL0a7dHeC4E80wlsBSF2oZ6Ej7AHBRmKLQBGCKqvxYPY0lsfLc5TpFxbtrrdBsfAhbVOXt4TsY4ZiZroNwIiXHVVJNH6kZ3qb4sfswH7Auv1+1TRYlTh0o36LSPYCalgKnC9VFWvrPNVfH0SVvgtIhb0sfBT5aLuWGc6E7pjky28NjFqiNIJ8uxXbndbxcA0N80ivEUEv0HYH8izFL7SMhBODxgFodUagqDki3BPy3Jv0p5lKLkarnT5ySYHhKeWolCpAEsw9AgGZ8DIgtxI3j/B5bYi9EOd9U4Vh5pgtXLO5TAGIJ/y5EbZWWyzIOkMRUGY/pRiYwJWT5nPTxnZfpA8+DcYAJPXhwofBMxzMo=
X-Forefront-Antispam-Report: CIP:13.70.157.244; CTRY:AU; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:au2.smtp.exclaimer.net; PTR:au2.smtp.exclaimer.net;
 CAT:NONE;
 SFS:(13230025)(4636009)(346002)(39850400004)(376002)(136003)(396003)(451199018)(109986016)(36840700001)(46966006)(8936002)(70206006)(70586007)(19627405001)(52536014)(4326008)(8676002)(316002)(41300700001)(966005)(2906002)(478600001)(30864003)(336012)(7696005)(53546011)(6506007)(33964004)(66899018)(26005)(9686003)(186003)(82740400003)(7596003)(7636003)(83380400001)(47076005)(5660300002)(33656002)(166002)(82310400005)(40480700001)(18265965005)(55016003)(356005)(86362001)(36860700001)(15866825006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: rigtechnologies.com.au
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 23:47:05.7878 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 680e18f1-abad-410e-031e-08db15f8453c
X-MS-Exchange-CrossTenant-Id: d9b9a834-a53c-4fa3-b2c0-12e53d54aec8
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=d9b9a834-a53c-4fa3-b2c0-12e53d54aec8; Ip=[13.70.157.244];
 Helo=[au2.smtp.exclaimer.net]
X-MS-Exchange-CrossTenant-AuthSource: ME3AUS01FT007.eop-AUS01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SY4P282MB1338
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hopperindustrialgroup.onmicrosoft.com;
 s=selector1-hopperindustrialgroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h9g0tL4XqLdQ2pIaQizOUlqrTc/PkMghNH7PSZ4M2nE=;
 b=IZB2XJDgVtRMjKQQcSGPIJMn2ue1b6UHSru7RtCFKfscGc+oBGmq8Ss37w2WgvrDNyHnCEJSb7x0O8y0CvaQ1Se6rmJ4dXl0/+Oz+1lGnDRH7srBXDO6VfeeJ5HxXa3Jb3iJa0fpf3ZhaO20x3izRipoIEK35vbUYgDSuL7A/DkoiVyDV0Mw3gff6vp9ITAjWZOeuzD9jjSVhT1EOcoqAdw7yk/sJYWEfpFRG3fYEwiiS5bK4VAAbJ7DDpny3eqvHfqqaSAMPzI8dCd5j1bx2rJcgcg1ag3/JiOyZhJZSFci7dKj4Xe9dU6NmMubB1UrcDWkxFs2v2/jiStdLcazVQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=hopperindustrialgroup.onmicrosoft.com
 header.i=@hopperindustrialgroup.onmicrosoft.com header.a=rsa-sha256
 header.s=selector1-hopperindustrialgroup-onmicrosoft-com header.b=IZB2XJDg
Subject: Re: [Buildroot] [Help] Struggling to build external python package
 on out of tree build
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
Content-Type: multipart/mixed; boundary="===============6954479387717767501=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.

--===============6954479387717767501==
Content-Type: multipart/related;
	boundary="----_=_NextPart_f79c20a3-ef81-420b-ac17-443fd50f589f"

This is a multi-part message in MIME format.

------_=_NextPart_f79c20a3-ef81-420b-ac17-443fd50f589f
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_ME3P282MB1347835B0C211FA9787F6A77B9AB9ME3P282MB1347AUSP_"

--_000_ME3P282MB1347835B0C211FA9787F6A77B9AB9ME3P282MB1347AUSP_
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Yann, Arnout, thanks a lot. I just tried this and it worked beautifully! I =
really appreciate your support.

Cheers,

Alberto

Alberto Fahrenkrog Senior Embedded Engineer 
Orica - Perth Technology Centre
p: +61 (0) 8 6365 4056
e: Alberto.Fahrenkrog@rigtechnologies.com.au
________________________________
From: Yann E. MORIN <yann.morin.1998@free.fr>
Sent: Friday, February 24, 2023 3:54 AM
To: Arnout Vandecappelle <arnout@mind.be>
Cc: Alberto Fahrenkrog <Alberto.Fahrenkrog@rigtechnologies.com.au>; buildro=
ot@buildroot.org <buildroot@buildroot.org>
Subject: Re: [Buildroot] [Help] Struggling to build external python package=
 on out of tree build

Arnout, All,

On 2023-02-23 20:39 +0100, Arnout Vandecappelle spake thusly:
> On 23/02/2023 10:13, Alberto Fahrenkrog wrote:
> >Hi all, I'm slowly getting ahead with this, and I still have a few more =
questions...
> >
> >I'm trying to get a tar.gz file from a git repo, which needs
> >authentication. The command that works manually is:
> >/wget https://outwebsite.com/koala/archive/release1.2.3.tar.gz --header
> >'Authorization: token MY_TOKEN'/
> >/
> >/
> >And the .mk file is configured as:
> >PYTHON_KOALA_SITE_METHOD =3D wget
> >PYTHON_KOALA_DL_OPTS =3D --header 'Authorization: token MY_TOKEN'
>
>  Since commit 3f2bdd0701de4f2bca7e6d96f96972e7bcabdd93 (by Yann, in Cc), =
it
> is necessary to twice-quote the arguments to wget (and wget only). So

Oh dang, a commit from 7 years ago... ;-)

> PYTHON_KOALA_DL_OPTS =3D --header "'Authorization: token MY_TOKEN'"
>
>  Yann, I honestly don't understand why this eval is needed, instead of
> simply passing BR2_HG unquoted... But I didn't look too deeply into it.

That's because that does not work?

    $ cat ess
    #!/usr/bin/env bash
    bar() {
        for i in "${@}"; do
            printf '__%s__\n' "${i}"
        done
    }
    MY_CMD=3D"bar '1 2 3' a b 'C D'"
    ${MY_CMD} START "${@}" END
    echo
    MY_CMD=3D"./foo '1 2 3' a b 'C D'"
    ${MY_CMD} START "${@}" END

    $ cat foo
    #!/usr/bin/env bash
    for i in "${@}"; do
        printf '>>%s<<\n' "${i}"
    done

    $ ./ess wee woo "woot woot"
    __'1__
    __2__
    __3'__
    __a__
    __b__
    __'C__
    __D'__
    __START__
    __wee__
    __woo__
    __woot woot__
    __END__

    >>'1<<
    >>2<<
    >>3'<<
    >>a<<
    >>b<<
    >>'C<<
    >>D'<<
    >>START<<
    >>wee<<
    >>woo<<
    >>woot woot<<
    >>END<<

So, if the command for a downloader, as provided in the .config,
contains quoted material, the quotes would be part of the word.

Regards,
Yann E. MORIN.

>  Regards,
>  Arnout
>
>
> >PYTHON_KOALA_SITE =3D https://outwebsite.com/koala/archive/
> ><https://outwebsite.com/koala/archive/>
> >
> >The .mk file is being read correctly, but I can't figure out how to use
> >DL_OPTS. The manual says DL_OPTS is a space separated list, but i see wg=
et
> >tries to use "token" or "MY_TOKEN" as the address. I tried a few differe=
nt
> >combinations of inverted commas, but none worked.
> >
> >Thanks again,
> >
> >Alberto
> >/
> >/
> >/
> >/
> >Alberto=E2=80=8B Fahrenkrog
> >
> >     Senior Embedded Engineer
> >
> >Orica =E2=80=91 Perth Technology Centre
> >
> >p: +61 (0) 8 6365 4056
> >
> >e: *Alberto.Fahrenkrog@rigtechnologies.com.au*
> ><mailto:Alberto.Fahrenkrog@rigtechnologies.com.au>
> >
> >------------------------------------------------------------------------=
--------
> >*From:* Alberto Fahrenkrog <Alberto.Fahrenkrog@rigtechnologies.com.au>
> >*Sent:* Thursday, February 23, 2023 3:13 PM
> >*To:* buildroot@buildroot.org <buildroot@buildroot.org>
> >*Subject:* Re: [Buildroot] [Help] Struggling to build external python
> >package on out of tree build
> >Ok, I see now that external.mk is explained in chapter 9. I jumped
> >straight to chapter 18 and missed external.mk completely. And for some
> >reason I never found external.mk on my google searches.
> >
> >Thanks all for your help!
> >
> >Cheers,
> >
> >Alberto
> >------------------------------------------------------------------------=
--------
> >*From:* buildroot <buildroot-bounces@buildroot.org> on behalf of Alberto
> >Fahrenkrog <Alberto.Fahrenkrog@rigtechnologies.com.au>
> >*Sent:* Thursday, February 23, 2023 3:09 PM
> >*To:* buildroot@buildroot.org <buildroot@buildroot.org>
> >*Subject:* Re: [Buildroot] [Help] Struggling to build external python
> >package on out of tree build
> >
> >You don't often get email from alberto.fahrenkrog@rigtechnologies.com.au=
=2E
> >Learn why this is important
> ><https://aka.ms/LearnAboutSenderIdentification>
> >
> >
> >Hi Andreas,
> >
> >Thank you so much! That did it! Where in the manual is external.mk
> >explained? I missed it for sure...
> >
> >Cheers,
> >
> >Alberto
> >Alberto=E2=80=8B Fahrenkrog
> >
> >     Senior Embedded Engineer
> >
> >Orica =E2=80=91 Perth Technology Centre
> >
> >p: +61 (0) 8 6365 4056
> >
> >e: *Alberto.Fahrenkrog@rigtechnologies.com.au*
> ><mailto:Alberto.Fahrenkrog@rigtechnologies.com.au>
> >
> >------------------------------------------------------------------------=
--------
> >*From:* buildroot <buildroot-bounces@buildroot.org> on behalf of Andreas
> >Ziegler <br015@umbiko.net>
> >*Sent:* Thursday, February 23, 2023 2:49 PM
> >*To:* Alberto Fahrenkrog <Alberto.Fahrenkrog@rigtechnologies.com.au>
> >*Cc:* buildroot@buildroot.org <buildroot@buildroot.org>
> >*Subject:* Re: [Buildroot] [Help] Struggling to build external python
> >package on out of tree build
> >[You don't often get email from br015@umbiko.net. Learn why this is
> >important at https://aka.ms/LearnAboutSenderIdentification
> ><https://aka.ms/LearnAboutSenderIdentification> ]
> >
> >Hi Alberto,
> >
> >On 2023-02-23 04:47, Alberto Fahrenkrog wrote:
> >>Update,
> >>
> >>if I change  $(eval $(python-koala)) to $(eval $(python-package)) I
> >>still get the same error. I assume that might have been one mistake.
> >>
> >>Cheers,
> >>
> >>Alberto
> >>
> >>Alberto Fahrenkrog Senior Embedded Engineer
> >>Orica - Perth Technology Centre
> >>p: +61 (0) 8 6365 4056
> >>e: Alberto.Fahrenkrog@rigtechnologies.com.au
> >>________________________________
> >>From: buildroot <buildroot-bounces@buildroot.org> on behalf of Alberto
> >>Fahrenkrog <Alberto.Fahrenkrog@rigtechnologies.com.au>
> >>Sent: Thursday, February 23, 2023 12:42 PM
> >>To: buildroot@buildroot.org <buildroot@buildroot.org>
> >>Subject: [Buildroot] [Help] Struggling to build external python package
> >>on out of tree build
> >>
> >>You don't often get email from
> >>alberto.fahrenkrog@rigtechnologies.com.au. Learn why this is
> >>important<https://aka.ms/LearnAboutSenderIdentification
> ><https://aka.ms/LearnAboutSenderIdentification>>
> >>Hello all,
> >>
> >>I'm trying to build a very simple custom python package following the
> >>instructions on the manual, yet I must be doing something very wrong as
> >>I get this result:
> >>
> >>$ make python-koala
> >>make[1]: *** No rule to make target 'python-koala'.  Stop.
> >>make: *** [Makefile:23: _all] Error 2
> >>
> >>I create my out of tree build with:
> >>make -C ~/opt/buildroot-2021.02/ BR2_EXTERNAL=3D~/Projects/br_build
> >>O=3D~/Projects/br_build BR2_DL_DIR=3D~/Projects/br_build/downloads
> >>br_build_defconfig
> >>
> >>On my "br_build" folder I have a Config.in file:
> >>menu "Python-Libs"
> >>     source "~/Projects/br_build/package/python-koala/Config.in"
> >>endmenu
> >
> >Similar to the include file for configs, you also need an external.mk
> >file for the project make files, with this content:
> >
> >    include $(sort $(wildcard ~/Projects/br_build/package/*/*.mk))
> >
> >Otherwise your .mk files will not be picked up.
> >
> >>In "br_build/packages/python-koala/Config.in"
> >
> >The package directory is usually named 'package', not sure if this is
> >relevant (but Config.in /external.mk have to match it).
> >
> >>config BR2_PACKAGE_PYTHON_KOALA
> >>??????bool "python-koala"
> >>   depends on BR2_PACKAGE_PYTHON3
> >>??????help
> >>??????  Python implementation of Koala Library
> >>
> >>In "br_build/packages/python-koala/python-koala.mk"
> >>#######################################################################=
#########
> >>#
> >># python-koala
> >>#
> >>#######################################################################=
#########
> >>
> >>PYTHON_KOALA_VERSION =3D 1.3.3
> >>PYTHON_KOALA_SOURCE =3D $(PYTHON_KOALA_VERSION).tar.gz
> >>PYTHON_KOALA_SITE =3D
> >>https://mywebsite.com.au/ExternalCode/koala/archive/
> ><https://mywebsite.com.au/ExternalCode/koala/archive/>
> >>PYTHON_KOALA_SETUP_TYPE =3D setuptools
> >>
> >>$(eval $(python-koala))
> >>
> >>If I run "make menuconfig" I can select or deselect the package, and
> >>it's selected per default on the br_build_defconfig (and in .config):
> >>BR2_PACKAGE_PYTHON_KOALA=3Dy
> >>
> >>But if I try to run "make python-koala" I get the "no target" error.
> >>I'll still have a read and see what I might be doing wrong, but I'm
> >>very confused. Any ideas are very welcome.
> >>
> >>Cheers,
> >>
> >>Alberto
> >
> ><cut>
> >
> >Kind regards,
> >Andreas
> >_______________________________________________
> >buildroot mailing list
> >buildroot@buildroot.org
> >https://lists.buildroot.org/mailman/listinfo/buildroot
> ><https://lists.buildroot.org/mailman/listinfo/buildroot>
> >
> >_______________________________________________
> >buildroot mailing list
> >buildroot@buildroot.org
> >https://lists.buildroot.org/mailman/listinfo/buildroot

--
=2E-----------------.--------------------.------------------.--------------=
------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspira=
cy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___           =
    |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is =
no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspirac=
y.  |
'------------------------------^-------^------------------^----------------=
----'

--_000_ME3P282MB1347835B0C211FA9787F6A77B9AB9ME3P282MB1347AUSP_
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dutf-8">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Yann, Arnout, thanks a lot. I just tried this and it worked beautifully! I =
really appreciate your support.</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Cheers,</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0); background-color: rgb(255, 255, 255);" class=
=3D"elementToProof">
Alberto</div>
<div id=3D"appendonsend"></div>
<div dir=3D"ltr" style=3D"mso-line-height-rule:exactly;-webkit-text-size-ad=
just:100%;font-size:1px;direction:ltr;"><table cellpadding=3D"0" cellspacin=
g=3D"0" border=3D"0" style=3D"width:100%;font-size:1px;"><tr style=3D"font-=
size:0;"><td align=3D"left" style=3D"vertical-align:middle;"><table cellpad=
ding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;"><tr style=
=3D"font-size:0;line-height:normal;"><td align=3D"left" style=3D"padding:0;=
vertical-align:middle;"><img src=3D"cid:image506347.png@B1FD0006.E7D064D8" =
height=3D"60" border=3D"0" alt=3D"" style=3D"height:60px;min-height:60px;ma=
x-height:60px;font-size:0;" /></td></tr><tr style=3D"font-size:0;"><td alig=
n=3D"left" style=3D"padding:13px 0 0;vertical-align:top;"><table cellpaddin=
g=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;"><tr style=3D"=
font-size:0;"><td align=3D"left" style=3D"vertical-align:top;"><table cellp=
adding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#000=
001;font-style:normal;font-weight:700;white-space:nowrap;"><tr style=3D"fon=
t-size:14.67px;"><td align=3D"left" style=3D"vertical-align:top;font-family=
:Arial;">Alberto<span style=3D"font-family:remialcxesans;font-size:1px;colo=
r:#FFFFFF;line-height:1px;">&#8203;</span>&nbsp;Fahrenkrog</td><td align=
=3D"left" style=3D"vertical-align:top;font-size:0;"><table cellpadding=3D"0=
" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#000001;font-st=
yle:normal;font-weight:400;white-space:nowrap;"><tr style=3D"font-size:14.6=
7px;"><td align=3D"left" style=3D"padding:0 5px;vertical-align:top;font-fam=
ily:Arial;">&nbsp;</td></tr></table></td><td align=3D"left" style=3D"vertic=
al-align:top;font-family:Arial;font-style:italic;font-weight:400;">Senior&n=
bsp;Embedded&nbsp;Engineer&nbsp;</td></tr></table></td></tr><tr style=3D"fo=
nt-size:0;"><td align=3D"left" style=3D"vertical-align:middle;"><table cell=
padding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;color:#00=
0001;font-style:normal;font-weight:400;white-space:nowrap;"><tr style=3D"fo=
nt-size:13.33px;"><td align=3D"left" style=3D"padding:7px 0 0;vertical-alig=
n:middle;font-family:Arial;">Orica&nbsp;=E2=80=91&nbsp;Perth&nbsp;Technolog=
y&nbsp;Centre</td></tr></table></td></tr></table></td></tr><tr style=3D"fon=
t-size:0;"><td align=3D"left" style=3D"padding:0;vertical-align:top;"><tabl=
e cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;"><=
tr style=3D"font-size:0;"><td align=3D"left" style=3D"padding:4px 0 0;verti=
cal-align:top;"><table cellpadding=3D"0" cellspacing=3D"0" border=3D"0" sty=
le=3D"font-size:0;color:#000001;font-style:normal;font-weight:400;white-spa=
ce:nowrap;"><tr style=3D"font-size:13.33px;"><td align=3D"left" style=3D"ve=
rtical-align:top;font-family:Arial;">p:&nbsp;+61&nbsp;(0)&nbsp;8&nbsp;6365&=
nbsp;4056</td></tr></table></td></tr></table></td></tr><tr style=3D"font-si=
ze:0;"><td align=3D"left" style=3D"padding:5px 0 0;vertical-align:top;"><ta=
ble cellpadding=3D"0" cellspacing=3D"0" border=3D"0" style=3D"font-size:0;c=
olor:#000001;font-style:normal;font-weight:400;white-space:nowrap;"><tr sty=
le=3D"font-size:13.33px;"><td align=3D"left" style=3D"padding:0 0 3px;verti=
cal-align:top;font-family:Arial;">e:&nbsp;<a href=3D"mailto:Alberto.Fahrenk=
rog@rigtechnologies.com.au" target=3D"_blank" id=3D"LPlnk689713" style=3D"t=
ext-decoration:none;color:#000001;"><strong style=3D"font-weight:400;">Albe=
rto.Fahrenkrog@rigtechnologies.com.au</strong></a></td></tr></table></td></=
tr></table></td></tr></table></div><hr style=3D"display:inline-block;width:=
98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Yann E. MORIN &lt;yan=
n.morin.1998@free.fr&gt;<br>
<b>Sent:</b> Friday, February 24, 2023 3:54 AM<br>
<b>To:</b> Arnout Vandecappelle &lt;arnout@mind.be&gt;<br>
<b>Cc:</b> Alberto Fahrenkrog &lt;Alberto.Fahrenkrog@rigtechnologies.com.au=
&gt;; buildroot@buildroot.org &lt;buildroot@buildroot.org&gt;<br>
<b>Subject:</b> Re: [Buildroot] [Help] Struggling to build external python =
package on out of tree build</font>=0D=0A<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">Arnout, All,<br>
<br>
On 2023-02-23 20:39 +0100, Arnout Vandecappelle spake thusly:<br>
&gt; On 23/02/2023 10:13, Alberto Fahrenkrog wrote:<br>
&gt; &gt;Hi all, I'm slowly getting ahead with this, and I still have a few=
 more questions...<br>
&gt; &gt;<br>
&gt; &gt;I'm trying to get a tar.gz file from a git repo, which needs<br>
&gt; &gt;authentication. The command that works manually is:<br>
&gt; &gt;/wget <a href=3D"https://outwebsite.com/koala/archive/release1.2.3=
=2Etar.gz">https://outwebsite.com/koala/archive/release1.2.3.tar.gz</a> --h=
eader<br>
&gt; &gt;'Authorization: token MY_TOKEN'/<br>
&gt; &gt;/<br>
&gt; &gt;/<br>
&gt; &gt;And the .mk file is configured as:<br>
&gt; &gt;PYTHON_KOALA_SITE_METHOD&nbsp;=3D wget<br>
&gt; &gt;PYTHON_KOALA_DL_OPTS&nbsp;=3D --header 'Authorization: token MY_TO=
KEN'<br>
&gt; <br>
&gt;&nbsp; Since commit 3f2bdd0701de4f2bca7e6d96f96972e7bcabdd93 (by Yann, =
in Cc), it<br>
&gt; is necessary to twice-quote the arguments to wget (and wget only). So<=
br>
<br>
Oh dang, a commit from 7 years ago... ;-)<br>
<br>
&gt; PYTHON_KOALA_DL_OPTS =3D --header &quot;'Authorization: token MY_TOKEN=
'&quot;<br>
&gt; <br>
&gt;&nbsp; Yann, I honestly don't understand why this eval is needed, inste=
ad of<br>
&gt; simply passing BR2_HG unquoted... But I didn't look too deeply into it=
=2E<br>
<br>
That's because that does not work?<br>
<br>
&nbsp;&nbsp;&nbsp; $ cat ess<br>
&nbsp;&nbsp;&nbsp; #!/usr/bin/env bash<br>
&nbsp;&nbsp;&nbsp; bar() {<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; for i in &quot;${@}&quot;; do<br=
>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf '=
__%s__\n' &quot;${i}&quot;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; done<br>
&nbsp;&nbsp;&nbsp; }<br>
&nbsp;&nbsp;&nbsp; MY_CMD=3D&quot;bar '1 2 3' a b 'C D'&quot;<br>
&nbsp;&nbsp;&nbsp; ${MY_CMD} START &quot;${@}&quot; END<br>
&nbsp;&nbsp;&nbsp; echo<br>
&nbsp;&nbsp;&nbsp; MY_CMD=3D&quot;./foo '1 2 3' a b 'C D'&quot;<br>
&nbsp;&nbsp;&nbsp; ${MY_CMD} START &quot;${@}&quot; END<br>
<br>
&nbsp;&nbsp;&nbsp; $ cat foo<br>
&nbsp;&nbsp;&nbsp; #!/usr/bin/env bash<br>
&nbsp;&nbsp;&nbsp; for i in &quot;${@}&quot;; do<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; printf '&gt;&gt;%s&lt;&lt;\n' &q=
uot;${i}&quot;<br>
&nbsp;&nbsp;&nbsp; done<br>
<br>
&nbsp;&nbsp;&nbsp; $ ./ess wee woo &quot;woot woot&quot;<br>
&nbsp;&nbsp;&nbsp; __'1__<br>
&nbsp;&nbsp;&nbsp; __2__<br>
&nbsp;&nbsp;&nbsp; __3'__<br>
&nbsp;&nbsp;&nbsp; __a__<br>
&nbsp;&nbsp;&nbsp; __b__<br>
&nbsp;&nbsp;&nbsp; __'C__<br>
&nbsp;&nbsp;&nbsp; __D'__<br>
&nbsp;&nbsp;&nbsp; __START__<br>
&nbsp;&nbsp;&nbsp; __wee__<br>
&nbsp;&nbsp;&nbsp; __woo__<br>
&nbsp;&nbsp;&nbsp; __woot woot__<br>
&nbsp;&nbsp;&nbsp; __END__<br>
<br>
&nbsp;&nbsp;&nbsp; &gt;&gt;'1&lt;&lt;<br>
&nbsp;&nbsp;&nbsp; &gt;&gt;2&lt;&lt;<br>
&nbsp;&nbsp;&nbsp; &gt;&gt;3'&lt;&lt;<br>
&nbsp;&nbsp;&nbsp; &gt;&gt;a&lt;&lt;<br>
&nbsp;&nbsp;&nbsp; &gt;&gt;b&lt;&lt;<br>
&nbsp;&nbsp;&nbsp; &gt;&gt;'C&lt;&lt;<br>
&nbsp;&nbsp;&nbsp; &gt;&gt;D'&lt;&lt;<br>
&nbsp;&nbsp;&nbsp; &gt;&gt;START&lt;&lt;<br>
&nbsp;&nbsp;&nbsp; &gt;&gt;wee&lt;&lt;<br>
&nbsp;&nbsp;&nbsp; &gt;&gt;woo&lt;&lt;<br>
&nbsp;&nbsp;&nbsp; &gt;&gt;woot woot&lt;&lt;<br>
&nbsp;&nbsp;&nbsp; &gt;&gt;END&lt;&lt;<br>
<br>
So, if the command for a downloader, as provided in the .config,<br>
contains quoted material, the quotes would be part of the word.<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt;&nbsp; Regards,<br>
&gt;&nbsp; Arnout<br>
&gt; <br>
&gt; <br>
&gt; &gt;PYTHON_KOALA_SITE&nbsp;=3D <a href=3D"https://outwebsite.com/koala=
/archive/">https://outwebsite.com/koala/archive/</a><br>
&gt; &gt;&lt;<a href=3D"https://outwebsite.com/koala/archive/">https://outw=
ebsite.com/koala/archive/</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;The .mk file is being read correctly, but I can't figure out how t=
o use<br>
&gt; &gt;DL_OPTS. The manual says DL_OPTS is a space separated list, but i =
see wget<br>=0D=0A&gt; &gt;tries to use &quot;token&quot; or &quot;MY_TOKEN=
&quot; as the address. I tried a few different<br>
&gt; &gt;combinations of inverted commas, but none worked.<br>
&gt; &gt;<br>
&gt; &gt;Thanks again,<br>
&gt; &gt;<br>
&gt; &gt;Alberto<br>
&gt; &gt;/<br>
&gt; &gt;/<br>
&gt; &gt;/<br>
&gt; &gt;/<br>
&gt; &gt;Alberto=E2=80=8B&nbsp;Fahrenkrog&nbsp; <br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; Senior&nbsp;Embedded&nbsp;Engineer<br>
&gt; &gt;<br>
&gt; &gt;Orica&nbsp;=E2=80=91&nbsp;Perth&nbsp;Technology&nbsp;Centre<br>
&gt; &gt;<br>
&gt; &gt;p:&nbsp;+61&nbsp;(0)&nbsp;8&nbsp;6365&nbsp;4056<br>
&gt; &gt;<br>
&gt; &gt;e: *Alberto.Fahrenkrog@rigtechnologies.com.au*<br>
&gt; &gt;&lt;<a href=3D"mailto:Alberto.Fahrenkrog@rigtechnologies.com.au">m=
ailto:Alberto.Fahrenkrog@rigtechnologies.com.au</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;------------------------------------------------------------------=
--------------<br>
&gt; &gt;*From:* Alberto Fahrenkrog &lt;Alberto.Fahrenkrog@rigtechnologies.=
com.au&gt;<br>
&gt; &gt;*Sent:* Thursday, February 23, 2023 3:13 PM<br>
&gt; &gt;*To:* buildroot@buildroot.org &lt;buildroot@buildroot.org&gt;<br>
&gt; &gt;*Subject:* Re: [Buildroot] [Help] Struggling to build external pyt=
hon<br>
&gt; &gt;package on out of tree build<br>
&gt; &gt;Ok, I see now that external.mk is explained in chapter 9. I jumped=
<br>
&gt; &gt;straight to chapter 18 and missed external.mk completely. And for =
some<br>
&gt; &gt;reason I never found external.mk on my google searches.<br>
&gt; &gt;<br>
&gt; &gt;Thanks all for your help!<br>
&gt; &gt;<br>
&gt; &gt;Cheers,<br>
&gt; &gt;<br>
&gt; &gt;Alberto<br>
&gt; &gt;------------------------------------------------------------------=
--------------<br>
&gt; &gt;*From:* buildroot &lt;buildroot-bounces@buildroot.org&gt; on behal=
f of Alberto<br>
&gt; &gt;Fahrenkrog &lt;Alberto.Fahrenkrog@rigtechnologies.com.au&gt;<br>
&gt; &gt;*Sent:* Thursday, February 23, 2023 3:09 PM<br>
&gt; &gt;*To:* buildroot@buildroot.org &lt;buildroot@buildroot.org&gt;<br>=
=0D=0A&gt; &gt;*Subject:* Re: [Buildroot] [Help] Struggling to build extern=
al python<br>
&gt; &gt;package on out of tree build<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; &gt;You don't often get email from alberto.fahrenkrog@rigtechnologies.=
com.au.<br>
&gt; &gt;Learn why this is important<br>
&gt; &gt;&lt;<a href=3D"https://aka.ms/LearnAboutSenderIdentification">http=
s://aka.ms/LearnAboutSenderIdentification</a>&gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; <br>
&gt; &gt;<br>
&gt; &gt;Hi Andreas,<br>
&gt; &gt;<br>
&gt; &gt;Thank you so much! That did it! Where in the manual is external.mk=
<br>
&gt; &gt;explained? I missed it for sure...<br>
&gt; &gt;<br>
&gt; &gt;Cheers,<br>
&gt; &gt;<br>
&gt; &gt;Alberto<br>
&gt; &gt;Alberto=E2=80=8B&nbsp;Fahrenkrog&nbsp;&nbsp; <br>
&gt; &gt;<br>
&gt; &gt;&nbsp;&nbsp;&nbsp;&nbsp; Senior&nbsp;Embedded&nbsp;Engineer<br>
&gt; &gt;<br>
&gt; &gt;Orica&nbsp;=E2=80=91&nbsp;Perth&nbsp;Technology&nbsp;Centre<br>
&gt; &gt;<br>
&gt; &gt;p:&nbsp;+61&nbsp;(0)&nbsp;8&nbsp;6365&nbsp;4056<br>
&gt; &gt;<br>
&gt; &gt;e: *Alberto.Fahrenkrog@rigtechnologies.com.au*<br>
&gt; &gt;&lt;<a href=3D"mailto:Alberto.Fahrenkrog@rigtechnologies.com.au">m=
ailto:Alberto.Fahrenkrog@rigtechnologies.com.au</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;------------------------------------------------------------------=
--------------<br>
&gt; &gt;*From:* buildroot &lt;buildroot-bounces@buildroot.org&gt; on behal=
f of Andreas<br>
&gt; &gt;Ziegler &lt;br015@umbiko.net&gt;<br>
&gt; &gt;*Sent:* Thursday, February 23, 2023 2:49 PM<br>
&gt; &gt;*To:* Alberto Fahrenkrog &lt;Alberto.Fahrenkrog@rigtechnologies.co=
m.au&gt;<br>
&gt; &gt;*Cc:* buildroot@buildroot.org &lt;buildroot@buildroot.org&gt;<br>
&gt; &gt;*Subject:* Re: [Buildroot] [Help] Struggling to build external pyt=
hon<br>
&gt; &gt;package on out of tree build<br>
&gt; &gt;[You don't often get email from br015@umbiko.net. Learn why this i=
s<br>
&gt; &gt;important at <a href=3D"https://aka.ms/LearnAboutSenderIdentificat=
ion">https://aka.ms/LearnAboutSenderIdentification</a><br>
&gt; &gt;&lt;<a href=3D"https://aka.ms/LearnAboutSenderIdentification">http=
s://aka.ms/LearnAboutSenderIdentification</a>&gt; ]<br>
&gt; &gt;<br>
&gt; &gt;Hi Alberto,<br>
&gt; &gt;<br>
&gt; &gt;On 2023-02-23 04:47, Alberto Fahrenkrog wrote:<br>
&gt; &gt;&gt;Update,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;if I change&nbsp; $(eval $(python-koala)) to $(eval $(python-p=
ackage)) I<br>
&gt; &gt;&gt;still get the same error. I assume that might have been one mi=
stake.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;Cheers,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;Alberto<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;Alberto Fahrenkrog Senior Embedded Engineer<br>
&gt; &gt;&gt;Orica - Perth Technology Centre<br>
&gt; &gt;&gt;p: +61 (0) 8 6365 4056<br>
&gt; &gt;&gt;e: Alberto.Fahrenkrog@rigtechnologies.com.au<br>
&gt; &gt;&gt;________________________________<br>
&gt; &gt;&gt;From: buildroot &lt;buildroot-bounces@buildroot.org&gt; on beh=
alf of Alberto<br>
&gt; &gt;&gt;Fahrenkrog &lt;Alberto.Fahrenkrog@rigtechnologies.com.au&gt;<b=
r>
&gt; &gt;&gt;Sent: Thursday, February 23, 2023 12:42 PM<br>
&gt; &gt;&gt;To: buildroot@buildroot.org &lt;buildroot@buildroot.org&gt;<br=
>
&gt; &gt;&gt;Subject: [Buildroot] [Help] Struggling to build external pytho=
n package<br>
&gt; &gt;&gt;on out of tree build<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;You don't often get email from<br>
&gt; &gt;&gt;alberto.fahrenkrog@rigtechnologies.com.au. Learn why this is<b=
r>
&gt; &gt;&gt;important&lt;<a href=3D""></a>https://aka.ms/LearnAboutSenderI=
dentification<br>
&gt; &gt;&lt;<a href=3D"https://aka.ms/LearnAboutSenderIdentification">http=
s://aka.ms/LearnAboutSenderIdentification</a>&gt;&gt;<br>
&gt; &gt;&gt;Hello all,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;I'm trying to build a very simple custom python package follow=
ing the<br>
&gt; &gt;&gt;instructions on the manual, yet I must be doing something very=
 wrong as<br>
&gt; &gt;&gt;I get this result:<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;$ make python-koala<br>
&gt; &gt;&gt;make[1]: *** No rule to make target 'python-koala'.&nbsp; Stop=
=2E<br>
&gt; &gt;&gt;make: *** [Makefile:23: _all] Error 2<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;I create my out of tree build with:<br>
&gt; &gt;&gt;make -C ~/opt/buildroot-2021.02/ BR2_EXTERNAL=3D~/Projects/br_=
build<br>
&gt; &gt;&gt;O=3D~/Projects/br_build BR2_DL_DIR=3D~/Projects/br_build/downl=
oads<br>
&gt; &gt;&gt;br_build_defconfig<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;On my &quot;br_build&quot; folder I have a Config.in file:<br>
&gt; &gt;&gt;menu &quot;Python-Libs&quot;<br>
&gt; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp; source &quot;~/Projects/br_build/pack=
age/python-koala/Config.in&quot;<br>
&gt; &gt;&gt;endmenu<br>
&gt; &gt;<br>
&gt; &gt;Similar to the include file for configs, you also need an external=
=2Emk<br>
&gt; &gt;file for the project make files, with this content:<br>
&gt; &gt;<br>
&gt; &gt; &nbsp;&nbsp; include $(sort $(wildcard ~/Projects/br_build/packag=
e/*/*.mk))<br>
&gt; &gt;<br>
&gt; &gt;Otherwise your .mk files will not be picked up.<br>
&gt; &gt;<br>
&gt; &gt;&gt;In &quot;br_build/packages/python-koala/Config.in&quot;<br>
&gt; &gt;<br>
&gt; &gt;The package directory is usually named 'package', not sure if this=
 is<br>
&gt; &gt;relevant (but Config.in /external.mk have to match it).<br>
&gt; &gt;<br>
&gt; &gt;&gt;config BR2_PACKAGE_PYTHON_KOALA<br>
&gt; &gt;&gt;??????bool &quot;python-koala&quot;<br>
&gt; &gt;&gt;&nbsp;&nbsp; depends on BR2_PACKAGE_PYTHON3<br>
&gt; &gt;&gt;??????help<br>
&gt; &gt;&gt;??????&nbsp; Python implementation of Koala Library<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;In &quot;br_build/packages/python-koala/python-koala.mk&quot;<=
br>
&gt; &gt;&gt;##############################################################=
##################<br>
&gt; &gt;&gt;#<br>
&gt; &gt;&gt;# python-koala<br>
&gt; &gt;&gt;#<br>
&gt; &gt;&gt;##############################################################=
##################<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;PYTHON_KOALA_VERSION =3D 1.3.3<br>
&gt; &gt;&gt;PYTHON_KOALA_SOURCE =3D $(PYTHON_KOALA_VERSION).tar.gz<br>
&gt; &gt;&gt;PYTHON_KOALA_SITE =3D<br>
&gt; &gt;&gt;<a href=3D"https://mywebsite.com.au/ExternalCode/koala/archive=
/">https://mywebsite.com.au/ExternalCode/koala/archive/</a><br>
&gt; &gt;&lt;<a href=3D"https://mywebsite.com.au/ExternalCode/koala/archive=
/">https://mywebsite.com.au/ExternalCode/koala/archive/</a>&gt;<br>
&gt; &gt;&gt;PYTHON_KOALA_SETUP_TYPE =3D setuptools<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;$(eval $(python-koala))<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;If I run &quot;make menuconfig&quot; I can select or deselect =
the package, and<br>
&gt; &gt;&gt;it's selected per default on the br_build_defconfig (and in .c=
onfig):<br>
&gt; &gt;&gt;BR2_PACKAGE_PYTHON_KOALA=3Dy<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;But if I try to run &quot;make python-koala&quot; I get the &q=
uot;no target&quot; error.<br>
&gt; &gt;&gt;I'll still have a read and see what I might be doing wrong, bu=
t I'm<br>
&gt; &gt;&gt;very confused. Any ideas are very welcome.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;Cheers,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt;Alberto<br>
&gt; &gt;<br>
&gt; &gt;&lt;cut&gt;<br>
&gt; &gt;<br>
&gt; &gt;Kind regards,<br>
&gt; &gt;Andreas<br>
&gt; &gt;_______________________________________________<br>
&gt; &gt;buildroot mailing list<br>
&gt; &gt;buildroot@buildroot.org<br>
&gt; &gt;<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot"=
>https://lists.buildroot.org/mailman/listinfo/buildroot</a><br>
&gt; &gt;&lt;<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildr=
oot">https://lists.buildroot.org/mailman/listinfo/buildroot</a>&gt;<br>
&gt; &gt;<br>
&gt; &gt;_______________________________________________<br>
&gt; &gt;buildroot mailing list<br>
&gt; &gt;buildroot@buildroot.org<br>
&gt; &gt;<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot"=
>https://lists.buildroot.org/mailman/listinfo/buildroot</a><br>
<br>
-- <br>
=2E-----------------.--------------------.------------------.--------------=
------.<br>
|&nbsp; Yann E. MORIN&nbsp; | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics' conspiracy: |<br>
| +33 662 376 056 | Software&nbsp; Designer | \ / CAMPAIGN&nbsp;&nbsp;&nbsp=
;&nbsp; |&nbsp; ___&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp; |<br>
| +33 561 099 427 `------------.-------:&nbsp; X&nbsp; AGAINST&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp; |&nbsp; \e/&nbsp; There is no&nbsp; |<br>
| <a href=3D"http://ymorin.is-a-geek.org/">http://ymorin.is-a-geek.org/</a>=
 | _/*\_ | / \ HTML MAIL&nbsp;&nbsp;&nbsp; |&nbsp;&nbsp; v&nbsp;&nbsp; cons=
piracy.&nbsp; |<br>
'------------------------------^-------^------------------^----------------=
----'<br>
</div>
</span></font></div>
</body>
</html>

--_000_ME3P282MB1347835B0C211FA9787F6A77B9AB9ME3P282MB1347AUSP_--

------_=_NextPart_f79c20a3-ef81-420b-ac17-443fd50f589f
Content-Type: image/png;
	name="image506347.png"
Content-Transfer-Encoding: base64
Content-ID: <image506347.png@B1FD0006.E7D064D8>
Content-Description: image506347.png
Content-Disposition: inline;
	creation-date="Thu, 23 Feb 2023 23:47:05 +0000";
	filename=image506347.png;
	modification-date="Thu, 23 Feb 2023 23:47:05 +0000";
	size=14270

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
YUYrfJl7ad4AAAAASUVORK5CYII=

------_=_NextPart_f79c20a3-ef81-420b-ac17-443fd50f589f--

--===============6954479387717767501==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6954479387717767501==--
