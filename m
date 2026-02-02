Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7944BE73158
	for <buildroot@archiver.kernel.org>; Mon,  2 Feb 2026 13:15:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2CFEB40A72;
	Mon,  2 Feb 2026 13:15:45 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n4xVkFc7Yk0D; Mon,  2 Feb 2026 13:15:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46E9440AB0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770038144;
	bh=LNb7EPgxaRnTAT6uedcBULo4p0oC8dQfvCmgdbj1/CU=;
	h=From:To:CC:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=bJw4eh2+lR+LTxevGoZOSf4lb6PNutEKxVtQWYjN5LtWGzSCa/OUDfx+A+vUE/eMt
	 epx3mcZIoLQEHU4u5Rq6FcOtXCw4GOGzdrVvcl5Wv4oMTXltRtOE3aaQf7v4wqZ8OE
	 SuYIX2p/T9ILz7N94DskxWAlZAGNVb/keSUd2fmHqv9FAKS+x3VWkdSVi3nYlo+HUa
	 7IEsBeEX2vfKJUK5JzNutNoKArg/9bRF8o9mZbLHAl54pX3U+ya1wpjcI5eVxHIfFp
	 u6AwYn799iU5+oBrnhDI7na5i4FGN0ldzGDnrSTITmY+KbTSvPxQWigSGpjENLAWnA
	 cMpCRdqE8zPHg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46E9440AB0;
	Mon,  2 Feb 2026 13:15:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 88BE61E0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:15:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7651A40AB0
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:15:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qd4ApgxUk5E2 for <buildroot@buildroot.org>;
 Mon,  2 Feb 2026 13:15:41 +0000 (UTC)
Received-SPF: Permerror (mailfrom) identity=mailfrom;
 client-ip=2001:489a:2202:d::60b;
 helo=usg02-cy1-obe.outbound.protection.office365.us;
 envelope-from=vfazio@xes-inc.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org AFE8540A72
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AFE8540A72
Received: from USG02-CY1-obe.outbound.protection.office365.us
 (mail-cy1usg02on060b.outbound.protection.office365.us
 [IPv6:2001:489a:2202:d::60b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id AFE8540A72
 for <buildroot@buildroot.org>; Mon,  2 Feb 2026 13:15:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector5401; d=microsoft.com; cv=none;
 b=dKcw59KKGrxlN9ebyu5GvY8bAN+R2PcWBoqH4WpB081qhT7bSQWrJ9ywaSfsVh7UoYNsh3WCOzCI0WcRD9pVP3Qe0lj0oUdP0Z+JY5RLgRR2f+0/Qrtbf0r4cZgU5PXxt0ZjIlx++V31F0NF+u6E5Dhxtdf9dSFXCf8L8hzCtMzM/jZf80R9vN+hNz3/qCbZt3Md20E4T2sbnUJ/20mDvcuJBRsaTyOhC9C9nVRzxmpFS1AdpKVEPSx9QOcLvcPg5dWJDXPLK8U5klbKj0Nw9boJoM4G5x0DOfiNKXlIdvuCmRiXCjKB3A8dfwVJfxgUQJ+hjU81KqktgOXmxIzElQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector5401;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gc9lTqomU+9PX4vlItOw5Gsw1i+rte1akH/GbayAjV8=;
 b=y8k6iph2VGDLwIJcaZOlML3VCocmq6pfyS3NpKAvUnZdikIiPHxdauU8BGDLjjF+NWjkrvYmZ8gZJpiaMxp7EJdnrCsRERtburBwqFuOliAE3GnlHEhYYRLACqgd873zwCuSDNjrCeb+s4idZMHkrW5Y9nEryd1VBux0e78TFgSOZkYTaxPE752nOgs/jJcNgmYsFbrwaLfqZ67X3wj+g2M98mtqsgVyBSIWPlwkgtJFxE9jpAzqVZ2CDag9shqOqkzOCaRzZbNidtMXMwQo91WOu2OxBpu4cfiPSS73VGIbFON0P2t84BLDyivVcKXWZzublP8GsUoiLLnK6M3cbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=xes-inc.com; dmarc=pass action=none header.from=xes-inc.com;
 dkim=pass header.d=xes-inc.com; arc=none
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:18b::15)
 by PH1P110MB1067.NAMP110.PROD.OUTLOOK.COM (2001:489a:200:177::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.16; Mon, 2 Feb
 2026 13:15:35 +0000
Received: from PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e]) by PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
 ([fe80::71c7:106d:6bd3:fa2e%5]) with mapi id 15.20.9564.016; Mon, 2 Feb 2026
 13:15:35 +0000
From: Vincent Fazio <vfazio@xes-inc.com>
To: Romain Naour <romain.naour@smile.fr>
CC: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] [PATCH] package/avocado: bump version to 113.0
Thread-Index: AdyURfjSEzMhJoDiQoaqOu4mjjhCWQ==
Date: Mon, 2 Feb 2026 13:15:35 +0000
Message-ID: <PH1P110MB16030B77E5503CD641BA48AF9F9AA@PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH1P110MB1603:EE_|PH1P110MB1067:EE_
x-ms-office365-filtering-correlation-id: 26cc461f-3965-4072-2433-08de625d26f6
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|41320700013|1800799024|38070700021; 
x-microsoft-antispam-message-info: =?us-ascii?Q?Ri10LCOClUJjFpyMVgDj13tLeC7W7+AHMvZyJreVVpUiVV8fPxgvG0xAlY81?=
 =?us-ascii?Q?H5up+jKVo+c60aRQ48pjTUIA12NFIY9D5et18mE6sUxb2tkmUtnVkbY6YOZr?=
 =?us-ascii?Q?00d+A06JBURwQCUR3n4SyRWLRWj84i4w2y2r8RIrYXZwx/GCdJTe9oOixZmr?=
 =?us-ascii?Q?lYxoBBlebigxpILHJZcMdafFvTFsqaRJiIBjGAwnae2ldZVBa+12uBXBUwim?=
 =?us-ascii?Q?IVX0HmL8PsjhmTmM/oFSJOlpHLepiWr/Ce/Q84aniQrjxmnL/tO2x0KFzuyx?=
 =?us-ascii?Q?d3LEMX9ewDRxK/U/v5jhnBkUxxOH/f/ayC5MDRNu71Dbmm/F4fCIl3B5F3Zd?=
 =?us-ascii?Q?ZJI5PQI9UyjoruWJl33jRCW+hJOK5Jk9feMa9nj16njF0ahoZGFEbHVvb19X?=
 =?us-ascii?Q?blkXIBKISciNvZBpyA4ywVCBNxbhxVfK7xXxOoPhT10KSXdcVr0qZP1LKm4/?=
 =?us-ascii?Q?jBDyE6P8I27yaGQ+PQAhM5/cqZRptU+Er+VOVN6ICR53N9JwkyG5kby5aJ6k?=
 =?us-ascii?Q?Z4AxSL1zSKgGqCsgoaAxsrzQA6P8A1zl8DWRkWTM6Jjl5tTdx6HYI7f0EGPC?=
 =?us-ascii?Q?AWcipFTg+Tj4BrKkQd9GqFAFFIPMP8b+vWwrDYZGmgvZTmq8JmIj7j+uCD9z?=
 =?us-ascii?Q?FIDE8p0mkIzgCayvlGYyuxb5dZU9tY4xxawTDKrDm6Ra8ky/lXfXF+nym7M6?=
 =?us-ascii?Q?/geVlNGrB+qU8YAyho/j29i5wYkgD8pPsnnwpVyfOcqojSFRoBIi2D5AARH9?=
 =?us-ascii?Q?YA4gJwKfG/oKFEfkU3AuzAer4fM2ifvsAlQ796fUxuaMzKf1jV1zzaQ6d+AT?=
 =?us-ascii?Q?2ZUIxQw4bZdVjyjuonk4onOgjm1EYNrqIO/foPdEwJ46rmmeAwud1E6bh0C1?=
 =?us-ascii?Q?RFCFISDl6mq2+JLyyKqQtummEt7tr0XfYiKnRugJiz/rstaDQRwkkXE+ndqN?=
 =?us-ascii?Q?xC97p0fiFTcEAmiXtzzzThpi1pGtz+qrp2oYKUvp5Ul0jFRVubiRVwSGz5UA?=
 =?us-ascii?Q?Q65p/tCCVsJJB1YgxuuO2fk563iLPG/VPT61HbNU5I9OyeUVrPWiru0YKg5A?=
 =?us-ascii?Q?kijUmHgFXUmfHMst+KpUHLBPE/i2zdQTfUlfY+6I5/V8BklQwW0/RV+LI7br?=
 =?us-ascii?Q?fzKohBmJ+3kZcQKNSkpTGA/DiGRzc9r17ghZblBTUMygmpOEBJKCwOpw7iWP?=
 =?us-ascii?Q?Nnf237FEFOQWaS4KiFVEfNT/5lBjPuDyFPx7SSjWP7S9I2/uwmBINWtJaN1P?=
 =?us-ascii?Q?wyVdxE6jdHAxB510LV4VcrXoYG02VUijg8xngYbeCdKDkXG8iY7fmo0REaJ3?=
 =?us-ascii?Q?QYf1yCMGE0XVYjrz+Kct8yJyfuCKTu/7ATIdEdU3DAncNcR5hT3LqOg/zU23?=
 =?us-ascii?Q?kXTk6wH5ueSggGvs6CtDuzjJJid3k7K8xbTQdeAdSp86Hmkz9fS+mSYfB1a1?=
 =?us-ascii?Q?+CdK7DlnAeDaRvGmOydUhiYRS02H1DmriItTIn9hvyq1V4CrCmLPaiEDmy0v?=
 =?us-ascii?Q?ne8D3z56Q6YVh/O6istHKIvabwcPDA/jIzFeQGo6Ij5CekgIV8NKOdFpBhcl?=
 =?us-ascii?Q?NKaPeKOkx04lHPPN4f06o4A6ne4uIT9xeyw4AWWSqXvalssotK/DHVlxuH4L?=
 =?us-ascii?Q?Ap5vAGt1F2XLvZB4umjTGQo=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(41320700013)(1800799024)(38070700021); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?fIFrB5/NBYo7HqacM2uPw28JP+lAziuLjWmaMFUlon76fp57O6icnOC0X/KN?=
 =?us-ascii?Q?xjGxHlRvjaf0cschO98VjPy6r3NxUx7lkg8dlxSVQisLExOcDy4BEc1BkOmA?=
 =?us-ascii?Q?ez+Zcft0+eQ95xnftthdJ+45iyZfCZd4cZosbXAKbBgy7baa5/VMjyWYlIYL?=
 =?us-ascii?Q?1j3PdnOPp0/w+O+Z/1Pqi5KPhpTvrxUuPA6U6QYd6J3sPOYQAwvtriMMttAE?=
 =?us-ascii?Q?MEGTIpPgtC0TaqVISB8WWlMKUEWc2SWyc9hmtIwZasAgzw8mA+VisJtquw9G?=
 =?us-ascii?Q?/F3dWfOOYl3zGxOQmIRtkmgd+/AWqAaEtqXoQenhY2eSLNgxTof7FlOAV5lb?=
 =?us-ascii?Q?yLSUGcNeyvf8FVAMLS81W63RDTmH7Wm0QhheK7r9OhNMoq3hnyOhyDXKMeeF?=
 =?us-ascii?Q?vY9jMGf0MLCAAcyOA4MWvU/Nj4ISldqiNW5h+9ztEcwPI0HGGtXY0KtWvSct?=
 =?us-ascii?Q?JoYvneAl7cKK7EOBKnqSyXENN63q0W0pj2XZYXblF067uxwU0Q8lEdC4gueQ?=
 =?us-ascii?Q?e/2ulw6EpRRU9w2OpHrvHi8EcJnL5t3fhZWSSS5MimS+cRMscwyrggp5ovYH?=
 =?us-ascii?Q?DfM2HPcrj0dVGA8Flnj5lZ9Gggl0C+RDA5Qx66doSDA2BErOIAT62+A66GM7?=
 =?us-ascii?Q?tFfeAI1vY2vFKE5Svp4ZhzOVr+IrUR/ediLQ9GhLp95qbi4C1aTHFeLxh7LC?=
 =?us-ascii?Q?1+6i+Wwhm4EWjIMQhMi94z0rPqPwpPQBJNOCrksqGiGteLiShj6zQQjRLYfL?=
 =?us-ascii?Q?7C+4KRjBL78pu2/rPmdlqYbJNZu4DJ1qoQPmQXrS5aZI+/C302I2QgCl6rgs?=
 =?us-ascii?Q?qNIfkMRKdzxywlNoSlqHPR7GombB17y+bXQuUCZ1Pu7PvP8gwZyiEEZYYWxy?=
 =?us-ascii?Q?UWR8O5F+K9k446PldDN5quEFCCpqJd5x0Ojaa3nG+NqBVkULfRHEBPDBG9FF?=
 =?us-ascii?Q?yfapC0OcoXlIVQNNFTMNMkxlWCwLdZ7dhq/A106BKv4xL7JeXTIB0bJIHc9m?=
 =?us-ascii?Q?XJDDE13vwPM2gFcBkwJETmQTjLUqrWbgAKZMskGhTxmooetqJvBaYgHHDKiR?=
 =?us-ascii?Q?n6ybimem+wvYTWVrkBiyic2H8B40WhV9EX9Bg96LihoCEW7QS2krAbsJGIRW?=
 =?us-ascii?Q?LKBwWzuPiTGDSLWvA6RasYKgNApea2kpgElXV+DTHhalihJQFxkgw6uYmZ0K?=
 =?us-ascii?Q?4VuE9lVe2iq3U5jagg6vya3/bfsqtFgyeapUpW74i5Xq3GOdanJcgH1ySXlV?=
 =?us-ascii?Q?RqwT8ystJpaACKrvt8iCLbXatnbYzDD37LTrr57DiRtGyg45q0ncAGZcgzta?=
 =?us-ascii?Q?t3DYk9UXhA/cbOkjxM7Bq1MJNuf4hn/xpuRCEN6NtG5livna44uD2e4TUX0t?=
 =?us-ascii?Q?ik+afIT63X1imHf3BEq+8dO9pp4SZE/QRDmetxDv97VLXUWGrBsfdJ9PefeQ?=
 =?us-ascii?Q?usDzAAGlJTnmyp6e41U/W3qw+ac8ZDsNrZP/MzZyox+Y0zMLtiwwxLHSrtpv?=
 =?us-ascii?Q?lXsz6WIOKlHecxI=3D?=
MIME-Version: 1.0
X-OriginatorOrg: xes-inc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH1P110MB1603.NAMP110.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 26cc461f-3965-4072-2433-08de625d26f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Feb 2026 13:15:35.7888 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2925f1cd-bdc3-4a76-bb38-6159e20a17f1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH1P110MB1067
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xes-inc.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gc9lTqomU+9PX4vlItOw5Gsw1i+rte1akH/GbayAjV8=;
 b=G1f4gX4g4x9wuHXUmkzp7K8cez+6YQSWZ19jNpUnhkQs+HJd8SZRUhYVaa5xt6Gbg1dAN7Ej3AvetbotvGDOIOCzbcKQuDXzivFTQeh5D7ql3wctb+I6H7Z9VG/0sOYGjPakKR3zFsT5kBYKTWsrWKk+8YvLQEeNcAXVmOHTugV0zeBC9p1+AdYWqWlfVGDFjM6WjcHLS1N13KgjGVRc7OI+wN9fGZPuzHJHpqENxyp5f2wk4vbPWKlOnOieGRIcG6kfaapTB/XgdLOmoTsLE1DxXSgwl9stElRmUKoOMwszXuUg9lnI7LKRkp4Al+pcqBOU1h/6D7pU5oOHpiwsBA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=xes-inc.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=xes-inc.com header.i=@xes-inc.com header.a=rsa-sha256
 header.s=selector1 header.b=G1f4gX4g
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=xes-inc.com;
Subject: Re: [Buildroot] [PATCH] package/avocado: bump version to 113.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

> -----Original Message-----
> From: buildroot <buildroot-bounces@buildroot.org> On Behalf Of Romain
> Naour via buildroot
> Sent: Monday, February 2, 2026 5:19 AM
> To: buildroot@buildroot.org
> Cc: Romain Naour <romain.naour@smile.fr>
> Subject: [External] - [Buildroot] [PATCH] package/avocado: bump version to
> 113.0
> 
> Our avocado version is old and requires fixes introduced in 112.0 to
> support python 3.14 [1].
> 
> [1] https://github.com/avocado-
> framework/avocado/commit/c1de44fabc047f149d6a9f742adecd8ed5cf939d
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/12944797019
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>

Tested-by: Vincent Fazio <vfazio@xes-inc.com>

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
