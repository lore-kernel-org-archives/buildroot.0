Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF28BC61CE8
	for <buildroot@archiver.kernel.org>; Mon,  9 Jun 2025 17:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A2D941CA9;
	Mon,  9 Jun 2025 17:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id swZuhstsK57p; Mon,  9 Jun 2025 17:35:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CBED441C17
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBED441C17;
	Mon,  9 Jun 2025 17:35:50 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 36A6E1A4
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 17:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1CAD56144C
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 17:35:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bqi2KjTS1eyN for <buildroot@buildroot.org>;
 Mon,  9 Jun 2025 17:35:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a01:111:f403:c408::3;
 helo=pnzpr01cu001.outbound.protection.outlook.com;
 envelope-from=sunilkumar.dora@blackfigtech.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D87716142C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D87716142C
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazlp170110003.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:c408::3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D87716142C
 for <buildroot@buildroot.org>; Mon,  9 Jun 2025 17:35:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RXXtSotjOIV0BQm5RGzrLvw4lp/ksCrnjXh1dUYD/v0rV8gzcOkV8tpuQTvpwM99g+JLOxammuJxMvkqwbIJT3gqIWwJiqQKYPMQV/rPLIsm00Z3DREfvjjHbxwLs42hgCtFGLmr4ytZWL9wNSoB7iCzaJLvbuoh+UuECiJf8ojzohR1YNwhMhZWWHTYBCBiwfCxC0VztojzUoT2wanWoQ/fJUos8OT5BdpBqL+SK5AfDIwr7xBV9R9d5rs9o1reKE5ZGqJJtUSwdyM1aX2KqqSh/iOaAQiHAPzWpstBdD+/XUEfoUWRdbYSo/bmGbCzwflRRQAVCG3IPitZ1ZTFXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ONRFNjEi3SEeUGhb0wsnQ1VQO/hZpTiD5GbNvb97gk=;
 b=qjsWSU6FPi9BXDDY3goKeflM61fl2ig3d1aIeZ4UDQ9Ma8vlgKQ/PbLlXvMaHNgjS+cuJxKZZcO+mxZGh2GNtGnTONQ8grjkWTko0hsMly72Fb8WO+4r7GE/H4mmzz94j6voDtqQmtBV2FpPbcZvwyLqgvIDqsP3T7uUtCL1AeaZYwjDnfTKT+ExaAdipHcVhgQYygtrVT9i9EPKYe3lOdb4+bINE2xS4N08CjbX0jMOxHXm9wsEK8/fX6UK3aQTJixwbrx76zLy8WRl2WtDg4v4rDfB9SGgcm9AHd8gHqJQppynhyhdMdkkIfLEpRJlCAguIBS13vw8rAaY5YC8Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=blackfigtech.com; dmarc=pass action=none
 header.from=blackfigtech.com; dkim=pass header.d=blackfigtech.com; arc=none
Received: from MAZPR01MB8371.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:88::11)
 by PN0PR01MB8837.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:124::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.30; Mon, 9 Jun
 2025 17:35:42 +0000
Received: from MAZPR01MB8371.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::911e:5414:4fd9:9354]) by MAZPR01MB8371.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::911e:5414:4fd9:9354%6]) with mapi id 15.20.8813.024; Mon, 9 Jun 2025
 17:35:41 +0000
From: Sunil Kumar Dora <sunilkumar.dora@blackfigtech.com>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Question] -- Inquiry: GCC's -Wpoison-system-directories in
 Buildroot
Thread-Index: AQHb2WTaLCNGH3FD6EeTrGYNWMTswQ==
Date: Mon, 9 Jun 2025 17:35:41 +0000
Message-ID: <MAZPR01MB837141FB4F42F5F5EA84F1F29B6BA@MAZPR01MB8371.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: MAZPR01MB8371:EE_|PN0PR01MB8837:EE_
x-ms-office365-filtering-correlation-id: c436b400-a83e-4165-208c-08dda77c0ea0
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|8096899003|3613699012|38070700018; 
x-microsoft-antispam-message-info: =?iso-8859-1?Q?b5HRXEPPUA5MCKLXJfsBfpSXQjs85lCNDldjs2fFCSM3Ui/QY+5c/YosgR?=
 =?iso-8859-1?Q?Qc83izrTWkkMgASVlQw/X6Bfl+nx2pnl3P5z63XZHiArNcv8paHeb0pp4l?=
 =?iso-8859-1?Q?b30of+Wy+vGjQ1GVibJbZxL7397KWwmBErwI1hkIu+6JO4AjM3tn63gY6R?=
 =?iso-8859-1?Q?bPBRofeGJ25mCBvmFH6QliIV6CyzLANEclQiDSmp0k96hw6uZCht32QBSH?=
 =?iso-8859-1?Q?JWSUAyl1P1XHDOm+0LmtX768JH+54bg9kfAiU8ZPXASuUFfoqh2Ewlu0n+?=
 =?iso-8859-1?Q?cI8BuocC6GMnn3Uv8otvwvGVGUKz8zH3hufQl6jnY3A2q/+9+GkOeNf0jB?=
 =?iso-8859-1?Q?W9AdmPk3OVinsTN63J7NxsNFJkIXOsWx00w+YdhowZ7nYj1BZ4oFdLKCEt?=
 =?iso-8859-1?Q?/6GzDIvPA50W4o2ygi5XpY/IhRjwbgo89a5oYxV5i6fnQNDYgSYmHz7KZF?=
 =?iso-8859-1?Q?HuMJ5S3NXdYiW2ZD/2TqtVip+gWwYghAalO2pbbk25wIep4rdFzLyaLYkj?=
 =?iso-8859-1?Q?HDnGOd6aamRT56rSlBdWO0ByiwB+TT0u2iNweND1HArK6OxWIkdVv0MRv6?=
 =?iso-8859-1?Q?UqjSpt1xPzVgS9kFeuWoB9qjxDlKwRly68JxLcp+AXXanPmrWPDLzdsV4E?=
 =?iso-8859-1?Q?8l1zMhYDYmvNvYOX+cmTj7DQo5QcOr5iYaTtqDx1pNuoRCsWRJwUO72mga?=
 =?iso-8859-1?Q?ZEMonsSzuoimp573G5pt2EY1YuIvTK4ElK8JaExguYsO53FmjrDOKBM6ab?=
 =?iso-8859-1?Q?r7AH8Du5eSWO1yaiEPjiYmq0oMIwimyOQpCep0mWcXbgPOIlyR4A4RXP/b?=
 =?iso-8859-1?Q?zTc2xk3sLv/8BCMOhftxbrtJNhLCDiJG4irTuwBv6FZECgUIGmz8N0fFEk?=
 =?iso-8859-1?Q?1GDNx4qHWFhCbY28+OrQ5RsLJ6KYaYk0JtW92FZS6ELyqgcnCV/Ci+zmkQ?=
 =?iso-8859-1?Q?sA5a2RrWWLJ1CUsYQlpsnyDFqLEzaQYiPG1DBMaWGJHfYI8Q+cFRD7vGXL?=
 =?iso-8859-1?Q?n7Jwk0CtI/Ef8tk7IPTVBGg0UzPxdOupGbMSoGC9y5PAT61CxoVJjzZVh2?=
 =?iso-8859-1?Q?TrrRROLyYdTlYVcm07tX/G3oJDXq2rdkcK/8WGKKPmsLhV7KSM7Urkywc/?=
 =?iso-8859-1?Q?lHtJ5XBCZ8maVkpOmXD0BjXAfUgp1XWTg4Onm6qg1trEledwA7s7Ba6SdR?=
 =?iso-8859-1?Q?gFssricOGqVnYYxIW75Ad2e8Hlzq+59fljkNv5QGqKmrxWWD2bFAtuXmNf?=
 =?iso-8859-1?Q?73dbLTjFfegm0Y5O/iboXXPSgtGEu75r0kItDrCFtH+EAyzpM2OfKBStoE?=
 =?iso-8859-1?Q?Bdpm6e4bdvS5s5Gl0JBN0efFaqNkVOHUuRpSd5RNhjloDJiU0KM746PeUZ?=
 =?iso-8859-1?Q?8QqQy1LfQ8yRylmboYA3jS/6FuQyYlMLDoHtXPUeBDSzukIsjJN5Prw5pT?=
 =?iso-8859-1?Q?NrrJoidTUbaweEYUNxHfdDtTa/8cPl+KpExPFjyN8IpUlUASun++xKZf8l?=
 =?iso-8859-1?Q?obzOciB1Xqw3VkkOGfIBqB/RIBwP09sI3X9jgsgy00da44Noi6oHnsCOSK?=
 =?iso-8859-1?Q?HD0C/ILvI4I4GYV9sLEWVn5p4PwJ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MAZPR01MB8371.INDPRD01.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003)(3613699012)(38070700018);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-8859-1?Q?nwUYqEtqarmhtdmdCDoLdgIaW/QKA9qEhYMUGf90yxXaFVVIcpEFrEWR5g?=
 =?iso-8859-1?Q?fBOb9oo6CVCVm99LyKId6IEyqPz9YeFerZXwoOBi7xA0J5YLUC4e4MNYv2?=
 =?iso-8859-1?Q?MX8GInpyqfDNOYLzoxrfMD5zvnPDi4DxNlwVC2+Y440TASRLgM78mbuMJo?=
 =?iso-8859-1?Q?oB2zGM2xYwo1/FL9C929eXgxX7xiA19dq7aEHfI+hB+NIOKBwjJgmfFxu8?=
 =?iso-8859-1?Q?MDG5FLC6dTu8CgZGCS2kj+NbGxbE0tpZM5q1A7Jwhu5CEg5kDCd94dNK5S?=
 =?iso-8859-1?Q?KDPuNXV6b3FIn30YTIWUUlu+h0yjvAdpFDM1nAZaVMojsEOqNRN/47uXuc?=
 =?iso-8859-1?Q?1jcA3ekjAX9js0kIolBL36qgDzB7WS0fR/mEtTXdKMWNqNTVUodh+Wlylo?=
 =?iso-8859-1?Q?WAx0JqxbatTjLAOly9Z/8erzuVsfoB2bQqYOKZc/YHxET1gsIdRcfKNsZ0?=
 =?iso-8859-1?Q?XMrQPGWSFRsjKLKIn0bePDmXh21cY1eoMp774A6U5arJE4pRqh62r5w98l?=
 =?iso-8859-1?Q?ehTfar9Ss+1YET7rBQ/s6O5YlwVPbNb5QDvrFPlP216kFAa8rFi//INwC0?=
 =?iso-8859-1?Q?aH0gsK47Pt3Ppi8fJmCojd9T7xHvYG1xQOWP8ofgUH0OMQOklHavRk/GbJ?=
 =?iso-8859-1?Q?qxsdsdyCKoCEeMZZbod+DJfPAGq4RnkaqgT5rzXV6yMAI/8hJE4EYMFrai?=
 =?iso-8859-1?Q?TS6Vf2djAdkVSxTlJzu0ehgEfyUpbxKndILOKFZlDuih2yDzpiBLg0y1kO?=
 =?iso-8859-1?Q?mdfiJiKln99gzCbhBLo8tW4X/Kga+Dm2XXejfk0Q26WnE9Z4XV3dIG1Zui?=
 =?iso-8859-1?Q?dBYGXAJIjrzU3Lb65RwncKshX+w+24N78F1aGOy8Jz75iHlpk1S0MzbVPg?=
 =?iso-8859-1?Q?GrnHBOPCq+PAd9Qhbv2L5kb/sHo71iLpCYKVk8VHZzosS7xM2vtIw/imGQ?=
 =?iso-8859-1?Q?hEHg7G6fTuOBGnyKSptkUhZMClRvDoz2xPk+2v0yZtUc4NcelxWLUXIttg?=
 =?iso-8859-1?Q?svrxRyq8/wzIUb5sMTQho94fngX1dYxbxqDTrQiRXG0s1mmXv/XZjjT+0r?=
 =?iso-8859-1?Q?dz/08JgAu7F2R9yEEPZTwgjPsH6jNZUrqBiakOjRGMTC5Cp1hEwFCQ1T15?=
 =?iso-8859-1?Q?aUlJNPT+xneEpr945GLghjHFnSG/PmzM0GDyb7ZkgT0AiZXEaF+gvvWCLW?=
 =?iso-8859-1?Q?odJJGtp4w686Lcdu4FHvSTZO4oEgtEemQJvd+FMDO+xR5/+I5HjN2ZAqzL?=
 =?iso-8859-1?Q?o4OFi+b+dITNkFqVr2N/QrZNhRNPpce98P7qhm4LYTGdVQqo1jUDrzt/e7?=
 =?iso-8859-1?Q?1uMA3+fDkKpSfJSG2XvnLA5Fdg/nM4bG3iLWNa6A5V8Y6REjsa/BdP6pxz?=
 =?iso-8859-1?Q?NNrc7jSm0RDZSICVAlVJvSAZOa2LaE8qeRqFB5Kgz7fQHG4CcKj4ZupCiV?=
 =?iso-8859-1?Q?bOx6Wb4tKQphz6XmApM9QcKXfJo+OmHgKn+8Y7BVZrixXOpnbpbEeWX2yW?=
 =?iso-8859-1?Q?yehRyw0dSgXyJmWjjRAS1gBi+C2bcXSr+nsCwMtuyB8VhNEXroU92sYVm2?=
 =?iso-8859-1?Q?nul9yvrjbVuWHOGxArMi7d2H9yZQ1JKDXNbIdPVtrpLvNRC510ofTaOBH+?=
 =?iso-8859-1?Q?DQA81cQpcqevgLbpgZWl72GWeqtbFrzXPNdRPX+J1EklEp7wBdZeqA0A?=
 =?iso-8859-1?Q?=3D=3D?=
MIME-Version: 1.0
X-OriginatorOrg: blackfigtech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MAZPR01MB8371.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: c436b400-a83e-4165-208c-08dda77c0ea0
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Jun 2025 17:35:41.9391 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 75dd016f-4b86-42d9-9a4d-6df5b9790019
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WFerZkWaHIK+JTP3kSwWGd1GEUaWCKMxiHgElC7YzXpV0+a0E8boLeQr+J0j9bdtUwtFa09y1JD0brU5mb6/JbLg380a5J/92YiuAaCKBSTdkE1BdGhHQ5yQO+bEFBNT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB8837
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=blackfig.onmicrosoft.com; s=selector2-blackfig-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ONRFNjEi3SEeUGhb0wsnQ1VQO/hZpTiD5GbNvb97gk=;
 b=MuXOffmW3P/PJ4qsgaXo5D3blXxFq18uS3VSxHeqHh0bOwE9joQ5+ZeuA+zkQFcEhNlu9jq/lrgPaAvFR7RKuTkdWErCOn/DyeOI1EwcoS3w6Jq3rFMGOOycMyLsihGk5oT58r3BIA51Zo4YgPjaVaXPOrDxPwcLFUxWohNa420=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=blackfigtech.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=blackfig.onmicrosoft.com
 header.i=@blackfig.onmicrosoft.com header.a=rsa-sha256
 header.s=selector2-blackfig-onmicrosoft-com header.b=MuXOffmW
X-Mailman-Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=blackfigtech.com;
Subject: [Buildroot] [Question] -- Inquiry: GCC's
 -Wpoison-system-directories in Buildroot
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
Content-Type: multipart/mixed; boundary="===============0410637208224707261=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0410637208224707261==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_MAZPR01MB837141FB4F42F5F5EA84F1F29B6BAMAZPR01MB8371INDP_"

--_000_MAZPR01MB837141FB4F42F5F5EA84F1F29B6BAMAZPR01MB8371INDP_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Buildroot developers,

I noticed that GCC once had a `-Wpoison-system-directories` flag to warn ab=
out unsafe system include paths, but it seems absent in modern GCC. Does Bu=
ildroot apply any patches to handle this case (e.g., preventing accidental =
mixing of system and local headers)? If not, is there a recommended alterna=
tive for embedded builds?

Thanks,
Sunil Dora



--_000_MAZPR01MB837141FB4F42F5F5EA84F1F29B6BAMAZPR01MB8371INDP_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<pre class=3D"elementToProof" style=3D"background-color: rgb(255, 255, 255)=
; margin: 0px; padding: 9.144px 13.716px;"><div class=3D"elementToProof" st=
yle=3D"text-align: left; text-indent: 0px; white-space: normal; margin: 0px=
; font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Hel=
vetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">Hi Buildroot dev=
elopers,</div><div class=3D"elementToProof" style=3D"text-align: left; text=
-indent: 0px; white-space: normal; margin: 0px; font-family: Aptos, Aptos_E=
mbeddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);"><br></div><div class=3D"elementToProof" style=
=3D"text-align: left; text-indent: 0px; white-space: normal; margin: 0px; f=
ont-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvet=
ica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">I noticed that GCC =
once had a `-Wpoison-system-directories` flag to warn about unsafe system i=
nclude paths, but it seems absent in modern GCC. Does Buildroot apply any p=
atches to handle this case (e.g., preventing accidental mixing of system an=
d local headers)? If not, is there a recommended alternative for embedded b=
uilds?</div><div class=3D"elementToProof" style=3D"text-align: left; text-i=
ndent: 0px; white-space: normal; margin: 0px; font-family: Aptos, Aptos_Emb=
eddedFont, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: =
12pt; color: rgb(0, 0, 0);"><br></div><div class=3D"elementToProof" style=
=3D"text-align: left; text-indent: 0px; white-space: normal; margin: 0px; f=
ont-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, Calibri, Helvet=
ica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);">Thanks,</div><div c=
lass=3D"elementToProof" style=3D"text-align: left; text-indent: 0px; white-=
space: normal; margin: 0px; font-family: Aptos, Aptos_EmbeddedFont, Aptos_M=
SFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0=
, 0, 0);">Sunil Dora</div></pre>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
<br>
</div>
</body>
</html>

--_000_MAZPR01MB837141FB4F42F5F5EA84F1F29B6BAMAZPR01MB8371INDP_--

--===============0410637208224707261==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0410637208224707261==--
