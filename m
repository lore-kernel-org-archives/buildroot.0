Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14765CCFA05
	for <buildroot@archiver.kernel.org>; Fri,  7 Nov 2025 02:45:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8FFC48418B;
	Fri,  7 Nov 2025 02:45:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id a-vCCaWJ02zx; Fri,  7 Nov 2025 02:45:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AC1B084194
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id AC1B084194;
	Fri,  7 Nov 2025 02:45:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E3C31CD
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 02:45:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 03A83607FF
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 02:45:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dkZnOkK4lx9n for <buildroot@buildroot.org>;
 Fri,  7 Nov 2025 02:45:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:d202::3;
 helo=gvxpr05cu001.outbound.protection.outlook.com;
 envelope-from=neustradamus@hotmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 47F0E607F7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47F0E607F7
Received: from GVXPR05CU001.outbound.protection.outlook.com
 (mail-swedencentralazolkn190130003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:d202::3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 47F0E607F7
 for <buildroot@buildroot.org>; Fri,  7 Nov 2025 02:45:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F/L5qo/6H28RudLF7FDXPbqeZNFBVz1WwHWRMkODd7Fa9UqGc4Er1orsXLrzvTFFXZWBqJmhGdEcxlU6SiSpUQhGy9TzgrG6ok35usuzdM94Yws05TN1rraNNz4eYSi0GIZPe8bNmN88OMFy6usjxmwqs12YuIsrVrqIhwUJ3gTm1SsARJXaJni/xMhiBaNRI+zgJ9MgYNq7eu2jCSiUlLD+xvwy/BL7fEJZbQMht2Qattttc17t+o80QhycIGHAsJUJKLj5dUDM3heGAv5cFLC6F6YWq/1qq/ixW/qp6Cf21EkBQSkMvgTRo0Rufa66PcK87+Jko2I4A0zVCzcoBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vo9wHs8SQB+2gMYQoFj8oG1i2tbjO5HVRPzr7zR4j7M=;
 b=nMRZuAnmX6Lq3QpL0N3m1McJfGn2W+VNP7Y3egrb7DUoqf2q69njauPUWrm4ZryIBFcHOCZL3s6QU69gHTSu7OJxpxIn2iMECN0T0t6C3Bxc0IJFxwDR5O49omz1LCMHzb1Rfx9zqJzouFdZ0WF1RcD2hQ3pvABr5dmfnwCtaIEAuJmf65WMpqSZmkKejZ2pgQgESDctgBTGo3Z2a8Q5ctIzoVEIFoTJX6gLK2Fd26Pe8KYIkg6RnB4Mvb9pIM2FsiqDS0RUM+1HpNMsMRTivbCBiIX/X9SVBnTLPLY6RztLEwUOQ6XJkRmksRMj6g6pqdoSeQaDCKGtP8SaKnhF5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from AS8PR10MB7427.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:5ab::22)
 by VI0PR10MB8764.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:800:233::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.8; Fri, 7 Nov
 2025 02:45:34 +0000
Received: from AS8PR10MB7427.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9172:20d1:3f36:a3d]) by AS8PR10MB7427.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::9172:20d1:3f36:a3d%4]) with mapi id 15.20.9298.010; Fri, 7 Nov 2025
 02:45:33 +0000
From: * Neustradamus * <neustradamus@hotmail.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>, "busybox@busybox.net"
 <busybox@busybox.net>, "info@osuosl.org" <info@osuosl.org>,
 "lance@osuosl.org" <lance@osuosl.org>
Thread-Topic: Received e-mails in Spams (bad e-mail server configuration / ML
 configuration)
Thread-Index: AQHcT4xbVq5Ku2J4Nka9RWjX3L3RgQ==
Date: Fri, 7 Nov 2025 02:45:30 +0000
Message-ID: <AS8PR10MB742728280F2CAFF7D46D7EEECBC3A@AS8PR10MB7427.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: en-US, fr-FR
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS8PR10MB7427:EE_|VI0PR10MB8764:EE_
x-ms-office365-filtering-correlation-id: 596b41fe-7a54-4de0-16bb-08de1da7b749
x-ms-exchange-slblob-mailprops: EgT5Wr3QDKxJXwPqhMYR24O0rVJ87o22vqZp64iIV8E2GRaakg4evZW70lpNQP60ncAb1x0ksKSqnb0cXP/8sc000o8GND6XHbMvRDwXSLTbcq37p+b9dKCA5uqHZZwtGDaDKWYrL+9UwRHwpWYOpS1LvJdVzYen4e1CMAEMLoO/p57bPeJYNlUPk+lfin1n33thacez69WylQBgG8q6NLV1SjFKFa7fMosEHDRMssxnw+TIaYUFBa/cH/EnSkVeyVERqviyqoRj9X78YQIwBS1cFMUFN5cw2yFHE6ABzxrE/wKWddKb0pWtnimSESMdynj0XrsU1toApi+dCG7ljsvf62lrzD4v7jUXbvUwzkLh1WAbeSH9SFljE1TWtBg+cTyoxBi5FehLAlEH0pXwrwyqFdf9iCZqHd7FRGW7hBFQzg9uMuEvgj2wwV0iN7hZk8GyaJMql2I5nSOSBstRi5WT1Tz+GxErhQu4jutzBBOSH3qCmfsG76Kr6ph0a6N6g5gKqHixipdYsH/IuPnAVAp4cK0qKzkl1gxJyVmrQZUxFug20WdLIUFXwFzfT6e+t7SB031eMuHTwe3/uFkr/U7vVdNcTI/8+liyPyJTiF26W/Pq0Zq8MPdnZJkSFNfllw4IedoQDiH6fkz5o+1YwzwBx45s3XYmQ/CILzx6DrQGLx+A23PlCBZBqRSxiLOp1rj37QqIVukm4C0ydXlBT/gvzrQ2PB0PK+AWRGwYe2I=
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799012|8060799015|19110799012|8062599012|15030799006|461199028|31061999003|39105399006|40105399003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: =?iso-8859-1?Q?g8hoKQYEXZZzBrQAUq0e9b1TgiXGLgJUEW18vI3RQV627+qNCGv0SYZPBj?=
 =?iso-8859-1?Q?zFZsaw2U1QdYN/qfLubmLDPS2ZjvykhjOREQ/IQ2J+gj+M6ngMEMZHBOJv?=
 =?iso-8859-1?Q?tn98GPAtIIIDUnCoWxGB7HFaiGIdtR/03Qln1APzBuYZRTcaLCcHKAAq+Y?=
 =?iso-8859-1?Q?FgKMN8yrZma6WagBrPjf13ewUhapR5kAKT4SmY9kZyBLyD71O+mDsMgrI8?=
 =?iso-8859-1?Q?UCTAb1sBoAVcBZY+Egclx7Kzp4YREcTHz/Xv1xoiVssTgVdCAABSBmVL7k?=
 =?iso-8859-1?Q?/9vAynXwViyCgd77LjtbPHuPjwqwHpi9wp3T0jkTmE1I37rVP3LYnbyeOj?=
 =?iso-8859-1?Q?6le/DT+KBg1TBHq2ShyDF0zJ5yoDxtOAGkVIZevQnURDPrQ7HOvHUivWq6?=
 =?iso-8859-1?Q?AN3SEvzH/ko5mA8hQl8XaNJnoaLPka5+wWi0qzis5nbY5Owl8PkRHevKaj?=
 =?iso-8859-1?Q?5DCtpxOiqIT/2EaKQ/SAQ/3AUBjy+VdPLUkJLINSTG1T5S6GaD2h4Ldt88?=
 =?iso-8859-1?Q?/0KXSbB0uRAQiFEFHVvxY6EX635W5ABsF37PX9FVunjKzUIPFCqAuHax0b?=
 =?iso-8859-1?Q?IZ2WYvOy5Avywlr67qbXHviK4QWhACPuTuHDfaExFLoDKviimtgIGnd6Fp?=
 =?iso-8859-1?Q?LTRe7XJGkFkR9deLvATX6QZJyyLouohRX674CK4WAXSRof/50w2Adc4qoX?=
 =?iso-8859-1?Q?QqNckWO+dmr8Vc6Iw8n8lhhcrwUS3Ev3YOAzw+cCe0EiPg7i0b4VNfACkE?=
 =?iso-8859-1?Q?UYOVALuipqPPBqUfgdndcXH9I++eSL48OA5DYSIz9fxq5fqLq1/2tswheu?=
 =?iso-8859-1?Q?L1Emb6HEPQCExj6VVd8HmsasFxn8SJfoeAXm4q1OtLOA7ehjQtSU0yHPtI?=
 =?iso-8859-1?Q?w2xrTXgOttZtsbJ2Svx6z/KpBi4GwiRo7OrEyBsB7Kx9osnw4DhW8n1H3j?=
 =?iso-8859-1?Q?9oAg71LJ8SHsInT+Oz4ZiHLsKmRN1fGPPCl5PqQtOWcalGzbvdu/BZSlHk?=
 =?iso-8859-1?Q?Q2VyVVDevKb/puzdedKcSPYl5N2BYjxGVzG0MYq9u3rNR1Xi7CbxcjeqyZ?=
 =?iso-8859-1?Q?Bp/5cc44qM6OzmhoUBH1SdlLPyeUcUIqIGrpf46yg3plfD7DYKBaU/RhDx?=
 =?iso-8859-1?Q?SCQkHroRgnWViy6UJRYl6lu5mqxScoMOb5Z5xqG7wlK/TQPL39XuWEkTBd?=
 =?iso-8859-1?Q?V+Wt5QRiEDIcntNitUTmi9LwBnsGIhIk8qpAMN2Iso9Mi1qEphhMoyow2Y?=
 =?iso-8859-1?Q?3ryTR7OMipZNbEsL5gLw=3D=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?NwKi8zZDMSsBzgsc3DblUwwgp6cXg6X95hoB2nzrZi++k5xmCjzVe5ZWKc?=
 =?iso-8859-1?Q?VGmV8DMDFiJ2yLdDdMGeYTuKISExEsHdiGVG+8JYn2Vamu1iK+DfkZcx5g?=
 =?iso-8859-1?Q?tO7cXSDyazNmTq4JjNgA0FM0Zcc2ooeNiU2uBCwgYeNWtOiNo4oUzSQlKd?=
 =?iso-8859-1?Q?ndpFbOeSgqjgvjbBo5Rj42rY82s74/0uAtZ5qXt0+Vt/pqkDSC9CBv1NA8?=
 =?iso-8859-1?Q?sWZjD66KAZ+psTOu837LGrEXtmMb5f2aVRYbSpy1AbCbaKRchDgeN2OQ0x?=
 =?iso-8859-1?Q?3ZRL8Ev5uU0ura4MYlu3flN4JX+2zZ4vNF1jXFKmxuj6nY+BMuN5aR+GXq?=
 =?iso-8859-1?Q?ftD08fuJnJBdhbH0YCL32/BJiPAljoFGJWGySy5z4wpgj0TIX2cJxcCGte?=
 =?iso-8859-1?Q?+X+Bb12AZDd27SZo5vISgLQc1NKMqoZVbCwWLrXqHIYMOMx01utGPp6TtH?=
 =?iso-8859-1?Q?+ISyd3uq0BfU9fxOUS4/9n+0GfNaEBpHJDTgCvsGinrXycHk9UM24cf41x?=
 =?iso-8859-1?Q?Y0+hp5SBGa9N8UVlojLLtkctxfk2FQEnumucmxsR3kHdF/g7UFSvApPjhM?=
 =?iso-8859-1?Q?zjAWLcXsocvRkbQKlPp6hllr70Bnu6G7dXNUDcOrcqROcnNU4Tvm8sMHWw?=
 =?iso-8859-1?Q?SpKFs1TGTxtSeBqP1OtK2CnqHOTwOPupq3k7O9WwwfhGLwqPLO6BKNf9op?=
 =?iso-8859-1?Q?HQrL34O7vsomlRVkqyHnz7FU2XgTZvU7hvH9oEVVgtkt4+/3u+ZWuUgB1Y?=
 =?iso-8859-1?Q?JXDV0DGGJ8eyOyP7PDOHiAFi22P34cHadRLGSmw2IIY1hET17UCMJSGSiC?=
 =?iso-8859-1?Q?uKVAhkLWZvYi21e6FVChMDBsPpu4uwDZz7txRZtiUFRdXMddRFoDg57n1R?=
 =?iso-8859-1?Q?v/YM3AI9FIDItLIdL76l3ZQykJHpVz9DgpfppCosfPcV5cYKWO737y3/48?=
 =?iso-8859-1?Q?+I3BigTuEE9j+0UIjt7Iie22cutFfUVPKgnN4NDogLGrmwbKHWtKhYChrT?=
 =?iso-8859-1?Q?FcVM4jUa60k8mAfUgFuga6kGdsh4lJgFwl9j+KHIn1n8lW2fTOsF9FJjAb?=
 =?iso-8859-1?Q?q+lZsMdseUNl3tVbj7rwMMJmFiF9hx3NUddKHOgbl7sAg5xK5p8Afuj5QH?=
 =?iso-8859-1?Q?WMA+tiNju0kDGw915i344r+a/5sSM2qwIAq65pebqWny9ZmxQmw35j4LgR?=
 =?iso-8859-1?Q?YzE2wHQIt45NfaCRiIMOs1NsrPbVshxU9J/XHk28lK+0A15bZ6bycz5VZB?=
 =?iso-8859-1?Q?uTicf7H+cSNL4XyJSkXsHxDXDrOA6/PzLbrMGIeKs=3D?=
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-8534-18-msonline-outlook-89c8f.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS8PR10MB7427.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 596b41fe-7a54-4de0-16bb-08de1da7b749
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Nov 2025 02:45:30.4547 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR10MB8764
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hotmail.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vo9wHs8SQB+2gMYQoFj8oG1i2tbjO5HVRPzr7zR4j7M=;
 b=OX1aaKFwpIZY+CxOz1JpkviE9GxdyWub99teErE2iXd+QTP9/+hlJlT3wjPGyJo0JqQbMQjSQIcgnZGBrZEHIVip8Zu3tZQ1R5G6uwZ4qFsRWdyMVkmZDmfpRL4rk0chULU/EjowUtyEIkr+YyceJi8aVTc/9tYcU4EeOFT13WzeH3ObWRD78ZWEfmowUwjNy/Hax/fAUx6JrhUi1iWfjX1GHv7OFghQuQcaQYmiA1fW7b8G8voHPClHKI+KTEeDCqGpl76iml22eY3i//yS4wKoOvDMu7fZfU4BccH+gNCkjuu72OAfxSq83jiIv+nuX2jOvyQPr494o78jArdK9A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=hotmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=hotmail.com header.i=@hotmail.com header.a=rsa-sha256
 header.s=selector1 header.b=OX1aaKFw
Subject: [Buildroot] Received e-mails in Spams (bad e-mail server
 configuration / ML configuration)
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

Dear Buildroot team (now in public) and Busybox team, OSU Open Source Lab (Oregon State University) team,

Can you solve the problem of e-mails always detected in "Junk Emails"/"Spams" folder?
SPF/DKIM/DMARC

I suppose it is linked to all projects, here for example for buildroot/busybox project, a part of several e-mail logs:
...
Authentication-Results: spf=pass (sender IP is XXX.XXX.XXX.XXX)
 smtp.mailfrom=buildroot.org; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=gmail.com;
Received-SPF: Pass (protection.outlook.com: domain of buildroot.org designates
 XXX.XXX.XXX.XXX as permitted sender) receiver=protection.outlook.com;
 client-ip=XXX.XXX.XXX.XXX; helo=smtp3.osuosl.org; pr=C
...
-------------
...
Authentication-Results: spf=pass (sender IP is XXX.XXX.XXX.XXX)
 smtp.mailfrom=buildroot.org; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=amarulasolutions.com;
Received-SPF: Pass (protection.outlook.com: domain of buildroot.org designates
 XXX.XXX.XXX.XXX as permitted sender) receiver=protection.outlook.com;
 client-ip=XXX.XXX.XXX.XXX; helo=smtp3.osuosl.org; pr=C
...
-------------
...
Authentication-Results: spf=pass (sender IP is XXX.XXX.XXX.XXX)
 smtp.mailfrom=busybox.net; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine
 header.from=googlemail.com;compauth=fail reason=000
Received-SPF: Pass (protection.outlook.com: domain of busybox.net designates
 XXX.XXX.XXX.XXX as permitted sender) receiver=protection.outlook.com;
 client-ip=XXX.XXX.XXX.XXX; helo=smtp4.osuosl.org; pr=C
...
-------------
...
Authentication-Results: spf=none (sender IP is XXX.XXX.XXX.XXX)
 smtp.helo=smtp1.osuosl.org; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=osuosl.org;compauth=pass
 reason=105
Received-SPF: None (protection.outlook.com: smtp1.osuosl.org does not
 designate permitted sender hosts)
...
-------------
...
Authentication-Results: spf=pass (sender IP is XXX.XXX.XXX.XXX)
 smtp.mailfrom=buildroot.org; dkim=none (message not signed)
 header.d=none;dmarc=fail action=none header.from=benettiengineering.com;
Received-SPF: Pass (protection.outlook.com: domain of buildroot.org designates
 XXX.XXX.XXX.XXX as permitted sender) receiver=protection.outlook.com;
 client-ip=XXX.XXX.XXX.XXX; helo=smtp3.osuosl.org; pr=C
...
-------------
...
Authentication-Results: spf=pass (sender IP is XXX.XXX.XXX.XXX)
 smtp.mailfrom=buildroot.org; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none
 header.from=buildroot.org;compauth=pass reason=109
Received-SPF: Pass (protection.outlook.com: domain of buildroot.org designates
 XXX.XXX.XXX.XXX as permitted sender) receiver=protection.outlook.com;
 client-ip=XXX.XXX.XXX.XXX; helo=smtp4.osuosl.org; pr=C
...
----------------

Thanks in advance.

Regards,

Neustradamus
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
